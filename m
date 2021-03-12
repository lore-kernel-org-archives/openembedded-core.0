Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.9100.1615559487507054044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 06:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fDDuFgzE;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id p7so42406215eju.6
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 06:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WKLrknUvaMeWE3QWrXEOWlnOpitY7ffuci+RAS8lT8I=;
        b=fDDuFgzEo3wePHHvVXU8a2166wfh5+0FYzGRcNXauGtH/KIUsEkRNkWtbFEaw1OCgP
         bW1d4KGQGdTEfXVspFIXKtF7SYkl7iJjnJboHLtfnwuenhzZ9SGs4M1wYJmlZjbs0D7T
         Qm4cX5CO1W55BHIdPFUP3qn+eAHBD7xtj1xVbz7I3z8OKNxpiqt18SX1/dK3KD/zYKuN
         Ka1TwbFmUsKOANl4bfyFrfky/KZNt1d9i8+djK0sCn7ECuWnxwvP1xnKtMcd3ZKJM1D4
         4AMN6qynqGemtO8js73DYeIoQ1iaSWfh4eeYQGPlHUXNyi1FQ5m1sgvaPtWSrPPHqQ/I
         ztMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WKLrknUvaMeWE3QWrXEOWlnOpitY7ffuci+RAS8lT8I=;
        b=KoCauou3Q27utcxSqAcaE6w+96j6Fgiq9SZ8pFWumatvNZnZmFjfY5JbUMBD2ZJMoX
         8vjM1t8GbtSNaOmeB4UlY5D01NRs+9UOXmWRJFKLlHY5fAEF35UtFZyZPoiQtyS26sRg
         RKJhxwI4WnLy8MqwAK09zSMExI4FiwJSwbs1mn00srcULQ/JPf+FKmncVs0lVp5AcaB6
         VqX0peNbDR33J2w3B2LiS2PFuNwgm53EUd8gHnVWqEByy7QGE2wamzB3MfnMpuVCWD3m
         jbAfJBftpGZFKQZ5XEZKQC1ZqV+1nkTcyXhDARa+3VT5bQ02Iq8luAIh7QsJS8uz4wkS
         jCOQ==
X-Gm-Message-State: AOAM533lVGBo+bEa5BJXe3XPBwemh72aAfPlJZerqtvMjXn+AKOVEdI3
	Z2jCDtIHj0B7FXadgMkvF40TqTdjTmQSzD3AKBA=
X-Google-Smtp-Source: ABdhPJzPfH/1OiF5kTZr5Loi0S7CjOnoWa67BZfYTAvUAsgR35bTYktCXDSgsIbNa67FMtJLMUznGNG89oWAjXD1LR8=
X-Received: by 2002:a17:906:32d1:: with SMTP id k17mr8757564ejk.94.1615559485792;
 Fri, 12 Mar 2021 06:31:25 -0800 (PST)
MIME-Version: 1.0
References: <1615376771-3093-1-git-send-email-wangmy@cn.fujitsu.com> <1615376771-3093-4-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1615376771-3093-4-git-send-email-wangmy@cn.fujitsu.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 12 Mar 2021 15:31:14 +0100
Message-ID: <CA+chaQceL8djA0_Mgi5sQ5+GWU0DCsnkVvdEtsj=k0CeDscqsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] iso-codes: upgrade 4.5.0 -> 4.6.0
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000043a3d105bd57c130"

--00000000000043a3d105bd57c130
Content-Type: text/plain; charset="UTF-8"

When rebuilding this upgrade I've noticed:
WARNING: iso-codes-4.6.0-r0 do_fetch: Failed to fetch URL git://
salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http;branch=main;,
attempting MIRRORS if available

The protocol should probably be changed to https, like all other
salsa.debian.org pulls are, so that it doesn't depend on mirrors.bbclass to
resolve this.

meta/classes/mirrors.bbclass:git://salsa.debian.org/.*     git://
salsa.debian.org/PATH;protocol=https \n \

from log.do_fetch:

DEBUG: Fetcher accessed the network with the command LANG=C git -c
core.fsyncobjectfiles=0 fetch -f --progress
http://salsa.debian.org/iso-codes-team/iso-codes.git refs/*:refs/*
fatal: unable to access '
http://salsa.debian.org/iso-codes-team/iso-codes.git/': Couldn't connect to
server
WARNING: Failed to fetch URL git://
salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http;branch=main;,
attempting MIRRORS if available
...
warning: redirecting to
https://salsa.debian.org/iso-codes-team/iso-codes.git/

Will send a patch shortly.

On Wed, Mar 10, 2021 at 12:47 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../iso-codes/{iso-codes_4.5.0.bb => iso-codes_4.6.0.bb}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/iso-codes/{iso-codes_4.5.0.bb =>
> iso-codes_4.6.0.bb} (93%)
>
> diff --git a/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb
> b/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb
> similarity index 93%
> rename from meta/recipes-support/iso-codes/iso-codes_4.5.0.bb
> rename to meta/recipes-support/iso-codes/iso-codes_4.6.0.bb
> index 9e02a0fa12..960989281d 100644
> --- a/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb
> +++ b/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb
> @@ -9,7 +9,7 @@ LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
>  SRC_URI = "git://
> salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http;branch=main;"
> -SRCREV = "a36019e5014bff251f83d522ddcfebaecf52afd3"
> +SRCREV = "3c012d266acaeda93d3e61ec11b8c18c1964fce1"
>
>  # inherit gettext cannot be used, because it adds gettext-native to
> BASEDEPENDS which
>  # are inhibited by allarch
> --
> 2.25.1
>
>
> 
>
>

--00000000000043a3d105bd57c130
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>When rebuilding this upgrade I&#39;ve noticed:</div><=
div>WARNING: iso-codes-4.6.0-r0 do_fetch: Failed to fetch URL git://<a href=
=
=3D"http://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=3Dhttp;b=
ranch=3Dmain">salsa.debian.org/iso-codes-team/iso-codes.git;protocol=3Dhttp=
;branch=3Dmain</a>;, attempting MIRRORS if available<br></div><div><br></di=
v>The protocol should probably be changed to https, like all other <a href=
=3D"http://salsa.debian.org">salsa.debian.org</a> pulls are, so that it do=
esn&#39;t depend on mirrors.bbclass to resolve this.<div><br></div><div>met=
a/classes/mirrors.bbclass:git://<a href=3D"http://salsa.debian.org/.*">sals=
a.debian.org/.*</a> =C2=A0 =C2=A0 git://<a href=3D"http://salsa.debian.org/=
PATH;protocol=3Dhttps">salsa.debian.org/PATH;protocol=3Dhttps</a> \n \<br><=
/div><div><br></div><div>from log.do_fetch:</div><div><br></div><div>DEBUG:=
 Fetcher accessed the network with the command LANG=3DC git -c core.fsyncob=
jectfiles=3D0 fetch -f --progress <a href=3D"http://salsa.debian.org/iso-co=
des-team/iso-codes.git">http://salsa.debian.org/iso-codes-team/iso-codes.gi=
t</a> refs/*:refs/*<br></div><div>fatal: unable to access &#39;<a href=3D"h=
ttp://salsa.debian.org/iso-codes-team/iso-codes.git/">http://salsa.debian.o=
rg/iso-codes-team/iso-codes.git/</a>&#39;: Couldn&#39;t connect to server<b=
r></div><div>WARNING: Failed to fetch URL git://<a href=3D"http://salsa.deb=
ian.org/iso-codes-team/iso-codes.git;protocol=3Dhttp;branch=3Dmain">salsa.d=
ebian.org/iso-codes-team/iso-codes.git;protocol=3Dhttp;branch=3Dmain</a>;, =
attempting MIRRORS if available<br></div><div>...</div><div>warning: redire=
cting to <a href=3D"https://salsa.debian.org/iso-codes-team/iso-codes.git/"=
>https://salsa.debian.org/iso-codes-team/iso-codes.git/</a><br></div><div><=
br></div><div>Will send a patch shortly.</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 10, 2021 at 12:47=
 PM Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com">wangmy@cn.fuji=
tsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.c=
om" target=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../iso-codes/{<a href=3D"http://iso-codes_4.5.0.bb" rel=3D"noreferr=
er" target=3D"_blank">iso-codes_4.5.0.bb</a> =3D&gt; <a href=3D"http://iso-=
codes_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">iso-codes_4.6.0.bb</a>=
}=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-support/iso-codes/{<a href=3D"http://iso-codes_4=
.5.0.bb" rel=3D"noreferrer" target=3D"_blank">iso-codes_4.5.0.bb</a> =3D&gt=
; <a href=3D"http://iso-codes_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank=
">iso-codes_4.6.0.bb</a>} (93%)<br>
<br>
diff --git a/meta/recipes-support/iso-codes/<a href=3D"http://iso-codes_4.=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">iso-codes_4.5.0.bb</a> b/meta/=
recipes-support/iso-codes/<a href=3D"http://iso-codes_4.6.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">iso-codes_4.6.0.bb</a><br>
similarity index 93%<br>
rename from meta/recipes-support/iso-codes/<a href=3D"http://iso-codes_4.5=
.0.bb" rel=3D"noreferrer" target=3D"_blank">iso-codes_4.5.0.bb</a><br>
rename to meta/recipes-support/iso-codes/<a href=3D"http://iso-codes_4.6.0=
.bb" rel=3D"noreferrer" target=3D"_blank">iso-codes_4.6.0.bb</a><br>
index 9e02a0fa12..960989281d 100644<br>
--- a/meta/recipes-support/iso-codes/<a href=3D"http://iso-codes_4.5.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">iso-codes_4.5.0.bb</a><br>
+++ b/meta/recipes-support/iso-codes/<a href=3D"http://iso-codes_4.6.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">iso-codes_4.6.0.bb</a><br>
@@ -9,7 +9,7 @@ LICENSE =3D &quot;LGPLv2.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd25595107=
9008b364516c&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://salsa.debian.org/iso-codes=
-team/iso-codes.git;protocol=3Dhttp;branch=3Dmain" rel=3D"noreferrer" targe=
t=3D"_blank">salsa.debian.org/iso-codes-team/iso-codes.git;protocol=3Dhttp;=
branch=3Dmain</a>;&quot;<br>
-SRCREV =3D &quot;a36019e5014bff251f83d522ddcfebaecf52afd3&quot;<br>
+SRCREV =3D &quot;3c012d266acaeda93d3e61ec11b8c18c1964fce1&quot; <br>
<br>
=C2=A0# inherit gettext cannot be used, because it adds gettext-native to =
BASEDEPENDS which<br>
=C2=A0# are inhibited by allarch<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000043a3d105bd57c130--
