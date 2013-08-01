Return-Path: <djszapi@archlinux.us>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE1F6B1F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 10:50:09 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id wz12so1915977pbc.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 03:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=dbx/MVmAocz2Oa6bHuMYAihbi7ADBTTs0m5Lf56raUQ=;
	b=PV3FHtmai7q94UvxbfnjKN9nWXLz8BvPxAUHgWJKpUU7srHZfSqzbEduwnRQ4MLj62
	gpLITo+bRqyXFodFTCxwcuTk0stdDND8JFI4wZ/0ovuhuDCdRS2EFTZ+vVp5t+sO9Gkn
	ZS/RewYQE80bOnSrd5wTiGJMcfF2ADd0Y5iVcyivQWI0x7ss5XSy6NdH7UCA5KSmqGdb
	GRZMGXcjygqo8IhCYufEsNTZ3Ek7JVbAg06w8EQFFU+83b/Y37cd0NmisThVqT3RFX64
	hiwb9iAvf239J2PLPxFVzyzYtm7DFoSfCWL6/rQA9qarFBHo+sV+6jTyBP7pI2fIi0J3
	6GlA==
MIME-Version: 1.0
X-Received: by 10.68.163.131 with SMTP id yi3mr1185170pbb.55.1375354210390;
	Thu, 01 Aug 2013 03:50:10 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Thu, 1 Aug 2013 03:50:10 -0700 (PDT)
In-Reply-To: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
References: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
Date: Thu, 1 Aug 2013 11:50:10 +0100
X-Google-Sender-Auth: lRRaVuh1Iwuej8ygehYDOmOFk48
Message-ID: <CAOMwXhNbDzsi4=mBb+0=iqdxafnAezRsMvJbG1dPetCTMEhJQQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Ross Burton <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnm+m/TQraef7t0/4ZdzAIILr4eNOW28zNCOxrWfntTZgLx7k054vHdg4JImpP6xyJDyxb3
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] u-boot: state the MACHINE when skipping u-boot
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
X-List-Received-Date: Thu, 01 Aug 2013 10:50:09 -0000
Content-Type: multipart/alternative; boundary=047d7bacb46e26a86304e2e09b3d

--047d7bacb46e26a86304e2e09b3d
Content-Type: text/plain; charset=ISO-8859-1

Speaking of gerrit terms: I would prefer that you didn't submit this.

I would like it to be more specific. If it cannot be more specific, it
should provide further information to get more specific information. Note,
machine configuration can be the command line as well, so this would still
be vague.

On Thu, Aug 1, 2013 at 11:07 AM, Ross Burton <ross.burton@intel.com> wrote:

> If the user accidently tries building u-boot on a machine doesn't use
> u-boot
> (such as qemuarm) the error message doesn't make it clear why u-boot was
> skipped.  To help, state the machine that was being built for again.
>
> [ YOCTO #4945 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> b/meta/recipes-bsp/u-boot/u-boot.inc
> index 6bbe457..6ec63df 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -13,7 +13,7 @@ python () {
>                 FILE = os.path.basename(d.getVar("FILE", True))
>                 bb.debug(1, "To build %s, see %s for instructions on \
>                              setting up your machine config" % (PN, FILE))
> -               raise bb.parse.SkipPackage("because UBOOT_MACHINE is not
> set")
> +               raise bb.parse.SkipPackage("UBOOT_MACHINE is not set in
> the %s machine configuration." % d.getVar("MACHINE", True))
>  }
>
>  # Allow setting an additional version string that will be picked up by the
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7bacb46e26a86304e2e09b3d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Speaking of gerrit terms:=A0<span style=3D"color:rgb(=
0,0,0);font-family:&#39;Arial Unicode MS&#39;,Arial,sans-serif">I would pre=
fer that you didn&#39;t submit this.</span></div><div><br></div>I would lik=
e it to be more specific. If it cannot be more specific, it should provide =
further information to get more specific information. Note, machine configu=
ration can be the command line as well, so this would still be vague.<div>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Aug 1, 20=
13 at 11:07 AM, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.bu=
rton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrot=
e:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">If the user accidently tries building u-=
boot on a machine doesn&#39;t use u-boot<br>

(such as qemuarm) the error message doesn&#39;t make it clear why u-boot wa=
s<br>
skipped. =A0To help, state the machine that was being built for again.<br>
<br>
[ YOCTO #4945 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=A0meta/recipes-bsp/u-boot/u-boot.inc | =A0 =A02 +-<br>
=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc<br>
</div>index 6bbe457..6ec63df 100644<br>
<div class=3D"im">--- a/meta/recipes-bsp/u-boot/u-boot.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-boot.inc<br>
@@ -13,7 +13,7 @@ python () {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 FILE =3D os.path.basename(d.getVar(&quot;FI=
LE&quot;, True))<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.debug(1, &quot;To build %s, see %s for i=
nstructions on \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0setting up your =
machine config&quot; % (PN, FILE))<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 raise bb.parse.SkipPackage(&quot;because UBOO=
T_MACHINE is not set&quot;)<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 raise bb.parse.SkipPackage(&quot;UBOOT_=
MACHINE is not set in the %s machine configuration.&quot; % d.getVar(&quot;=
MACHINE&quot;, True))<br>
<div class=3D""><div class=3D"h5">=A0}<br>
<br>
=A0# Allow setting an additional version string that will be picked up by t=
he<br>
--<br>
1.7.10.4<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</div></div></blockquote></div><br></div></div></div>

--047d7bacb46e26a86304e2e09b3d--
