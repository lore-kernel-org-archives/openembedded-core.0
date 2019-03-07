Return-Path: <leon@sidebranch.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id B5BFD7CEAB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 14:56:44 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id l136so3769898vke.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 06:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qnovATEEA0+M3fs2+C2klhs9lkYrO2PB646NUTiYjRY=;
	b=l2oaFVGCMBi1lSqO3W8nzhXwgLwexArDnVtyVop42a2zYARg3mCrXQ3zAv9RfN9yWK
	b4lVzQttm1AK9l2CAJ1DpYj70BybpdxRc8oztVEVtEZbuC93nxwW60VWJTpWQ31SBehL
	3deP7EqB5AlX1kILcjGnDR+25T5B48VQWp9hJoL49EF/+2xPoBDjSjvrZ6tfVzFntt/2
	668K82EqXfp7V7Ni3O7cefgK09PCdTiSynCdcAJhax/VwvIm4u7fKcc/1csxsiC+6O/c
	zapyQRufMfzOGnlTpfRniCzzxW2TheqN018orzfGkbEsPl653ZQ5nMUC6iWpAz8WNXbu
	0ZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qnovATEEA0+M3fs2+C2klhs9lkYrO2PB646NUTiYjRY=;
	b=SQn98QMjTqrjAQCmlT0S3hiBs55Zulz36FAo2mxdvQM5k/vaVDxanXC5OoktBiaqUW
	iivV03089hiABJL7eFGxeD0lsqE7qaXyP7r3EJCrGDaLbqNvUxKkBo+C8T2XwZVoHsGG
	jkiJ/Oz765pW0X5Pm0CYfY2fgT8OM/oheBZZ26LqRuCeSX/AM2levhO42opVYujb0zXW
	n5K1mFV06EerJSIT861i0wpeWv4IER+o+4o/eDrzA7HkmR7f8Vzv6xw5XCWvsD6GX9D+
	WUMPood3nvexqrt1VUTZd03P8A58BknuqFsgMHb9v9lisKfa0z2td+JPog4OpjovN8nB
	3/Vw==
X-Gm-Message-State: APjAAAUjQ1oaCJKDQaouj1SI81hKE1c1E2RIu2m1TTpKBId+G0LUK4Ok
	92ckL5xz2o2JpLvYlynEYX6VUd0tFds/kxzNGOVUnBn316A=
X-Google-Smtp-Source: APXvYqwoTZlKvdQHt1rXwYOkLKuHN7+j1TH/yDO1F8gufFpU8dJhSvqjL5Otpn2iI9twENjnhpLHNu867VosZ0Gs3kc=
X-Received: by 2002:a1f:210f:: with SMTP id h15mr6620647vkh.6.1551970605510;
	Thu, 07 Mar 2019 06:56:45 -0800 (PST)
MIME-Version: 1.0
References: <20190307142709.12076-1-bunk@stusta.de>
In-Reply-To: <20190307142709.12076-1-bunk@stusta.de>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Thu, 7 Mar 2019 15:56:33 +0100
Message-ID: <CAMjhiJg_2+jdiJaiWHumQ2oXc80apXhJ3RaiGnsWM4_-2QOMRg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH] systemd: RDEPENDS on util-linux-umount
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
X-List-Received-Date: Thu, 07 Mar 2019 14:56:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2019 at 3:27 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>
> It looks like there is an implicit dependency on util-linux'
> umount - as otherwise when using busybox' umount we see a
> long delay on shutdown / reboot.
>
> [YOCTO #13058]
>
That bug number is wrong, seems only slighty related:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13058

Following the discussions, I think this had to do with older versions
of busybox not ignoring the '-c' option that systemd passes to umount.

https://github.com/systemd/systemd/issues/7786

So, systemd has a dependency on *either* util-linux-mount *or* a
minimal version of busybox. Do we support minimal version dependencies
in Yocto?

Regards,

Leon.

