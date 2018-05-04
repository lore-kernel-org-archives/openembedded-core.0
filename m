Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9826774823
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 20:13:37 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id v15-v6so22219989wrm.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 13:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q96S3K90mKwFjdxBERHLmfoI9SFvyqS382EaKrubxPg=;
	b=R8nGYrNf8dljlY6FNP1LuLvYwFrtnXNzhP9WAp9zowU4+Z/CZtsHEMmKcyWn2l9Nbq
	jIUZ3c3rEpvjbGW2G8m8AW7+Rf6VzZ55pPH1eRTZlmY3GCv2ud2V3jXrKtE59m0vXslV
	G9Gs3S+gey/RvMSQokBHNumXTYib1r46De5Rtoe8DZShhybfh8+NoQQs4mv1aBnciCZ3
	8JTeHR/G52frdCLTQQOFD0WNiZinIv7chGqrUupFBXJLRG0cUkR30aVsGkMmV6xni5M7
	esFudWxpEZx+DFRNzNcQB9Ux1BIpfAtQZgi/LRwYGBs5IvvoKVeAbEfXkAIEiBf86JFw
	W7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q96S3K90mKwFjdxBERHLmfoI9SFvyqS382EaKrubxPg=;
	b=hFokNTopJDIWhaiQ1EH3rKTGnt7mP+RWoaZACLF1MqiIbwmAzB9aeX7wgUTItQJMwS
	n4Nm7FrO45DyIVSPGJlyEsjaJ+3oo9hpB/N/gSo+Q5HBHR04G4cWY879g6PZMZ/G8wwp
	3KLnHkPeb3O4QIDFG4FW7QrzUJBd/95kmGeXSxgjPut4gKqvGU2RhZpZR9dNyrtybn8x
	9W4nSJRiWTdJUFbwwhvTHtzt7PtF+aZLdQ55PvW59bV4epZXDvsnvJuCxr+F3D42Od7y
	6hIuzvmwGnStTaVF5tqv8QJJroBnoH+q84lZve5CRgGWY4H6yGMlYJcTQtCU55LrGFl/
	z2Bg==
X-Gm-Message-State: ALQs6tA+FPj1+q4AtgYC/JxQ91OfC/OPZUijOHH/MgGx46Xia1VM3Sdv
	8n4cTCngmkRgpxara2/yTKZyspS/mImWGmMMwJg4/g==
X-Google-Smtp-Source: AB8JxZqgfRhe4vKc0KOXBDcHAOIBx2En1UmYVyogxZaX81srNemEzyrotBaZF38D4+b7ORcKhw1TQUjqLx09Tt8jBys=
X-Received: by 2002:adf:e4c8:: with SMTP id
	v8-v6mr20540495wrm.133.1525463463486; 
	Fri, 04 May 2018 12:51:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Fri, 4 May 2018 12:51:02 -0700 (PDT)
In-Reply-To: <20180504123244.43049-14-alexander.kanavin@linux.intel.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-14-alexander.kanavin@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 4 May 2018 21:51:02 +0200
Message-ID: <CA+chaQfzfNip1UE1WWy2v=T6rWkYkSLTZS-FRek2hP9W=T_3_w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/14] babeltrace: switch over to git
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
X-List-Received-Date: Fri, 04 May 2018 20:13:38 -0000
Content-Type: multipart/alternative; boundary="000000000000dbe8ac056b66a3f1"

--000000000000dbe8ac056b66a3f1
Content-Type: text/plain; charset="UTF-8"

Similar change is needed in stable branches as well, I've just noticed it
failing with 1.4.0 version used in morty.

There is quite a few fetch issues in morty as of today.
oe-core/meta/recipes-support/libmpc/libmpc_1.0.3.bb:do_fetch
Resolving www.multiprecision.org (www.multiprecision.org)... 185.233.100.48
Connecting to www.multiprecision.org
(www.multiprecision.org)|185.233.100.48|:80...
connected.
HTTP request sent, awaiting response... 500 Internal Server Error
2018-05-04 16:46:19 ERROR 500: Internal Server Error.

oe-core/meta/recipes-support/libpcre/libpcre_8.39.bb:do_fetch
ERROR: libpcre-native-8.39-r0 do_fetch: Fetcher failure for URL: '
http://downloads.sourceforge.net/projects/pcre/files/prce/8.39/pcre-8.39.tar.bz2'.
Checksum mismatch!
sourceforge is returning some HTML instead of this tarball.

meta-oe/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb:do_fetch
--2018-05-04 16:52:52--
http://www.hyperrealm.com/libconfig/libconfig-1.5.tar.gz
Resolving www.hyperrealm.com (www.hyperrealm.com)... 50.87.249.191
Connecting to www.hyperrealm.com (www.hyperrealm.com)|50.87.249.191|:80...
connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://hyperrealm.com/libconfig/libconfig-1.5.tar.gz [following]
--2018-05-04 16:52:52--
http://hyperrealm.com/libconfig/libconfig-1.5.tar.gz
Resolving hyperrealm.com (hyperrealm.com)... 50.87.249.191
Reusing existing connection to www.hyperrealm.com:80.
HTTP request sent, awaiting response... 404 Not Found
2018-05-04 16:52:53 ERROR 404: Not Found.

meta-oe/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb:do_fetch
--2018-05-04 16:53:32--
http://downloads.sourceforge.net/fuse/fuse-2.9.4.tar.gz
Resolving downloads.sourceforge.net (downloads.sourceforge.net)...
216.105.38.13
Connecting to downloads.sourceforge.net
(downloads.sourceforge.net)|216.105.38.13|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2018-05-04 16:53:32 ERROR 404: Not Found.

meta-oe/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb:do_fetch
--2018-05-04 16:54:20--
http://downloads.sourceforge.net/project/mikmod/libmikmod/3.3.6/libmikmod-3.3.6.tar.gz
Resolving downloads.sourceforge.net (downloads.sourceforge.net)...
216.105.38.13
Connecting to downloads.sourceforge.net
(downloads.sourceforge.net)|216.105.38.13|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2018-05-04 16:54:20 ERROR 404: Not Found.

Luckily all of these issues (except the babeltrace) are covered by default
download mirrors.

Can you please upload the tarball (I assume you still have it from the time
you were testing the upgrade to 1.5.5) to:
http://downloads.yoctoproject.org/mirror/sources/babeltrace-1.5.5.tar.bz2
or
http://sources.openembedded.org/babeltrace-1.5.5.tar.bz2
so that it's covered with default mirrors.bbclass as well?

Thanks

On Fri, May 4, 2018 at 2:32 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Tarball directory is gone.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-kernel/lttng/babeltrace_1.5.5.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
> b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
> index 92d86b92e8b..5d7a7efd2f5 100644
> --- a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
> @@ -10,10 +10,10 @@ DEPENDS = "glib-2.0 util-linux popt bison-native
> flex-native"
>
>  inherit autotools pkgconfig
>
> -SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${
> PV}.tar.bz2 \
> +SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;
> branch=stable-1.5 \
>  "
>
>  EXTRA_OECONF = "--disable-debug-info"
>
> -SRC_URI[md5sum] = "7decafd46093e4e47c14e7307d498986"
> -SRC_URI[sha256sum] = "409146789b4a6b81f6a275fcad932a
> 030743d444f6de5bd4a34aaf17aa72e8ac"
> +S = "${WORKDIR}/git"
> +SRCREV = "d68a4daf85c73ab7d7070de0c98d0c170af4758e"
> --
> 2.16.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000dbe8ac056b66a3f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Similar change is needed in stable branches as well, I&#39=
;ve just noticed it failing with 1.4.0 version used in morty.<div><br></div=
><div>There is quite a few fetch issues in morty as of today.</div><div>oe-=
core/meta/recipes-support/libmpc/libmpc_1.0.3.bb:do_fetch<br></div><div><di=
v>Resolving <a href=3D"http://www.multiprecision.org">www.multiprecision.or=
g</a> (<a href=3D"http://www.multiprecision.org">www.multiprecision.org</a>=
)... 185.233.100.48</div><div>Connecting to <a href=3D"http://www.multiprec=
ision.org">www.multiprecision.org</a> (<a href=3D"http://www.multiprecision=
.org">www.multiprecision.org</a>)|185.233.100.48|:80... connected.</div><di=
v>HTTP request sent, awaiting response... 500 Internal Server Error</div><d=
iv>2018-05-04 16:46:19 ERROR 500: Internal Server Error.</div></div><div><b=
r></div><div>oe-core/meta/recipes-support/libpcre/libpcre_8.39.bb:do_fetch<=
br></div><div>ERROR: libpcre-native-8.39-r0 do_fetch: Fetcher failure for U=
RL: &#39;<a href=3D"http://downloads.sourceforge.net/projects/pcre/files/pr=
ce/8.39/pcre-8.39.tar.bz2">http://downloads.sourceforge.net/projects/pcre/f=
iles/prce/8.39/pcre-8.39.tar.bz2</a>&#39;. Checksum mismatch!<br></div><div=
>sourceforge is returning some HTML instead of this tarball.</div><div><br>=
</div><div>meta-oe/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb:do_f=
etch<br></div><div><div>--2018-05-04 16:52:52--=C2=A0 <a href=3D"http://www=
.hyperrealm.com/libconfig/libconfig-1.5.tar.gz">http://www.hyperrealm.com/l=
ibconfig/libconfig-1.5.tar.gz</a></div><div>Resolving <a href=3D"http://www=
.hyperrealm.com">www.hyperrealm.com</a> (<a href=3D"http://www.hyperrealm.c=
om">www.hyperrealm.com</a>)... 50.87.249.191</div><div>Connecting to <a hre=
f=3D"http://www.hyperrealm.com">www.hyperrealm.com</a> (<a href=3D"http://w=
ww.hyperrealm.com">www.hyperrealm.com</a>)|50.87.249.191|:80... connected.<=
/div><div>HTTP request sent, awaiting response... 301 Moved Permanently</di=
v><div>Location: <a href=3D"http://hyperrealm.com/libconfig/libconfig-1.5.t=
ar.gz">http://hyperrealm.com/libconfig/libconfig-1.5.tar.gz</a> [following]=
</div><div>--2018-05-04 16:52:52--=C2=A0 <a href=3D"http://hyperrealm.com/l=
ibconfig/libconfig-1.5.tar.gz">http://hyperrealm.com/libconfig/libconfig-1.=
5.tar.gz</a></div><div>Resolving <a href=3D"http://hyperrealm.com">hyperrea=
lm.com</a> (<a href=3D"http://hyperrealm.com">hyperrealm.com</a>)... 50.87.=
249.191</div><div>Reusing existing connection to <a href=3D"http://www.hype=
rrealm.com:80">www.hyperrealm.com:80</a>.</div><div>HTTP request sent, awai=
ting response... 404 Not Found</div><div>2018-05-04 16:52:53 ERROR 404: Not=
 Found.</div></div><div><br></div><div>meta-oe/meta-filesystems/recipes-sup=
port/fuse/fuse_2.9.4.bb:do_fetch<br></div><div><div>--2018-05-04 16:53:32--=
=C2=A0 <a href=3D"http://downloads.sourceforge.net/fuse/fuse-2.9.4.tar.gz">=
http://downloads.sourceforge.net/fuse/fuse-2.9.4.tar.gz</a></div><div>Resol=
ving <a href=3D"http://downloads.sourceforge.net">downloads.sourceforge.net=
</a> (<a href=3D"http://downloads.sourceforge.net">downloads.sourceforge.ne=
t</a>)... 216.105.38.13</div><div>Connecting to <a href=3D"http://downloads=
.sourceforge.net">downloads.sourceforge.net</a> (<a href=3D"http://download=
s.sourceforge.net">downloads.sourceforge.net</a>)|216.105.38.13|:80... conn=
ected.</div><div>HTTP request sent, awaiting response... 404 Not Found</div=
><div>2018-05-04 16:53:32 ERROR 404: Not Found.</div></div><div><br></div><=
div>meta-oe/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb:do_fetch<b=
r></div><div><div>--2018-05-04 16:54:20--=C2=A0 <a href=3D"http://downloads=
.sourceforge.net/project/mikmod/libmikmod/3.3.6/libmikmod-3.3.6.tar.gz">htt=
p://downloads.sourceforge.net/project/mikmod/libmikmod/3.3.6/libmikmod-3.3.=
6.tar.gz</a></div><div>Resolving <a href=3D"http://downloads.sourceforge.ne=
t">downloads.sourceforge.net</a> (<a href=3D"http://downloads.sourceforge.n=
et">downloads.sourceforge.net</a>)... 216.105.38.13</div><div>Connecting to=
 <a href=3D"http://downloads.sourceforge.net">downloads.sourceforge.net</a>=
 (<a href=3D"http://downloads.sourceforge.net">downloads.sourceforge.net</a=
>)|216.105.38.13|:80... connected.</div><div>HTTP request sent, awaiting re=
sponse... 404 Not Found</div><div>2018-05-04 16:54:20 ERROR 404: Not Found.=
</div></div><div><br></div><div>Luckily all of these issues (except the bab=
eltrace) are covered by default download mirrors.</div><div><br></div><div>=
Can you please upload the tarball (I assume you still have it from the time=
 you were testing the upgrade to 1.5.5) to:</div><div><a href=3D"http://dow=
nloads.yoctoproject.org/mirror/sources/babeltrace-1.5.5.tar.bz2">http://dow=
nloads.yoctoproject.org/mirror/sources/babeltrace-1.5.5.tar.bz2</a><br></di=
v><div>or</div><div><a href=3D"http://sources.openembedded.org/babeltrace-1=
.5.5.tar.bz2">http://sources.openembedded.org/babeltrace-1.5.5.tar.bz2</a><=
br></div><div>so that it&#39;s covered with default mirrors.bbclass as well=
?</div><div><br></div><div>Thanks</div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Fri, May 4, 2018 at 2:32 PM, Alexander Kanav=
in <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.co=
m" target=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Tarball directory is gone.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/lttng/<a href=3D"http://babeltrace_1.5.5.bb" rel=
=3D"noreferrer" target=3D"_blank">babe<wbr>ltrace_1.5.5.bb</a> | 6 +++---<b=
r>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace_1.5.5.b=
b" rel=3D"noreferrer" target=3D"_blank">ba<wbr>beltrace_1.5.5.bb</a> b/meta=
/recipes-kernel/lttng/<a href=3D"http://babeltrace_1.5.5.bb" rel=3D"norefer=
rer" target=3D"_blank">ba<wbr>beltrace_1.5.5.bb</a><br>
index 92d86b92e8b..5d7a7efd2f5 100644<br>
--- a/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace_1.5.5.bb" rel=
=3D"noreferrer" target=3D"_blank">ba<wbr>beltrace_1.5.5.bb</a><br>
+++ b/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace_1.5.5.bb" rel=
=3D"noreferrer" target=3D"_blank">ba<wbr>beltrace_1.5.5.bb</a><br>
@@ -10,10 +10,10 @@ DEPENDS =3D &quot;glib-2.0 util-linux popt bison-native=
 flex-native&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://www.efficios.com/files/babeltrace/babe=
ltrace-${PV}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://www.effic=
ios.com/<wbr>files/babeltrace/babeltrace-${<wbr>PV}.tar.bz2</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.linuxfoundation.org/diamon/b=
abeltrace.git;branch=3Dstable-1.5" rel=3D"noreferrer" target=3D"_blank">git=
.linuxfoundation.<wbr>org/diamon/babeltrace.git;<wbr>branch=3Dstable-1.5</a=
> \<br>
=C2=A0&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-debug-info&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>7decafd46093e4e47c14e7307d4989<wbr>86&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>409146789b4a6b81f6a275fcad932a<wbr>03074=
3d444f6de5bd4a34aaf17aa72<wbr>e8ac&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+SRCREV =3D &quot;<wbr>d68a4daf85c73ab7d7070de0c98d0c<wbr>170af4758e&quot;<=
br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.16.1<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--000000000000dbe8ac056b66a3f1--
