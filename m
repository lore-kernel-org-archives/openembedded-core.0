Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QbBPX-00035E-EK
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 14:59:31 +0200
Received: by gwb11 with SMTP id 11so1927229gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 05:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=JYvjiVnK5JPO23ERy/fWyF87LOM83v1gAEyp5aHA7P4=;
	b=kcYJ8rNiwfFs25pG0rnmqJC0pMeGWzuO0s7OnVtvJTkWFQD3Gqk2knWslHs8IAk+1m
	bgDsIGN3L6ZjFbaIvwvoyip+r0IDuOCXH9Nfx+Llj0hWejU2pJ1sapLG2aRMeWx+8THK
	eKBcQPgKCL5t9BBiJopXMjD55O8rPFmFU+g0o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=oZLWLmbqW6dsyiFRFOUKRkwNYy4EBZtGcSFO+u+skpfoRpb0iHLop1TDqOjQYfv8bx
	JJUCTmD54TwHzrz89GvlPXMsfXQhLRVBEHVGz0JpfmavV+2cZxKZ9CJryHeJ5+aKiwJi
	gXcpFvaaXFWlYjMO4SJfMP2V+9xNoozHcKjWs=
MIME-Version: 1.0
Received: by 10.90.249.11 with SMTP id w11mr1495872agh.3.1309179350595; Mon,
	27 Jun 2011 05:55:50 -0700 (PDT)
Received: by 10.91.161.1 with HTTP; Mon, 27 Jun 2011 05:55:50 -0700 (PDT)
In-Reply-To: <1865303E0DED764181A9D882DEF65FB69F4CEB0730@shsmsx502.ccr.corp.intel.com>
References: <cover.1308777703.git.bruce.ashfield@windriver.com>
	<13b6560cbb0a8a498266eba93e93f71fb34be9c2.1308777703.git.bruce.ashfield@windriver.com>
	<1865303E0DED764181A9D882DEF65FB69F4CEB0730@shsmsx502.ccr.corp.intel.com>
Date: Mon, 27 Jun 2011 08:55:50 -0400
Message-ID: <BANLkTi=5O-MUTWv01N_ngQeDah7veUzccQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "dvhart@linux.intel.com" <dvhart@linux.intel.com>,
	"koen@dominion.thruhere.net" <koen@dominion.thruhere.net>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 1/2] linux-yocto: update meta SRCREV for new config groups
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
X-List-Received-Date: Mon, 27 Jun 2011 12:59:31 -0000
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable

2011/6/27 Cui, Dexuan <dexuan.cui@intel.com>:
> Hi, I got the following ERROR with the patch:
>
> Log data follows:
> | Unstaged changes after reset:
> | M arch/powerpc/boot/dts/mpc8315erdb.dts
> | Deleted branch meta-temp (was cf7d7e5).
> | WARNING: addon feature "features/taskstats" was not found
> | ERROR: required features were not found. aborting
> | ERROR: Function 'do_patch' failed
>
> Maybe we forgot to push the proper commits into the linux-yocto git repo?

I definitely pushed them all. see here:

http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-2.6.37/commit/?h=3Dme=
ta&id=3D94fa015b130e96a3b6242a8ac4ff4cca9406951f

It's more likely that your local clone wasn't properly updated. I'll double
check the SRCREV as well, which I just did. And that's correct as well:

http://git.pokylinux.org/cgit/cgit.cgi/linux-yocto-2.6.37/commit/?h=3Dmeta&=
id=3Dd5d3c6480d61f83503ccef7fbcd765f7aca8b71b

Bruce

>
> Thanks,
> -- Dexuan
>
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-bounces@lists.openembedded.org] On Behalf Of Bruce Ashfield
> Sent: 2011=C4=EA6=D4=C223=C8=D5 5:29
> To: richard.purdie@linuxfoundation.org
> Cc: dvhart@linux.intel.com; openembedded-core@lists.openembedded.org; koe=
n@dominion.thruhere.net; Wold, Saul
> Subject: [OE-core] [PATCH 1/2] linux-yocto: update meta SRCREV for new co=
nfig groups
>
> Updating the SRCREV for the kernel repo's meta branch to capture
> the following commits:
>
>  94fa015 meta: add taskstats experimental feature group
>  4fb2ed5 meta: enable freezer support
>  88d619e meta: enable fuse and cuse as modules
>  f465827 meta: add namespaces + experimental configs
>  fbdd376 meta: add devtmpfs config group
>  b04f6d9 meta: re-enable cgroups options in the standard kernel
>
> There's also a change to the recipe itself to trigger the taskstats
> optional config items by default. This is to allow the introduction
> of these changes gradually, since other recipes inheriting the kernel
> can add or ignore these options at their convenience.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb b/meta/recip=
es-kernel/linux/linux-yocto_2.6.37.bb
> index 2ee801e..90943c2 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
> @@ -20,9 +20,9 @@ SRCREV_machine_qemuppc =3D "9d278962ff228ea9627a85b0d21=
ed717246ebf1f"
>  SRCREV_machine_qemux86 =3D "57545699dff0b384bb16be74b0358059da5cce6a"
>  SRCREV_machine_qemux86-64 =3D "5d36c23eecdc9663c9c3a2a511d4872d3b3fd669"
>  SRCREV_machine =3D "12646d158aced2ba0122787bd56ff554e371091c"
> -SRCREV_meta =3D "8888d948e0ddbc5f37bd3dc23cc1b398ab230e2e"
> +SRCREV_meta =3D "94fa015b130e96a3b6242a8ac4ff4cca9406951f"
>
> -PR =3D "r18"
> +PR =3D "r19"
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>  SRCREV_FORMAT =3D "meta_machine"
>
> @@ -33,6 +33,7 @@ COMPATIBLE_MACHINE =3D "(qemuarm|qemux86|qemuppc|qemumi=
ps|qemux86-64)"
>  # Functionality flags
>  KERNEL_REVISION_CHECKING ?=3D "t"
>  KERNEL_FEATURES=3D"features/netfilter"
> +KERNEL_FEATURES_append=3D" features/taskstats"
>  KERNEL_FEATURES_append_qemux86=3D" cfg/sound"
>  KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound"
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


