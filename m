Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FAFC77B7E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 07:22:02 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.44630.1685344917139022290
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 00:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JDNLExjH;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30ae141785bso1964084f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 00:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685344915; x=1687936915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=peFv4xB0CcYLeYf21aJG5a4y2qmDykbRskr0QHLj31I=;
        b=JDNLExjHuD/YUZDtFzfL2vZ/HYSu/R+gc/BIUELIqYsmHWAgamWwylOIkbk16+O6gp
         mLdApjSeeyHAY6+y5CJAG/Lj3SWA4slG55gfgdjl3tQSwMhxr4UWFLfcB/meJ4XhedK3
         +7pdRQmj5J5Vq+vC+4+AB6qS2vq/8SRIdv+MEXGAlhmEzxjh6i7GdcE4nfSjSl/7MEeD
         7V7eXiwH86lF/wVok6DIGStJXDwlUcRZj+sNC2EMjZnBY/lyAYVbWztotwQhIcDY3Ayo
         OUt22q5/oLGgwf00xrOhJEPxwC5zahQniq9Y/zzNWEOw4wXQcojMk5gP27psm942hItT
         7wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685344915; x=1687936915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peFv4xB0CcYLeYf21aJG5a4y2qmDykbRskr0QHLj31I=;
        b=NCVOq4U2OnRYKAcdvkkPEILxrmcs1rgCBeKIrzPDzxjCdw4khNFyF8x6LAhCyDc42g
         M/DpTMtrvReGS5qBK5vtNftK9z/2hapvcqA/YOFzEcfoHHqHFyI/AlbkxgOscMiD88eQ
         3l/j/VvFL2kSzSNcGbI/3sDJ3nHVMeesr0fOVPXbLBM49+l23g7yVQtMgeheJg88e/uB
         59mpU4DfWzkGy4X6QWFWvcATJKiOiwq2wq6Ny48qO7GDNe24IFkxetkQ6V1QzlNs1Dl/
         6FCdDTlLcpaYkt4MAKU6tZ12kPgJe7lbtAU44mVObezwK0Dj4xFXmEA+toMgeBTaIVTl
         7l6w==
X-Gm-Message-State: AC+VfDxGxJEALhXKWU/K2M4rQU1jyOceDDr0T9Xm76VtDHn1qval5QfC
	sfavZXIUsCcCuZ8X11q5tnyhktNh1j77jD4Jl60=
X-Google-Smtp-Source: ACHHUZ4Geb+1SWdigfvDqzfxb2fndQcxJQmZebJPuKhjkfWs0pcHblJosUE073DwA2PrPH2kzAubC44ieezcsiHhwKI=
X-Received: by 2002:a5d:44c8:0:b0:309:49e3:efaa with SMTP id
 z8-20020a5d44c8000000b0030949e3efaamr8231423wrr.29.1685344915196; Mon, 29 May
 2023 00:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230528055252.3869703-1-schitrod@cisco.com>
In-Reply-To: <20230528055252.3869703-1-schitrod@cisco.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 29 May 2023 09:21:34 +0200
Message-ID: <CA+chaQeCpJ-70Je8non8KADuDk8SZzysN7KiDFNFDd3-dVY6sA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] sqlite3: Whitelist CVE-2022-21227
To: schitrod@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fe8fc705fccff045"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 07:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181852

--000000000000fe8fc705fccff045
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The patch author seems a bit mangled by ML, see:
author schitrod=3Dcisco.com@lists.openembedded.org <schitrod=3D
cisco.com@lists.openembedded.org> 2023-05-27 22:52:52 -0700
https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D5f15caa526bb57070b9abb9ba2f488ee1bfb5372

Is it correct?

On Sun, May 28, 2023 at 7:53=E2=80=AFAM Sanjaykumar kantibhai Chitroda -X (=
schitrod
- E-INFO CHIPS INC at Cisco) via lists.openembedded.org <schitrod=3D
cisco.com@lists.openembedded.org> wrote:

> This CVE is applicable to "SQLite3 bindings for Node.js" only.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-21227
>
> Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
> ---
>  meta/recipes-support/sqlite/sqlite3_3.41.2.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
> b/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
> index b09e8e7f55..11bc8bb4c0 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
> @@ -12,3 +12,6 @@ CVE_CHECK_IGNORE +=3D "CVE-2019-19242"
>  CVE_CHECK_IGNORE +=3D "CVE-2015-3717"
>  # Issue in an experimental extension we don't have/use. Fixed by
> https://sqlite.org/src/info/b1e0c22ec981cf5f
>  CVE_CHECK_IGNORE +=3D "CVE-2021-36690"
> +# As per https://nvd.nist.gov/vuln/detail/CVE-2022-21227
> +# this bug is applicable to SQLite3 Node.js
> +CVE_CHECK_IGNORE +=3D "CVE-2022-21227"
> --
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181812):
> https://lists.openembedded.org/g/openembedded-core/message/181812
> Mute This Topic: https://lists.openembedded.org/mt/99178473/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fe8fc705fccff045
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The patch author seems a bit mangled by ML, see:<div>autho=
r	schitrod=3D<a href=3D"mailto:cisco.com@lists.openembedded.org">cisco.com@=
lists.openembedded.org</a> &lt;schitrod=3D<a href=3D"mailto:cisco.com@lists=
.openembedded.org">cisco.com@lists.openembedded.org</a>&gt;	2023-05-27 22:5=
2:52 -0700<br><div><a href=3D"https://git.openembedded.org/openembedded-cor=
e/commit/?h=3Dmaster-next&amp;id=3D5f15caa526bb57070b9abb9ba2f488ee1bfb5372=
">https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&am=
p;id=3D5f15caa526bb57070b9abb9ba2f488ee1bfb5372</a><br></div></div><div><br=
></div><div>Is it correct?</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sun, May 28, 2023 at 7:53=E2=80=AFAM San=
jaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco) via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;sch=
itrod=3D<a href=3D"mailto:cisco.com@lists.openembedded.org">cisco.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">This CVE is applicable to &quot;SQLite3 bindings for Node.=
js&quot; only.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-21227" rel=3D"noreferr=
er" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2022-21227</a><b=
r>
<br>
Signed-off-by: Sanjay Chitroda &lt;<a href=3D"mailto:schitrod@cisco.com" ta=
rget=3D"_blank">schitrod@cisco.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.41.2.bb" rel=
=3D"noreferrer" target=3D"_blank">sqlite3_3.41.2.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.41.2.b=
b" rel=3D"noreferrer" target=3D"_blank">sqlite3_3.41.2.bb</a> b/meta/recipe=
s-support/sqlite/<a href=3D"http://sqlite3_3.41.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">sqlite3_3.41.2.bb</a><br>
index b09e8e7f55..11bc8bb4c0 100644<br>
--- a/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.41.2.bb" rel=
=3D"noreferrer" target=3D"_blank">sqlite3_3.41.2.bb</a><br>
+++ b/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.41.2.bb" rel=
=3D"noreferrer" target=3D"_blank">sqlite3_3.41.2.bb</a><br>
@@ -12,3 +12,6 @@ CVE_CHECK_IGNORE +=3D &quot;CVE-2019-19242&quot;<br>
=C2=A0CVE_CHECK_IGNORE +=3D &quot;CVE-2015-3717&quot;<br>
=C2=A0# Issue in an experimental extension we don&#39;t have/use. Fixed by =
<a href=3D"https://sqlite.org/src/info/b1e0c22ec981cf5f" rel=3D"noreferrer"=
 target=3D"_blank">https://sqlite.org/src/info/b1e0c22ec981cf5f</a><br>
=C2=A0CVE_CHECK_IGNORE +=3D &quot;CVE-2021-36690&quot;<br>
+# As per <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-21227" rel=
=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2022=
-21227</a><br>
+# this bug is applicable to SQLite3 Node.js<br>
+CVE_CHECK_IGNORE +=3D &quot;CVE-2022-21227&quot;<br>
-- <br>
2.35.6<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#181812): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/181812" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/181812</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99178473/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99178473/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000fe8fc705fccff045--

