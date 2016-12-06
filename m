Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id C7CC171AAD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 19:52:24 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id n6so357624679qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 11:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DSACl7xHp3kLXwojT/EyWxn/wmi02wtev3IbuQvIOSw=;
	b=UWWRtf1Pz+AWHlAkYsmHBT5GbOYQtGFRq/XeiElfLbhKBdbGmN8vzFKrKyps1hwTZA
	/G+7LYyJzKk0kM0R/HMNhzXuQDPO4w59yjhGPr3oDeIEf8LY1GxVrrBJvi5jmm0ccdyk
	pvHILhDEla/OH6yGT3lmaYyTRLLSDBu439vS8JtgLMddjYmdQpfiP3uWus13OP1SUNZy
	9K9UxMIOjros0GCLyVs804snHYb/KMEUmay4Y3mTG144+nyYoSwdxFXC7aOBqEcNCw/o
	xOnQ8KO94PQuszv0+kFOq/s3ThwerPPOT7lqlF4a1Y88IaPkW68uDwlj3rH3xRozUkYg
	A1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DSACl7xHp3kLXwojT/EyWxn/wmi02wtev3IbuQvIOSw=;
	b=jm0j+bzImHnEuCkI8oBxJ6h3SowFm5fhsD/NhpLnsCveheSkg+7MDampAEZ33M4HS7
	TUnHbIKaQcI5EoO6h1okuLfY5ukpoBb9Cwjl/kkYHdUpInSuKS+VqjxeD6SVCvZEtvwZ
	FvnMozLMC9zTxGQm/yrbLeXPlyHn22jImcmywQXSAfCabxH7CLaH7FiqgouGTQrhJZN7
	thX/FS0r4wArC4o/8ag4ULWdAXDWPUUw2WmxWAXPJ8xvq4bXND8TeIHcD3Lwi/BAUgPl
	Ibo69R+cU1nnmieQ/nBDro2UYjxMms9k+JWC0Hl87fv2ik/N7+H7M9oKnt6r6ktu5zhM
	/7uA==
X-Gm-Message-State: AKaTC03qKLjOWKqJZ/0v44etI9XQNzjoOXLk9U9wBTswlhfA5LKyPTbCszptZ4utm/Gv3h5bv5ic2AMJ3V364ce/
X-Received: by 10.237.37.77 with SMTP id w13mr63596551qtc.197.1481053945681;
	Tue, 06 Dec 2016 11:52:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 11:52:05 -0800 (PST)
In-Reply-To: <1481024991-5882-3-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-3-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 19:52:05 +0000
Message-ID: <CAJTo0LbsxuA6wMm8gY1LJJhxq15k10x9HoD0qBBHi4tSoQa8SA@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/33] dpkg: update-alternatives-dpkg should conflict with other providers
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
X-List-Received-Date: Tue, 06 Dec 2016 19:52:25 -0000
Content-Type: multipart/alternative; boundary=001a114108ea538ec2054302be07

--001a114108ea538ec2054302be07
Content-Type: text/plain; charset=UTF-8

This needs more than just RCONFLICTS:

ERROR: dpkg-native-1.18.7-r0 do_populate_sysroot: The recipe dpkg-native is
trying to install files into a shared area when those files already exist.
Those files and their manifest location are:

 /data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/bin/update-alternatives

I have both package_deb and package_rpm enabled, and have a build from
master before trying your branch.

Ross

On 6 December 2016 at 11:49, Andreas Oberritter <obi@opendreambox.org>
wrote:

> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/recipes-devtools/dpkg/dpkg.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc
> b/meta/recipes-devtools/dpkg/dpkg.inc
> index ec0117b..f7d9e77 100644
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -63,6 +63,7 @@ do_install_append () {
>  PACKAGES =+ "update-alternatives-dpkg"
>  FILES_update-alternatives-dpkg = "${bindir}/update-alternatives
> ${localstatedir}/lib/dpkg/alternatives ${sysconfdir}/alternatives"
>  RPROVIDES_update-alternatives-dpkg = "update-alternatives"
> +RCONFLICTS_update-alternatives-dpkg = "update-alternatives"
>
>  PACKAGES += "${PN}-perl"
>  FILES_${PN}-perl = "${libdir}/perl"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114108ea538ec2054302be07
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This needs more than just RCONFLICTS:<div><br></div><div><=
div>ERROR: dpkg-native-1.18.7-r0 do_populate_sysroot: The recipe dpkg-nativ=
e is trying to install files into a shared area when those files already ex=
ist. Those files and their manifest location are:</div><div>=C2=A0 =C2=A0/d=
ata/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/bin/update-alternatives=
</div></div><div><br></div><div>I have both package_deb and package_rpm ena=
bled, and have a build from master before trying your branch.</div><div><br=
></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On 6 December 2016 at 11:49, Andreas Oberritter <span dir=3D"ltr=
">&lt;<a href=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendre=
ambox.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-o=
ff-by: Andreas Oberritter &lt;<a href=3D"mailto:obi@opendreambox.org">obi@o=
pendreambox.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/dpkg/<wbr>dpkg.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-devtools/dpkg/<wbr>dpkg.inc b/meta/recipes-devtoo=
ls/dpkg/<wbr>dpkg.inc<br>
index ec0117b..f7d9e77 100644<br>
--- a/meta/recipes-devtools/dpkg/<wbr>dpkg.inc<br>
+++ b/meta/recipes-devtools/dpkg/<wbr>dpkg.inc<br>
@@ -63,6 +63,7 @@ do_install_append () {<br>
=C2=A0PACKAGES =3D+ &quot;update-alternatives-dpkg&quot;<br>
=C2=A0FILES_update-alternatives-dpkg =3D &quot;${bindir}/update-alternative=
s ${localstatedir}/lib/dpkg/<wbr>alternatives ${sysconfdir}/alternatives&qu=
ot;<br>
=C2=A0RPROVIDES_update-alternatives-<wbr>dpkg =3D &quot;update-alternatives=
&quot;<br>
+RCONFLICTS_update-<wbr>alternatives-dpkg =3D &quot;update-alternatives&quo=
t;<br>
<br>
=C2=A0PACKAGES +=3D &quot;${PN}-perl&quot;<br>
=C2=A0FILES_${PN}-perl =3D &quot;${libdir}/perl&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a114108ea538ec2054302be07--
