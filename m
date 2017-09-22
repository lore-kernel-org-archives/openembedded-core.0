Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id E470F78270
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 19:19:20 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id t127so1028630ywg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 12:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=7HsLZJzJ2dYRJvkcO6AVf3pNjXy931L/YzuOnS8JCvo=;
	b=gwGJD3tuBLc08KfBX1jQGS4NAPubp9L3ttp4UbRtLGRuYttRG2GyF4G4q8B//J7IRg
	mvi1U5rMKC7R4pLcoYNtZhKLmaKrZ+0kxMofPB0uCA66+mH+UXAr3nOJcjGP6oFBEyOB
	OIwcmaog6hm1e/EXfZlDNxuiXlT4Ns9i3UdPWrUUMnHjhueNhLQgv5qRS+QXWYzAKLnd
	pQFaMyjgNU/odHa5JQ6ZaFEJZ0kkxLJha9gWFm+YSNwK2kwfkxXJBcKhxQQ5SAnEtGjp
	RZziQF32InybrJnYccG8ZE8bHoIiD0zHw3Btrz81Wz8NtOE4cMS5vDyf5rLSkeTt6j8E
	nGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=7HsLZJzJ2dYRJvkcO6AVf3pNjXy931L/YzuOnS8JCvo=;
	b=TecVvCaKrbaI1lSIcmG/lgY+j2edE64MAgWy0csa5G0pkjEnBV8DZjJjG2S3iSdjua
	cWgytS7Zi86MsAcLoFzFFCRbjq3XO+hqYX1nH2/tjn+1FK1EV2gacWACSAWJ3If91z/W
	OSvoBPCCvGjqj7HLnb1F4/bswMtFCxOxZYQ+gW4wbZkBPSH5e79twqj4zxg+boE8cmkf
	47BgB5OQcu1kfABrwqSicIgbc33e92eufTpNsF6lfpUPOyCcuLyUTGYxRhb8pBbcdKD4
	DNAoHuevV9f483YzDPs73jTzoMLYon3aL+JGmmSPnD3b2xkdrCobN2/oXEvorGt5n3kx
	qa3g==
X-Gm-Message-State: AHPjjUi7NtZQT24T6iiKVVy8OAo+fdcDuOabGhijyj1t/CQRklsqjX5M
	TJeZIxiIy5+YB8PJNkSUVDD7c4cX
X-Received: by 10.37.189.78 with SMTP id p14mr103227ybm.449.1506107961586;
	Fri, 22 Sep 2017 12:19:21 -0700 (PDT)
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com.
	[209.85.223.175])
	by smtp.gmail.com with ESMTPSA id e4sm207446ywd.63.2017.09.22.12.19.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 12:19:21 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f175.google.com with SMTP id d16so5298863ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 12:19:19 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBiP/XWqBsY2XNL+SzqjP95/08wWeXq4WnIY3UETwl9aE+lZ1ko4vD/LSpDtpfHMJJd5CajeZA259RfT+jCmHE=
X-Received: by 10.202.83.10 with SMTP id h10mr281828oib.56.1506107959035; Fri,
	22 Sep 2017 12:19:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Fri, 22 Sep 2017 12:19:18 -0700 (PDT)
In-Reply-To: <47d049c3-4034-7224-4f81-e1aac8f8b030@linux.intel.com>
References: <1506098477-5444-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1506098477-5444-2-git-send-email-richard.purdie@linuxfoundation.org>
	<20170922115204.37ef6f2c@seebsdell>
	<47d049c3-4034-7224-4f81-e1aac8f8b030@linux.intel.com>
Date: Fri, 22 Sep 2017 16:19:18 -0300
X-Gmail-Original-Message-ID: <CAP9ODKro_Zh8raoQ=sDmEXU6OEQwpV_5rJ_E8Lt+MKip5j3fXQ@mail.gmail.com>
Message-ID: <CAP9ODKro_Zh8raoQ=sDmEXU6OEQwpV_5rJ_E8Lt+MKip5j3fXQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] pseudo: Add fastop reply fix
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
X-List-Received-Date: Fri, 22 Sep 2017 19:19:21 -0000
Content-Type: text/plain; charset="UTF-8"

Richard,

On Fri, Sep 22, 2017 at 2:12 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 09/22/2017 07:52 PM, Seebs wrote:
>>>
>>> This changes the pseudo FASTOP functionality so that a reply to the
>>> operation is required. This means we then cannot lose data if a
>>> connection is closed. This in turn stops corruption if we run out of
>>> file handles and have to close connections.
>>>
>>> This tweaks the connection closure patch to update the comment there
>>> which is now outdated.
>>>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>>
>> This looks reasonable to me. I did some testing with a very similar
>> patch and concluded that, while it slowed performance slightly, it
>> didn't slow it nearly as much as the pre-fastop behavior did.
>
> Also, the issue this patch is fixing is not theoretical. Setting max fd
> limit to a low value (192) is causing errors on my machine:
>
> dpkg-deb: error: maintainer script 'postinst' has bad permissions 644 (must
> be >=0555 and <=0775)
>
> and with the patch they seem to go away.

When queueing it, please make sure to add the proper patch headers.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

