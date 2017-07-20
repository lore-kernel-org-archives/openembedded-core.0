Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2C939782D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:52:12 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id g13so11126304ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 05:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+wxl/LIyCMXB8kYq1Pd/0y8vXtlZlz0IeKRUoTw/41Y=;
	b=DOUaJSX+3b9RlM+WZkeGtPNJ7kdZPSLrOJI/mEzqXJp+Kh1tHPjOfgKGAg5yhYSN36
	LXMbxTR1dCqRrTBw5CTIXPemb13DUQQhPLR3o1irokVIyUy5Tff7JHlrI5cr60hwbVXG
	N2io0C8+aLyHWWYRB8kbZySfdxWslAz7gh5Kw1YUgoCiK7P1uIEBYI2mDBVBERxPgknH
	/nFV5mMvNqZ1tS/MU/3/M26PFkDkG8Mkz20p7Uns1f71FRosEdw8AaObpb3+vBONsmcK
	TH2xpIRkYTFu7GTHYf27JHZPv0dIa9qktl2vleOsGYBBKTH8+IAWWx75JicEWN/Y5PQh
	fL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+wxl/LIyCMXB8kYq1Pd/0y8vXtlZlz0IeKRUoTw/41Y=;
	b=hM6jvmo9fR3ho2Nl6JL0nyJvjVOx8YIgMt/PDXATNA/SdWLvzAUqeWsSVTstIln9+o
	OA0bckpyOcpglDHkEbNsuZoYi1R1QDSihl6AtMTFLFht40qrJjsergXU71agMmw9H0ke
	H4Nxp/LjkbTV9Q/kdzp+Ds7SrcsK0MdXLgmg93BBvmwIzTH8gREYxsjtZhAPZyMpWhPf
	CPCdhe+QsJxMgSXUfibzhs/edZBW8aDZLdWpOPAeR90/c18cPElkdE2yEW+1aJPMKpOx
	xoajUdry7GrtrBemm1coRZQPSgEVHh3HLtIvkD8n/hTJvMomgbV18jC++jgKBzyy7hpD
	518w==
X-Gm-Message-State: AIVw1123Vm6VGUNHhoN1W6gksa4nuhei4yWmvgpUmZsZRa+pq2aG7JxM
	3/KRWtghOneEJk129sFIrXcjdFSPje2X
X-Received: by 10.107.160.132 with SMTP id j126mr3465447ioe.224.1500555134133; 
	Thu, 20 Jul 2017 05:52:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Thu, 20 Jul 2017 05:51:53 -0700 (PDT)
In-Reply-To: <20170719025055.34644-1-raj.khem@gmail.com>
References: <20170719025055.34644-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jul 2017 13:51:53 +0100
Message-ID: <CAJTo0LaTdL4FFw2Nx6EshRbpx_yP=kuZsAJWseZ8qEf8h8O=pQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] glibc: Update to latest on 2.26 pre-release
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
X-List-Received-Date: Thu, 20 Jul 2017 12:52:13 -0000
Content-Type: multipart/alternative; boundary="001a1140da66bc8d260554bf3716"

--001a1140da66bc8d260554bf3716
Content-Type: text/plain; charset="UTF-8"

Fails in glibc-locale here:

| LC_ADDRESS: language abbreviation `agr' not defined
| Makefile:1039: recipe for target
'/data/poky-tmp/master/build/work/corei7-64-poky-linux/glibc-locale/2.25.90-r0/locale-tree/usr/lib/locale/agr_PE'
failed
| make: ***
[/data/poky-tmp/master/build/work/corei7-64-poky-linux/glibc-locale/2.25.90-r0/locale-tree/usr/lib/locale/agr_PE]
Error 1
| make: *** Waiting for unfinished jobs....
| make: Leaving directory
'/data/poky-tmp/master/build/work/corei7-64-poky-linux/glibc-locale/2.25.90-r0/locale-tree'
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| DEBUG: Python function package_do_split_gconvs finished
| DEBUG: Python function populate_packages finished
| DEBUG: Python function do_package finished
| ERROR: Function failed: oe_runmake (log file is located at
/data/poky-tmp/master/build/work/corei7-64-poky-linux/glibc-locale/2.25.90-r0/temp/log.do_package.7984)
ERROR: Task
(/home/ross/Yocto/poky/meta/recipes-core/glibc/glibc-locale_2.25.90.bb:do_package)
failed with exit code '1'

On 19 July 2017 at 03:50, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb | 2 +-
>  meta/recipes-core/glibc/glibc_2.25.90.bb                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
> b/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
> index 5dd0c70400..429076ea98 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
> @@ -22,7 +22,7 @@ SRCBRANCH ?= "master"
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
>
> -SRCREV_glibc ?= "43a9f537fc121a867981ca31ea9d79f33ce0fd24"
> +SRCREV_glibc ?= "91ac3a7d8474480685632cd25f844d3154c69fdf"
>  SRCREV_localedef ?= "dfb4afe551c6c6e94f9cc85417bd1f582168c843"
>
>  SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> diff --git a/meta/recipes-core/glibc/glibc_2.25.90.bb
> b/meta/recipes-core/glibc/glibc_2.25.90.bb
> index caf1ff4138..477b04d867 100644
> --- a/meta/recipes-core/glibc/glibc_2.25.90.bb
> +++ b/meta/recipes-core/glibc/glibc_2.25.90.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=
> e9a558e243b36d3209f380deb394b213 \
>
>  DEPENDS += "gperf-native"
>
> -SRCREV ?= "43a9f537fc121a867981ca31ea9d79f33ce0fd24"
> +SRCREV ?= "91ac3a7d8474480685632cd25f844d3154c69fdf"
>
>  #SRCBRANCH ?= "release/${PV}/master"
>  SRCBRANCH ?= "master"
> --
> 2.13.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1140da66bc8d260554bf3716
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Fails in glibc-locale here:<div><br></div><div>| LC_ADDRES=
S: language abbreviation `agr&#39; not defined<br></div><div><div>| Makefil=
e:1039: recipe for target &#39;/data/poky-tmp/master/build/work/corei7-64-p=
oky-linux/glibc-locale/2.25.90-r0/locale-tree/usr/lib/locale/agr_PE&#39; fa=
iled</div><div>| make: *** [/data/poky-tmp/master/build/work/corei7-64-poky=
-linux/glibc-locale/2.25.90-r0/locale-tree/usr/lib/locale/agr_PE] Error 1</=
div><div>| make: *** Waiting for unfinished jobs....</div><div>| make: Leav=
ing directory &#39;/data/poky-tmp/master/build/work/corei7-64-poky-linux/gl=
ibc-locale/2.25.90-r0/locale-tree&#39;</div><div>| ERROR: oe_runmake failed=
</div><div>| WARNING: exit code 1 from a shell command.</div><div>| DEBUG: =
Python function package_do_split_gconvs finished</div><div>| DEBUG: Python =
function populate_packages finished</div><div>| DEBUG: Python function do_p=
ackage finished</div><div>| ERROR: Function failed: oe_runmake (log file is=
 located at /data/poky-tmp/master/build/work/corei7-64-poky-linux/glibc-loc=
ale/2.25.90-r0/temp/log.do_package.7984)</div><div>ERROR: Task (/home/ross/=
Yocto/poky/meta/recipes-core/glibc/glibc-locale_2.25.90.bb:do_package) fail=
ed with exit code &#39;1&#39;</div></div></div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On 19 July 2017 at 03:50, Khem Raj <span dir=
=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed=
-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.=
com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://cross-localedef-native_2.25=
.90.bb" rel=3D"noreferrer" target=3D"_blank">cross-<wbr>localedef-native_2.=
25.90.bb</a> | 2 +-<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.25.90.bb" rel=3D"no=
referrer" target=3D"_blank">glibc_<wbr>2.25.90.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-nati=
ve_2.25.90.bb" rel=3D"noreferrer" target=3D"_blank">cros<wbr>s-localedef-na=
tive_2.25.90.bb</a> b/meta/recipes-core/glibc/<a href=3D"http://cross-local=
edef-native_2.25.90.bb" rel=3D"noreferrer" target=3D"_blank">cros<wbr>s-loc=
aledef-native_2.25.90.bb</a><br>
index 5dd0c70400..429076ea98 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-native_2.25=
.90.bb" rel=3D"noreferrer" target=3D"_blank">cros<wbr>s-localedef-native_2.=
25.90.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-native_2.25=
.90.bb" rel=3D"noreferrer" target=3D"_blank">cros<wbr>s-localedef-native_2.=
25.90.bb</a><br>
@@ -22,7 +22,7 @@ SRCBRANCH ?=3D &quot;master&quot;<br>
=C2=A0GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/git/g=
libc.git" rel=3D"noreferrer" target=3D"_blank">sourceware.org/git/<wbr>glib=
c.git</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;\d+\.\d+(\.\d+)*)=
&quot;<br>
<br>
-SRCREV_glibc ?=3D &quot;<wbr>43a9f537fc121a867981ca31ea9d79<wbr>f33ce0fd24=
&quot;<br>
+SRCREV_glibc ?=3D &quot;<wbr>91ac3a7d8474480685632cd25f844d<wbr>3154c69fdf=
&quot;<br>
=C2=A0SRCREV_localedef ?=3D &quot;<wbr>dfb4afe551c6c6e94f9cc85417bd1f<wbr>5=
82168c843&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=3D${<wbr>SRCBRANCH};name=3D=
glibc \<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.25.90.bb" re=
l=3D"noreferrer" target=3D"_blank">glib<wbr>c_2.25.90.bb</a> b/meta/recipes=
-core/glibc/<a href=3D"http://glibc_2.25.90.bb" rel=3D"noreferrer" target=
=3D"_blank">glib<wbr>c_2.25.90.bb</a><br>
index caf1ff4138..477b04d867 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.25.90.bb" rel=3D"no=
referrer" target=3D"_blank">glib<wbr>c_2.25.90.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.25.90.bb" rel=3D"no=
referrer" target=3D"_blank">glib<wbr>c_2.25.90.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSES;md5=3D<wbr>e9a55=
8e243b36d3209f380deb394b2<wbr>13 \<br>
<br>
=C2=A0DEPENDS +=3D &quot;gperf-native&quot;<br>
<br>
-SRCREV ?=3D &quot;<wbr>43a9f537fc121a867981ca31ea9d79<wbr>f33ce0fd24&quot;=
<br>
+SRCREV ?=3D &quot;<wbr>91ac3a7d8474480685632cd25f844d<wbr>3154c69fdf&quot;=
<br>
<br>
=C2=A0#SRCBRANCH ?=3D &quot;release/${PV}/master&quot;<br>
=C2=A0SRCBRANCH ?=3D &quot;master&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.3<br>
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

--001a1140da66bc8d260554bf3716--
