Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 71A48770A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 15:47:26 +0000 (UTC)
Received: by iodd200 with SMTP id d200so93763222iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 07:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=t+I9ZnhgfoD8KsC3KNg99+rZw3wnsS9RCxXZkDwx/rc=;
	b=dnlh2N5p8Yrftd3ZxEPeKh9fqdlFMPB97kn374CEoEc91NBYQF/ZBKRj6Bw8w7IwwA
	+5RTD0+cOluVS3snMm/5VHCLB29z/1VGVQ7voW2Nz9CZcKXJ05sM2p8L5jV4Ds4vBoNK
	wEV1/94RxZyWsftRYFSTMkZMWDzNXcdtmj+GUMns10oU0CgOzXk7Jm/voSYvENzGft2M
	l0lymh89FMd05Z8NcJp3dLk2gw7+j/ZtHFpzXh7okwVKt4n8SAWQRB/a/MuuFma9aT/a
	Apn2hc8M7ttQFPw+ddAJNUF8YdfUrfnFpy6lYFZ3d23OMqgu7GoDQWx+qeNBYwbCrXEn
	I9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=t+I9ZnhgfoD8KsC3KNg99+rZw3wnsS9RCxXZkDwx/rc=;
	b=IGoujui9rJKkirNrgE/LKe85mcwwKisuSv4xuvtj620z8pc2pH7AaseQWTmqjMWQtl
	UflNVaxWLxCiFMPRJ2BmZmdzkTQdiH6gLslEvtC/8oH2/3/4k+K0TYjrjUMhRTjh9cQT
	Cf189BeasSp2xioPKN+QQtLWJKv8lczaT/2Tf7vPLqMuKu7GNenZiEsFKiMGnCPfOzPW
	x8l7Ki57/WrXeaIeCRStDx9kzQVZEb7IBuBenXhpE6u9minkTaHvEZgmvyXbrdWqMPBz
	W92uTrrF/JCk+7PR0czONvtyoQr3hAE7nr+NylUIWDxr9QKSLGMPd7E5Y/hzARn9FaSW
	TFlQ==
X-Gm-Message-State: ALoCoQkCy+Ks3fuG7CqTABHrzGzmkH+DeoW/+MKTww8s+ZfCHgF4yX/YHV0N4KpispvfN5cBY9Ti
X-Received: by 10.107.12.193 with SMTP id 62mr10701108iom.173.1446738446837;
	Thu, 05 Nov 2015 07:47:26 -0800 (PST)
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com.
	[209.85.223.171])
	by smtp.gmail.com with ESMTPSA id i69sm222083iod.27.2015.11.05.07.47.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 07:47:25 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioc74 with SMTP id 74so28215664ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 07:47:25 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.17.160 with SMTP id 32mr589849ior.28.1446738445414; Thu,
	05 Nov 2015 07:47:25 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Thu, 5 Nov 2015 07:47:25 -0800 (PST)
In-Reply-To: <563B7395.1010104@streamunlimited.com>
References: <1446653201-6456-1-git-send-email-radek.dostal@streamunlimited.com>
	<CAP9ODKqFTU76yL_DqeNku4G3502R00C4K8qwdEtCp5zk1pmJRw@mail.gmail.com>
	<563B7395.1010104@streamunlimited.com>
Date: Thu, 5 Nov 2015 13:47:25 -0200
X-Gmail-Original-Message-ID: <CAP9ODKq-WgcW8vpj5ZvrEby7tm5HKAa7zstTQmHphP0r=DObRw@mail.gmail.com>
Message-ID: <CAP9ODKq-WgcW8vpj5ZvrEby7tm5HKAa7zstTQmHphP0r=DObRw@mail.gmail.com>
To: =?UTF-8?Q?Radek_Dost=C3=A1l?= <radek.dostal@streamunlimited.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: properly specify CC for EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 05 Nov 2015 15:47:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2015 at 1:19 PM, Radek Dost=C3=A1l
<radek.dostal@streamunlimited.com> wrote:
>> This build error has been fixed in new U-Boot releases and if the
>> board required an old version (and cannot be updated) the fix should
>> be done on the recipe and not on the common file as it can change,
>> behind the scenes, what is in use for several recipes without notice.
>
> Thanks a lot for your valuable input. I was not aware of the fact that it
> was fixed in the upstream already. If you know the commit out of your hea=
d,
> it would be great if you could share it.

I don't know; I strongly advise the upgrade for the board if you have
the resources (schematic, time, ...) otherwise a recipe workaround is
the best alternative.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

