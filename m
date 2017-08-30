Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id D5FEC78250
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 10:53:33 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id o132so4555200itc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 03:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tyvGkAWwkndhFmTDfFnw+vEmtvHz/+RIBul4lvl8S4M=;
	b=APncAaFl1OnfBqjnppbBtp+L9vytmG5A4HwSRIzA4oM2LBACIvvzliDlxSp2aL0Mxz
	Ol4nQQH9+WJ6pjW5xi+ld6pU4Sh7IBBZ0slISpvQNWFgSvf6VtEzfyqiVOHC2urBWt8R
	vFKYZZunxBCrhp/K7qigl+jSMGRNdRa77rIDHR68xC0FISKS9pMLrCcK24S2aCYmDUEX
	BnNnKS1hygLt4xTjAkm3Qcr4Dsajc1cLUOhoNCU9RPfVc4pgU8tTPC9II3DlDEHUVP5o
	dmh6tjxyvWkx7WEKfjvgUULniz9BDRdQuuMBljheD0MzzQ0BStwuhJFtDa6uS4KSziYk
	bgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tyvGkAWwkndhFmTDfFnw+vEmtvHz/+RIBul4lvl8S4M=;
	b=XTzbM+BHWoTb+sQSjlJSmX8M9+HvV4NbtZfCDHJUduVzgovJXzD9oIwqP4xHUoEPfD
	Xek3I2UPvvxpSvQetYj6/FYVTyajPX9EyodUHGjv1b8SIhBnaTHF9PQq5zd77KGJZLyc
	nubWER0DdOxoUQyIZ/9BNaGabGOyiYyoftM/IMasg0iTUlxBerL7TbXqPFamuWeOM469
	MArD1f/EwDw/3pTI8NZbIWml4PHaBXMOQKpuTnBGSkzNqo3DcRLIndvoDKmrPDcKhvJQ
	4HjtOfX6/KL5N/Rhj+R+vd5ccN7bMTdijCWG6PRjs64ZBhn9phpV5khZnPwIJZTK8Ow0
	bZrw==
X-Gm-Message-State: AHYfb5hFO6uZ76+v46VRu93F2j0Acs4aZNRfl8W6gggTRIf7M1DXTi2/
	917OE77wxaUb5rC/rJa1IzL1iG3bsnGs
X-Received: by 10.36.77.73 with SMTP id l70mr934836itb.70.1504090414770; Wed,
	30 Aug 2017 03:53:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Wed, 30 Aug 2017 03:53:14 -0700 (PDT)
In-Reply-To: <1503991517-3965-1-git-send-email-yi.zhao@windriver.com>
References: <1503991517-3965-1-git-send-email-yi.zhao@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 Aug 2017 11:53:14 +0100
Message-ID: <CAJTo0LYAddb5=Lm8tfX8E4SHTeHRsUfv=HV1Civ7ak9G8M4sAg@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libmnl: add recpie
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
X-List-Received-Date: Wed, 30 Aug 2017 10:53:34 -0000
Content-Type: multipart/alternative; boundary="001a114064b2e207cd0557f65678"

--001a114064b2e207cd0557f65678
Content-Type: text/plain; charset="UTF-8"

Note that we've reached feature freeze for 2.4 so this will have to wait
for 2.5.

Ross

On 29 August 2017 at 08:25, Yi Zhao <yi.zhao@windriver.com> wrote:

> libmnl is a minimalistic user-space library oriented to Netlink
> developers. There are a lot of common tasks in parsing, validating,
> constructing of both the Netlink header and TLVs that are repetitive
> and easy to get wrong.
>
> Move it from meta-networking to oe-core as it is a dependency for
> iproute2 to support tipc.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/recipes-support/libmnl/libmnl_1.0.4.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta/recipes-support/libmnl/libmnl_1.0.4.bb
>
> diff --git a/meta/recipes-support/libmnl/libmnl_1.0.4.bb
> b/meta/recipes-support/libmnl/libmnl_1.0.4.bb
> new file mode 100644
> index 0000000..b458799
> --- /dev/null
> +++ b/meta/recipes-support/libmnl/libmnl_1.0.4.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "Minimalistic user-space Netlink utility library"
> +DESCRIPTION = "Minimalistic user-space library oriented to Netlink
> developers, providing \
> +    functions for common tasks in parsing, validating, and constructing
> both the Netlink header and TLVs."
> +HOMEPAGE = "http://www.netfilter.org/projects/libmnl/index.html"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +SRC_URI = "http://www.netfilter.org/projects/libmnl/files/libmnl-$
> {PV}.tar.bz2;name=tar"
> +SRC_URI[tar.md5sum] = "be9b4b5328c6da1bda565ac5dffadb2d"
> +SRC_URI[tar.sha256sum] = "171f89699f286a5854b72b91d06e8f
> 8e3683064c5901fb09d954a9ab6f551f81"
> +
> +inherit autotools pkgconfig
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114064b2e207cd0557f65678
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Note that we&#39;ve reached feature freeze for 2.4 so this=
 will have to wait for 2.5.<div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 29 August 2017 at 08:25,=
 Yi Zhao <span dir=3D"ltr">&lt;<a href=3D"mailto:yi.zhao@windriver.com" tar=
get=3D"_blank">yi.zhao@windriver.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">libmnl is a minimalistic user-space library oriented to N=
etlink<br>
developers. There are a lot of common tasks in parsing, validating,<br>
constructing of both the Netlink header and TLVs that are repetitive<br>
and easy to get wrong.<br>
<br>
Move it from meta-networking to oe-core as it is a dependency for<br>
iproute2 to support tipc.<br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com">yi.zhao=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/libmnl/<a href=3D"http://libmnl_1.0.4.bb" rel=3D=
"noreferrer" target=3D"_blank">li<wbr>bmnl_1.0.4.bb</a> | 13 +++++++++++++<=
br>
=C2=A01 file changed, 13 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/libmnl/<a href=3D"http://libm=
nl_1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>bmnl_1.0.4.bb</a><=
br>
<br>
diff --git a/meta/recipes-support/libmnl/<a href=3D"http://libmnl_1.0.4.bb"=
 rel=3D"noreferrer" target=3D"_blank"><wbr>libmnl_1.0.4.bb</a> b/meta/recip=
es-support/libmnl/<a href=3D"http://libmnl_1.0.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank"><wbr>libmnl_1.0.4.bb</a><br>
new file mode 100644<br>
index 0000000..b458799<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libmnl/<a href=3D"http://libmnl_1.0.4.bb" rel=3D=
"noreferrer" target=3D"_blank"><wbr>libmnl_1.0.4.bb</a><br>
@@ -0,0 +1,13 @@<br>
+SUMMARY =3D &quot;Minimalistic user-space Netlink utility library&quot;<br=
>
+DESCRIPTION =3D &quot;Minimalistic user-space library oriented to Netlink =
developers, providing \<br>
+=C2=A0 =C2=A0 functions for common tasks in parsing, validating, and const=
ructing both the Netlink header and TLVs.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.netfilter.org/projects/libmnl/ind=
ex.html" rel=3D"noreferrer" target=3D"_blank">http://www.netfilter.org/<wbr=
>projects/libmnl/index.html</a>&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+LICENSE =3D &quot;LGPLv2.1+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>4fbd65380cdd255951079=
008b36451<wbr>6c&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://www.netfilter.org/projects/libmnl/file=
s/libmnl-${PV}.tar.bz2;name=3Dtar" rel=3D"noreferrer" target=3D"_blank">htt=
p://www.netfilter.org/<wbr>projects/libmnl/files/libmnl-$<wbr>{PV}.tar.bz2;=
name=3Dtar</a>&quot;<br>
+SRC_URI[tar.md5sum] =3D &quot;<wbr>be9b4b5328c6da1bda565ac5dffadb<wbr>2d&q=
uot;<br>
+SRC_URI[tar.sha256sum] =3D &quot;<wbr>171f89699f286a5854b72b91d06e8f<wbr>8=
e3683064c5901fb09d954a9ab6f55<wbr>1f81&quot;<br>
+<br>
+inherit autotools pkgconfig<br>
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

--001a114064b2e207cd0557f65678--
