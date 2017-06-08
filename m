Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4B4D6781CD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 11:11:03 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id x129so16724783ite.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 04:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3DhtsKRwmBGGaZwxlPQNCMzefyEnaUlgoR5skMNi9TY=;
	b=vPbtvhbC6PuygMe8oaF2w5drN3eTjWmjWXmBY/a7XxCCIhwqb/5C72bfhgoA3nl1nf
	UUV0l/Q1JOefn1Xka2qoVodbo/bvxILS747zx0k3z9WdMC07lATMr0RpR/VucA7sMfiC
	43Sm/ecVMbJ/CS7jO6/pg8CLNGkwWtpjetMdNW4LRu2vT1/TtmjzMBu6aDf6dHfdViF4
	MYCZQ/ui8QLQm4QHcWUQpXcK587zXHcP8eg5k2HfmJhd24UJRArSRnAWemq3I5CPBI0k
	HO5Y76++Nojz+lCdNEkAiiePSBPXzeZwhWRzVR4+aPX/EBgbLI9Q/HC6O0qpn4xaZYfa
	14FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3DhtsKRwmBGGaZwxlPQNCMzefyEnaUlgoR5skMNi9TY=;
	b=JanRGTadHM/1+ZRQILMO8umqhXKhH3xtu7C7c4FT7ox2KUtCA/i1ywq1ksuB+uD0MH
	BGWmFJTD4owMnosm/5+/3VmSkoUmTQ0Zs7/lBzkbomBSPYh94hss53tz1SwgUCifn9Zc
	aTKrr/P0iXxQjL4oHQPcZ5vxm1tpnbI9iH1HmdLrcc8apfx8wcWIoR3UH91sB8fezjQm
	HFsOay9dEFwhfkxYM6AFiw2PQ9SegrIbvQ7mtRseOH9yVLWqB5MF7wVTuz87qhN5CL8v
	MmB7McVLJd6RaqO+OQgm2yGBt87Ixx41Fqc8pQ/oOW33ToTeSnkYR3idmt2bWMwp/56P
	snbA==
X-Gm-Message-State: AODbwcC3IHDZPegzGohMGza865GSmxhjnuCYRHcG+nWUTEZXLprRSdjS
	SZM8tOZl6k7t77fRklVF5tgXWG3PMX8ViaE=
X-Received: by 10.36.9.144 with SMTP id 138mr4886192itm.98.1496920264974; Thu,
	08 Jun 2017 04:11:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.130 with HTTP; Thu, 8 Jun 2017 04:10:34 -0700 (PDT)
In-Reply-To: <1496825497-26430-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1496825497-26430-1-git-send-email-fan.xin@jp.fujitsu.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 8 Jun 2017 14:10:34 +0300
Message-ID: <CAHiDW_HDeS1mp1SAOBD6s1Dh5L+kx1RiL_WQhzdMsKVmLRfEFw@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxml2: Fix CVE-2017-8872
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
X-List-Received-Date: Thu, 08 Jun 2017 11:11:05 -0000
Content-Type: multipart/alternative; boundary="001a113fe74aa6e5f2055170e851"

--001a113fe74aa6e5f2055170e851
Content-Type: text/plain; charset="UTF-8"

On 7 June 2017 at 11:51, Fan Xin <fan.xin@jp.fujitsu.com> wrote:
>
> CVE: CVE-2017-8872
> The htmlParseTryOrFinish function in HTMLparser.c in libxml2 2.9.4 allows
attackers
> to cause a denial of service (buffer over-read) or information disclosure.
>
> External References:
> https://bugzilla.gnome.org/show_bug.cgi?id=77520


This should be
https://bugzilla.gnome.org/show_bug.cgi?id=775200

I have the same question that was asked in the upstream bug comment 6 about
two weeks ago: The patch doesn't seem to have any effect (because the goto
will happen anyway since 'avail' is 0), am I missing something?

Jussi


>
>
> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> ---
>  .../libxml/libxml2/libxml2-CVE-2017-8872.patch     | 23
++++++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.9.4.bb          |  1 +
>  2 files changed, 24 insertions(+)
>  create mode 100644
meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch
b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch
> new file mode 100644
> index 0000000..df05e06
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch
> @@ -0,0 +1,23 @@
> +libxml2-2.9.4: Fix CVE-2017-8872
> +
> +Bug 775200 - (CVE-2017-8872) global-buffer-overflow in
htmlParseTryOrFinish (HTMLparser.c:5403)
> + - [https://bugzilla.gnome.org/show_bug.cgi?id=775200]
> +
> +CVE: CVE-2017-8872
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> +
> +Index: libxml2-2.9.4/HTMLparser.c
> +===================================================================
> +--- libxml2-2.9.4.orig/HTMLparser.c
> ++++ libxml2-2.9.4/HTMLparser.c
> +@@ -5396,6 +5396,8 @@ htmlParseTryOrFinish(htmlParserCtxtPtr c
> +               ctxt->instate = XML_PARSER_EOF;
> +               if ((ctxt->sax) && (ctxt->sax->endDocument != NULL))
> +                   ctxt->sax->endDocument(ctxt->userData);
> ++
> ++              goto done;
> +           }
> +       }
> +         if (avail < 1)
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb
b/meta/recipes-core/libxml/libxml2_2.9.4.bb
> index ea0d3b8..0b4cbca 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
> @@ -24,6 +24,7 @@ SRC_URI = "
ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
>             file://libxml2-CVE-2016-4658.patch \
>             file://libxml2-fix_NULL_pointer_derefs.patch \
>             file://CVE-2016-9318.patch \
> +          file://libxml2-CVE-2017-8872.patch \
>            "
>
>  SRC_URI[libtar.md5sum] = "ae249165c173b1ff386ee8ad676815f5"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a113fe74aa6e5f2055170e851
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 7 June 2017 at 11:51, Fan Xin &lt;<a href=3D"mailto:fan=
.xin@jp.fujitsu.com">fan.xin@jp.fujitsu.com</a>&gt; wrote:<br>&gt;<br>&gt; =
CVE: CVE-2017-8872<br>&gt; The htmlParseTryOrFinish function in HTMLparser.=
c in libxml2 2.9.4 allows attackers<br>&gt; to cause a denial of service (b=
uffer over-read) or information disclosure.<br>&gt;<br>&gt; External Refere=
nces:<br>&gt; <a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D77520=
">https://bugzilla.gnome.org/show_bug.cgi?id=3D77520</a><br><br><br>This sh=
ould be =C2=A0<br><a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D7=
75200">https://bugzilla.gnome.org/show_bug.cgi?id=3D775200</a><br><br>I hav=
e the same question that was asked in the upstream bug comment 6 about two =
weeks ago: The patch doesn&#39;t seem to have any effect (because the goto =
will happen anyway since &#39;avail&#39; is 0), am I missing something?<div=
><br></div><div>Jussi<br>=C2=A0<br>=C2=A0<br>&gt;<br>&gt;<br>&gt; Signed-of=
f-by: Fan Xin &lt;<a href=3D"mailto:fan.xin@jp.fujitsu.com">fan.xin@jp.fuji=
tsu.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0.../libxml/libxml2/libxml2-CVE-20=
17-8872.patch =C2=A0 =C2=A0 | 23 ++++++++++++++++++++++<br>&gt; =C2=A0meta/=
recipes-core/libxml/<a href=3D"http://libxml2_2.9.4.bb">libxml2_2.9.4.bb</a=
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A01 +<br>&gt; =C2=A02 files chang=
ed, 24 insertions(+)<br>&gt; =C2=A0create mode 100644 meta/recipes-core/lib=
xml/libxml2/libxml2-CVE-2017-8872.patch<br>&gt;<br>&gt; diff --git a/meta/r=
ecipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch b/meta/recipes-core/=
libxml/libxml2/libxml2-CVE-2017-8872.patch<br>&gt; new file mode 100644<br>=
&gt; index 0000000..df05e06<br>&gt; --- /dev/null<br>&gt; +++ b/meta/recipe=
s-core/libxml/libxml2/libxml2-CVE-2017-8872.patch<br>&gt; @@ -0,0 +1,23 @@<=
br>&gt; +libxml2-2.9.4: Fix CVE-2017-8872<br>&gt; +<br>&gt; +Bug 775200 - (=
CVE-2017-8872) global-buffer-overflow in htmlParseTryOrFinish (HTMLparser.c=
:5403)<br>&gt; + - [<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=
=3D775200">https://bugzilla.gnome.org/show_bug.cgi?id=3D775200</a>]<br>&gt;=
 +<br>&gt; +CVE: CVE-2017-8872<br>&gt; +Upstream-Status: Submitted<br>&gt; =
+<br>&gt; +Signed-off-by: Fan Xin &lt;<a href=3D"mailto:fan.xin@jp.fujitsu.=
com">fan.xin@jp.fujitsu.com</a>&gt;<br>&gt; +<br>&gt; +Index: libxml2-2.9.4=
/HTMLparser.c<br>&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>&gt; +--- libxml2-2.9.4.orig/HTMLparser.c<br>&gt; ++++ libxml2-2.9.4/HT=
MLparser.c<br>&gt; +@@ -5396,6 +5396,8 @@ htmlParseTryOrFinish(htmlParserCt=
xtPtr c<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctxt-&gt=
;instate =3D XML_PARSER_EOF;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if ((ctxt-&gt;sax) &amp;&amp; (ctxt-&gt;sax-&gt;endDocument !=
=3D NULL))<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ctxt-&gt;sax-&gt;endDocument(ctxt-&gt;userData);<br>&gt; ++<br>&=
gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>&gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (avail &lt; 1)<br>&gt; diff --git a/me=
ta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.4.bb">libxml2_2.9.4.bb=
</a> b/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.4.bb">libxml2=
_2.9.4.bb</a><br>&gt; index ea0d3b8..0b4cbca 100644<br>&gt; --- a/meta/reci=
pes-core/libxml/<a href=3D"http://libxml2_2.9.4.bb">libxml2_2.9.4.bb</a><br=
>&gt; +++ b/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.4.bb">li=
bxml2_2.9.4.bb</a><br>&gt; @@ -24,6 +24,7 @@ SRC_URI =3D &quot;<a href=3D"f=
tp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=3Dlibtar">ftp://xmlsoft.=
org/libxml2/libxml2-${PV}.tar.gz;name=3Dlibtar</a> \<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libxml2-CVE-2016-4658.patch \<br>&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libxml2-fix_NULL_pointer_d=
erefs.patch \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-=
2016-9318.patch \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libxml=
2-CVE-2017-8872.patch \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;<br>&gt;<br>&gt; =C2=A0SRC_URI[libtar.md5sum] =3D &quot;ae249165c173b1f=
f386ee8ad676815f5&quot;<br>&gt; --<br>&gt; 1.9.1<br>&gt;<br>&gt; --<br>&gt;=
 _______________________________________________<br>&gt; Openembedded-core =
mailing list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded=
.org">Openembedded-core@lists.openembedded.org</a><br>&gt; <a href=3D"http:=
//lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.o=
penembedded.org/mailman/listinfo/openembedded-core</a></div></div>

--001a113fe74aa6e5f2055170e851--
