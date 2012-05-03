Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPqge-0002ja-79
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 09:42:52 +0200
Received: by laai10 with SMTP id i10so339275laa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 00:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=2PkFR2iRy0RePh2xOMgr5iKk/JGO6jNhlrfkB9Qg/Jg=;
	b=l5jvMNqgWVwl1VGVKo98NM0o5Seo15UdlBmvPv6QQfN1GyLRdEyEL4dDtxLrt5aJBa
	11MB1nM+HEl4bY9MqAZYYggXATBhsqG+4AibDx7E9FW2qN1BiIR3ocw9YAZb021uG8dt
	WyolOgkuQ9Y8NUrQ5cwUEgQgwYmIGy4u6QLBPLkJMqLy8+YcIiQtrJr+0xKMOgj9SenF
	z1qJpL4CB30npyMtB5HSlQhI9GSn2fHWoZ5usYB/L9TbVBBEdyMwRtJErw8RH6SAc+ik
	7umst6Sam5Nd/h01oxfi9QH936mBez26T+NrCMuJ8bc4HSj3TGYu2xp9o9wk44RrFBFr
	Tqhg==
Received: by 10.152.145.228 with SMTP id sx4mr1006854lab.45.1336030387030;
	Thu, 03 May 2012 00:33:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 3 May 2012 00:32:36 -0700 (PDT)
In-Reply-To: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 May 2012 00:32:36 -0700
Message-ID: <CAMKF1soELbeTS=ZnH3bhUbJkcaUz_sdkhRcykntqc=2jNBcUrg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 07:42:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 2, 2012 at 7:23 AM, Jason Wessel <jason.wessel@windriver.com> w=
rote:
> The user mode NFS server does not get built by default when you are
> using a purely command line driven development environment without SDK
> tools. =C2=A0In order to accommodate simple test configurations and have
> all the tools built for the minimal validation with qemu-native,
> simply add the dependency to unfs-server-native.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
> =C2=A0meta/conf/machine/include/qemu.inc | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/inclu=
de/qemu.inc
> index 421a149..742b629 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -14,4 +14,4 @@ RDEPENDS_kernel-base =3D ""
> =C2=A0# Use a common kernel recipe for all QEMU machines
> =C2=A0PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
>
> -EXTRA_IMAGEDEPENDS +=3D "qemu-native qemu-helper-native"
> +EXTRA_IMAGEDEPENDS +=3D "qemu-native qemu-helper-native unfs-server-nati=
ve"
> --

how about replacing  EXTRA_IMAGEDEPENDS with
MACHINE_ESSENTIAL_EXTRA_RDEPENDS here ?

> 1.6.6.2
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


