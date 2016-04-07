Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id E3B4F770CD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 09:50:36 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id o126so65282757iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 02:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qNqYzGeonuM8A3EvgXNBkHjv6BjL+J0YdxG+6h+0gE8=;
	b=Q4C0NaV8gVvvylez1kNUrCWhJKdfVSSgSiPj5+jIzOzWwjMZAtcjzcdEogVfKPAYY4
	gNcXOpOA9CkxKx+io/4tko6BddvLtdIbJqtFlTXos88QWenMl4c8o9rH5ePmpmA54/ih
	rbSpkkQja4DVamaj+P1yOse3YmEI9BYatGOoTfhMLa6ep7IL4Foxenfl+JnhqJwdU/az
	wYndzIldLcvagcpOK5dw1ha8i2JmYebj05IJwD6Bm53u+psSNmohePbfNT6TLQvhwaRO
	KYJcF/PefMoc/OC41esa9zzJTQUeLRCUXz5WoEC9O3u/29WlHjQN3PvuuZErrhmEeKne
	/awA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qNqYzGeonuM8A3EvgXNBkHjv6BjL+J0YdxG+6h+0gE8=;
	b=E5ExEeskpHx3Ne0YyaKzQ41CPCAO9MwI/5TI8Gyh4KrWlocUAEZj5z5536CfeXytY5
	U3T1elCdr1ER/JvEJN+R5+oM+HtSFMS7roXf+MqbJxAvFtHatMrSm/brtbpp//YlDlDj
	8MmH+gdinflH1KjBPxgQ0tNUEh/5mtouD+j6m60jKSLVRCxIMcB0nLisVPk9O+6yW2Tg
	Nm6D9w+CP60OavIVsN3M2Ccrynnl2BIrzR2oAX1IF4jgl7QhpBnsVCHfbQKqEByvDpyj
	oklh5RHTCLbDwF2nJv+j2kqb1GZA3/Icmo00/ygmZcEIId2gPEhHYmhSssVkR8+AS7+d
	hy9w==
X-Gm-Message-State: AD7BkJKCmXzuDe7iX9+eSmP4AZ9+ZgO5gM/V3jw4/+FBaCsJLixEfbs9N+Dd5qPCVgoG4DFy4PD3YewpcOG8Yygm
X-Received: by 10.107.134.84 with SMTP id i81mr2094824iod.99.1460022636995;
	Thu, 07 Apr 2016 02:50:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Thu, 7 Apr 2016 02:50:17 -0700 (PDT)
In-Reply-To: <1460012563-18898-1-git-send-email-raj.khem@gmail.com>
References: <1460012563-18898-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Apr 2016 10:50:17 +0100
Message-ID: <CAJTo0LbNiJNmDdFXPwGbF-AD8fzgtj9YiYX9-7jrVGugytgBNQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox/mdev: Ensure /sys is mounted before using it
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
X-List-Received-Date: Thu, 07 Apr 2016 09:50:37 -0000
Content-Type: multipart/alternative; boundary=001a113febc8a4b350052fe202aa

--001a113febc8a4b350052fe202aa
Content-Type: text/plain; charset=UTF-8

On 7 April 2016 at 08:02, Khem Raj <raj.khem@gmail.com> wrote:

> +#sysctl -w kernel.hotplug=/sbin/mdev
>

Why add a commented line?

Ross

--001a113febc8a4b350052fe202aa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 April 2016 at 08:02, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":h8k" class=3D"a3s" style=
=3D"overflow:hidden">+#sysctl -w kernel.hotplug=3D/sbin/mdev<br></div></blo=
ckquote></div><br>Why add a commented line?</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113febc8a4b350052fe202aa--
