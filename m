Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1E505607A4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Oct 2017 22:01:57 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id u134so2533214ywu.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Oct 2017 15:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=HCA9CJxKr1j57bQ1jHjH7NdFehGGwUiSuLybo1Zvfi8=;
	b=M0X1oDKy3xZxvL2zrayxT332nLQT4sZEpaXYgwD044P9CrwQoc0bvrGiNN+3P5cqg4
	2EL5cl4kqAs+6XKm50J+aaOx2RBpLxGza9fsvmpRF4YQWVG3grLFAWvjTJSBZtqRc71x
	k6JQSv9FV3d+THfkGsrHXsmPoWmZ1j6v+ZOCYUrCI/ZpmFBHJQJdqdoEp8lk4Rweend9
	ymxFs7hEX/+AEafwrIK8loLbLrD0rMXagUKrGv99+SHmPiTloHkh8dbTYyrxrhLi5yjH
	26p29nL3+fylSTLgA4SEm8q59xzZCsrJa0FecPtT8rcIrI9t03vGHaAWnvUJfsPVzTo+
	/PsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=HCA9CJxKr1j57bQ1jHjH7NdFehGGwUiSuLybo1Zvfi8=;
	b=N2RKtgK3qEIZN9XEGK3qbrFZeZXbsAkuj6aHqmnOPx1QgO2bIUWVLU27wm75SyOthN
	dZP7yfAr6x2T+kMzvCPLW8ihaKQfnhtz59R0QsPiOEAXPm42j2i9ljTTrfmbFuEc65bH
	hUBrpLVCHjFlrq3u5zoZD5ZuP2fr0IFochcFzYEQzKZjUXifJFZ4v8NAx5ujBFguEoBo
	edMJj4AiTKb0zYmyC4ppyIl9zeHpoGN3IbsKsD+X6QePaYKH7Ip69hIkpzRtlWwASPAB
	CnTCnxkHnQJ6LjFXxWfz+uZBLhx9KmFxtPae6f3Jdex9f7zan2mmY0jIfEc9lqeFtLyX
	yZTw==
X-Gm-Message-State: AHPjjUi4oaYb0W5ExyGmj4AimHc42pLz12goRVFnDmkfmLGyM2x6F7Hz
	BrxYYzcsfdsKdtns3Fhj6czVH7aQ
X-Received: by 10.129.37.7 with SMTP id l7mr11559259ywl.67.1506895318692;
	Sun, 01 Oct 2017 15:01:58 -0700 (PDT)
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com.
	[209.85.218.45])
	by smtp.gmail.com with ESMTPSA id l24sm539581ywh.23.2017.10.01.15.01.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Oct 2017 15:01:57 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f45.google.com with SMTP id f3so6536953oia.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Oct 2017 15:01:57 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD1q2oprmV7Bxrv3hlhDquXudanqZYZvo5uif5boL9CQicBqZv/SR3XHqQrU/YtJIouRca3NfOvXsjKv6XALJ8=
X-Received: by 10.157.8.134 with SMTP id 6mr6216907otf.189.1506895316937; Sun,
	01 Oct 2017 15:01:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Sun, 1 Oct 2017 15:01:56 -0700 (PDT)
In-Reply-To: <7738c857-3635-f56f-45fd-cd7d5b5eb82e@linux.intel.com>
References: <20170930180655.25134-1-otavio@ossystems.com.br>
	<20170930180655.25134-2-otavio@ossystems.com.br>
	<7738c857-3635-f56f-45fd-cd7d5b5eb82e@linux.intel.com>
Date: Sun, 1 Oct 2017 19:01:56 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqpb2nGy9M55g44Onm6Bub4nZ8xKQv4A+LEuoqtkwtRPQ@mail.gmail.com>
Message-ID: <CAP9ODKqpb2nGy9M55g44Onm6Bub4nZ8xKQv4A+LEuoqtkwtRPQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] lib/oe/package_manager.py (rpm): Allow use of non-signed feeds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Oct 2017 22:01:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 1, 2017 at 4:39 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 09/30/2017 09:06 PM, Otavio Salvador wrote:
>>
>> When we wish to use the package feed for local development, it does
>> not uses GPG signed feeds by default but dnf does. We need to
>> configure the GPG signature check out so it works out of box.
>>>
>>> @@ -551,7 +551,7 @@ class RpmPM(PackageManager):
>>
>>           if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
>>               gpg_opts +=
>> 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' %
>> (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'),
>> self.d.getVar('DISTRO_CODENAME'))
>>           else:
>> -            gpg_opts = ''
>> +            gpg_opts = 'gpgcheck=0\n'
>>
>
>
> Again, 'gpcheck' option has nothing to do with verifying signed package
> feeds. NAK.

Oh really? so tell me why it fixed my error?

Without this patch I need to use:

dnf install --nogpgcheck <pkg>

and it is sub-optimal as I did not enabled signed support.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

