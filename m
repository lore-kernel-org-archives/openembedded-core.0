Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 253087645E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 09:31:38 +0000 (UTC)
Received: by qkdg63 with SMTP id g63so15899970qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 02:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v9a6VTCOfX/Pd/Hg3fwAn7fWNehFcBfD/TiwrHcgm+c=;
	b=Vqc5xFvCPySKNwG06c/E4DJqFHHyt+nSwSBtpmx3DhQBLEDtXbz6ao1n0yQd5/4otY
	o2WKK7NIxN+PU8V+cYI8eMudnil5FgDcpKLq3wvpz53xhz0Y0k0H6+swe5n6hd/W2+Tr
	iOLj2+8+Rmcoswxt2Jiw32H9OHKb4VqcbPJHKG1zstE2AyZ+T2pxfBle8uTNDgLMZf2g
	27ZU1wCc/fosjCYEGKkKg8a4mNIf7rEDbV0lUW6TOGjdZQZ5S+MKDfekGp2uFvusElMT
	AdUhawFJ5faNi+n7DZ22oJCZqUr0CbJnPouM0J60IomdiJivsmdZGkCpF0PvxzkR5SHt
	WG4g==
X-Gm-Message-State: ALoCoQklpa4i86/8jPnRv7uh0+Y4FNKzo3JY/phfD2aqJ+YsGVe6kKnvP4zoOWsrmKFFOUUhSDh8
X-Received: by 10.55.19.19 with SMTP id d19mr69486922qkh.100.1438248698551;
	Thu, 30 Jul 2015 02:31:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Thu, 30 Jul 2015 02:31:19 -0700 (PDT)
In-Reply-To: <1438276954-8382-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438276954-8382-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jul 2015 10:31:19 +0100
Message-ID: <CAJTo0LZhkvggLTcgEJ56=c_5g06JNNfK_31g3R8Lbb5fY=BLTw@mail.gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][meta-oe][PATCH] iotop: upgrade 0.4.4 -> 0.6
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
X-List-Received-Date: Thu, 30 Jul 2015 09:31:40 -0000
Content-Type: multipart/alternative; boundary=001a11401734c6d055051c145ebc

--001a11401734c6d055051c145ebc
Content-Type: text/plain; charset=UTF-8

meta-oe patches go to openembedded-devel@.

Ross

On 30 July 2015 at 18:22, Li xin <lixin.fnst@cn.fujitsu.com> wrote:

> From: zhangpanpan <zhangpp-fnst@cn.fujitsu.com>
>
> Signed-off-by: Zhang Panpan<zhangpp-fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-extended/iotop/{iotop_0.4.4.bb => iotop_0.6.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-extended/iotop/{iotop_0.4.4.bb => iotop_0.6.bb}
> (83%)
>
> diff --git a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
> b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
> similarity index 83%
> rename from meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
> rename to meta-oe/recipes-extended/iotop/iotop_0.6.bb
> index d629245..5dcae98 100644
> --- a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
> +++ b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
> @@ -4,14 +4,13 @@ DESCRIPTION = "iotop does for I/O usage what top(1) does
> for CPU usage. \
>      a table of current I/O usage by processes on the system."
>  HOMEPAGE = "http://guichaz.free.fr/iotop/"
>
> -PR = "r1"
>
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
>
>  SRC_URI = "http://guichaz.free.fr/iotop/files/${BP}.tar.bz2"
> -SRC_URI[md5sum] = "cdd38b276cbf238676f5d2bcf098ba9c"
> -SRC_URI[sha256sum] =
> "46f3279fb1a7dfc129b5d00950c6e8389e4aedeb58880e848b88d686483df0b0"
> +SRC_URI[md5sum] = "5ef9456b26d7694abf3101a72e1e0d1d"
> +SRC_URI[sha256sum] =
> "3adea2a24eda49bbbaeb4e6ed2042355b441dbd7161e883067a02bfc8dcef75b"
>
>  inherit distutils
>
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11401734c6d055051c145ebc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">meta-oe patches go to openembedded-devel@.<div><br></div><=
div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On 30 July 2015 at 18:22, Li xin <span dir=3D"ltr">&lt;<a href=3D"mailto=
:lixin.fnst@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: zhangpanpan &lt;=
<a href=3D"mailto:zhangpp-fnst@cn.fujitsu.com">zhangpp-fnst@cn.fujitsu.com<=
/a>&gt;<br>
<br>
Signed-off-by: Zhang Panpan&lt;<a href=3D"mailto:zhangpp-fnst@cn.fujitsu.co=
m">zhangpp-fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-extended/iotop/{<a href=3D"http://iotop_0.4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">iotop_0.4.4.bb</a> =3D&gt; <a href=3D"htt=
p://iotop_0.6.bb" rel=3D"noreferrer" target=3D"_blank">iotop_0.6.bb</a>} | =
5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-oe/recipes-extended/iotop/{<a href=3D"http://iotop_0.4.4.=
bb" rel=3D"noreferrer" target=3D"_blank">iotop_0.4.4.bb</a> =3D&gt; <a href=
=3D"http://iotop_0.6.bb" rel=3D"noreferrer" target=3D"_blank">iotop_0.6.bb<=
/a>} (83%)<br>
<br>
diff --git a/meta-oe/recipes-extended/iotop/<a href=3D"http://iotop_0.4.4.b=
b" rel=3D"noreferrer" target=3D"_blank">iotop_0.4.4.bb</a> b/meta-oe/recipe=
s-extended/iotop/<a href=3D"http://iotop_0.6.bb" rel=3D"noreferrer" target=
=3D"_blank">iotop_0.6.bb</a><br>
similarity index 83%<br>
rename from meta-oe/recipes-extended/iotop/<a href=3D"http://iotop_0.4.4.bb=
" rel=3D"noreferrer" target=3D"_blank">iotop_0.4.4.bb</a><br>
rename to meta-oe/recipes-extended/iotop/<a href=3D"http://iotop_0.6.bb" re=
l=3D"noreferrer" target=3D"_blank">iotop_0.6.bb</a><br>
index d629245..5dcae98 100644<br>
--- a/meta-oe/recipes-extended/iotop/<a href=3D"http://iotop_0.4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">iotop_0.4.4.bb</a><br>
+++ b/meta-oe/recipes-extended/iotop/<a href=3D"http://iotop_0.6.bb" rel=3D=
"noreferrer" target=3D"_blank">iotop_0.6.bb</a><br>
@@ -4,14 +4,13 @@ DESCRIPTION =3D &quot;iotop does for I/O usage what top(1=
) does for CPU usage. \<br>
=C2=A0 =C2=A0 =C2=A0a table of current I/O usage by processes on the system=
.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://guichaz.free.fr/iotop/" rel=3D"n=
oreferrer" target=3D"_blank">http://guichaz.free.fr/iotop/</a>&quot;<br>
<br>
-PR =3D &quot;r1&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;GPLv2+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4325afd396febcb659c36=
b49533135d4&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://guichaz.free.fr/iotop/files/${BP}=
.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://guichaz.free.fr/iotop=
/files/${BP}.tar.bz2</a>&quot;<br>
-SRC_URI[md5sum] =3D &quot;cdd38b276cbf238676f5d2bcf098ba9c&quot;<br>
-SRC_URI[sha256sum] =3D &quot;46f3279fb1a7dfc129b5d00950c6e8389e4aedeb58880=
e848b88d686483df0b0&quot;<br>
+SRC_URI[md5sum] =3D &quot;5ef9456b26d7694abf3101a72e1e0d1d&quot;<br>
+SRC_URI[sha256sum] =3D &quot;3adea2a24eda49bbbaeb4e6ed2042355b441dbd7161e8=
83067a02bfc8dcef75b&quot;<br>
<br>
=C2=A0inherit distutils<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.8.4.2<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11401734c6d055051c145ebc--
