Return-Path: <i.efimov@inango-systems.com>
Received: from mail.inango-sw.com (mail.inango-systems.com [213.136.71.184])
	by mail.openembedded.org (Postfix) with ESMTP id 11E877CBE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 18:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 04ADF7A24DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 20:32:01 +0200 (IST)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id nB3wsWAGzj8l
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 20:31:58 +0200 (IST)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id A38097A24DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 20:31:58 +0200 (IST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com A38097A24DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1550860318;
	bh=LlMKTlrKolhfh7u/7PTuaq0BPAolJZClq+LJVyJykk8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=oGjPoABidgDloDlZoCdPdA8KdEsuzaX1haGFF0GjqqpBnvlY6m3Ep98TtLP2EncoD
	wSnHEzYeOdd87Gtp3w6klCW1Y2+3gioxzYajwXRUkWAm0ufHd2rC83BSh9qNkPwe5P
	u/EdfW1k57ecEYSUAb5YkY0AyW7n9QA16kOrLq6j6If1lQkkvr/XcSV1vdqJrA6E+O
	A6DoOBdcmuP+DPdtPt6eTYvr+FpQLC5v3b9jZDFUMJbkIkj9c0tirEGWg8I9MkvfTk
	Lq4R1GWeIXh5dqQI7iTT5WpWSmCwuupOrwpO8GAsSF8uhfp/MpsH2Bh219DtR/VsMj
	N3SH5FNZpcd9A==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dXDXSLbi5BhU
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 20:31:58 +0200 (IST)
Received: from mail.inango-sw.com (mail.inango-sw.com [172.17.220.3])
	by mail.inango-sw.com (Postfix) with ESMTP id 62D317A24DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 20:31:58 +0200 (IST)
Date: Fri, 22 Feb 2019 20:31:58 +0200 (IST)
From: Ivan Efimov <i.efimov@inango-systems.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <1928708604.1124302.1550860318265.JavaMail.zimbra@inango-systems.com>
MIME-Version: 1.0
X-Originating-IP: [172.17.220.3]
X-Mailer: Zimbra 8.8.9_GA_3006 (ZimbraWebClient - FF65 (Linux)/8.8.9_GA_3006)
Thread-Index: rhjJpcJ3VrJLIvmJLDhyU/mtc13vxw==
Thread-Topic: btrfs-tools Makefile: remove duplicated '-o $@' option from CC
	cmdline for libbtrfsutil/ subfolder
Subject: [PATCH] btrfs-tools Makefile: remove duplicated '-o $@' option from CC cmdline for libbtrfsutil/ subfolder
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
X-List-Received-Date: Fri, 22 Feb 2019 18:32:01 -0000
Content-Type: multipart/alternative; 
	boundary="=_e4bb9630-75eb-42d5-b726-58ef14653d89"

--=_e4bb9630-75eb-42d5-b726-58ef14653d89
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Command line for target "libbtrfsutil/%.o" contained 
double usage of '-o $@' option and causes compilation error: 

cc1: error: too many filenames given 

Signed-off-by: Ivan Efimov <i.efimov@inango-systems.com> 
--- 
...01-Makefile-fix-double-o-compiler-option-using.patch | 17 +++++++++++++++++ 
meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb | 1 + 
2 files changed, 18 insertions(+) 
create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.patch 

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-dou$ 
le-o-compiler-option-using.patch 
new file mode 100644 
index 0000000000..335067bc1f 
--- /dev/null 
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.patch 
@@ -0,0 +1,17 @@ 
+Command line for target "libbtrfsutil/%.o" contained double usage 
+ of '-o $@' option and caused error: 
+ cc1: error: too many filenames given 
+ 
+Index: git/Makefile 
+=================================================================== 
+--- git.orig/Makefile 
++++ git/Makefile 
+@@ -414,7 +414,7 @@ libbtrfs.so.0 libbtrfs.so: libbtrfs.so.0 
+ 
+ libbtrfsutil/%.o: libbtrfsutil/%.c 
+ @echo " [CC] $@" 
+- $(Q)$(CC) $(LIBBTRFSUTIL_CFLAGS) -o $@ -c $< -o $@ 
++ $(Q)$(CC) $(LIBBTRFSUTIL_CFLAGS) -c $< -o $@ 
+ 
+ libbtrfsutil.so.$(libbtrfsutil_version): $(libbtrfsutil_objects) 
+ @echo " [LD] $@" 
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb 
index 1b4f515cb6..f1c4691313 100644 
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb 
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb 
@@ -19,6 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \ 
file://0001-Makefile-build-mktables-using-native-gcc.patch \ 
file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \ 
file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \ 
+ file://0001-Makefile-fix-double-o-compiler-option-using.patch \ 
" 

inherit autotools-brokensep pkgconfig manpages distutils3-base 
-- 
2.14.1 

--=_e4bb9630-75eb-42d5-b726-58ef14653d89
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial, helvetica, sans-serif; font-s=
ize: 12pt; color: #000000"><div>Command line for target "libbtrfsutil/%.o" =
contained<br>double usage of '-o $@' option and causes compilation error:<b=
r><br>&nbsp;&nbsp;&nbsp;&nbsp; cc1: error: too many filenames given<br><br>=
Signed-off-by: Ivan Efimov &lt;i.efimov@inango-systems.com&gt;<br>---<br>&n=
bsp;...01-Makefile-fix-double-o-compiler-option-using.patch | 17 ++++++++++=
+++++++<br>&nbsp;meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb |&=
nbsp; 1 +<br>&nbsp;2 files changed, 18 insertions(+)<br>&nbsp;create mode 1=
00644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-doubl=
e-o-compiler-option-using.patch<br><br>diff --git a/meta/recipes-devtools/b=
trfs-tools/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.pat=
ch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-dou$<b=
r>le-o-compiler-option-using.patch<br>new file mode 100644<br>index 0000000=
000..335067bc1f<br>--- /dev/null<br>+++ b/meta/recipes-devtools/btrfs-tools=
/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.patch<br>@@ -=
0,0 +1,17 @@<br>+Command line for target "libbtrfsutil/%.o" contained doubl=
e usage<br>+&nbsp; of '-o $@' option and caused error:<br>+&nbsp;&nbsp;&nbs=
p; cc1: error: too many filenames given<br>+<br>+Index: git/Makefile<br>+=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>+--- git.orig/Makefi=
le<br>++++ git/Makefile<br>+@@ -414,7 +414,7 @@ libbtrfs.so.0 libbtrfs.so: =
libbtrfs.so.0<br>+ <br>+ libbtrfsutil/%.o: libbtrfsutil/%.c<br>+&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; @echo "&nbsp;&nbsp;&nbsp; [CC]&nbsp;&nbsp;&nbsp;&=
nbsp; $@"<br>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(Q)$(CC) $(LIBBTRFSUTIL_CFLA=
GS) -o $@ -c $&lt; -o $@<br>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(Q)$(CC) $(LI=
BBTRFSUTIL_CFLAGS) -c $&lt; -o $@<br>+ <br>+ libbtrfsutil.so.$(libbtrfsutil=
_version): $(libbtrfsutil_objects)<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 @echo "&nbsp;&nbsp;&nbsp; [LD]&nbsp;&nbsp;&nbsp;&nbsp; $@"<br>diff --git a=
/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb b/meta/recipes-dev=
tools/btrfs-tools/btrfs-tools_4.20.1.bb<br>index 1b4f515cb6..f1c4691313 100=
644<br>--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb<br>+++=
 b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb<br>@@ -19,6 +19,=
7 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs=
-progs.git \<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; file://0001-Makefile-build-mktables-using-native-gcc.patch \<br>&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0001=
-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \<br>&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0001-Add-a-possibility=
-to-specify-where-python-modules-ar.patch \<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0001-Makefile-fix-double-o-compile=
r-option-using.patch \<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; "<br>&nbsp;<br>&nbsp;inherit autotools-brokensep pkgconfi=
g manpages distutils3-base<br>-- <br>2.14.1<br></div></div></body></html>

--=_e4bb9630-75eb-42d5-b726-58ef14653d89--
