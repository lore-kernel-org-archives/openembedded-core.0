Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 862F977348;
	Wed,  3 Feb 2016 16:01:59 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id xg9so4821212igb.1;
	Wed, 03 Feb 2016 08:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=cEhqtaH7aTCL4AaovH4ffaRKzO0cGDAwvvvfJjULcTQ=;
	b=QUNKOWy6ueZ8N0bvgYtYVxfCHV6Q8gZ1K8rLWWqXMLEmpBLRxPPgPEQZ+tNaJcp4ro
	Pls8+S3BGckQx6s51E8z7iKARrTUHzg9xaUUSNtrblt+q6f9aWcxGLtP6BAgydfuhyus
	FIecu/EaAa7zHO9kqtDhM0Y4vPVk1xsMsTK6XlPWqfSdU0MfP7iPVcrpUklAF3nmGhY8
	1FkXF3RzVAxRBHOvb6N3Lq0hRYUn1LrX7JJuLuhHfNdowOfEIlxDazSKOC3MdAUQRCGs
	eRyOzqX8/zpkCSjjQ1keSvyKSxsmEV/uOkoL/n+ib41mUmx3UGuZNqk0BdxxxB3iKHU6
	psbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=cEhqtaH7aTCL4AaovH4ffaRKzO0cGDAwvvvfJjULcTQ=;
	b=dIhC2OOE+CxVmhGJXRnBJQ9rk4aDXxNtQoud9Lu34oZWWbdoQpYOyYaJiB2XF9ypCA
	DxPCF6hzlf4y2qY0pVteiSop1zHpeMXOOCP1HpS4+bG3Gj9hzvZLJ0m9iESv/P6aluEn
	VvnjrCBILPxqPsJdo9QXT5H8BBfjzOihvDCUfy3XyaNgL9N5DqcHCBTpSNf7qBMig49l
	wJiyBEpwBpcl3nCQiJi7ZYB9+mQgKzQVjFGzNpqvPX0D5s3uPM+R6zZ37ShML1OY89r1
	u9yvmdwNKPhnjhNKqsNFNIeFbeFXACW5LvUVPvEy4VjQ8gt9OX2xI56jMGd0dMQeHqha
	TThQ==
X-Gm-Message-State: AG10YOSrzbJaJje12ssk7UXbeleAg0z/jPHW68zxPLTzFPp0ZP4c0dLLQ/SuOFH60UkSU1sGWDPGk8FxiMlBRw==
MIME-Version: 1.0
X-Received: by 10.50.111.111 with SMTP id ih15mr25126864igb.78.1454515319663; 
	Wed, 03 Feb 2016 08:01:59 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Wed, 3 Feb 2016 08:01:59 -0800 (PST)
In-Reply-To: <1454511012.27087.183.camel@linuxfoundation.org>
References: <CALbNGRRmD=4QUi=+_fx48M4GDB9VwTX5m5wH12j4ed1OK6SW6Q@mail.gmail.com>
	<1454511012.27087.183.camel@linuxfoundation.org>
Date: Wed, 3 Feb 2016 17:01:59 +0100
Message-ID: <CALbNGRSZ83cE_hOSPNy5J_Jjc5KFtc10uEC7MoF0VbZHUPHUfg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Language settings GTK (glibc?) problem
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
X-List-Received-Date: Wed, 03 Feb 2016 16:02:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 3, 2016 at 3:50 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2016-02-03 at 12:49 +0100, Andreas M=C3=BCller wrote:
>> Hi,
>>
>> while testing libreoffice language packets I found that language
>> settings for GTK based apps are broken. Interestingly QT based
>> applications (tested with qtcreator and lxqt) and libreoffice are
>> working fine.
>>
>> I did some research and hope for some expert with helping hints.
>> Details are:
>>
>> * I am testing with jethro environment
>
> I did wonder about http://git.yoctoproject.org/cgit.cgi/poky/commit/?id
> =3D3b5288f0a28205289063424afc474675cbaa05b8
>
> or possibly:
>
> https://github.com/rehsack/poky/commit/46ac36953e2e76ba716c7ba42ddfe41c
> 9a19a11d
>
> but I haven't looked into this much and don't have experience in this
> area.
Thanks and yes - I have seen these too but they are not in jethro - if
I am not mistaken.

Andreas

