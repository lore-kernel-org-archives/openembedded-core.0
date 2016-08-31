Return-Path: <bill.randle@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 71064731BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 14:42:29 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id c133so35880078wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pBXt+EP9c6N0kca6h6JSZfcjPttLDUDLGZ4WjSnDngg=;
	b=c6vwM+NYcKkCcAKCGPAOjjgOTRnjXsZs6Wcc9AOi6JT/wZbQY07tZl0YjjjuRFGEAb
	t/ovKXVYpYweDZW2a+2lXFq0XRgy01ftUmxU/Mca3i6Pt8a0arvAOIPKtls2m6gycsX+
	qV3bgFSiyAGOEulwt62jEWDmMX/CbUhdfXc/pOY7duMRrQCzEIFrUppWC2PSJ5ziCRPE
	vPl52WmlEhQmaJigOyJR0o4VMSPOUU4ETpk+CMEfcnZnIJHnxeQ/qnRH/EykSulRuc6t
	9paeYRluv4R2FVKEAEuCyrDnFh180Y2TjzsU6G86QYJe91FrjEqTBkt0+uYH21E225fS
	9w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pBXt+EP9c6N0kca6h6JSZfcjPttLDUDLGZ4WjSnDngg=;
	b=OSakFa8xVXmDdFBZ3Au6U+TbEarncJkTfbffq+BHp9IWQM1o1IwHOZfQWmrHUWi1eC
	APGZn0gKbf29AU3DIOpqEuh91NIYFwDkXOFyGVJstIqQqO3rLSIEfHR/FIrkIz/b2G2p
	nrdYt/UQRS36a46h5iZO1WNicXR9Q4WZ3Nin/y7hFxDe/pwXhkZ1FbhnDJcG6IY6THH9
	B5yaV5e7AxEtySnWuyKrWIRznmIIQIYV2kvLSXAouarfUu0ry0w984RYtvXDXveRQUX2
	vHqPSm/mNS+l9z7GLiT5oJsMMMMmz6k2mfSur7i1MBk/JPazzDeALna1i72ZJg9wRRkg
	RWpw==
X-Gm-Message-State: AE9vXwMYqlfx4KyOd7W5xHg9utVFyy+65B4ICVmpfys3Sfi4XKtG2X8mdOsWPQ03AFaSlIGC1qZ2Ot4XKSEWYg==
X-Received: by 10.194.222.231 with SMTP id qp7mr9194978wjc.134.1472654549395; 
	Wed, 31 Aug 2016 07:42:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.1.150 with HTTP; Wed, 31 Aug 2016 07:42:28 -0700 (PDT)
In-Reply-To: <1472621878-5147-1-git-send-email-zhenbo.gao@windriver.com>
References: <1472621878-5147-1-git-send-email-zhenbo.gao@windriver.com>
From: Bill Randle <bill.randle@gmail.com>
Date: Wed, 31 Aug 2016 07:42:28 -0700
Message-ID: <CA+n--H_aSwgXXtNj8VJO3JxDs0zC5RiOXRAqLp=nL8Bpp16U0g@mail.gmail.com>
To: Zhenbo Gao <zhenbo.gao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl: correct the path of perl used by ptest
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
X-List-Received-Date: Wed, 31 Aug 2016 14:42:30 -0000
Content-Type: multipart/alternative; boundary=001a11c3ad8a4b39fa053b5f1bd9

--001a11c3ad8a4b39fa053b5f1bd9
Content-Type: text/plain; charset=UTF-8

Under what conditions is the explicit path to /usr/bin/perl required? Just
before your added code, it creates a symlink from the installed perl
location to the "t" directory where the tests are run. What if the perl
that was built was an alternate version and installed in /usr/local/bin?

    -Bill

On Tue, Aug 30, 2016 at 10:37 PM, Zhenbo Gao <zhenbo.gao@windriver.com>
wrote:

> some files from perl-ptest depends on perl, which is located at /usr/bin/
>
> Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
> ---
>  meta/recipes-devtools/perl/perl-ptest.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc
> b/meta/recipes-devtools/perl/perl-ptest.inc
> index d136c5c..94e40e6 100644
> --- a/meta/recipes-devtools/perl/perl-ptest.inc
> +++ b/meta/recipes-devtools/perl/perl-ptest.inc
> @@ -24,6 +24,12 @@ do_install_ptest () {
>
>         ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
>
> +       # perl is located at /usr/bin/
> +       p='^#![/.]*perl'
> +       files=`grep -E ${p} ${D} -nr | grep -v -E 'Binary|win32' | cut -d
> ':' -f 1`
> +       for f in ${files}; do
> +               sed -i -e "s:${p}:#! ${USRBINPATH}/perl:g" ${f}
> +       done
>  }
>
>  python populate_packages_prepend() {
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c3ad8a4b39fa053b5f1bd9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Under what conditions is the explicit path to /usr/bin/per=
l required? Just before your added code, it creates a symlink from the inst=
alled perl location to the &quot;t&quot; directory where the tests are run.=
 What if the perl that was built was an alternate version and installed in =
/usr/local/bin?<div><br></div><div>=C2=A0 =C2=A0 -Bill</div></div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Aug 30, 2016 at 10=
:37 PM, Zhenbo Gao <span dir=3D"ltr">&lt;<a href=3D"mailto:zhenbo.gao@windr=
iver.com" target=3D"_blank">zhenbo.gao@windriver.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">some files from perl-ptest depends on per=
l, which is located at /usr/bin/<br>
<br>
Signed-off-by: Zhenbo Gao &lt;<a href=3D"mailto:zhenbo.gao@windriver.com">z=
henbo.gao@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/perl/<wbr>perl-ptest.inc | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/perl/<wbr>perl-ptest.inc b/meta/recipes-=
devtools/perl/<wbr>perl-ptest.inc<br>
index d136c5c..94e40e6 100644<br>
--- a/meta/recipes-devtools/perl/<wbr>perl-ptest.inc<br>
+++ b/meta/recipes-devtools/perl/<wbr>perl-ptest.inc<br>
@@ -24,6 +24,12 @@ do_install_ptest () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl<=
br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# perl is located at /usr/bin/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0p=3D&#39;^#![/.]*perl&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0files=3D`grep -E ${p} ${D} -nr | grep -v -E &#3=
9;Binary|win32&#39; | cut -d &#39;:&#39; -f 1`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in ${files}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s:$=
{p}:#! ${USRBINPATH}/perl:g&quot; ${f}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0}<br>
<br>
=C2=A0python populate_packages_prepend() {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
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

--001a11c3ad8a4b39fa053b5f1bd9--
