Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 946AC6057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 14:00:00 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id s79so23022769oie.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 07:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=qLqAxz4CiPQMVVjbxqi7pzJy4cKCT75dcxL9YcFPPJQ=;
	b=H6Uns3hqOnaPV6TrjpcGEqzbtwPVxOVFeuQ4sGzncvpxfhgbPdXg2ibJRE9U4suheB
	yNiflcYZitObXalaap/oSFiuEgq+liYX8TNBtfUsZknWc/dlhAD8o5UzaYVS+C8OisFE
	EscQ7JQh08QcPhw8BMqGkYpLURgxg23ibz4tvM9vuxp+ly8+XdNe9BdXFcTLkZKmx46O
	rga+FjIT0aXTf9l3T2rNaykjQ2LkIw2FtNzIvt8ginM4wl5uNKvyX6e53IS9pBTmskhr
	ScXz28RmiCJ6xYIAA1an/fyABqdKKtEl9NgGoJiHPThJMDykICp27zSlZEjgIP6DHQRH
	PJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=qLqAxz4CiPQMVVjbxqi7pzJy4cKCT75dcxL9YcFPPJQ=;
	b=DKGSes66t29R+4kBjH71JJGZGPcc5tj1RQ3dME4znKoxgZMNmUCzhZYFjfmezZiQGX
	7Csbnzgm3NibYiIFHejlSD1H0mP5BgasX73ZaGl1gKvTPrExOuY24XzIiEnzxOqNG3rY
	ba2oYkuFgL3jEPuenleSAVzjOe2NKWhu5LX7R30Uvh9eW94ecZXKukRM0f1atyTBaPoZ
	6XXV0G3ICXcz3yQHHVbzeB3gwBYTHsggM1PTx0rXVDmuJipnPK1bNx5A0/9si+lbKSNn
	Dz2NDWJ62qXoPRqz1ePTSlNGz9yQBKr45st/hwZVkopbVQKE2yV88lYLFI+6Q1eJcsqY
	8JiA==
X-Gm-Message-State: AOPr4FW2Ru1zg7kHlzdn8sHWAKEsRCL5Q1aHqThPYwxJctu4nn224vHvUVYggLWRg6dwyRvcVc2z3bLRsw54Qw==
MIME-Version: 1.0
X-Received: by 10.157.47.207 with SMTP id b15mr1632955otd.118.1460469600572;
	Tue, 12 Apr 2016 07:00:00 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Tue, 12 Apr 2016 07:00:00 -0700 (PDT)
In-Reply-To: <b807b4837bfb7f579a075e107e9cd7cc297b654b.1458191793.git.raj.khem@gmail.com>
References: <cover.1458191793.git.raj.khem@gmail.com>
	<b807b4837bfb7f579a075e107e9cd7cc297b654b.1458191793.git.raj.khem@gmail.com>
Date: Tue, 12 Apr 2016 10:00:00 -0400
Message-ID: <CADkTA4PBrU16rwZjWZCq_88JUYN6YKqTNH8X_XQdBZ17QYeNeg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] socat: Access c_ispeed and c_ospeed via APIs
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
X-List-Received-Date: Tue, 12 Apr 2016 14:00:00 -0000
Content-Type: multipart/alternative; boundary=001a11353a2cbf5e1105304a13b0

--001a11353a2cbf5e1105304a13b0
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 17, 2016 at 1:18 AM, Khem Raj <raj.khem@gmail.com> wrote:

> make it more portable across libc implementations
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...001-Access-c_ispeed-and-c_ospeed-via-APIs.patch | 39
> ++++++++++++++++++++++
>  meta/recipes-connectivity/socat/socat_1.7.3.1.bb   |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644
> meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
>
> diff --git
> a/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
> b/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
> new file mode 100644
> index 0000000..367b48f
> --- /dev/null
> +++
> b/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
> @@ -0,0 +1,39 @@
> +From 545d3dec8c91d6074516ffcfa79323ddf9d83839 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 15 Mar 2016 21:36:02 +0000
> +Subject: [PATCH] Access c_ispeed and c_ospeed via APIs
> +
> +Use cfsetispeed(), cfsetospeed(), cfgetispeed, and cfgetospeed()
> +instead of operating on c_ispeed and c_ospeed termios structure
> +members directly because they are not guaranteed to exist on all
> +libc implementations
>

I finally bisected a runtime failure on my container platform to this
change. I'm now
failing the new assertion, where I wasn't failing before this was added:

socat-1.7.3.1/xioinitialize.c:70: xioinitialize: Assertion
`cfgetispeed(&tdata.termarg) == tdata.speeds[ISPEED_OFFSET]' failed.

I can revert this in my own layers, but what's the best way forward to get
this
fixed in core ?

khem: This says it is submitted upstream, did it get accepted ? I can
follow up on the socat
list if it merged there as well.

Bruce


> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Submitted
> +
> + xioinitialize.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/xioinitialize.c b/xioinitialize.c
> +index 9f50155..632ca4c 100644
> +--- a/xioinitialize.c
> ++++ b/xioinitialize.c
> +@@ -65,10 +65,10 @@ int xioinitialize(void) {
> + #if HAVE_TERMIOS_ISPEED && (ISPEED_OFFSET != -1) && (OSPEED_OFFSET != -1)
> + #if defined(ISPEED_OFFSET) && (ISPEED_OFFSET != -1)
> + #if defined(OSPEED_OFFSET) && (OSPEED_OFFSET != -1)
> +-      tdata.termarg.c_ispeed = 0x56789abc;
> +-      tdata.termarg.c_ospeed = 0x6789abcd;
> +-      assert(tdata.termarg.c_ispeed == tdata.speeds[ISPEED_OFFSET]);
> +-      assert(tdata.termarg.c_ospeed == tdata.speeds[OSPEED_OFFSET]);
> ++      cfsetispeed(&tdata.termarg, 0x56789abc);
> ++      cfsetospeed(&tdata.termarg, 0x6789abcd);
> ++      assert(cfgetispeed(&tdata.termarg) == tdata.speeds[ISPEED_OFFSET]);
> ++      assert(cfgetospeed(&tdata.termarg) == tdata.speeds[OSPEED_OFFSET]);
> + #endif
> + #endif
> + #endif
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
> b/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
> index b9a8a2f..6da9a17 100644
> --- a/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
> +++ b/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
> @@ -15,6 +15,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>  SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2
> \
>             file://Makefile.in-fix-for-parallel-build.patch \
>             file://0001-define-NETDB_INTERNAL-to-1-if-not-available.patch \
> +           file://0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch \
>  "
>
>  SRC_URI[md5sum] = "334e46924f2b386299c9db2ac22bcd36"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11353a2cbf5e1105304a13b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Mar 17, 2016 at 1:18 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">make it more portable acro=
ss libc implementations<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0...001-Access-c_ispeed-and-c_ospeed-via-APIs.patch | 39 +++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-connectivity/socat/<a href=3D"http://socat_1.7.3.1.bb" r=
el=3D"noreferrer" target=3D"_blank">socat_1.7.3.1.bb</a>=C2=A0 =C2=A0|=C2=
=A0 1 +<br>
=C2=A02 files changed, 40 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/socat/socat/0001-Access-=
c_ispeed-and-c_ospeed-via-APIs.patch<br>
<br>
diff --git a/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and=
-c_ospeed-via-APIs.patch b/meta/recipes-connectivity/socat/socat/0001-Acces=
s-c_ispeed-and-c_ospeed-via-APIs.patch<br>
new file mode 100644<br>
index 0000000..367b48f<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospe=
ed-via-APIs.patch<br>
@@ -0,0 +1,39 @@<br>
+From 545d3dec8c91d6074516ffcfa79323ddf9d83839 Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Tue, 15 Mar 2016 21:36:02 +0000<br>
+Subject: [PATCH] Access c_ispeed and c_ospeed via APIs<br>
+<br>
+Use cfsetispeed(), cfsetospeed(), cfgetispeed, and cfgetospeed()<br>
+instead of operating on c_ispeed and c_ospeed termios structure<br>
+members directly because they are not guaranteed to exist on all<br>
+libc implementations<br></blockquote><div><br></div><div>I finally bisecte=
d a runtime failure on my container platform to this change. I&#39;m now</d=
iv><div>failing the new assertion, where I wasn&#39;t failing before this w=
as added:</div><div><br></div><div>socat-1.7.3.1/xioinitialize.c:70: xioini=
tialize: Assertion `cfgetispeed(&amp;tdata.termarg) =3D=3D tdata.speeds[ISP=
EED_OFFSET]&#39; failed.</div><div><br></div><div>I can revert this in my o=
wn layers, but what&#39;s the best way forward to get this</div><div>fixed =
in core ?</div><div><br></div><div>khem: This says it is submitted upstream=
, did it get accepted ? I can follow up on the socat</div><div>list if it m=
erged there as well.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
+---<br>
+Upstream-Status: Submitted<br>
+<br>
+ xioinitialize.c | 8 ++++----<br>
+ 1 file changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/xioinitialize.c b/xioinitialize.c<br>
+index 9f50155..632ca4c 100644<br>
+--- a/xioinitialize.c<br>
++++ b/xioinitialize.c<br>
+@@ -65,10 +65,10 @@ int xioinitialize(void) {<br>
+ #if HAVE_TERMIOS_ISPEED &amp;&amp; (ISPEED_OFFSET !=3D -1) &amp;&amp; (OS=
PEED_OFFSET !=3D -1)<br>
+ #if defined(ISPEED_OFFSET) &amp;&amp; (ISPEED_OFFSET !=3D -1)<br>
+ #if defined(OSPEED_OFFSET) &amp;&amp; (OSPEED_OFFSET !=3D -1)<br>
+-=C2=A0 =C2=A0 =C2=A0 tdata.termarg.c_ispeed =3D 0x56789abc;<br>
+-=C2=A0 =C2=A0 =C2=A0 tdata.termarg.c_ospeed =3D 0x6789abcd;<br>
+-=C2=A0 =C2=A0 =C2=A0 assert(tdata.termarg.c_ispeed =3D=3D tdata.speeds[IS=
PEED_OFFSET]);<br>
+-=C2=A0 =C2=A0 =C2=A0 assert(tdata.termarg.c_ospeed =3D=3D tdata.speeds[OS=
PEED_OFFSET]);<br>
++=C2=A0 =C2=A0 =C2=A0 cfsetispeed(&amp;tdata.termarg, 0x56789abc);<br>
++=C2=A0 =C2=A0 =C2=A0 cfsetospeed(&amp;tdata.termarg, 0x6789abcd);<br>
++=C2=A0 =C2=A0 =C2=A0 assert(cfgetispeed(&amp;tdata.termarg) =3D=3D tdata.=
speeds[ISPEED_OFFSET]);<br>
++=C2=A0 =C2=A0 =C2=A0 assert(cfgetospeed(&amp;tdata.termarg) =3D=3D tdata.=
speeds[OSPEED_OFFSET]);<br>
+ #endif<br>
+ #endif<br>
+ #endif<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/meta/recipes-connectivity/socat/<a href=3D"http://socat_1.7.3.=
1.bb" rel=3D"noreferrer" target=3D"_blank">socat_1.7.3.1.bb</a> b/meta/reci=
pes-connectivity/socat/<a href=3D"http://socat_1.7.3.1.bb" rel=3D"noreferre=
r" target=3D"_blank">socat_1.7.3.1.bb</a><br>
index b9a8a2f..6da9a17 100644<br>
--- a/meta/recipes-connectivity/socat/<a href=3D"http://socat_1.7.3.1.bb" r=
el=3D"noreferrer" target=3D"_blank">socat_1.7.3.1.bb</a><br>
+++ b/meta/recipes-connectivity/socat/<a href=3D"http://socat_1.7.3.1.bb" r=
el=3D"noreferrer" target=3D"_blank">socat_1.7.3.1.bb</a><br>
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d6=
9f5fce4486a80fdaf4a4263 \<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.dest-unreach.org/socat/downlo=
ad/socat-${PV}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://www.des=
t-unreach.org/socat/download/socat-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Makefile.in-fix-for-parall=
el-build.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-define-NETDB_INTERNAL=
-to-1-if-not-available.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Access-c_ispeed-and-c=
_ospeed-via-APIs.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;334e46924f2b386299c9db2ac22bcd36&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a11353a2cbf5e1105304a13b0--
