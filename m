Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id DFB1971ABD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 13:03:12 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id z6so28149115iti.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 05:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bErAAOsrtvrqwIRDMmLlh866MHgvywUuLIGFXwTS1LY=;
	b=y7in8IzHwI3vGO2v+M9gSwzCoAT73K7neJl/R/5O9K4Ia2YkKyj4DuhdO4AU+Cl9br
	2wgfUPJNcGOJeirik6Dsby31c6ZDrJrZEbsjPC0r7BehGJAIjGRWIJ819UTRaZfOy9tV
	T60TABeREKdk0J1lVG5LwR2KZXgTipgGuldtBEIuzVsJ8PtcjbS5xpth4T45bpjirnkh
	8MoY9BLQsbm2MuKbxkIJic2StjvO+ZUE4WagdJ5dr55A74794t5afhAwzc5bszHKU1iq
	iO7DbWZTJFwJHxEbyCJFZZm2r2ZWxxK+GecQ3odS6UaIz1G4sPR5YOlBYCIu6K7Ph12b
	envw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bErAAOsrtvrqwIRDMmLlh866MHgvywUuLIGFXwTS1LY=;
	b=Fd3dnleFLZq2wnhAZ08cwmyy6KV9junReWK86rnJzAe8VegMOHOGNAS0rjvJf6SBdc
	9gwN85pKDi9DzWsT2GFHR8qoYp7/VBmAgPBrue9tJVRPTgd+XwFfX+Iv4jknk4pEAxci
	n1hhknknM3RekzVbGvhdir8mMFa9pa0/rF1h8VABZI4a7cFSEOer/KNvAtbv3ezDNUPR
	b9uxCRZNnMaDrCfKpqJZ3rupfu3Gf8jhXcNqeAD0lwlszKvkyDBKdyGk+CARnPYcWsAV
	ECw7OgGxcOcIvwpiJWiWiG1aTkvdJA79oH/qjoywfveyepS2me9sUVzaQ8Eoeqfh5qZY
	jHgg==
X-Gm-Message-State: AKGB3mIHJSXw8fbwBPzUwJZFbHJME5f/lRQhGV3EBsFG3BuEYqnJcxmk
	07oEhMcOXDB09V6eBMH20ZzyRbTThB9ygE8hQJnKLQ==
X-Google-Smtp-Source: ACJfBotergjNN2EoXPyNCbYPh/IdAfAnA7Bq4R8a2BsO6DuqjZ7g3CEcHFkkxwagcbXh0GxQjZBpUQHgdh/mu0heutc=
X-Received: by 10.36.80.148 with SMTP id m142mr19828436itb.6.1513602193780;
	Mon, 18 Dec 2017 05:03:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.141.20 with HTTP; Mon, 18 Dec 2017 05:02:53 -0800 (PST)
In-Reply-To: <1513300719-10186-2-git-send-email-yi.zhao@windriver.com>
References: <1513300719-10186-1-git-send-email-yi.zhao@windriver.com>
	<1513300719-10186-2-git-send-email-yi.zhao@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Dec 2017 13:02:53 +0000
Message-ID: <CAJTo0Lb-=cwFZpFmnmxVnT+4nqM0U5L5zaLtFjum2u7fbBkAJQ@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] hdparm: replace stat with coreutils as runtime dependency
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
X-List-Received-Date: Mon, 18 Dec 2017 13:03:13 -0000
Content-Type: multipart/alternative; boundary="001a114387b8178d7405609cf962"

--001a114387b8178d7405609cf962
Content-Type: text/plain; charset="UTF-8"

Does it really need coreutils stat, or is busybox's stat sufficient?

Ross

On 15 December 2017 at 01:18, Yi Zhao <yi.zhao@windriver.com> wrote:

> Currently only hdparm specifies stat as runtime dependency in oe-core.
> But the stat hasn't any update since 2002. Replace it with coreutils as
> runtime dependency since coreutils also provides stat program. Then we
> can drop the stat recipe totally.
>
> Also add a patch to fix stat path in wiper.sh.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../hdparm/hdparm/wiper.sh-fix-stat-path.patch     | 38
> ++++++++++++++++++++++
>  meta/recipes-extended/hdparm/hdparm_9.52.bb        |  6 ++--
>  2 files changed, 42 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/hdparm/
> hdparm/wiper.sh-fix-stat-path.patch
>
> diff --git a/meta/recipes-extended/hdparm/hdparm/wiper.sh-fix-stat-path.patch
> b/meta/recipes-extended/hdparm/hdparm/wiper.sh-fix-stat-path.patch
> new file mode 100644
> index 0000000..4af1b61
> --- /dev/null
> +++ b/meta/recipes-extended/hdparm/hdparm/wiper.sh-fix-stat-path.patch
> @@ -0,0 +1,38 @@
> +From e233006ee212109d2a1401dac37a9a851cc493d8 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Thu, 14 Dec 2017 15:23:47 +0800
> +Subject: [PATCH] wiper.sh: fix stat path
> +
> +Fix the stat path for OE.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + wiper/wiper.sh | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/wiper/wiper.sh b/wiper/wiper.sh
> +index 79eddc8..9ef2840 100755
> +--- a/wiper/wiper.sh
> ++++ b/wiper/wiper.sh
> +@@ -97,7 +97,6 @@ function find_prog(){
> + hash -r  ## Refresh bash's cached PATH entries
> + HDPARM=`find_prog /sbin/hdparm`       || exit 1
> + FIND=`find_prog /usr/bin/find`        || exit 1
> +-STAT=`find_prog /usr/bin/stat`        || exit 1
> + GAWK=`find_prog /usr/bin/gawk`        || exit 1
> + BLKID=`find_prog /sbin/blkid` || exit 1
> + GREP=`find_prog /bin/grep`    || exit 1
> +@@ -105,7 +104,7 @@ ID=`find_prog /usr/bin/id` || exit 1
> + LS=`find_prog /bin/ls`                || exit 1
> + DF=`find_prog /bin/df`                || exit 1
> + RM=`find_prog /bin/rm`                || exit 1
> +-STAT=`find_prog /usr/bin/stat`        || exit 1
> ++STAT=`find_prog /bin/stat`    || exit 1
> +
> + [ $verbose -gt 1 ] && HDPARM="$HDPARM --verbose"
> +
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-extended/hdparm/hdparm_9.52.bb
> b/meta/recipes-extended/hdparm/hdparm_9.52.bb
> index 49fdc94..13cfb3f 100644
> --- a/meta/recipes-extended/hdparm/hdparm_9.52.bb
> +++ b/meta/recipes-extended/hdparm/hdparm_9.52.bb
> @@ -19,9 +19,11 @@ PACKAGES =+ "wiper"
>
>  FILES_wiper = "${bindir}/wiper.sh"
>
> -RDEPENDS_wiper = "bash gawk stat"
> +RDEPENDS_wiper = "bash gawk coreutils"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
> +           file://wiper.sh-fix-stat-path.patch \
> +          "
>
>  SRC_URI[md5sum] = "410539d0bf3cc247181594581edbfb53"
>  SRC_URI[sha256sum] = "c3429cd423e271fa565bf584598fd7
> 51dd2e773bb7199a592b06b5a61cec4fb6"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114387b8178d7405609cf962
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Does it really need coreutils stat, or is busybox&#39;s st=
at sufficient?<div><br></div><div>Ross</div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On 15 December 2017 at 01:18, Yi Zhao <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank=
">yi.zhao@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Currently only hdparm specifies stat as runtime dependency in oe-core.=
<br>
But the stat hasn&#39;t any update since 2002. Replace it with coreutils as=
<br>
runtime dependency since coreutils also provides stat program. Then we<br>
can drop the stat recipe totally.<br>
<br>
Also add a patch to fix stat path in wiper.sh.<br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com">yi.zhao=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../hdparm/hdparm/wiper.sh-<wbr>fix-stat-path.patch=C2=A0 =C2=A0 =C2=
=A0| 38 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-extended/hdparm/<a href=3D"http://hdparm_9.52.bb" rel=3D=
"noreferrer" target=3D"_blank">h<wbr>dparm_9.52.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 6 ++--<br>
=C2=A02 files changed, 42 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/hdparm/<wbr>hdparm/wiper.sh-=
fix-stat-path.<wbr>patch<br>
<br>
diff --git a/meta/recipes-extended/<wbr>hdparm/hdparm/wiper.sh-fix-<wbr>sta=
t-path.patch b/meta/recipes-extended/<wbr>hdparm/hdparm/wiper.sh-fix-<wbr>s=
tat-path.patch<br>
new file mode 100644<br>
index 0000000..4af1b61<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/<wbr>hdparm/hdparm/wiper.sh-fix-<wbr>stat-path.=
patch<br>
@@ -0,0 +1,38 @@<br>
+From e233006ee212109d2a1401dac37a9a<wbr>851cc493d8 Mon Sep 17 00:00:00 200=
1<br>
+From: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com">yi.zhao@windriv=
er.com</a>&gt;<br>
+Date: Thu, 14 Dec 2017 15:23:47 +0800<br>
+Subject: [PATCH] wiper.sh: fix stat path<br>
+<br>
+Fix the stat path for OE.<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com">yi.zha=
o@windriver.com</a>&gt;<br>
+---<br>
+ wiper/wiper.sh | 3 +--<br>
+ 1 file changed, 1 insertion(+), 2 deletions(-)<br>
+<br>
+diff --git a/wiper/wiper.sh b/wiper/wiper.sh<br>
+index 79eddc8..9ef2840 100755<br>
+--- a/wiper/wiper.sh<br>
++++ b/wiper/wiper.sh<br>
+@@ -97,7 +97,6 @@ function find_prog(){<br>
+ hash -r=C2=A0 ## Refresh bash&#39;s cached PATH entries<br>
+ HDPARM=3D`find_prog /sbin/hdparm`=C2=A0 =C2=A0 =C2=A0 =C2=A0|| exit 1<br>
+ FIND=3D`find_prog /usr/bin/find`=C2=A0 =C2=A0 =C2=A0 =C2=A0 || exit 1<br>
+-STAT=3D`find_prog /usr/bin/stat`=C2=A0 =C2=A0 =C2=A0 =C2=A0 || exit 1<br>
+ GAWK=3D`find_prog /usr/bin/gawk`=C2=A0 =C2=A0 =C2=A0 =C2=A0 || exit 1<br>
+ BLKID=3D`find_prog /sbin/blkid` || exit 1<br>
+ GREP=3D`find_prog /bin/grep`=C2=A0 =C2=A0 || exit 1<br>
+@@ -105,7 +104,7 @@ ID=3D`find_prog /usr/bin/id` || exit 1<br>
+ LS=3D`find_prog /bin/ls`=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 || exit 1<br>
+ DF=3D`find_prog /bin/df`=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 || exit 1<br>
+ RM=3D`find_prog /bin/rm`=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 || exit 1<br>
+-STAT=3D`find_prog /usr/bin/stat`=C2=A0 =C2=A0 =C2=A0 =C2=A0 || exit 1<br>
++STAT=3D`find_prog /bin/stat`=C2=A0 =C2=A0 || exit 1<br>
+<br>
+ [ $verbose -gt 1 ] &amp;&amp; HDPARM=3D&quot;$HDPARM --verbose&quot;<br>
+<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-extended/<wbr>hdparm/<a href=3D"http://hdparm_9.5=
2.bb" rel=3D"noreferrer" target=3D"_blank">hdparm_9.52.bb</a> b/meta/recipe=
s-extended/<wbr>hdparm/<a href=3D"http://hdparm_9.52.bb" rel=3D"noreferrer"=
 target=3D"_blank">hdparm_9.52.bb</a><br>
index 49fdc94..13cfb3f 100644<br>
--- a/meta/recipes-extended/<wbr>hdparm/<a href=3D"http://hdparm_9.52.bb" r=
el=3D"noreferrer" target=3D"_blank">hdparm_9.52.bb</a><br>
+++ b/meta/recipes-extended/<wbr>hdparm/<a href=3D"http://hdparm_9.52.bb" r=
el=3D"noreferrer" target=3D"_blank">hdparm_9.52.bb</a><br>
@@ -19,9 +19,11 @@ PACKAGES =3D+ &quot;wiper&quot;<br>
<br>
=C2=A0FILES_wiper =3D &quot;${bindir}/wiper.sh&quot;<br>
<br>
-RDEPENDS_wiper =3D &quot;bash gawk stat&quot;<br>
+RDEPENDS_wiper =3D &quot;bash gawk coreutils&quot;<br>
<br>
-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/hdparm/<wbr>${BP}.tar.gz&quot;<br>
+SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/hdparm/<wbr>${BP}.tar.gz \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://wiper.sh-fix-stat-path.<wb=
r>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>410539d0bf3cc247181594581edbfb<wbr>53&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>c3429cd423e271fa565bf584598fd7<wbr>=
51dd2e773bb7199a592b06b5a61cec<wbr>4fb6&quot;<br>
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

--001a114387b8178d7405609cf962--
