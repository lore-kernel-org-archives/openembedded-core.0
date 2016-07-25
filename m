Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7596E667
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:16:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6P8Gftm023081
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 01:16:42 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 01:16:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2016 01:16:30 -0700
Message-ID: <7e81c96cfa91fa9c0ce74f735725892b3222cf5f.1469431066.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469431066.git.liezhi.yang@windriver.com>
References: <cover.1469431066.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] gettext-minimal-native: 0.19.4 -> 0.19.8.1
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
X-List-Received-Date: Mon, 25 Jul 2016 08:16:41 -0000
Content-Type: text/plain

How to upgrade gettext-minimal-native:
  - Build gettext-native
  - Copy gettext-runtime/po/Makefile.in.in, build-aux/config.rpath and
    gettext-runtime/po/remove-potcdate.sin from gettext-native.
  - Update COPYING when needed (usually update the year), do not copy
    the whole COPYING file from gettext-native.
  - Go to gettext-native's ${S}/gettext-runtime/m4:
    > Remove lt*.m4 and libtool.m4
    > copy lib-ld.m4 lib-link.m4 lib-prefix.m4 from ${S}/gettext-runtime/gnulib-m4/
    > tar czvf /path/to/aclocal.tgz *.m4

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gettext/gettext-minimal-0.19.4/aclocal.tgz     | Bin 39744 -> 0 bytes
 ...-PATCH-Disable-the-test-to-convert-euc-jp.patch |   0
 .../COPYING                                        |   2 +-
 .../Makefile.in.in                                 |  44 +++++++++++++++------
 .../gettext/gettext-minimal-0.19.8.1/aclocal.tgz   | Bin 0 -> 40014 bytes
 .../config.rpath                                   |   2 +-
 .../remove-potcdate.sin                            |   0
 ....19.4.bb => gettext-minimal-native_0.19.8.1.bb} |   3 +-
 8 files changed, 34 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.19.4/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.19.4 => gettext-minimal-0.19.8.1}/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.19.4 => gettext-minimal-0.19.8.1}/COPYING (76%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.19.4 => gettext-minimal-0.19.8.1}/Makefile.in.in (91%)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.19.8.1/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.19.4 => gettext-minimal-0.19.8.1}/config.rpath (99%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.19.4 => gettext-minimal-0.19.8.1}/remove-potcdate.sin (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.19.4.bb => gettext-minimal-native_0.19.8.1.bb} (93%)

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.4/aclocal.tgz b/meta/recipes-core/gettext/gettext-minimal-0.19.4/aclocal.tgz
deleted file mode 100644
index b04ba55032e45b1d11545df227a1e9ca26bebf8e..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 39744
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

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.4/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch b/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.19.4/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch
rename to meta/recipes-core/gettext/gettext-minimal-0.19.8.1/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.4/COPYING b/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/COPYING
similarity index 76%
rename from meta/recipes-core/gettext/gettext-minimal-0.19.4/COPYING
rename to meta/recipes-core/gettext/gettext-minimal-0.19.8.1/COPYING
index 8d11d1d..3671ab6 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.19.4/COPYING
+++ b/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/COPYING
@@ -1,4 +1,4 @@
-dnl Copyright (C) 1995-2014 Free Software Foundation, Inc.
+dnl Copyright (C) 1995-2016 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.4/Makefile.in.in b/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/Makefile.in.in
similarity index 91%
rename from meta/recipes-core/gettext/gettext-minimal-0.19.4/Makefile.in.in
rename to meta/recipes-core/gettext/gettext-minimal-0.19.8.1/Makefile.in.in
index 8906ba0..38c293d 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.19.4/Makefile.in.in
+++ b/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/Makefile.in.in
@@ -1,14 +1,12 @@
 # Makefile for PO directory in any package using GNU gettext.
 # Copyright (C) 1995-1997, 2000-2007, 2009-2010 by Ulrich Drepper <drepper@gnu.ai.mit.edu>
 #
-# This file can be copied and used freely without restrictions.  It can
-# be used in projects which are not available under the GNU General Public
-# License but which still want to provide support for the GNU gettext
-# functionality.
-# Please note that the actual code of GNU gettext is covered by the GNU
-# General Public License and is *not* in the public domain.
+# Copying and distribution of this file, with or without modification,
+# are permitted in any medium without royalty provided the copyright
+# notice and this notice are preserved.  This file is offered as-is,
+# without any warranty.
 #
-# Origin: gettext-0.19
+# Origin: gettext-0.19.8
 GETTEXT_MACRO_VERSION = 0.19
 
 PACKAGE = @PACKAGE@
@@ -33,7 +31,22 @@ gettextsrcdir = $(datadir)/gettext/po
 INSTALL = @INSTALL@
 INSTALL_DATA = @INSTALL_DATA@
 
+# We use $(mkdir_p).
+# In automake <= 1.9.x, $(mkdir_p) is defined either as "mkdir -p --" or as
+# "$(mkinstalldirs)" or as "$(install_sh) -d". For these automake versions,
+# @install_sh@ does not start with $(SHELL), so we add it.
+# In automake >= 1.10, @mkdir_p@ is derived from ${MKDIR_P}, which is defined
+# either as "/path/to/mkdir -p" or ".../install-sh -c -d". For these automake
+# versions, $(mkinstalldirs) and $(install_sh) are unused.
+mkinstalldirs = $(SHELL) @install_sh@ -d
+install_sh = $(SHELL) @install_sh@
 MKDIR_P = @MKDIR_P@
+mkdir_p = @mkdir_p@
+
+# When building gettext-tools, we prefer to use the built programs
+# rather than installed programs.  However, we can't do that when we
+# are cross compiling.
+CROSS_COMPILING = @CROSS_COMPILING@
 
 GMSGFMT_ = @GMSGFMT@
 GMSGFMT_no = @GMSGFMT@
@@ -187,6 +200,11 @@ $(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTFILES.in remove-potcdate.sed
 	    ;; \
 	esac
 	test ! -f $(DOMAIN).po || { \
+	  if test -f $(srcdir)/$(DOMAIN).pot-header; then \
+	    sed -e '1,/^#$$/d' < $(DOMAIN).po > $(DOMAIN).1po && \
+	    cat $(srcdir)/$(DOMAIN).pot-header $(DOMAIN).1po > $(DOMAIN).po; \
+	    rm -f $(DOMAIN).1po; \
+	  fi; \
 	  if test -f $(srcdir)/$(DOMAIN).pot; then \
 	    sed -f remove-potcdate.sed < $(srcdir)/$(DOMAIN).pot > $(DOMAIN).1po && \
 	    sed -f remove-potcdate.sed < $(DOMAIN).po > $(DOMAIN).2po && \
@@ -216,7 +234,7 @@ $(POFILES): $(POFILESDEPS)
 	  test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
 	  echo "$${cdcmd}$(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} $${lang}.po $(DOMAIN).pot"; \
 	  cd $(srcdir) \
-	    && { case `$(MSGMERGE_UPDATE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+	    && { case `$(MSGMERGE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
 	           '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
 	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) $${lang}.po $(DOMAIN).pot;; \
 	           *) \
@@ -232,7 +250,7 @@ install: install-exec install-data
 install-exec:
 install-data: install-data-@USE_NLS@
 	if test "$(PACKAGE)" = "gettext-tools"; then \
-	  $(MKDIR_P) $(DESTDIR)$(gettextsrcdir); \
+	  $(mkdir_p) $(DESTDIR)$(gettextsrcdir); \
 	  for file in $(DISTFILES.common) Makevars.template; do \
 	    $(INSTALL_DATA) $(srcdir)/$$file \
 			    $(DESTDIR)$(gettextsrcdir)/$$file; \
@@ -250,7 +268,7 @@ install-data-yes: all
 	  cat=`basename $$cat`; \
 	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
 	  dir=$(localedir)/$$lang/LC_MESSAGES; \
-	  $(MKDIR_P) $(DESTDIR)$$dir; \
+	  $(mkdir_p) $(DESTDIR)$$dir; \
 	  if test -r $$cat; then realcat=$$cat; else realcat=$(srcdir)/$$cat; fi; \
 	  $(INSTALL_DATA) $$realcat $(DESTDIR)$$dir/$(DOMAIN).mo; \
 	  echo "installing $$realcat as $(DESTDIR)$$dir/$(DOMAIN).mo"; \
@@ -290,7 +308,7 @@ installdirs: installdirs-exec installdirs-data
 installdirs-exec:
 installdirs-data: installdirs-data-@USE_NLS@
 	if test "$(PACKAGE)" = "gettext-tools"; then \
-	  $(MKDIR_P) $(DESTDIR)$(gettextsrcdir); \
+	  $(mkdir_p) $(DESTDIR)$(gettextsrcdir); \
 	else \
 	  : ; \
 	fi
@@ -301,7 +319,7 @@ installdirs-data-yes:
 	  cat=`basename $$cat`; \
 	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
 	  dir=$(localedir)/$$lang/LC_MESSAGES; \
-	  $(MKDIR_P) $(DESTDIR)$$dir; \
+	  $(mkdir_p) $(DESTDIR)$$dir; \
 	  for lc in '' $(EXTRA_LOCALE_CATEGORIES); do \
 	    if test -n "$$lc"; then \
 	      if (cd $(DESTDIR)$(localedir)/$$lang && LC_ALL=C ls -l -d $$lc 2>/dev/null) | grep ' -> ' >/dev/null; then \
@@ -417,7 +435,7 @@ update-po: Makefile
 
 .nop.po-update:
 	@lang=`echo $@ | sed -e 's/\.po-update$$//'`; \
-	if test "$(PACKAGE)" = "gettext-tools"; then PATH=`pwd`/../src:$$PATH; fi; \
+	if test "$(PACKAGE)" = "gettext-tools" && test "$(CROSS_COMPILING)" != "yes"; then PATH=`pwd`/../src:$$PATH; fi; \
 	tmpdir=`pwd`; \
 	echo "$$lang:"; \
 	test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/aclocal.tgz b/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/aclocal.tgz
new file mode 100644
index 0000000000000000000000000000000000000000..9b2d1f561d734df608c9c7a6e29e08131296a5fd
GIT binary patch
literal 40014
zcmV(;K-<3`iwFR{kBwIV1MEEcbJ|$a^RxeoH^emt4+w;>*ol+HfNg3puz+(E<5CIf
z0a^=*)nSKC^1pxG@6g3zCtppbc6Kyl5PJRk_1*mr#c)mP(?FRY{`7}k6}XNM58?aZ
z=;-*6{Z<e8H{Kqp)t}Vr@yWsAk$O~Bf2yd}%E`%3r1Hm+6knkq=pG?I*-PD-s@veG
z=l=+Te(d#v7?A}KVA0ZTazye|8U*xHP^u{EOQl-aF&&%K-Nn+grn7+L>jhE;&6VJz
zTEyF9_W2SXsE2r~9+OLtQZjHS!K3a`a_NSSsRx$p6dAIXV<_xqIJ0~*v20548~ga8
z&nptl=teZG^VE8vJ_#M$np*)i$%1-w%lDy~1TJv4SQ6ba%dSUE%MUzj90o8>z)5(t
zf*FA({C2~D%w5x(SO&xH7m4l@+jXY+9UzU48(0RTa^Zo%ya#G3I}FjK=g!H67dkGv
z)~&Hk;d!mDHJX>Vo&2bFqqS?Dt5)Z-tJS-W=Ab#eEAEVT2mzRSt$y9q;IIB$el!7M
z99y%&5G`loBIzXRK}PyqGajN=P3R495x7QxtljGTrnN4c?Ljlo9?Iu1yw>Y?ullu{
zr~%tXFD%EfLz9x%60I_Ob0<(rAY-O``^50cd6K%kpsetUcr*w-hx}~#ukP*&aqkTj
zpD(HZG?3%o6&MWrvL+;;en58DLj!4mlo^b}I&ty0I?ep(y7sQQMgwG|MnsGnbYeLa
zM_IZdnduK{i7-v9<6U9IO{^XG{<A&#`z~;D>NzC~T*#q+P!`x8|JBN2wF2?~q*_&v
z4^;I8;{QRldiZzz{}C6)uRU%Agd4#g(TS~-)}Tx3r>7#s#jzh^d$qJZ!2e}}dmO~4
zw$}VGZ1y`^s{>)SDI@r`_O98#s0~{;`4N|*#-)e=<$cn#sqO>Uz$Ws0<%G61CUe~h
zA<tsGpSh374OkZfz~@{yJlBW8AubKV1(M^Fl!7>K*S*s12VxkE7b_t8VnKD!M`UA4
z#-4jmomV(8B6>Xwg2h?6Y=fYDW$J{A>rKnLXUssx<ykPd%j0lbf|QTptqkftC{?QE
zxjzL5J*X%M@#blo2BAah@PvR*fhIlEFBvW%^nhWIF6e*?auE|Ka|U2GC|MwxgpR=!
z1hUWrV(7L_sBVBFK{lR3NK=_AMJBgB(dEIlOfo@qdAu!<&*UpfwoT)P3CTmY`np#n
z#_1^l8LsD1Be0iXO!I}UTaJ&2_B=YF9z}{ln7|5{2C+=)1YkkbBe_Wqc}(*!N#9ct
z1+#mQD0u{K-7z<)q>PRfwTidhfo2`NJVvil%lQBCRw?JRX02&@AWUD=NItJ=pj=^s
znpP;V6bcT5YOtoErzgY<@(*;d65t=rZ%=Y6q5$x2fmG-m7)LCza$tOJrAbu-Q!}cY
z5G09h-9!E~g5`oj@&vVALJ#^$M{F$RLY}pJ)0%?Wf}9d`L<54f9xNRqQHrRD28Klk
zUv;ORK1c2X(4K`3y-6{#N%?YcW`z0@ou53q-aYXxrgU)BddwFLGPA~3kkv&b4<;Ne
z0TDUUAZU&Nl!QUR*S+IDvJmDPM(BZd&USbm(jAZwM6D<<S-k<?Y=gNmA3oy%&-3Cb
z3o>OEs8#92)dS|lVx)$rPhIEIUPcijLOu_D16)!u8OX$5j(wAjGY;+hG8DJe1RhJ&
zoYK<54bUreyKL)No|Pa(mlpRx)2tK(OPD<zfSoJ0I~C(%yuTPU{y#h&mMSNlCny|Z
zo}}zfp?dSdG?;;cdvKc+9s#N|Sq=atp_YY0Ce|mgH;gKElswZX{4lWG1DF5`+&KmZ
z_H_E|uZ;XCrUssFC@|c@^?(DU9+ZDigYuzTIXHO3;z7;#!#Rz`&J-+!0lo}j4q~<s
zdCt}`%<Y$VUVx9}^LdjMrY0~_>-E}A@bO=MA@Rc-m_C4;lix)l`{hfbF&Yher5eP*
ziH?9YF;rS+5;t6LlTgOO4t@MflXTU&t!sl}qb@Qf44%Ni$ND(|&!n8>0j@J(Jpt3`
zc81#R0Om=<kG-bEn?al5fsv8nJEFKy$aDs<xbJ1RKWtro)CS$#e!Yo!E9CXc<IL!s
zfR*vH%*GTzXnrADh<4RZmlr6&>t?Od>}wadS355#*zH8vM1)&X@OHcOfrPDE0b#4B
zr>7OQO<tb^D1(BkX3*+((#k_-;-Rj4nqh2i?p?LAjS2M(ZaXj`)#{u&HY8@NggwTn
zwhJdCMh+rk^cD%HgZVa9v^r>epaUDlUqw@p8u*puPq@(7gPT^T+ecGQOJXqWx9UT!
z))};t^87{~VepKa;bWbalaFyMs6x|K0r5p~K`~HX)$8O?sX`5{PaW5X*d+oGStHhT
z27Idc036iz=`&CvBscM=6!tt#`E;#Sh{TLfZaV<l*f!o8U{2!>NVMe$!5x!4TSM_7
zT@^5?LuE(u^pkwVDitYkGIpmBFLREI(~Jkp4ROBV1}>ILysW+KcK33ux`7Ol0yHUv
zN?yPvKoffN*;tP=>JVtc#HO!SL6*ZZ9}n^A`GF6~Y-$)$5{B&fA4pAl*@sDr2EP<z
zYQ440^P@vmJ$NHi<+t@cK6rU@@+Qu4kuRN}lS8!P<5h=RYyHm(a%)Xb6OL8yb_PSO
z*RNgO)V7)GI(X^ES`U)!TqpS)nnSD$V!@3E)c&3;z4ycE6sx1iTh5_i^@HDYxx#wG
zPmg=iylQpCfE&kKg#Ij7cnT^>6`M;#B^Mc>j|6=WhJ<CNa6BdPjT|>SjVJka7bv|=
zuAY+J6GI8VzAOCquHt?FH8GsPF1df={*S6wP7YW0f7HMCe}2gIg2Wae_kRx8Z};#$
zp40!8#Xm&!-m?Oj;*#-_^z_gsO$g*(0F5um5Vs>B+2YC+V`pOPQ=fFTP8XL0n=FCj
zugh+`-F;7VBM5aHrhd56pa24~=fJin-go=IwK`W?+#8rwG3&)oupbZ)Y(ZOvFNr-`
zKHY{(jGaU#9&N^!TJ*fEcZO|1b=j_64aA}+3Z@6n5JCw-rZ6ox$ZKXqxKjeyM6BH;
z2}PiQad1vI_&69gZ&>Zs!70apt(jR);JIdKfaalM(Zj&S6)aL!jw=kEJN8|h2Goy{
zVcpB;W;nw9P_rgLNq)3xoW#aizxmJGR=>Fgwy*&@9uz<dJ7QB0xAR1T8ED;39biKT
z%+yq7Y{Mvm0WsGlguk3asdgU$WOoKpW4Lf3M2$OGpdjNxPS-`d#@e-6lHl9U_ihXN
zOTWx&1JG@9!kdP`Qh5bn!p-rv(}I#ryG}KdsJoO)x-+JAoVb9uzqcIIee}6c-wfW>
zv2t9G%W|`L;x-rrEOn(_7L~qD=_2nGh{o<<G6VPfM1}lRNK?kDwY8FvK9CWE17pO_
zkXki(vEnL~rv{7Bac|m)Px$#02&3iIfUugBf9g))kM78M3i;>Ef(Ojr`_0<02sh0S
z^>&esS|1KS;@uEzu8udgUJpvF;!596w{y|%)_+5o!AAjGuitbVO}y<lx}Ek%e)qnQ
z-|zeQB!%betHjUju5}6$`Ge3N+PG8vbHwATwDhFO4nE%CR{B=%h2U^+Tu2W57iC6r
z7^!eIRDmbCSDAjeh9Ep0irTVCAIeT>+qok4FOZ+lN!sApB}o5rPO4datN_l!XNi>}
zn3zDHyMTm-G{jORUy>&CC01>vkR4C*0I1%qrFGNzcp0_}ehq!sqD^ypxE|!|%G2x<
zqz>x_6mTR{T;YqwuKZcz=4PD|_kW>;lhRG&NJFlMn`gKY7L2hUK|q7lv+6}@>0+N1
z@v?xrA_gJZ*W2~}^1Jm8wP<Jrj4$}8Y*a1-07{DF7XaI2iD|0T<8|oPlD3IFytuG8
z*@wt~>P7=X@;xXy1ocLdsEmAdJ^5)CsvC@M3me;5k@Uo7zeSL%)Eun%_p>Q_iYmO)
zwxDhs3on)$xLGiJ2E$OF!w+5wuU>0&$?HkJVqz+aA86pAbBc5TJ<;!{NlFrRyix7^
zT8%l|Tb_zh>0jb}8Yd@nL~UCMojIsx;7N|%w>Tkr5!cIy1+o>#p5v1ISWnJ?3VW|!
zB~cuI6Am8NvM64DGm7FCipc)c=%7mkPkr5Zu2Avd0G<n(FD%?Gm-8kr-EBQ1!S6>r
z>_e;v#=ejY(gIAkwFlikuSmZ3qem*E8!6sNoD+n3%0F+r!)8Mq7+jf=<9utEqmWZ8
zG3(wiRad@`FRqXu!x$gyd7LHJ4V3@QwbH-hB@TN3iR-@y$0x@Jne(4j^+^4D{r5*)
zFGy?wa{c%CW$FchQ|0Bl7XZ}L)1zmd_y4P`2m_uB7l!WO!5uISwoJM3+<#Fc@X6!M
zGG+vMz@ugQgKpXS7~p{)>M<PbFlgtNTv3O5Ao5-~wqYLBhEW~J7p@mUw5_qHd&>+Y
zLn5K^h!P*t5AZC}qYl%f0Jo0a2g{^v``PsZwrecW3jH!Xa&uU>tzgMDCC;q^`IH}=
z!+v}To4qhX+({M{u?3|d9m9Q~9yJ-N@$v~?Bp*e#vWu`DuC2!-aP^B(7P@h-PibP5
z<Ou6AOY5Ucrj&hPYhUh!FF2&>;t?;g>|YDPN<9CJ{UGGl_E5MDk1oLI$ZM0|{KHsI
zozPbxIln1Ncc@ep(JT2v2zfnY-~TXd%U>us)5UG_H^t~Rn#2n<6+y)fJHiHf)J=Xm
zEyUf{q{s!}tq%e@Befg09DUUs4x1l_`BAGgY!5!(Ty)!*;XBP{BmRYLjaL7zz^RQv
zrA@mI)3G=juG@P>0ySR=bR4)Y`vq1X{Zvr6f^S??)v@l+<1tTm!V|r~Ur+<j&zfl5
zbiN3d1#C(pm6A)6<Ab}}CQ=lW!h|90Kr9S{q%A0>!1eJ&uj?&~5*ON3au6IoMf)0T
z?A$~WTTIy`NgUFjL{(%jpy2s={y@5f?7f>0+=Vs{E!zatg)$CO1{nNSY&|*&Xu$j$
zLtNg6sXBa%xW*Stim{v*xWED?0U@wd`b-@RGDV1f`2Dr?nfEU8ZeRJni7<MMYIxSw
zok(o8n^L1Ss9m(1rNMQr-)t0=HQc65AUd7<Eo`oEDJ*b8VhhEgVtYZl+1QktB}bUP
zlyx?i!4(}M7Kfel;OT6a3PdQVC`5?>r6F<V3sESPxFoIO*n>izCRBFi^s>Y60p=rT
zTH>ds*O0zKGmE*V>+D5b$smpdvv)Jd=_z>)%*gE-k{n7N(9Y5yc{?~i63<c>gcvCI
zdFW+!&-H0hpYzMSH8MMdf~i6X9=TT0dlGLlV^X;oAfkHeJUVs|@g|sI34n7Z5q;G{
zQcnEs0lwj4$_UO#_QP@P`>~0!d6P&)A{a!Z;e)y!=(al*vO8mAl}c{_Czv+ifFXAC
zP=x5nU$zqlBnJzSGos8POiv&_$)2M0QKoa3osxG$5091ucMMB4#TGlWJf;*6c7;yF
zn7{M`I^Xj_*TTd8bh-};q{BijMq*Jj{73ZB?MHpdR8N}D6cXKx%>AjgS=bIJeG6?-
z^J*AMWF;5h8(;=Qs!YEJEQPVN^-<nuM1gs6wtNB=92g4Je>OyifbBS=w{l<5*?S{c
zTReJ}JS)yHp_DoCFb1R7=jZL13y4UplLbf-!J=gHq1?rFYN71{cO_P}QF4#Vt(Yc(
zW)I3kmMqaDT@<|KdDNy4SkPg`>F9Hc>$eW3Djv%jF05Vf4G5T`aIZ_fewwHX5?lB+
zZyI960esZJ^$6THw<fqcm>=z`SS7$8e5RjC(XVTZv%|X9M5e@MzS2NFZvg=-$d8)+
zez$)Ha)981@AOz66oI-V5+su5WCs_H_<u3oE98${+q^4`?zYg$LBw~wY2Iknt~%X8
zGe44N4G{L0+fka7D4E2<i3zvx<R;`>gXOw3xuf0c8ZonHsbseiU`=*;hG=~X;n#eQ
zY<J{w$oyy;Xfp6>7;%NDHW`Ol3zTOtQs}iiR)1=P+Y78gp&wglMZMe=qIYufSs_D#
z(3<9llZo|71F^yv^xS4>Blf{j0ScD9wN|G!#8t91UD(FtD^GI7M?G$|URMx2xGSKG
zMZ9MvQ^a?XVMxYE21$}{frSsoCS4v(XZ{^pKFn`@W@h+K_XT^en;pQ>F1n46N|rPZ
z)ay5UP`2UsW$S}HMUsW;_iDrIc*KD_r?{H$%fg5-0zB~m%;cd6IY2n0Pw~ARRxis|
zd6=hVQhvCJl1Emsn=YS8i#{w$^F)I&i+2(h!r$!9?c&LsPJ58Uy+4p(E_$6if@RR3
z3B*I2<Us7W>iPTbF5F?=hNsVk!=RxUh=60}pgG*b5SYKFkRuq>Iv3!=Fo3L0sAAzf
z;K98IaiH$%-Of9~M8;nPnnYm(+1v1}MIgk1-pZFLSe)kR9fP?)qc)#X3ncm!+99ol
zfsb={-C2@7Yr<z(fEDMj!J`XGu|rlWo{4@X(qg1WlxEC^VD~k6qwaMV&s=dX=%<Cw
zvM_taZw{p+cp(sOi#aG*Q?K8B*J?Dy!6J!fz}}!+Y33CkzTlTQ%=PA+RFxy1v?1vU
z45n*@{0+b&S`$ykR-ioTZ<{=BjVzdVtnmV@CUDx#-X<%q^9hF?!D4y64pNDis1zPu
zn1A2Y>fOPI2s;gkFzprBy}_rPkmm%Gi`!Pa0b|tLw~b~49U8|wcU;zrgRF03{K_YI
zJ52oObs-*|OKNK-BnASt4_jDs!ugo8BZADfbto007nH@;MvkC+p?&)V--~6W?B~d)
z{6uoNw-jjl!qUVr=LbaWCCPp=@vQ@{M!+jgDoJjEYzPbI7&(lGY}@YVG_tQehHS)x
z%J~*l2%nQuhKlx)7p0(oA_9iXmhte#Tngocx$~^p$jAdkm<vS-50(?tB8}rY=EaQj
zW^lz%9kx1G`H?)}8qK+)39HZC0;r?rT_NsX>tAW_Tf^)8NOmbjMNG6^I3h4vK_@C@
zf#i$u>lYR!5g5u6=p5T;TEL2#$pT+PlKk)DI1v4x3GTRsv@H6~!EJj8Rl&Ay+=Ua!
zvuJZ$yXT^6N$PtmbRv&MR&W<@$nzyZP@3sdzV-%&Vd09ZlUPDT!;`a0LN3!Ln8L;X
zc>=x^kXp0w6HD8|oH6I)d-`~O6CUBeq>{xo!TIS}H}3IAmXe(aI{Fu1(!NB%QpiDq
zaee_1z9)qc8g^s<FwFVhjyy1_rRu!FZLinu4<StUo9|k9!gog=oqP%~KiB`|dIge~
zH|Kb|>@EDAk&;@F?}+g^+P_0Lp!p&z^l+I5DZ!&ly65RjGOCh&l7Di*N&z#aT7VR-
z-n~j;9u;{JxfgH5r_Xk*7fS>%v7ROF>N;^liGZ)P{a<@;+R(<4Eey}smtRpMlprx$
z5SwE=cm{)PbAy44aN=C-bQ-AvjU}~4Eg4AS=eNISskOUW5_m}_q3<0>bXT3)PMtb+
z*3^WHf54bD^)3|(6@mX-DNpO77nI#e{o7|3?Vuz}`beXlL;h_u(Y&BZ=3|bDG#5Bs
zu;M34@#f`|`EgFWK#oN)=mq`cB7j?B&;~y2vHfuwzp{cNIO~$gH+h_gu_Po3ny=v=
z(85*#!&0zujXV&wH`SbQR}`)ny;zo>E!RF*O&~UoOT&Fp2vdH%AZ>P*g@sGyVh*yv
zh-UOQ+naK#Kc{@F$U_^n1uERK${;Q%>lS`K{q03PpX@Scx;hW9t@owPXIo$1meYN7
zTg6Ty`!7*Wa-|i+pwd@hYVmgpRM>9EBgEVu9ALXBDyI|3duK*&1Vt97G|o(~&Z2h6
zr&p*hY^ZZ9RC`pufG3sRA>F+coalWtz(rOQN+&ROEV_pC*Ph;Ky)3)s<{)^MJVxVY
z4qj!8qFg0`b2`{LI-<S+v!Z?$9GIR0q9_-~EvZ1l7_l_|$1Pxe5JfqeZV8;vgZPR<
zZ742Op$tuD!kD9Y9M*;*kK;pUIpaB`ehy;)Wyn1OV^}&;#6n@Gpt%Zm(LnoMqTqB*
z?*w758z!P;e=UE4^TCA<<o7e55Z*K5cReM1=fo_sPxnI4VKG-dIx+6F4G8;_eDuG?
z(L*;?-|0gk7C)e`J$<VV1npp={DsVsgimIhQ_)nR={s|-y?MVozrgOy*`L4j4)yO*
z=#&z171a5XkAcD#i9z`jQ{!Yxo%!fMre11?TbD3=tV1?^Fnf<s`>3^vhkb35BByX5
z!XCPA+(-kEF`7i!f+L%^D3N^*DWoe7B;=I3W4Pr@c{$1XIo_7CDCiDSTKfTkcEH$T
z1k)?i6~o$)Ab2wDgku&kIAGLX7oxOtUXum^tOOrT(9)1?dFn62cM+;kYu!Q3%+kkk
z<c1-4!$JM_8$kUya+?R59z}r*#iQ+=@3x;ei99Ql&Cz5)9vio<hx)R_ce$7$VZ4dV
zili?0xIo7gpjTUsph{?rCVPAVA&+Kr8?X;8OGd3<op@eK4m2w<m`~<ui`}M=)GK&1
z15L@skSTS{IV>v<x8gG`5u*S-Qpo9%fZ7#v1daA$Xv$(}K}N!ukuCa1$o7b%cW47j
zY9VDfbU_A}<0vc1Q&n@67IsIynhU#trp;Q>y9SrJx0N@=Uu_Gd4`hK<!LMa)aCZ7O
zPjP(uHZ*4f{W^JZ+}z$Zbk;f*K10hVR@*1O){(;h9JMcF)Ups0RS>@kocSuo>#Pg7
zpduq!7xg9i>L*dxzeN##|D3^ro$Zsur~d=T>sAISX5qg?4x6+9t@|_>C8OZlXipT$
zV3O%L+VPli;eV8vMU91+Q%f7i=cChy-)-0^s6j)gQ7D6kkfk`=A9W^Vz9%(}wd@Ws
z+)QS4KD4!&nY;>e3Jux3^Ss<`R;*y{%>%SRC9S9vp*`!91hY3t*jx=wB~&QbKJb)e
z$SZZ0=(e#0#25;`j|9e=oWN&<YHP4+l5w(*FR5`;`ZJm%o}pYNnZ#gL>1Gv35~35&
zeyV2A*U*U7V`_)!xNhwj1%DWZRu1LXtC-#!pNfA;Z2;s~$*6Fvpsa<|;ji$~VIr*Z
zN+E0EtX0%1XjzEbR@{XJt7dw2bafTdf1XwPL(g;uePpb0a^5Es1|<(Hr|alhk+j1t
zfs#v(>v3}U{q}L`R9#R=?;_bTUBw(c#OnaBhpf&OhE_)NT-carU2;5Ox~MJjF)}kb
z*RTa<S04oF+z#5b(IFUCPKT5}*)sD^T|RtQqMEJUcG}(DnY-mq`=i=cQ%E7HB5h0r
zG_Q?OCCQ>cuG{VkSegwxhOvdtv-x3pRirze|2C)ex)dB8Sb0Bxr-4DKC4j%Ah3pBg
zvNQuH!>dVm92r$bSIWuFuF`jv>=nnHH=aWBK4a~P8LX&1&3IiD$d|tlM_tr#CrZVw
z!*?q~rkbKBFx@TKH2zlPQkr5urZ-bavpkBwnQIT(7Hqj2NuJO;*z>rz<#`Vz;$pmY
zi?-E0JGb54?UU`@z2k%Jm(4BmP)QBh`hKfH&un<_pr!do$v&D^&BssM==0_Qtl<`1
zliJd(!nDcXKJ_3^_F){Yt<)y+VOt@SHpi-8cvCDPeZxP>>624W8W*;Q&?GM;?E$6S
zRwOY@CZiGFiLukllkcjVTv{8SxKz9i9Uh{o?6YTkuccAzR^D~W(=9)Ql;PjUPB%7W
zMBGY;<#q(Wn-(=$F=mbyh4GRW1I{KA*4q>Rdm{hrsLyVKj`6dI2Cx=UV!S)G6`$%4
z(*N$Di}C%tzo5@de?72lu?;NgRDhp>$sUaZI_XZ~u-pbNg17<&e2Y4n4+sslO^>~f
zjnYcn@@FjPx;s$WobF+R%4*u_V!;?R78`}x{gJWKVJ!0Ck+w6_`X%eg0Z)T2jYaR&
zN~*4G&GG-H_>HTL-!=c=W@9ZC|FyCCVDsMp|4TfJ!eD^T|2H$;-#U9Mljr}+jDWCz
zs&s!c?yK!dzoXpRE81*&wbsCv2GLbCq8O`_9h_v0)H*#^;6*QZ4%B>Sm9G=ppxv<n
zQR0Rx_6AT#QmQv>Uf(dSn{0Ps8yP$l%Sd5uuo_s&@SwfsbD)c;cY@<((tdYi%V8`%
z>v<H8@eq-UR-<QyF&u9n|A+|)C}~B&!{RXSt1?<Uy^$f_rHLcv;V@;Nh*dIN#~#q&
za1So1uyQ6T2DkfahpR2f3RE~1g3ca?cNW}`PkDuOZbE=a|4p;)Y7zOp{0j~iFF52G
z-Y)!3;dFTSe^&B8lm4#*u}{<g`}}`j=27(DBL8dm<o{#I|B5F6bI|;;r1>9D@>g}U
zQ;GdlQm+Z^r=$6J5~Y*k7-~I(zRyXz=OEnkl5K}-`-%4NO0qxc!=_@NmHf}3|EsGj
z57PO+8ygSS?&<%Rcov1i07d>A4{x9T`@vr-5ZHW4zrBv9RtAMH@9dqm_)i<(W0#fn
zJ$pM#^LzYbA!~QPkZ;K@4ehb{oN2KpgM@7y?j&L50(VdP^Hf-Az#p{HJC!IMww~1+
zG8Yv)VPhy@T4oYBQX0=5hL=G(B+0e#sL=qlvZd^q>z(a`!-Kt@?fu}zVe8~=nOdOS
zkXBgEDEaI&JcmQ`g7M!iDtNdbw59%8bdG-9uv^e8S1}OhajzF&;a?O6gmQ@4E)i00
zi`0*z)EN6bXM|*d&w;1VTbmR|5)$TdWp7W|Z&g*R%97iP0N@y}PTPN=Wg$jvAukm*
zD91vWqx(<@rSq`ctMEE=ObcJhWYTU&xNn6B`%_&V=F)BA#F|teY3B^a`-)0yPg-34
zj`)i7hpoaOu2AsvZpXyoQEr-Qz6w@dcqgk4v>L->K|RH8+Od{4sWHquJ{0U+7LM)j
zDev!KEZP`_o&UgC>}dE)cE7?r^tIIPR1RM4@2CFplnf}CH<T|sp_(%jN*rI>)*)TU
z*sWVS4uu6C@06(q>v@LiQw`MbFx44D>sw9tZ6<vBl<P@12#0f?{_0&4J(c!kTWX|~
z6-;*B(#tk2B~I?9qfpDqTVw30nGe!DbFdBQz}e)2B3*3ny~YHN75cGRYt(8F@Gs7_
z-e}Ysjfw@R75Bmsz`}@)Gcij$*ruk`ql24)hT5#tKUzf;IEitnzOnxSjB#m6EYTlJ
zk3}ceP5Sc$&BE>!ersH|Q63H2@SXO>;1i6J0h-i&)=N=zd!4=t`nCvd5<ANag~6{c
z^Mzflvs_<X??>Vp93G?sQ-NBMU4*_)FfTpw36#{EPLCuxpY*snc4$aAgQdy=V76y4
z8J~X>jN{;&Z#Et_oXsjqg}v4xzOOdWJ>u2Lv+6f$^HLUrbZwwrB?-D*sy51MYnj9Y
zG617JdE{c!9SkR9PNVT=ZGH94>I(dCW4-Vgr=<Dn_)xU=o*&q$l&IR-<ovX;^48FZ
z4B%yeJRae=umw{v>HZQ0h+k(nfabmE9M=HWzK7$cvKHlGNWcy-C}=eU2tGQH;4SdT
zB`8|Xl*Kia6P=wzug8jhzNX<+@V~mb88x`u75bs;Se@eh7zqUiusuDjJRVkILw>Ve
z*FZ6y!3PgI8v=9-jAobyt!H9%n6$gy`A~XueKUp7smh-QqgOZA3XlJcnCs5g9}sm{
z^HJCB`%K)mPgus@r<3z@V1P03B3!F;(UHJoJGfWU*vK>$FcHwQD)G`qNVobYqOdFL
z7CzcJjSwwYvCyy3IJ_vYTw{VW^?Q5QPGa_PDBJiLEN#q0O=sSIH_XKK;ttYsp~6rO
zvx>tMPecRX5jA*ArS(kv5qdozp`8(@@EIlCD}>X?Oal7C1y07PMkWk{0h67RicQ|e
zJM&24bb2pX{3UONqd4i3!Mb#x<aoPS785T4Ia#^e_P}?zJGx0s<-W|`7+t`&?stLB
zezUf@nLtmTzFB*)e%8h-e0&Ma-}dAp8uY_AYikdDgni?`p0NM^y9Y)*E@QWz<k9wT
z?zj~cb3PNR4=Da2nqUDw5OdvpwNw3{BNY7*;TFobQ)VvcC@jYTAo$UZ6zGjQXp$x{
z9<F9wOvlrQ0XI{iU`-B6%UTlj-tpe+ieQ0a2J+Wm=Kzl;?KxoMaW_BAy{9j$^TFjw
zo(WlP{5+rxHJxhCO`NrmcC^m9ZnG**I3+n$VDU0e#zCCuIDz^JyVscV=yEu@#)L+G
zxP^;JL>cFSw=D=O{S-Y=&jvUP1UW9bFer<a*&8{c35J9M3QW)hXU!-I-zlj8hOFkF
zx#ADmf}D{&=z4;d2Qf{EC1rtjvw}b~7McjR1`Jkxm%$OW<IEhO7o^O=5!cL+)i|CK
zEHibyBrGS1n|LA}3NEGG-}aKAp!#EzcgoinyT9Jv%;5)P1qSjt!APmEHF45Y!Z?t2
zx*d%5)59YgZFt2bQKryrA8-|MNPl+VC|Xi~89u0sN`96lSrY2B(3;UmHOq$HMxn5!
zX2`W0*8NW#4$BWH(Z)W=Wzpeob-Y*7;83b+k}GXHQCv6ID<**XI3`FOx%Da>4KTVG
z%)&d4RbG&<9$AWwN8)GI;u1w;=jaxg+l93jGDy4h66q8yH6jZ0MqM-^P&y0gTyhoO
zh@}t?u{P!m!ICP;Le$~p0#&g$Hl8OWh{DlgoP^1Bx7S6R3Jz>=MOq~azfN&hP*y1C
zM1{9MR4LSjYEzp}iv&Z`55pvp(WOvdNquDK+%kue&Grk^iNKN&ouN>U9o{PLqJ*sd
zpf^_h-rU~Fo<zu(^)VW7LB=+p3@oE>$$1tV1qny3r)v$~lf+APfVMdlkQOm$rVqm@
zog${F80)7_|1D`c2l2)z+)BoGYO=XQQ!6Xa4_*Q4S{_$<u>9bh8u^9G7&AOGG^2x)
z`pb0evs((aUDBjgNPrXVUdZ_|3|V3c`1jlUC3*G&qXb-;t6<`ihcA!z_M4weS20&W
z9K0k+i=R>uv`%(+f`G1U`sK^k4jQMsFAcErg5u$skv7+yie%W4`3DBPqWJD*n`zc%
zkS(?grPySSn`1XsqPJ<Gb4DxURhC#w5`?3R##W&)Pa%?Yn*c7EV#-}s<WEV_5Bn2N
zmFi!%cQQ=DY4L658^$ca3wk1!;Q#FS1tn20sR#wBL)T1nc2s6RWKvvOmqSi#>79`b
z7ZN5i`?OSdTbmC_qGC$eDTGQY*Gy7R_mUVB&?MvT7;R1L8>)=`aWR;{X426zI%X^J
zaqkc~uKyx14m7H}wkd$Gpk`j3FbMuh$OJL5x~<Srebg!^#em&s|NN6Y-NCrieZTU1
z`v0tNY-I9(uB@%z+y8xuXHggo(D^^-GypWVe{<S`|Ah<yITyt4-uEktO>`~Gko^jF
zc2p9W8Fpt_Xd&M$9P@FZj1|_AqWGcI`IiVT7Nf9>iLqLH&z~JN<uSr33!n<RL!RAW
zxghCYoDU<(Y)ev~UvA42-kj@95%a)JCr(ht(+S}oGC19=K74Ea*?>P!SMZ%JoLm%#
zCLssfS*%)qRsWu#urWy{{mA4~31vnuHqdiG=_J}UnSbGmqN&8nBu=It4LKi7MKr|D
zC`>NJafFtG4yaC-l9fTnJMopgNe$znm<;U@UG{9Whm(xdt9!b(zOnh>?Khh+57*yp
z2Ak_{Xuzq9Fin&tg*@uf-{`$Bf_#c=_=V$(<TRb;9A=x2v<_b#!@X?g{Q}?*LW<kD
zAax5UL|EWv1L$|B2WXC>Y+z6?$_u};*tvO)@&Vk~6h(3c2f{dCv0hWyAiU|uv}t5p
zQfL}P2%`iqQSZT(;S%s+VF4SvW)&I!ykXlC{P_$2XAlk^b1{y6$=zb`qNMuajsZYJ
zzfs`K7kBt?iSV{?-D`{Lf5;fKpdxUT#Z5N?6q7Ik<jL{&5qF(@EtFpcT%MAPu6><?
zR{*?B?ic!%1W<OniLX5Ul=mR$?tXVLxvsa4wvTtXLy6U+z5RXDA-g}raMZ?opWT5V
z=pih4?REix<o5uI{sNPKE$ZS15gO(lFVyN!Ucgmaw2Y*B%06-(N2Zq@#BNb%w=Rn3
zxFf|`h&LRWX?5r5RV|lX&POKTy44$AhDa<u6a#+rH@|s@_o}srE6ZsDatjiY7O0E6
z0vp6>STpDjK6bny{kNQ&DWphe9D)&)Sz5K#FbRVA#fqI4$a`(%qdGX=-fJ~mfjTeY
z0!aXr7|O`3XPvlaUjU#Q%U6GIR?quj+?P&w^!xh%uWqFLe^wi-_x?X$<RSiFVu0fR
zS6%);hx_M@<q!W-o<AL(&{&N^rb}0GvWBDh-%)#vOem&|S9W+NPZEqL8ZD@7f%z%x
zh2>(Z+&kTp1VojlWU|y`GDe>Vbg7Ub!cdW}!|>Rit9IIKrEUu;_zk@}>P1L>q5F{u
z5)-z^laTWjDm9BYQx{6f-UEBhnU|#zO#WEZI5<)?^Wn+ZYGJ{S7_9;anO5u;{E&4j
z;2T<$Wf<1763z{|B*!l2Tinrc6YgWEu-I5ts<D%(*JG_sD*Y=faX7mpJ8{Sa@=i#$
z+$b%nT&Q36q@X~xpV$3!mjCC2jkT4u|L6MZgM0e_B_5{#Ht~1eKOg$2f8*i9jeEL(
zPxt?1bf0uN6Tp&D@<^(?U-d>fxx1ri2uLTs?eLF(wQnv4lcd&;`%fxrJFKiIWxFjE
z6yILbfB)6)b(3KYkBC}4x_DC2F4PaxN6zMoI&yZ%CzBm{V0DLSpJC2+Fh(E8Gkw%B
z+DF&zXvhnn9}iEIaNdV8?4`5bjgV!^6&(h!B1fbjUmU?oPGHT{ndh8yxiV1<#JIh`
zpCcHhA}_xK5W&&3BDa#Px`j+Ujw$euw-3+)!B@Q(U`Cmzd;5DQKjy%<W+K=*JZ|Q+
zbn@d-GuS^oc+USotsHn%@Q0lj+sDE5A^;+%L=O!dUNpCNo5$D?7H<VFGM?oM5)^s4
z{Tg9q3mhH8*Jr`eVawy1Zbi8AcjI+y@Bh3L0^gqP;KUsU?2tQUZaK(#4iw<In#TuF
zaDVT>-x6X#uzhlJy!Z6gNmGm8$>+}^s2HWOAHIv05>c&26!)^4z~L~!0JXiy%8^{;
zuK|Az=&Kf8kmQ28E%mr)67dvf@8m}*xex-40Q1UN;*J?*j0D7vl$j}Qyqi(YKnq?v
z9gatEZk`8YZQ6NinfcjYPw_m>hC>dScg8%ZigZbPQ}_$$*LZ}P0MIS{3eK+>B`hO2
zpH<*c3J#zX>Pe@;uGYgVMB^?qBDYGXCRz;~kR7PSKS=N_lxw0}7s%BP)C`j$d>x;Q
z^DFsd5M7bw6doMoXz(7RAIty9_Z$a58ORC%e}Km3SM5aphyLuJjmGg+8~%p>_Roy(
z{wtaLIM5KZ6(lE5Kd0yii8N0@L8>-+8;FBw{Is<TB_y<NqUEh28j)S0`532*!U>m6
zJVr$b`r@1T_1J}82uJQng+$<q*=_FZ!^G&`Rj{LSau6vnE2Jad@5Z&uC)wdG2f)e2
zZFG`Q<4g1a$Lge3V^o>tOP=`AeOBS9VJZ&qEJ8HWlLV)|bd-~z;8I6EM`Nx&iu%A!
z*yYfou_7qien@ejiLE;84&Y;i?jGHqn&sH8gkWJ3;q-UkZ+a&Z*qXMUidhp#bfjpd
z8|Qfs;Oy>RyFyShxh3i=NwLa{P9!4xbw&7zL#AZfXS=OCqc%&{!i|7zw^T<KECX8i
z)5=1|Zq+G}-?+lZoW@%RxsB^jd5x<A`HgF$kkk4>^N0OIU^kkc=FPXf_H~K;4qQzg
z{13Tf|6#_^f6yaeAR9;2<Lw<hI|PPhx7li*ERZr_e<yg^Y_+zZH(P3(?~s~R+D-wr
zgS~h~?ETKo#TD!^Hlj*~Q5&zDD#9`)>jH8wce#YssIfNp$|Us)1qBW7IA+y-QU#Aj
zs9?Yy7+p)1t>j*fIj=letf0$yl1FfxxRJH2h|DS&%IfTH&<I225v5)x-98*};UJ19
zN$;j&I>d}S?{peI&Br-XmmomOg@2biJ-G2=pUUcfG-7k;tH^*#k6j*(bZeV2Y$#*k
zWJV8N342K#sOyqDwwi;Gioc;b$>L(JT>xPRYPQ;h9Ltz<F1U)LwN)6q?Y2O)%l>9O
z9?~8SZYhP{KO8pKR(JRJw~E$x2klh}b7CE4(U;H-FaOA_yvM{>eoR(^fR2hwq=Ex>
z2WV@++e7B4aWDx{0Go@hqxOX271?}bdIt07&z?N{wVF3MYcyyxC)o*cC{K}IWtLZ8
zRhcc;$#_V7pn@ccAIMq)jrcjy3L$=?vnNPq6YihT^4`Jjag$>1ppC^yh85ui4eX{c
zMj6n+Bt?~0AHeUC3BMr^g=()|fH_wFnP`Sj`7;)D0zryYkA@}jxJHYPRsutyVYpPt
zgN{|UAap*^!W3O|NRlcBR~^Jv6!tJn0xOK3D+HBXwJPE=zCv=tVT-D$?T4KeOJRlt
zsaQDPc+0h3$dd(S@xqZ%kNWc7PP?8)j)br`1}+G*ilCf~*C7+sNp&2zHw=s1HWJ+*
z5~%@?C0#G*^^jp!oIqR1VRFo;M92aG_oGx6-(HT#!$<XcCvF4xje?JUJsQ*--#px`
z%fj$}-0wY^g5J^}j679#wh9GdUv-3jPb=(aVz`Le(#H`waS#(pa(muwh7l!+9!2m1
zzD%az+I|r{Jv=!%d|5iR(yL-*vH(j3W08H}qRHR9HRLOA4gNNzT3|b9q^jB9yddy<
zUSIK>w-Wx7R|)^|R$|uHUx~kYtBru}0jYc+<xQ(8Fmr-U*;!C-HR(3kJWz8jL|*@V
zV5ct5Z2-+!u=(dKwTKrzNdvkAOoJs<da1y9oh@!=19u^{rE0pLa;nll{;K*@PE|Q#
zS=p&-eaflaffI2Q-^kidW&2aM_UOut%O%+M0CG!B2dF1PKR$p{J2vXjf6`q`!SR)v
z1v1?^Kgg+_yBf{YIbW$+AZK*WDwPXKBF&7>`AW?KIiqt^u~n8)NSW$g3X-?fOqi+e
z<-pA8UY5>H+ZMA*&)2||ZIV-ZCS32*=fa%}1w2*e?)Wr>@X_&ntestY-X?OfIJfjn
z$g{9|j?#0tk%#5^rL&;pK|9Kw2mLXp9-3G7qU<O=A9En&Epqnbf}Q!uQbbZX8@w3s
zjU-PCsWhmac30|eYi;=ovt3q)y~zkoz16$xVK43wbFRxl_d8NKt6oV^N4nlcKi0o5
z!{oB6g!;~3s(P=nGC1#b6Vn&WZ#S5b4a8*)t+%D#l<r+xjz2j+FRKc1*uguzZWUkj
zlZ$p}0VRnb$=a=VrW-u=DvTNWY5n1TuiePBQ2J_k!GLQSKNDA*=vA)nOi_3#T_dXA
z=FktePIgg|nAHx#Z`7Uy+xsZB%xQ^AynMOs)!$lfGr7H>uD&uF$UG>l!#q0P%K-&_
z{LXf*$;5We^_AvOljm{Ft_WdS{3=4R1<W+527u9p)r4&zN?}DbR?3f6B$W^YuQXP~
zKgEi8BpQ#!2gfJfn62BoH4?|7hW%vkAZWfmYVPD^9M!pzX^WEBWyF>z6g4Nwbg+g_
z?vAogYtF*a#V>%JFh11Sp#qJpZ}7)t06VCI3bdP~J`6`;KSzg#8jh<DZrbRg%m1D5
zf90R}S3l|x+rt~tpA7opQ0dUd^bWQ!N(S2fA^z-4=s)9l(i7u^V{OBYLMq>|!$CWq
zz=ALgdcg#sdw#=z4$zJy2+mn&hxdCcKDvsgxT?%&66_;`N5T~JP$`5WzP(;=(vK6Z
zj>PaKN@g<_14$)OUi2R8j%{J7Exb3q_l3JnO{LwDlsN2OwdShU&ZGETPenzX!|Ww<
ztJ+jR2Q|55$tg*48wG*Ji<^R2+23z!PUw!aZh|RrT<M!CinuF_DDi(=Xoa;K0))cK
z=y>Q<r@C5uKnL<y@}Lig-P#b7zS^a*zk~oXzq~rZ@l+kd|InT4>JqJ2CvD8asXAA#
ziKmk>%i(A-WM~%|)+LE>-;eDKnE+T@K^W-OKAh?#G#^e>_eu3XK~unioJ%7;uZe^B
zO2+#iM)8nL?M4wakia0QmzLT>w@mSaLUA^V-=Px~3P}q}{E0E<fxBUoFSU%+K8A;v
zkg!2aDU9ZQFoohojWisHXf%pP6}cA@@pP|scz{z;cvLVt`9Z9PXC-qU!x0hpIu45B
zVbWsL3xb5SoR-Rww37>-E@OM#0r_|zjoJamzL%+sotQ*qJBikh(4{Mm>Q6(L3J5K4
zcLR?o^#tsG)fwAg=i6^9Po8Lxoe<T}@r4TSvh}m+Dd2!kgY@L<h6?vEz;F*g)t1pv
z?<vBsEsHlLcKCc#!~fRcN4d6KtiNg0hcYGvE4@>#8RgN^QaRI=!uy)|XYHT=tcbI)
z1JjnCEv-&kt(`uQE~uw#@T0a|p6;QPX(`>YiiqE(TO7o;{%Q^oQ+uu5I@1xVQed)S
zvWhmu%weNfZ|l*53h$uIen}<yd_Q<~@T%3^C1JT^9TgnCI&NAKj1mqqOm>?T^a8VF
z^kKpK>uiT|9`<^ebXS}9NZVQ1M0k{Pz^Ug{wU$nkWf^60v>S?>F;IasPT%evzI=Ij
zAUUJ$7i814eX{qG>O+ZeEX{+FNv<!ea97l^emHuEG>(*3Y~BmSL)bwb)~o86ATn!i
zpA4dT;|paCToY_1d>QqIl+*&w$w@oXfs-m2difGt)WMja@9c=`50e2_uM$6n+AZx(
zNioyS5-cp@#8J*InOtj4<xS)_R*FS@VP#l+P=?A%L2NB*VCDr1mH-rYCJ4${gUE}o
zB7U=TbuCapR1_-XIRv0ISc={ib~?-pT(sM;{~m5;hv=eJdZ;k2IY;_%Gd<K4!e)oe
zUCtYDsyYl5*w*n4_1~R@x8?F5)!EPUAoD`5`PZM%3uIROj|b}+|G!Omb?^W21s?YQ
z&={ao0M8i$Wc}U^<lYVBPv{0>$vc&O4_kR8>LL}Jz$7&*a%Lhd19Xb|>XX(<`*f24
z%~;QDAMN3m9L2~r5K=kuPt;W+oeF2?*%2A>;!P*PZMr=iesBA(Tc)G)l+8(FV<)Dm
z{?Myb&yia}6Bqh(Cmuy+)5<zIX_KZ!B0RM&=Pt~;(|NqJyAc^qa|c(V97uwaAUW|N
z=9(HeOvHRuOukV$ZT7qtT*In)0M3lF3pJ0M&zi^0gPmq;=kVyq?W3dbxA$K){jqnI
zxX=l}tFcYnp6B;RZXkDsghmM~T<>jgd@Ucx_elhXeb||dphM(t;7pyT#D4=$bGN<d
zoEcFmm8EOO1Wd!+Y~efOYzEXE*vhueh^RZSjsa^=J`zu}eV89Z(`0+=Zo3mND0iBj
zO#6koa4}`NorW?q@(66he)t)Ae|%=}|ErDlwY2~DgN^(6e_!Mw{+}`6*5Uuqd3A$R
z!T-er|8aPTWUQ@`Etj=R>G-z96CI3~$Oo=MOgqPeM`x=(DxEoUI_kYe2t4qx7q%&2
zxe+tN8@5Vyxk}e5Gphie+rM*~o;RE9RF24;!tKDk(~8WTSk%)GOE*#+dG0;Qi5_<@
zy?JDJgCF)zUMK~zTLn5tRZM(p&QG8xB(JVfgFeXyhEAW^Y6>W9T(#kb!jhWczh8R~
zaWjA3W83<S2et1wHbrKqWzhICPiBS`{^HSUrW7}pJxTgt{Vx)Q{Usl@X2Ip}CjV<Z
zc(9(4|7|qx&;Kv+ED8q$6c5l?@rQk(V80~qlkva)dME!;IO&Pz#YHq4!|O$*LYj7v
zAT712BgU#s#z_UU-%1OTb`L|%Qcu4{vl>;jA`{4y!3E5KBEl{MkaN0gKEQW!%NFSD
z?%~OCiDrMJz~IBDJi@IZ<s7T|=cyjF=)##+(tnomaMcHDH+`V`2bDfob4q!RSAWU;
zQ`U+vISn~-PhTI#%*GcrvK+KYNAOo|REMMP=Q;sq-T&4y`k%GN>b?Hwi#&$@OAJsa
zz=L^if$Bt9{Y#$+*&y&%_`o%^rO>Cu(eWONXO0hB!PDcz@0tfW8(nT+)+pdyK*ePM
zBV86@goAh>t(!T>ZK4bhx{1s<%3(n;wDfvy4W+6XMTD`CH7A8@1!|oW4l!gK#<_^0
zH)6ds8CRyI(1q)R1MQGGilil%A&WW$Ft-G_8l;QpGh<5nqg$r4w{Lx%>Iiz;SzBG;
zbU8y9FTe1m3-acu&yP%<9#|&WbbiSj=^ssPdQ#-&)|`^M&pN#_NPC+j%fVzcD<M57
zqO)9X6~QOdiW{^d``Ht@BHPnHZsg@Z#?x!}qa+D0qR%J-o^}3jWaB@tuioGPzR0sE
zYz(;V;lE)H|MiqK*lQHBpbb?2T)e=&VaQ*_FyyZBK}l4=8gRt}S+SF_%LW%vvf5J$
z;WXQ3)tYj@cS<SN0r<pJb<Gfcgf6?6r@EFGbGt>4#5>g~uh=_XCQtUADmPOAo|>gR
z8TiN=B=2s;&sYHdOC{cDpxx{IuKM2xtp9zmzP7gVU}JL)^}m~|oA>Acmv|P1#sIDV
z^`G^dc)+ijqz`|UD}HMNccsag_B$LrGIkQom(`A?s!c>v50>{&f}`z|7j>eoPl<%q
z=?qKiy>U<v+r6N!y{QOJJMQ&3m5fSBE}O9>4f1VuwYFXpt!T_weHE~cY6fud1U>Rt
zxMAO@LF@!#Ha!aVchPVjkCF5lB3&~uMLK$j758^BgczNpJ#?Tu#Sw5)(F@rkf>{)M
zOC2!^>3l<9H{%V29)GO!4u``KO<;OA?B>NlrJGvVCim;=``Q9YFn)%n;V*V3`nKMQ
z-q#0{Uhil00zz*h^xs)tqA7d&Y<G!L7G?V;{iGg0UdSszf#Tphy4U~(w`Ovym@Tdy
zWae3w{oVZemvf&Rzj~g$fbf3%_&LdxfkPNfs<ak-gtvkh&HbaGb#hEzUeziNtm+h^
zf>s*69m{nX9Ta(a#3`J4;iN~3XXB<U1q=uk4qp@}3}Q5avggm7=%@B;JjAL0i{fa6
z?u3!REfchwN888SCx^#1_=4UfNO_4t>Rp95i6Ej>TQJg%U)^f|NTTtF0%mc8ANufL
zv_i(Y<%vfe-B9G=m~AiWXWc<PLFZ=?QfcO)7dVR`c{WOP#ggc<sCeObP^%Zm?-Gu!
zCb{Eh1jCLhxd^C_PLZr#kFl!^fSh81QCAE(juGu4-9D3_Rtev2EnycP<3CG}xuLBh
z{`*)!SE_CCs4Sl7ZNuA$-J`$$TKsCmcytFC@__|U^>69%k}B|F0sWMvhuRkG9kX)J
zcXrYeD8(d0A@mZeQV51BR;{AvGt`&ILI~{s_)?mRW|OExxrq#%P{hr&pu7n&#2mX2
zE?1YU96yl-P>a+e+-?~Bcob5$Nc2C2g}aE9rit%UlVO58od8gEHNu}uMfB&&cD#%;
zw;_{Zcf``0mBz->&m6Z-c41B!KRdzh94|@b9l0pBnUaQQN!-JO5vNN=TRc5|^QQim
zd>{Y$Nd2J%h@&XLARe&Om+GgdKfx#dce(zi_NG=>>k11M4&nivs2Jjm?@Q1EMc2b)
zvLnmsA#s9m)z1PuhAt&vy@BVe`d1gy=Tk@*`&4o0>IF~<c%%DQ5Kn}Qm5<@Brt#8k
zSOMZ@3&~do4m4g+ZFk~9B!3z=-2L4G?w0*s<FKhRW79em3JQVt$V>};EE9_Fh!=kh
z65heRj)$IcaNOCcIZG}l%*F-<k77?^MBVq1gerp{C?av*9YJ4vBx%5n$dGLSYCx60
zVmleU8^l)w(*)s8)H8e0DxKbw-VG*Mf%1Zs(0U7@l0p{*GN9Rv@3;3$nuh?ikw>B9
z{S4EtyMRT>47q!rz$)xLYr!}8m+6!tJa`4e5TtEfTbvF_$0S~0jY81|#tUg0<(jnK
z{Bw&ZQ}^s#7phyx`CI;1{BLv}Mb~3DZ>l@`tt?ct(b$I@Pl?EKnxzn{nklP^T;8jq
zA^F%ZI+l=cg<UJp`ZOn|sy`iJ40$US{gt$BgnD(e)_jubxbmt#^K*rwJMcmtcgL0T
zcsy&5rf~P~#Dl>4ondcvQOgf|R(0f?^XqFTY<6s5g5g6fxiK>9jALFD`w{a7#ND8@
zYJ~DQb>#CUK%H^tUD!SnN1VCSXK8hi+AwJkaoAt!t*X9}$v+GxL-1s|=JE02F&2|3
zK}>BALrGAefq{5Kn+$+t?-u`M(vZL2L$`mp<$X>G&{X+PV`XLClK*V3tW*BajeGl#
zFY-wF4`YDN0XMG;K;y3@2%2r{v981dk`SU;opKeGh%G+F7&1fP2BSf{iz<7`$H{2?
zun<%XLu@NWkckQ3jz`d+VLa%_n<_@k>$c$#MzK=2FaNL`;F%|Z1SJ`lYH~iZp?}3+
z54K-6KhQ^tldWEu3;?Px;pBpaTO=VkI-*hOa&tDMl8$M~2%E8RAcgL^ngCuk43MD?
znBuP)ARp><7DAN{GQUyZBV*Ci?~jPbM-_68O$pQ&&<;x-%kxc$;Uu}FXd?&E(YKY;
z{(1oS#6i;Qj^U7Pz?)kAA5|2P1@K5Mg{cGs@Ky@X+EC!)vit9Mz5XB`{s)FMd4F|%
z^9zG>tw{XO>Gsnd82|GZd;jy@{>y{IqyIf_oxJ+~hu1&;pVgPNpzkui!eu}LpaqYo
zZ?RJ-<3nD9Uf^&~-{S8?MqUvaBoCe*?*7OF5~s!0xB5!!0mA;4@Cs(6kXLT3N}kLt
z+a3<jd*KD$4Gwmumqo6$du{gsUNQn;73#PCw55`*q(^{7t&aK2ja5nADQ`K|`-0uF
z?v%F*52CQ3mtp(psClq^a`^o=@M>y@(n>(v1hDLw%3%6B&)bun_wwzjy;F$Np_mJ$
zSFBJ|ok#H&-2!Cq<X4F)q#YkcGTD@b#L2*9Kv5vS@{UV+9q5J5v@#sRr-Xy{XnIEp
zN!(6IsqZizn%!5nU*H}tFQkaJ+f}06F5RxE%q@7w2cEf25zbEOL>gRFr8UJ{J~Hzt
z{B5W^0rFCK=s<iS^IzcRCATw~Nv7i@m`R*tB|Ph*LSLqOKw&TSiKu`JLk+M-qS(|J
z37(V-lTqT*AYLL!{qROfN-^wDmu(2dWf#v7CAL78ijR)Hb0+qbY9q;>BWhjc89=#B
z)FhhMd{Rw4%w`;96+KIfO2wOMnw*hq;t=Qjs*9Eh-X0T-bg%ISg}s|{^5V+larg&4
zQQf_9f2_*BND9_6QaMekE%Qf1+AH?SK_&G0AVI-RJ02k|=-t#7<~eE=Iqr0XIROzJ
zG>*%3F2FluRvRKSC_0RLz4(g6+!XR89jsD{n@CE5o~$ze6{jn*hKSZoG8qg8AEZ1g
z64d){C|L0X>~~dHtMU<s(HY4sDN*?cyQJ`dBacKWs{e2bs-L$!^>R#P@);e?;ix`j
zVn#@sWjF|<79yEiRfmhIAo)WYA#**UEErBW1Xa<X)MP_}#I7tO%*imIqPnj?u&!tn
z>0pyxlZlCf&e%}Sq5;hGm<4wfvXpZA7-$#~8+9d&Aw2&w1D2t4?l=I<V5~=C&}B@d
zA4BKKd|?`tI=-pve2AeE4X`Js11yy~jf$yT7)Ns8XgUgB%Pvo`W4*&n(#7Op!}D=8
z(!kW1IS-MwuvV_J<pNA<0n-s#0YmJPcBn^wOi76*j6=c`&(ULom9fA&JuR-iMeIB+
zuG_X$X#{qRs4^dyC}<*3j|~Kc|3gc21iAr0mn7dVyKZj*%^jx`5o*{uSqRe{na2`K
z@|P9SsN{MeLo;uI=IIP{vZoo%L++i%DQ`rhs(19=&5~$(K8SO6ey7_(wN5Vz$><^!
z(!|})Psncm7&%G<v8Z&^#SOp+Xpy@#1uUp_kv-x+Ptq^4_lE_4hR5lg{zu#k=4H5z
zMxI0Sa=taq;G#jNjD@MAZpkBJgaUA7gDJU|=z3hS-XxdVcaj|nkiAX4$E6DJW0LuL
z8IC&00!!8?z^mHKLNY*dJn|OeED7FEFdvg7*!M7B%r2RjVJB!OpmI=S(91@xv7%V|
z9&+BWf#6&^?_Shs!jPOw4jz$>$N;U2;mv~WSFeL-d;1hI%JaH(Y6CPf1+M{1nw26h
zlz0i$$yWsG|KZ>LT|)0XPLl0p%6WkHcL9W@!O4P28_jsZpjm*Y>fyn&z2`J~%&s6a
zWdjJiD(us6a*b=6!)c^4g<=eIT8?<sz32`sYbu^p#eMATAkVW?Kwa^cG?tKaMOq{#
z3PS6YY<+J^sm0bB#b4!kS}&UW`&DV>@`1^?975e*--1lZhnjYLPsS+8B>}66T0Q*^
zHgEOZ^WGlbmeiOL=3MoRPV1^ySg<#<`NDszuWDnP@9K?JUvF~<ihgUAOl^FpeCnI3
zl}ivz<=i59Ff_f$hoOsPU@$rH)Z`DD@{-1QD#$N|g}gMI`ZB;QJJXd*xB-x<3^Jv?
zp1iT3QCjn0`zcZliP?k=rvk16@~%*20D4EpbdgZq!L5Qp+4a^T8x{%XQANnCvy4}m
z`#LSld3JpG@@RYKyY1&qDaesN0%a+>kp9ucY%1vtCcjJ!1BuFqfvU%15Z)sbnFB{^
z8G1do&ENr0IC^PrCjrX~kL0>p7f*F%G1-J$3=In3liz|RED8slq0=zA>XL7DQ|F22
zm}itGIBvHmBgN+fl=Qt4^(0BR--TKPjy&|BJsMj$_DZunCzUnr^1S-v+|^Z7XEr~<
z8I*GtNCs4iuCrW>8UqdudaTOXuU{Rd28S;{&EW1bJQP272YP_qLvGES{`mz34h6~#
zrW7ilR?yG2d<tJBi>+o(PDuJyR^*zJYy95IGFQe{aV2z8T9c73a(xtsS6Ci+CrO==
z(y`F@<8@y&rL!e<FM+SwLvH?$C0WbvIu~z!`#0x3UIGz8|B##3=??{NoOh%-JJ%Vl
zbX<$^+`@~(YHhQjT>mhM(HP}=@)%M=p_<dHU_00e^z@hDUujzw;AI2O(2}MU@I%sm
z%)ZdtJ3M$>uAE|%_}^;7JJ&UMi*r%IKTW5f-YE4#h0LmHLrAp-8u;O6Eb>0U{sLnX
z7;S?THb_LLkSovj4&WNVyQsumHYTI9R1|@MzV)VHwe_apEzXT&QU3Kt3rTFVd^vxo
z@@&WLNL&z|`)}W>&+7Z>7Th-83fs){twM}boCEk=SK1w%1N<A>Ul5j{H4B#Tkwp=?
zkW-V(gL*6Jhb8%WZQJ}8UJqi|xG}X7Qh1_eEBSz2Ff&(=pIfe>zmj()`O(1@tO1Ce
z2DLMUTA+fjf^5tbPEmAI$(FU*C05B)G5xmS8s>lfwfMU<5bTKj#!_>BtDdf!u9A?+
z`oYeSj&8&p(>Ht+BmJ>XVcOuC)~&4b>fT!uugH!XjWj#3iO2-H3TWLXp8!WFmXeVf
zUHn3xxXh!yBM%hZA04zEie;XdTsDDj0B2F8@@FBLoQyF&Oe;nyIYkAHQBaQZ?J>DW
zc{JGYhHf`F+4x6q?EJ}h)3Aq=a1+oqEb5pKnC&hYAvdwLRBVXiDjM&zdA+e3O&2X_
zYia(1x_1f0Q`jnKwZ_Yj2H?ok;F_jkS*H4)?(6DS-BdBh*57Or3TeXq^q_UBB_)mK
z$F=v>$ZWX;IOgdoVCmNUOH=R<hR0}j67QJEva*&HD7EOA{aP?HSvcx-;WD0P`W!&<
zDAx*u@9O+a&~csIOq8nz^+{#$ip0{*Z_`<#-=?!VziAH-Nqi}85fI!rMZMQ_C*EW!
zAYm)j$*!zH04|WxL*z7^*Csw@sU^(cesk=Ce${_`uzo-Khxi~XOl|n&)=i(djh{Hp
zpUmihb8;!n*fto%cl<a9Q;=G9lq{%|fg{5}ST;H;OdZ7lBAWMals|Mv@lfm9)bq&t
zOYgc&k8=(Yyme|K<2^WR0kaKE*^j851<Y|W9!=V~yAUsMF6+Eb_|xt)UC_umB=fQt
zX5S@o_MKCVa6{ezkpW2yG2axh)FQ^+MSrW_%_Ch}jo-5uXusGJ)9khZ7V~mMvecSe
z(k|jQEGyKKcp7%eQvQ{-;x@Q^V(zYG4kWX@g$yR1NMRU9A|ZPPMwb{6?=0%YSC2Av
zp0W27UN6XZC?&6Vk@Z%Sn{pc>?;g2uMV=vlEgQqAS|O(ZV3r?js(faB?7nGyON+Z<
zIhIm@i+JsuoWo^eDW~TG6HRXYTxxfC#N<ix##2m<V<gUTl?v%0)RysxSAKx!#Fh-A
zDWLR0RY)p7rJ$jcVXaarOs|fSaH?amR9nLJt&T+XU8B-~e^)E3@b6k>4gOuPti!(>
zm5rHQY5Yf^zov0(@|1TEw}_`}D$3NTSnll4fjg#99{z9}o{G*c=EsX$hNc;$vM5^$
z)82TSQkYS6DmZ+fcP90`oll#kIp--mQ|EaFUH;Jlk)1V%ubfgc^&<7BBzXgedO3D9
ze(D9cZasScz1uCH!Nr<d$&aUD;noz;x0((A=>C3};q}7lqv~aP4K;4jS?_5$->Tp$
zU(>#je2uUT<UQLXUxY$?^cwf&^_zkga;S%Gp^Dd*36y!N`^)L__~2^G>%(iTX)X^*
z{ioN}{d#@LM+I+v47(FI=V6?xbju@I&HkN;#`NQvpBzGJ_xV#F)%@J*z*gh?WXCo?
zA9;9dAfN0Ax4SjZLC()-IL`T*6YosXTOaMRvhS$EX9{+Hg2P_*{B}n^Kes;kRbz9{
z=q;E4e)3rX2`+DzbJ&8ZwY;zWEXOU`1%7VJG`O|y#5%|^+=kZPhK;!Gyxp3ym^B6Y
z?1ep~d6<mb4(0LV)JtuH{87X8A$*!wbrE|G4k))p9Yxj_1-Ynu8);c}-?S>Ky_780
z+rK29Iw2f_b%2?=R3wKKHzR(Cth8Uo;;B1MJh0e~E5-<_1La6?9knMEi(x52J1JBP
zRM1B{N)mvwlt|aQG$`2bgATMN>XT%IO2hP)H@t>zUL`|&dCp4}`y@*qsD<eYs=I(#
z%|k*Q-hrM=ocpda9M00UIVHJzx#y9nU<Y0$WLc#RPNcP$y~ewH$7UVb?GZZbg?82*
zc&Rc4;*H1AVBAHq964toSTuV#Dk6V9l#yA5*mMm&Hio2!BO_}g_f#>=;8PYHYPq_O
zn2#TGN3j~pImWHMb<K-zA;A<XDcg2+IOfSaf<08xd*nL09&RhYH?~@?V2@c?W0`%~
zH|t~L@PO7st_C{Ba$Z4gCZAmv_qvd_2F;bSnl7+zRazC0^gD?~XF}N~dXlawu!)1u
zIRG`5=VJ6n@5o#hHFHbMH_p}Eda9r@izOmB1t&i(0Z<V0r|c6<nrbA6noOZ3swU#=
zENU_bEx{*`p5S9>$}Eb4&t0jC)r&mJg3mMtKZi}vW$bT7Y4EXW&3u$5w_CZlI$YS}
z2yg*Vw_r0!g?vPKY7&~VuOO+fml9jWhE9?k5})iNGnzRUqI49WrlR`@JTmgLDbh3b
z+*OLEo-9H-v-)3-lJk)vXT<X(Y3_lh$@1T4&}DgL*n18Az-X-^LF0Yp({L35cOFkT
zWayOo1@A=xk<|S%gW57MW$<(N*__eL6oC!4{{!WyKxYN%#AMB@yiNq~L)M`0?*_-O
z4k)7aj1g5VUuJYbkY)hrmJ2(Mf}Dt9m?V5I`1u6|PlX{S^8xh25R+leW$>k+LwJ5p
z$u-dPcM8Dw5nP~RSZ3y+a*nh=C9ZgHwd$EydN4~l<-xej#W|cINbud9XGo}SwOcX*
zl-!Hl4{D_;-6Fc%SRu>@H&@{eA8r?M++pqxeSW;4&Vj2s3)}DR+V|N4ig^@;+a|_$
zDl!aaqlv=NS!#0q2ChyKsUxy(?HOIsa{B&`(LB@d>e*xS3_v^TB&!iityKBxb)~W-
zH3u26g{9>pe9j8&EsH_vx4u+t<SR<NQJG{9=epSC84F7oSz}@KWCV7Zxm)#3=;~*h
z(bYfSlx8HL7SZyyF;n!HzDxPR(9LM?U?*)|rl6$RX-^S>v4|9xEu&pn(mmN$+EayV
zu9})G3d9sQj#mN4tTq9w@h$+gd2;OsxK_(B{8sP|9la&R)O$g}<M8@&mi+Cm%XVF(
zLm3`S2~KmRoYU9Xp2oZ*EAO%~y9wQbGxzzNwj;?vfAA?RuZeaa#EDOX&rc8669X(?
z3?}%Wcgtr<XBjg@l&wogh6wTF(H-D359@HtJBGQmX*4ncG;(ikA9rW-+}QSVR&wgq
zW9HrMQy322`p%|{quT!tqhbNUN02!6*r5@B)qi}jeiI9nH}#*DqxEo6`$~1{I*;1L
zoNcO9dHJWsF-496idgG~#F5p+-q=b0tDQ_ewL3j_Y<D!~6};vs-Mi&TdqeJm715rI
zFa*4ho`x3yY!tnxTtpQU?+c*xVgQ5x1+vaRjq9ELP}CajH{>(bO)-uzJ3b1vT&KwI
zZ{94IMa?Pfp+{V%R-abNL$7o<txl)=DsKZ5N~qksNl#~b_!2pYTBVA5DV3ZGDC(Vs
zTw5!jo0ewn2-=+1SF@QGX-)5la>=sZXC3c?ox#PJf-`s-=z`zlb{aPWm2St$*dS-{
zGfH|mm7THS3E>rBPV2&*SQ~!)+=oPPi@BLcKg*BSjoc1muDX_=X`<R$qe$^j^AE*Q
zIo}%aj1k?APvd7!ZjGOh;@SAg;oSJiwNA?YaBF$-taZP$m>!>x71i4#a>VsnOqs*Z
zY!1;qKA*>A>`qIQ&m7J_>M87D_Atp~4f&Z{MmEDg$bF{F=af%(!P=?D+4ggfx1NFg
zG4Xaf-=m&e8lio5{Jo6<sYmjNPxUy57oEv{9_MnOc@}5$Y4z@AxbVqM7iQ6h+nFzT
z4H)J^;kmZ$^i7+KKT|gB9ky$Z8N)P7-`tMf(Hzdy{)9$x{LG6Dvkm0<`Sat$6eGIZ
z<HW6KS}%{LVHgmK(7@_!X|;lZE(Arf@GpKQ97Z;7hA2#>mAzbA=^emwtry;P1c3RY
z_)3JR&y+%_B|oY-hRBa)VoI-RPly-gc0}fj)%{#xGQ#0!n8V6XuWQS7sl~!SQF@^N
zdIMwhtFZECIDdLyVnW$o_Z=EbVSt!^9|j(dO^5;xlIW{Gr{)?*=dXX8kPx|0JOlPz
z4>Nn+*<s%B61yB3n^G!UhWd|%%r?y!BvDdXwMqo*rsx&IqZFnp0KH62j?x_+B{U8@
zXf9IP=2)B(W(JPch8LzZ@SqINa0J*zGO*mXD<W0_^X)-VHk<d+2vMZpO?3FsPR&KD
zkFe#q6|0#AU@c}kij!P;`5)^T()8J*51naqYl7K2rvi&wyQ7W{2mXj<uCzQMLga|C
z(yF!%gka3Mb~!99hB>uhp{)^yq~(CiQ7_`;FMxCCl&C_ivMrPdN273XAv1ZCca#MQ
zMTd4&cQgY*>nX}l)W>+LP>sPVo-vU^N8^3~J?Y5MO*F&k@1_kq@_9p54Hj1Z{Gfk5
z`p5M7{g5@ev$it3OpK#P(*qlGCitQqROL#C4$@gqb4337wd}EaPnTM3Liq~jHvc9I
z%5779pVt%!0LyTGhHfb?&_OU>!uF&;;rz?B+pgS<xv_@iv5dUK49%XSJIs=WGDH;U
zABz%Lyqbp=(4NL!!s2)6%{Y#Gyl0hhJS7Z{NAEbe>sic68)P(Bj{e4gjN4O!WVL$C
z5t*yUQx`0|Tz<CuR#fyjy<~EdXm)hKTNybs9R!zRe9jjvHxr6D6+PF^fdl`mh@HcO
zljgxmt1NFXtWMFyFFw~L@KnPp1Wx*nd2}66gu~nZKug34R$xk%F1|vP5Z^$5maU9i
z#uyZXN5}mL&q_{?r4#0iuVU7rU<OcBkl+HNwWsbd)yCjG6w8<Moq0muTJs>|Rbr1M
z6dVRdY}Siy-_Oi#3}dER_;6c^oad4z+fQG9Jl8V&66T)0b6lse<A}2O-w*sB+Qh1P
zvv~=oLZN3g^KlZ91|q@J3?qY^FvTXXkqkp#-6#5Q(hDuHf6qB)u;yUPGTFSlgKe&>
z!j}<_F0SK>vBx4p8^GluNhn67i47&0GqufC5;?_yai(l<P-zTDP6=#Er~A9xySs!S
z0&|zNzTe(|MY%3swVG9UadLRLuQT@n>Z$T7pN!Q3osq;&z^7sAyml5~qURI18YD9M
zbCtqBSF}r&N>+pPkuF!nCwF*z8qU%#ju~yUHKqoH*3*$6720HGn>S>1v9Yx<za;Oo
zx@67igk|3Xa-FfV?pIFyO?(Dcpff~DXo^V5sy9L<hurkKzVoR)NcpQvr&h!^r~6(F
zxqZ#FXwfZIzLui*4yxVx#Cp!{ap1&?OWh?|HOjN<G*sO$b4|<!nYzTH$%HGC1^{Uh
zL3Q6R1i15*fAq|Mk_EWcI{21DJ~X%KiCr%H-aGPwX^~TBTpR78xKj$nwSs4(40<-r
z!wZ(o2|#qQM!Vl|gl^<U%n?3~W5)-G862g>#s~aI@_MOxbHpK@P?aY}oZ#uABtE?x
z--f;Io!K<{F*oN7FiIFQ*ZtY4n!4iNX4*gYqMJeOjLd5Gbqt@p3#(l0yIjg#uz43V
zd<ggKs~5HD6R*vES-s^N%r!^Wa6I4cJV*1+l4p-*CM~o6Q-oaRT5EFKQ8p9!|G)j2
zADCR39iY}<|4ePHz_Yo&4*y--*w|dBzZ>iP-<6fsmG#xtzcp4Ltgo%DJlI@a`P)ik
zb)(Vvn^^fw{c#?ka^Xmbzx8gy!9`<QxoDJpi4J|)XHhs90Q?bL{CeVnD8aR63@3ec
zrPla{Z$vxs@Mc6AX-hk0u?mY=g?~0G`12e1+1M1%@DksO&&O9tiYP`8rJt&Zy+NDr
zMC7rFX3lspo@4n$mZwuK7X(#CH_!wn72SRpjVOnBbxab;+qa>Ec-O2GsY}MA?%8CF
zdWMS3(M3u3^u4Jcce>{o&0i+!O$3P;Ffu>(aS)HY?MUaK9lghU72ldM@77bedB);J
z*oAve%@xSVv>zO-1MYb@{dkhd=-TGvfRZ<&GN8IzYpj{v<1z!+lnP?Cwy|2P)!;u5
z;F8mhFp7{&m@7?1<+YqM2V)VKB}_>$3fu3ZF{OYs*&kmt_m6_s$?@L7bG#I0MJuuo
zGApFcYr@HZP_Bacu-5ROb<8=F0rK{AHW+~70&&G$GJ#Uq=_E>DqkTcxNtu7+2X-{p
zNs{@h&UvC@%&m=bt|1z^!@Bft+@#hlvS6{|S(tR&e5q!xsmo9~)4WWChn51E4NoOs
z(}}D(ud#l68F||@s5w@_tE;ITaAx1I$b^woNg#l4Bt|cj%uO+#D7&Dv0Sl6I<{`2U
z0}2_*0(nRSg1wIhU5YG|!33G+RZ9+@HlH1$Y@oOz7uD&))bya)Pw7mZw~#-~mxTUL
zkW<LsN2OCkym3i{m2uEbC6qX+>7`U|&O|~6nB=M4{6P*pfBK;N>_H+mfG?9hD3yn2
z-l+SxbYWFgxTY(6eLimMubT1enC4V!S6Ta5$JSf>UVOAOscS5jb#`>FX}32M{uob2
zul?99Q|0*WzdoIR>^%M!GdwKr<WrF{lkwdz=d^^on>XhCKA7$vRgaZy{#W(;gZVkH
z-{q`(_3ix2c0Um@(GFvC5fa(#Y&tThOW7x)A+!Cp=At8Vbf2D#%;j6~rAf$~?qQ#g
zjQp-7Bj49yPTz)I52Y}9=YN$yKj>fccrVN$ddpt-Ebd*j0bNjWYHSNADQXv+W9F3a
z_~tEIil|RYjZF$_a;WZ2_?~uk*#$nfDEV7;120;Y`GOZ+4{_HUyKgk37(2PZllG`P
z%(*k!7ZK)$NlQ6^EjpeIU}U|UiZGoJcKa96SejhmxXAz5%EU#3c6z0IR9kR%2!rEo
z0r#w?jUwsEB>8I~?@96<uBT>UJrzu;w0)2@npw?TMYooUzw)mSOa7+q!Ud-l)d?*`
z_Vm&ksXG=LDDn5+mfqMktPgK8K&_SwY5exkT?}+Z3YNEJ%Tz$Wt!OC$!7)1_2XD?e
zLU!z6{AF~*2#sWAA&We7qI9PB607e#-@4+|HFZCFR{@I^8{V>M__tcGwA4XSBq~$2
zO=jF<CPRBLJP~EAle5i5D*}l8Wi(n~#-RXjIa(b2*j(2?>+riWtI5?0a~MekO?S|Y
zW*8?4$|)HQkTH<$r2ER9Fp{V+Nfpr@NrvI5{r(~L%<6MJ?02AxQ;49J+88o;LPkd<
z)WWXyLn})8D7t|ENV`ELQ`lUu$*P9~aRD#dDx@FlGi7)SSlqC!WVj>@jL|ni8fDA;
z*KF&7u+~<qXEH<l<~sfCN^gCX{E;~jrqX=62d&5gM)q-mW=|bbqtXGwSX8IZ5=aR>
zTf;6(rpTJSOIW-mITqqlqJ&o{y^b&qD9W&Ke&jy3N-75g7S=2%i|FxX4Goi^d@n-1
zFllnnDHX3)@RHRaaE@{SFz#X8C0o3htfC!X5I989f-F2s;vUM|u?fO(7fOYAW;Xo~
z)eORP>b2Bj$SV%Efy2?FIs^!3A8ib4^;>ZdrZf2iuRm;AQDQcuOS|%>k5&LUlXAD&
zh2^%wU6qAIo2z^abec=V>Td8Y7XPIv3SKE>oD#|V>R2TSuYmTD!A`eGg~Kb;STWk1
z-ROOUQDjD9C+_tkp4lh5sGL<@3UK)Oqzh>NgrxEEJ(+Vh2k*P1c!0mHcE7zGkB5)y
z^-kPQYRP0!gWXUMheLXS|J1)}Y*sfKYu{ilpK3IC|Igl5H26B)df$z%p42Q*g(E-?
zBCapPcM%6ll#U@}>_|IdaAPu_TIOVYDMU<!wTJaSi+dEna`3KJu$sV|EucE-4$xy2
z$o0jb`-?O*(ug2v*#TeA%#I`9l<v9Zl0u3jiCU;AK&{x|q5{i9F-w7mOh*kI$FUkP
zA;!*&W&r=&`L1+|H%GY`xZEh(zvu<+_kmpOU~?V5y)~gr5Ve}mfy4(pM@PWPbg#!Z
z=ka7Dpjd*{7Zyp|B!c~;&GiNM`@$j+itf36;mBzbFI0J-2C;Qj%~<3XJypDc@Uy!C
zHn9F`?}7Gkk_y;EYX-MJFR0Zmdw)CE!tU}no8mWd{mo`T``c5Galoo&T_p95N`BT`
zkqJMN<E@`d`#Zt*{{GgEDDLct>Tm?)yvhZt*pidrN*T%xEdM#CGmk{2GF);E>9#C0
zI_C~;+D~6cHMh0*j4qY<AMyWvfMWFGk(E>)P?6y%;}runWxe9uh;^OZTfAMy7q*lR
ztvUtQ<Wn%cGF$xG6QQ$K<9fB4$T|)#il?YrhrwJ7&~M159K;iL$-22uD##m>GQn<!
zvzj6vXTW8fFPjP5`nl~+2HF-5uR0#9$2sQ2o|w63Lolw+h`MPB2pp>&#t$1^3SO+2
z;9LVb+fWiC{-ifnx>Vs$Z|;+MdU5;R=d=9bXS)5*%IfCkgTFOaHy^C6Z!|Vm8-H7A
zG}ap%_x3+u;#m|D1C-@YW6d@FsjcQ1|7`r#Eq=@u7kG>P!=3Lu{uJ=#<i&Awdso>h
z7!L{fgg#GUCket~7v*AbOYdG=r`4i3Y(1+t#CmOoc>b3_MGsrzHL%pRhUkUucQk!N
z1`~{~a4CZ^W^0dBdV2{dRc2Y7PX=wvIvN>3Wc`AZACI8hX^@)JlU6-@2T<t6_V>-;
zh=&&(|G+aKP8$|mC{A}NjHP5%#nEAF@3rWoiv_nJFZRSiU&1oryZY6ri|+H#a#AB(
zA_>d<T2$KHZ)Hzwmro?iw<rYyDt@Nw;LBGh&DXFnJFkvgd*3&4&7;Aj&#r4EE+N|*
zGaZL7kM{PPaN;!gTTN{+fYOZZgXd($a=iVrWH?}dr)(aXm|zhEi0@BZyFnnfw#52E
zG#a5$<simrn?io1MF+lMG9t6BK4A4V3BAV?mI0GS3|%JSO0gLA0C0(i+<_LF2jA}<
zA0E7H9-IU(q05J@;C1kQ6Gnb`5WL(wPzZ{B&@KqT8QiYsw}6NbR?4XXXe`CgwFkEu
zL=r6kS1PVyFO=X%IcM!2FN~t`WHb<ezkZy)JG`|KCJ$Lt@MdAHwVt!kszzpOk~x7L
zestV~2_x!20>wpfG>XV7FX@h%-$U;HqQ@=Ni5RzQE^V=ZU{@b~N+t#AAO7!i@&MD%
z|3+hVWi567uL4hSfBt`oXHi%fpm~4?o+H2U@Zm$W_kBS2z7PL$r~gqn>51mWMKl`M
za3f0^L4;-h5RL@;XYb$y$;J{vrhkBtEwOKV4Qk2RATlV<Ciq!w8>`;U2AKg<IEu4K
zoQH5N89_CQEpc@jqA^0M#wxl_$CHao{No$y8b@^4W9miRK)OF<hmdFkP}DB2t&%VX
z_=?d*1VBn5eju-HlQ~C8my>eEH*(S};emRF5afAO16<%4rYq)6JfY!@QGb%@7zWaj
zFY#}O&4ORZp15uLomi>dtAp0w^8+}l+zQf=G9&PEdV+*DY@^5s=P$t5{11KOqawF}
zW$K{$z3bwyTzoi+FM>AwgzYqlKOp0Goe6W73%O{0nGBNd1x&D8Bx6NT%mbE_2$Hsb
zIBs7W3_SsyjQW6AgVs16itnP)AnJ+IVXIXZ?Y5{MigtI@4v{dd*HWMW4S}yp5{Ww`
zlnhNO8ft;<nY(=y$cL!uOn{e4yVMQhvlt^yS->LY2acOoy1n6kKF7pW2?{>Z6W#6+
z;>oK6#nm|yiPK!(PBU=-`s&fYG?zy-DFLP+EAXIl=K~aY?i1d<+<xsZB{vCdru}DA
zv(c9t`}^YCZ$&BT{t^M(P;$_<ESAO2i|ym!>E4N`iq*0wUX|UP?v*G}%T>`3|DaCf
zR3t9T=4SPrIQ<X<K&pmE1ccwZp7*$Xr7l!jc`P1_?mzzF4Yc*Ee`4IG`{)XeQ{-!h
z`T(=m7f+suE;*#<hEbK=rEeGtjG4c>SOreEp9_raoV<`eWM9gbS03AJEI+5|zjH~%
zAWj#3WJ$&?^BdPFcy20@=BiWV*yg1bBMoPDLvhnm{dO59xyMsY@zBgN+b6A`rqhwD
z$f5Y7oxOP-%Rhtx4jsd@58>%&9l)`U<oOQdoZe!W=xlbs=N{5Ihp#@ZGsmyLU5QGk
zGmpKw3!20EZf7&uGaP)EJwi@{EQ8WI*gHCEo;a6F=a1RlHF~WnJJw%!=GM(yq&w~5
z9K=a&<|Y}^u_1xj5jf+cu+Qpwx$~6M5{;7dKV1|Vg@Xv)=%n5rK*ctny+nK0(}^WE
zs$fxrRJA4)>@q|kHU!kqzYn`TQv3Qz%93PODtNJYkM{-GmPuFvNIKY29E(1xhUM5$
zs>O+PdFuN8Xbd~~EE-=$5$tVl0ei2S17I+7(FJOmVQLdmims9AKxx_1SseG4%C?AL
zD&EQMmSt>CPwUGR{|7jv3d|1?37YaTd#XYA(NQiQVZcV5Y`py8#}S)8t8p4^1_q7|
zNcf7y7qGKY{0@d`159c{97UtcaF{4MWHF#;k<33c=4hgD(OiWJdpv*rD5QWtXjj$I
z$vCm^(e*HDTlqy$*oGFKK>k%^oiT<m!hUtg$O+I*65JZ<wPaP8mXnBLdUA35o6B+Z
z(0AtH>gw9sgVmL_&2Ki=A3WIjX5~Sz_t;y0KozQ<8vFaIhJP1{2~}-;v%bFhV10e%
z!P<kBhZ`G>&Bn$nQ&;tz(u^Rg!<397x-R1=%rFqEkU2%j;c2Pl?-KAeD<~CQfgj#c
z<}f|~1VZshR2${Dk3H?3otAQjA->%bCI9%#0B+vKh}DG2+FX0A7*@h{ni{#k;T|%+
zL7Z0Mqu>-DlVFeN&1Ls|EQ3~YBBW_J&=0R?p+Wwla%JCyOiXpj7M4nY1i;^Ju9d}a
z0{;MB*8BmCuYM0dQ`1Esu(djLxorOYN@Uj&K2DsbCQe)OTi5>NYj2_&oX8d@s!4oN
zMke>Kr*Qp)Jp-U`pIQAoQ~$fRlF|RJZmitPf4{`DC>R5j=yzjw;D^S;hp78qS*s{D
z@XDr%0kMuh(~@BsYw%Ae9R@h5QP?bO7rCDJ-;|o14L~UvK|Hp&Og0)-X1>o4UWw<?
zfC4QZP0rA2a35M7U@(D^F0n5arfx|BqDtePlABD%Iz9o+3H0YZ8dORqT1QbtuyWlA
zj#3YYcuw+49ig=_bzjEw#CojCV^&Psvs<9FY8P3&7z1Fld(GL+jIpS3RFoPU1M`io
z7I^t(D>A}@)r#GMAF{$eX<)Ss!&+9M$cJ3A6ZgaJK!x_00G5oBN7B~)Rd0loy9-P$
zTC;xJ;UE8M-&_nP37VZgspyTeQj@i80|N2wCH?nb?Orz-){teZ#iNTSw3Ak7fAPJV
zwST44)!N1iUZJe3_RHX4--_b+vh|!V)O!cdOQ$MhJru#2L8T+iVbsxq5O$>@c^5U|
zh>RU9%b+mAK=WYx=|0>Pfj}rW3c~`xR>Hzncx@f`^8SGLp92a$CH8@yPH<UTjB66c
zt5y?xy(J?=z7Km9{SGdxWiyoHX6w~H#$l45mEc~6XEJZ^d5F6|!}zlw|1-}2^^KLa
zM*92*M)>~x{}RulAPi8)|LVGP{y&^@{`*h*`&0h@l)pdaKjxI*Tv48fJC{*gM#QHO
zoN3D;8b$0lhSXg4;OG!f%iX=>oLJ8ki|OU|cg>*HJb7D2ME953J7}G3@9$45^71=q
zCpel`q}AN@er7&~zAPv=b;d&!uHr_QqgA*-rg{{ktDD$iu3*h4oQY$+V4UaNT7+!F
zxUSrKYOwkkS`A$g2N<udU32)1=gpIo=4-NsJ3dsVa3~^2`iM&<!&^in(mqr8vAEZZ
zugC`|LJg1d)^V99l%AiV1Q-e2pd#Uzkogj6Wt1<(f<hnqOjNF*B%3wWe#=B;!u`-s
zF3$U7h3gp3TRF|4C)GLHyR)#DCCh+N$_Y!>ByZwy)Vs04$>m6FSnOq*0;a4OxgJd@
zU?cQ`5rN!?Pns~j!00`Dc~X%DC7VgU=Us|*5x^ijFmdPw4dd>%6Jfkmo_zgwyA`}_
zwp!cIQTqKnc(!{gR-b&`5MO`I@~9F_`@G<&qT>W}0UI8W3(1ao&-xV9-i<}$G5MwQ
zA1jYxVwK+Zk>pnOpaGM3u;jqR<Hesv`Bq~R$te~0&N-5-C3vzW0P!|z3++oxR`Z_;
zQ0h`e?kdvf{VXBEFxB>9cb&$6T)&;upH`|5-!7x~j`H<bLf4*^+9`f8ziP|$y8(Z!
zzqNkWmdk?M3RW5$TaSzblKonB$M|X3T|cc@BtdRDQyFGu$~d2Y$$>u48L9nV_h|mH
zK6eJ|-^|yFf<b>)kw+LrSJCJ$n_EM2x3_+M>kY1IPTAtGB?YbM!ui`g1{SY+8DTCh
z_^Yk>&gx~{gI8Pd4z@wJQ$3qpB-OCfLG8xYC!q)*+w!L;9()e=f!7he=zNSk5Ae=$
zKQs5R9eR|F367uYx#(l=jEg9#4dWRkMFW_JsHkQ9GP_N+mf3F32h*wfH=GS1cgMk6
z_aijGfIc;HcU=CN_Of~Wyjjs;@)3SA>|n0I>VGU$ng^ZX<anezzsIpe=~8366RKUT
zO;%u?k-^kf>=YOY!+F(66HKVCX#g@^D&Q>o?n_`8I0U&5X-S4I!oZi3qcMk|9cQjb
z7PGZr`{?QB$vaQ~g@IpSRzmpsfnzsCOU@GNlGgfJR~=Xuy~u}0C%~?`&Hk#t!vBu9
zWtrALl4$&adgA}S<wql@40nj!M-HCtJx4E+m)i%st<vc*u39UD2S2-%5O?1W_;QRP
z|G46_z5S*guWM0{umIOsEPeW@JFx#-tJU7VRnC#pnNtFGTsfB?Etge`Dm{iS_!}<S
zQu5WK+VWRl!T!}wo0hxgqBuHqoK^`VLSZq~z;fet3~%d1v0PremfK0OY_sJ?rMM`z
zJO9Rf1R>f|uzWEYwPlD_et2)?j;Mb6Q~fReZ@GvgOH~V!$vMV>saw?%FIDZI-qh-u
zYVkPPa?49FZllXz)u8f)Re2GO8JytHk|?)13Nb>XOF@txWV+_YN~&hMg6$CNz?2TL
z&bzIGtZ&?}%^JCt9pB(u85)X*3JT9jQBIMbi=vBB_|yRvt%{y@oZ`!FI|bFm)M}2S
z@uD~(D>p0r9y@<oD1C!hHRO-TB9G(u;ax4Xpd1~Z&<;ghCv4@bXo&Z|#0dmVn}a;w
zhCOtEvw%1uBPe!9r+a=LQRos%c8dp3cVNAxFwSmH6YcbVo?WK8I&iG+X5HbLYbd14
z+Tq(QEJ}iYL|)_y@$tnYj)sIc-V7MTGcKE7#%k(f9E`)Wt)D4C!MRv^Gj>w+!1(7J
zr(sG8^`92&or3&%DvG~yBOl%_zbUE@Nu{=2p(ct3#p+*+H}F(!U~h^^{Y|O1{H9Fb
z>TeqLf_O50{*De&$bzqTn@6p!g56K67?8RBeY7ro{%X5bfm&3kB3>QsZl5&upS!PK
zzWh=D_53COf&&?o{W;)(9gy83Ss@$2aXI{kGVLm6;pm=sqmGXI#iCam4yIV?V^|_5
zna*6OCr9Ip!mvo!3t2!4R&`duOAcCsJct&f_M}QFmC4<SIdS;3b-3R=X$IC*`m-d>
zMr!B);j0A-_oE50*QJQ?F$O+@*|AXlwl$rurIImOFoLb0Jvg1z7i-IPz{1(9@N;Sb
zUUX$%E4!m%g4RkDW`|C1Ja0(y^sQ*rHr%<VIC)D}?WLuyqTS;qr+9iJ6x|mJ8K&mG
zS(LZZJme5pK&)vN(o<ghBBS?VpgjxD@-B*<xIaXVh1}52w@|8BizQ$aqYy4AILZqA
zZNV<%-@M-Cda;Bh%5e89ds}fx$sOBLEy&A@zag7QeN;Pxc<66I5x!3}V;6mA%I0Ex
zi1pzw!%^f*mS#RKnI@N}WKR<c5$p_F&Z^lT>{+(otGTh?k&jzQria4bqL~~}3LfrG
zK3a-;7)68tYwuDlw||AA^S4lSB)+&+oe>m@_MfsMAb?v%53W$uhhMsfu$sB)+6alZ
zPqyJctxiqyvY@oX>bz7cDLf;W5=EFC7?FuVrb98>^Z}J7YLe}RaL%h4#}qD_j8i?=
z+EMZZiiVYXt(_gddUeoho_xhIrHfNfNSL=M0VcJhY3r7$kt&-Z(>c}c@utdWk`PkL
zG6RAJp9blf0bH9`GJc>vcfdP_z4!vB!hxE2>cb7MCZhkK+LIKj8cKyj^JUAQ)l@{z
z0i8^C%O$1N=~|9A8DBaABSfmtMwCJqm2<dboMGq>oE#<U%Y)?VqsOCgkn}=nR?pED
z%{0i_DQ6>0Nm6JP&WR00(Oy;83qbuC7qd~Y@kvoVd@}j^+?*9T5!=+`Y_~$u{!=&|
zn~rw*N#lg38o9gKZZvN@YgD!id(c=nRw!y}<t1*@`+SGHo07pyySwQ!R#S#IRTmtw
zRUdh-gpz?Jxe#obL>BV0uBwdWb$|PpJRSb^n>wC;yU^d9g9l1De_Q43V+M-Ze_Ex~
z=>jFxPwT5%6!@xsT3=npmO5*{z><aZT++4mN%p-HNgY$!Bl_er`-S@Pq!%UC<qS?a
z7q)Xh&6k_~+`Gk>Yw@UifuZecXW={i@Bb_NBEG@a=ZiXkdEy&Two-;1I7sXuxb-C~
zpTv^V?c)@V`EWR9ivSh-7$~#4bvbOmqR>~YaYvyKSr-wnNst$Bc_FXp9bBVOpO<*s
zkohYX^Y0dXr|@1PmQv^El7!_Q<y-?ZT_jM3dj2YZRwcXefpCzGE!j{gPR7!qi~MQT
z(o&i_OO|FuzdkyoOMa3uQfZwW9UtyATP-wLQM*K1tSpKjP+`WWCK@22E$d`ZF?YKf
zD)T28`u8ffqN1}@TBiCyI|~8^*TzTmqbht;%#ngUvxwKt)NQgN;pA22sOni3QCA4Z
z2Hpan+31T@Tkxvkrpv%@E&aZ=-209a@4LvlZz1KryL@}b1@8_r?YX7dx0GWOZKG*<
z*2NqY;tJhYV?LSD;&E`1Xah%d9K~x89oEPw0>_tJx~U+3E>TsKtvX>}e@2JrrPuJ<
zIvOs<0hZoc!hfAa3^qU|uKg-`Ggz7vvISdKr`k*f&2<7x1Zb)#N@Xh&1RgNoe%m}e
zStu?q;D7k_hcswiodK(KBfO)CW#KFbti6n`#~3s`wUxi$KHfuPcuBQ|qt5h5s{v|o
z9jFbzh0gP&f|u^oXj6c}g4xnE>JQQS@_HeuAHn~@k8ubUe#DG=V-jX@39(Pv3eS;}
zvl12w3^~2RAT)I$y=<5BM%I5iT>@H;vhKo?c)P5|;lACf|4OsbiXy%iumwr4JJ58@
z3mwKeZv*H%c@{2wSUBq}Ji^hvKrdpMLrESZ6vUoerD@J>cTt%|z#+zoG5RrqiQ3%+
zU9Csaut$?SX8YfeC%d*llG0*b)E8*9YCWh;6|6qAcg^^0;n5jXd-JAPuT%6k^xIT*
zDtgzE7yKxs@HTe+;lj90ktb-lA*DF*lp~3zm4U-EY`mr}3KD5y1c#ko6pm8JgyZ`O
z$A>tC6OB!8d)gx>>crUh`kKRYyE~Y0T1N~dxd`mTHDg6h98K^X8UU|_s40mM(w;bt
z;P3{B7Ft|KbcpLt5~e@uEG&5~HY7rhwWiHUWTNItGaY&aTC<{ep?b6Rb5YU+igIjk
zP)ohDRR2jVFV;ItY|T<v2(2$Kbw1V%R1+v$fi?G>Z>^)44?`pE<uU<@y~9MF|3++y
zbx=&H3X;sy92zLM#3B^v#{q_SQ@SK5ivsmkUkBXcg`(S+!jjt#>|}KZkz9CMh+kM(
zxTO;252ku?@)g}yoAt3;tWU4rxrLHNAG5sK>^Ylnzsb@(6h?n_iTJqvCZW`o-GpbF
zoK2?&mDzK&xOdj|%%$J*DRDktd6TcS`AB6=u9D`?${DXx<`XDmtcg87JZc`F>@{0=
z0q@eyUDytL2jxId&Ipr@jJxc8XxiM_-)?<|=Gt%sr&{{om!D$N{?m7%qGj<%frUMB
zrk1)~>n9g3{NrZp@YONg+jsZ(KVd^=%4(x1i6<jq4r?8bQZf6|met11(85W{k)=e-
zXxq|SHe0)vLQH&R@CN^qYl}bCg5dAW<f(Ies+wnh)!ZFaa<@>$-AV<Qo+9YH`$oKR
z_skn>({M-i4rPee3>S*#kC||2>oEwmEQO-{mFfR~WFBoq&NJ3~C@}!7k!AE;e^VpA
zn@_Qu`u5YE-R86BFZTZDyZx63he!W=+&X#n{SU8y{J(m5)&?&7;<EeicfCH$=YQa;
zHF<w^ee+9Qo^%>Z3PttP?wi#e+>-P6F{oGJG?jn+l#Hr7tvdYMI;yLe|3b0SpjfZ&
zhvR{H+rAlfd%bQOKJ46#dUYE{>!`>;+&Vu^eyP6tzha&KBR}!zvUp!8X5QtD*IH1Q
zG+4~($EbGmRk~?a?mQ~o`Bk?mmF?|RwX;>Uj%s#3m8^*pd0Q3iT~)91s$4%()%x)&
z)=#2ZovBitOO<NrOgwp$r>IPCt14A#ytxtj%T|T{&-VA*_TT?|V*horvv2>o(|WOe
zd}P0wOM^O(=5#KNsngj)(f(7+Jb0Y3!O?M&YDb+JU;fl^=eba{{u2H(<G<<D$e<0Z
zu=7I9eNNbDykK<Jq_VZ-Af&Oi{&rNme+&h5ii^VjxNmG_wPun~U9JDHN=P;cKFeR$
zH^qm*NA=VCnmN9qSmxc_igSBILJ9j%ySFD+8S{r#!rA~(#QMwbiGxGfALoTEiB4^c
z=yeUu!=sA+vE+yvl-{1y0^>gM$v)Kp5Ib@VtoFo`)5j$jSjuBi3Td`G9m&>2gLXGc
zblg-K;TK)dCwvZZ3SbJ!DOgD-MiXVAHis?XmnUGT(Rq@dM$+*-TS$|zNBRo0z>0={
zv7`xhK0DNwMYS!e)p5Ir`2gSOYadQL55#kGdMw^Za5-=a22f!dBos&fsyr*+SXbRN
zC4Q`3K|d_uIMc_hgDxp_{cpsWKgw}3FRtYtCG#R+JGl%;!})PgR7VyYG6f?I;JJ|!
zKo>07pAtz81Lq2xZ5D3YoGZ!lBas3i8>Dvn@6(md2GE8nd#Jz)d);3+-Mt9g?FnHx
z#u!gHYK+fA)UioPeGT>w_Ea$CJm*l={&95C#mMm(Xhg)rv5Zr6hIz3Q8K*=$UaMF%
zQ=_<~I^zrFlGEdIet!!^{|8ZQ`~}ls{$(HLPO6l8@N-3in-TwYZDk{!|7)#rpa1jA
zJc}ZQ0V)#Q=A3CjISTAwH7S^z5;PNPgT-JtzooK{wx+_eC7cek{<^hCTo{~=wlNn$
z!&Q+EzjjW*ad33JcX0A7AP7@pd+qFa(_N|l>AubEk_=1&Ew|s3HC4cM1Hu~_-$L?M
zIXRYeekHycmM9;lN~VN&su*)A*{`r=e22l?QIpPACWWt7iyiS*qu4310S@pYy&i1h
zHZVkCn~vV$C?2z2lr|+wE~8#=iR5^)e1xee2yIF*iUigW5l0&yVv3kD2Y#n;QEh5K
z&dcdru?5W2(pO6rv9yZ+6!D)9{v+@o`p|GcyjfWiA09i<&L-!ljg^(Rk16vdhN2Ut
z@&ejpCGz4}f+7{!YDKKUe%sh6qYO|*g@<Wr_lL4vVPgZz6v`+vUV&mC+)P5JISYt_
z#d(T3xrI*kFIw~F^W)}Guyb@&I)z<B<uS|!B|SB%Ne`ki=RO7I)4YA!JZz=jy=?7Z
zv^BTfOSp9Wu(q16zVqYrANCG{06L_aPA3M%C!H55Z<K|LiL^%>#D&{eg1IbM8JFbG
zw_1N$%mJY!z{@fYuAEmlg(>b&x%<<3ORcn}H*iszMtMB+#-cU4^F~2>&k_DPAIwpM
zcemd!|Le-;%IbPL|LfZ7ef-}q@+=Aq0~GJ~U>@GD@$liMl?K3M0Qd_qfcFuB?;`?F
zjR?HykKMnh;>-=hF$bFqbp|wEHj)vs;EF?7(AJcF@rRpJCX*F3w0T}VIjj<wUww9X
zT#?<za@C{eF}!-&+^rrSz{ghyyDA}=IIW29xA$K)t9#F?2Zty872jfen5M^d*vfW-
zt{{}$e2CLZC0fm+?c?o}!(-09$o3YLW36`;-XwxZNo_$}I~0F)tI2q5z{tW6Ek?w2
zkYn8MgLE^r_@f&NyBou<1PrR5bqDq2lFj<DG|w`D(MGxy<_SyID0w3z`8%l9i{p1P
zc&|kJX9PnThOh$|eANyaF<JW(07^d#J5cR3UPqDY^A<XzmGIrx5_aJ+{<HL$8`>)3
zzmMVOf)d|HWjnkig`4Djv0r};7ZD4_qdUNm4=~lK{w+P$p-Vn2pvF`>AtB|wjIW$D
zebIH)o{WjSv7evVrGP_djS-4pqETEuyBYIGOqd5##EAqGxcJ;qu|C{OV>H>3*Jq%r
zeWWpznVNzQs<l^*b(vC;Y#DED#bS*J^0(gx+bxtGFaBMj!2$=`T#z5ymjGJ)<62nN
zG&WY9*Xdc)*ci40GwNWtRgjen3)1K&r@(muCzD0*cJq`VkvxzrM;r<j8KYVHYJuV`
znh=YId|;iOV_PL&8^v=?oNQY&*|sNRvhAAO2{U1GQ<F|Q*|u%_WKXtnp8j9qd9^>m
zy7s>Jz1DAavmKprw2FO25$m7K-|WI1SQwH(0ImtJb{ZNE=OgzFXs|Q-)Ya8P*+|G+
z6-$NS;#@Vljy5twl`O~0Fc%d$Z_ICY4!C4N{PW+p1b=GyDK31+d705&HTgudL2a3>
zj7_utqnfNN`yZW|30?JiNQbpW`!#AZ>SNo#ol0$e`MR(5FQP-1jG1`6Tj!dXn$VJL
z&h4!FzARz(4WLt6@3TO5r^M!m{KJCUvjnsq5Tbf-SG`o7{Wi3JgxvKOSY>3mo~M^!
z)3!lO8pU_<*XkW8evb_eq+N#F|EG#GSDKY?I(cpftRENUZ6{syW2!_hEq<W%ZqjXU
zQM7^b&-=C>dYX>^=O|AZZy{~I=vJs7($9kpGdiQqOiEjiDMA#dl!9DdQFVKrQ6Ngp
z031P98v{LhgA$W_;uxr)p-CYIB^N6zQe4K<c15IUeA~cWx=ENE#&4zT8k(h7jXf`&
zU~vn~W+SooWagyF^qYH}Mti-P+<6@ZCKPw4oisDkQ}CNK<m;UY&r=S0AkR962<JJ3
z7=x_b;vB+U_VDn51%iUuv5Boih?(a+gpZ;DfZ&(Ftlpu;k=u~P4G4E=%IaT{Fx~Pk
zX?MRSpEagTP@*|orQtD-!<15SpuQ!|oPF6AE`h&xPo+;i|FBzXBm56|bi9U2n$RKa
z;eZLsXoDJIWkDq%&MLDss<L12XqvmY*}uh+^Nk+)OR9pNo*rSfL@$PDet^~#9*)PI
z@T%6V1Y2CulgnP?n);VHYR;7r)x9f=B&m)E?}ur!19^@keGrO@wo3OPQwFc~&qj*b
ziN2&C*AHJ7`bUs-EazwNC#HX7YU63+2`O^n2$WQ_D|$+M*sGxtWHI!dB(|qYh;P*o
z{jSPS-T4}4l*z>|Ex3h+M$sLm289oj$1+j!_C?eAg$4K$Wm$7$_QL1g>P1!BtA@wN
zjM(9o?Cd*%JFTg&?>xp&DmbLRF3tw+aC!G{l{MGs$aVmAit{-v$6>k<Huf%|sH{ID
z4T~q93sSCpcqWmW&EJQ(3*wO%ftA|dQ8#btPOl$_HN~h3SzZ~sWVL2thiz8~Ry0jR
zR*CP?0e$vfg{_SrRMMdiKdEin9JevEjqQ-%K7%nr#XLf+;>d%}reZ*dsGG^rB;-YD
ztopawl$PUNR8)!ZXM;bY+Uy8iP7JSdgpp9|A+_C$RVZmp#fV14|6|HIbuWYE2$z&K
za!jC`Z9OpwZziplCdHO5_KWHvOF={m`++=rpcHNr{~eV|j!DklkqNv-H&9a^cbDBY
z34zee!m$BajwP(aW!$I0%)6!KynS2-Iy<JB@wYxhvO<hb>f~yZ=cpW4d_?(gKsSc_
z2YSWt7G}MRTeHKratN!?E68y1gu=5OHC(d&peA1s?*idU3kDzj3)sn$jI;j)I37~a
zV=Z@xf0xv?_?b|`iTKr^l00T{9H9#R{b6BS-o44gF1vT&mYro)^E)`+i^Ko;o<3k~
zYGdO9R~nv1F=rAf(?8U+feT9Dll&IX?>#T&WTonI#h*5T=4Q*KYlkk;nQ=!1QmO}H
zRi^F9#ehL9ei3PWwP11Ae~rdD>F-DPBO8iI<Md3=3gH#H1k0e)&tM~~gBWij*nzCU
zUvtm3j~>`zics!hbfhll=p^?RYD(%~Ba~|-vI=I4xgyxz<3z>AoSY4$?}C#%!;8mp
z!`R!*loR&kdvUtK5&&U}%19P(mgWf6#DqGjt28R{XSOeuofTUPoguwI<c~Ywsn@`0
zZ|mBt9l}jkUUUZ0*15Rp3QR*h2Oz-Czg^@SufITj4NSVb`|9^5h)m!8VA$;wr_drT
zoemVlv>!0)aR#*?;?YVAK3f2Dt|i@HaN;9<pIE2M1=KnB+VtSTky|fFvKUZ7*YLZy
z1=#OfF9lAUt$~Hkk<T!tRYt%o7FD?%tbjw#xVcA}aLf9^9X97I;=Hl@%&g;{-(N1-
zXy54B(7UJQ+M2q&$OVD90I^C_eHFr_Fo7Y!jQ*Ehg%fk=YqcKkrP}C*+DCR`!TAWc
zcqxWPlfQgk{*fGEMh~Z)WKeTQ5b)shU?|s{vGIC)5#&EN5D$V4w28UO$wf@p+NXFd
zDD?~9o{=bXiryE$Z%5J#zV&L&N_*oiIo`8Ztwl<f%hE`{q__(<s7U{!>*F=XjD%1-
zskbCl7*Xhf0~-KXBqUhXiM0Ol<4<}&w|$DOye^Fnk|lJ}fd}_j?{R>yIuQqI1Y&TA
zF@5}Un0hG)?3Zi#m0ibl3DI+<sm@1UNVhiM2DilaUDanwjbXw`*oUC@D2)f3q1dEp
z^m=qoWs<x5Wnf3M$8S;`MryC*Cfi1<Sh{XB&qp1?DJzB3vD2FWa?swE{jDwE&oz&*
z_FfQJ`}icWKT3g%83nCG8D58Xgs%6IdyK%VFqZU1l&1Ex6&Qs4yMK>-(wEUc@kG2(
zrTjAFHz{Hd7fTZ&0Hr^onf!|@5LPB;w^_$^YxNfrkVUIf`RGJZEVsiW{4C|u=@6M!
z0xhiPy{?HL+>teM+4RY}%a$$5mBtS%3)1{rV1rMy^~@vkZbD(<xMLS{2K2ZVM}pK!
z^Y%gO?_RI+%Z{V$0b!~34AUm%0FEFnRPA<<_yvcgHK-fAVf`qca&&TLrta<Rkd<fd
z-!FVnD=`Ug1|t2?stelBm9Vasz-e&cV!!)_#WkJkqQB;!OQBhf6ss%s)tTM%1Xdg&
z;kCD!*0vo~W2M1JK=@KW^et<GRKzP)brH?UZ^X0c!oF1kFBD=y66n>RH*rtr?63b!
zfI>UiK|Da3o*)ZfqEBs%l{F*l8>GNKT=Mj9NsJU&q%H1u>uDP0btV#eRIG?D+Wlu<
zYO*0_c=8GUVku`GOJ=Z)FyDD&?MZTz89-FYX9Q0FlBo2K4gNDP?^xjL(7d45)nE&S
z>n%gSJ40L!+YX$ny=*Lj6Z6X=fr0tE8HKN&KN>O6G46jfK7`_jS729AA!m`dCz5gg
zjG!Zajd!IdFx*y!1;gW4SFDbfDii^Jy;E|()OgPNM{Z<IgyOaMnu&ea%}`rQt1obq
zm|!Z1ETD<tP_Z%#N+UBxi5>1;jrA<4Mm+thKgsAwl-w?GMV*p>Jhuxhb?S0cky-eR
za|#7uCqf*)NK&zk{A<9OlO8Oj0^@Ue^=tclVIRpvGw8GU4O9iMVo@zlcY)ygJEj43
z?1%`n`{|p)J5?7gaN&iw`{!n5Yp9BUvOh&KO2KWLd>zrMte^9kyHXSmx20c#fME^J
zXq!M-L#>=pV*M2wx|T|kAfdiA+1yKYk=3l)-eb|1f@=BT@rnkM{L#+o=iA|UC5BFn
zoqn_-DFZkR5#bVR-gMHCH?L)1ZD#^j37tXnp-@)W9!wqN)R#)l%DfKElGg}M(%U~M
zuf)89uCPLFAn>0TQf_%h-7`f4xDpKuN|tKPZr{7h3z}9jVK`3jL|0-O8>jHIcJjZc
zNuus?9)|}os<FNKMuM=Ns2Ux8(ML+zei8Tt%|`d-_(PHkZeX$=Zv5oN3I;c3fFC~@
z2KmB?qa8Y0`N><>YnjTIBIeC`(@|}0?Jm7C!`PP&`bC?aJ^vQqAePDI*(o)u{mSH<
z)#di#rxh)2Sy2?@!8`;yj?J8(`*Xx<7&7k<yXR;?w-ur+8hI7QFkamGr2Kyp_F}c8
z7$_#e@Z>h6z?V#<L~QRpLRVk}-=@NNg`tQ~eNNG0(}GRM?LWMM+zmB<d<jxLE|4VK
z$acFDksHe701|6UMc}+t+r;1Xy@-V9zF=6j3+`t5?=F>8X_8tytr9OX${%Rag#~aQ
z8fz<i5E>uKyqz*CJxPhco(!XJ>wwP3iiz#iVk>&J{$!lA2Sz$zYa`Fa>0(Qev3_@7
zAj;RFI8zDiXwgp(o6HUMAuyG1P96-t+`Y`~CAwHDp^5IU>>0{;B$DnW;>*nD^Zr=8
z+)iJ6JG#hi^<COuZ`-<5ZHR)A^1lI#%`5T4h!XNOVL(v`qyW=6tK^D7TJcaq1uA%B
zI(0gsm`cfLUr8G}$`<_70voQ7j4!ovo3r2gbB~%yepJm+5J{6-%OmpGO~UD=z%jEX
z3W0CR(tMOB=uzGZIo`aiA6R7ooiB)(^qwT)edmio6TaLqxul7|zUjYCv<4o*lz2VO
zA7ALZ7}wb(Y~wgmGb<~9&fD+MZ;{>Zm}%jhPikK}k=Z;mXYCj2v|>8(XG}f&EJXd3
z+-q5HmG#`Cuu~i}z@%r-&iQ$HqmSJZP2Op%JDixu(DRPWvm}(ZCEE$r&6f#{Z)0dZ
zwz>0ZKZRJ0Nz_P}B(^syaJWvoYVMx6sOXjmxhR^CL-H(~*E)fHPYz{Ai=WT7*aBQ0
zY)Rnaew0s#bPy7-Fl`5m#%JeUY;&+L?$`jjoyTLKI56vI)Sf{(F3)!}k=XE*@L|>U
z#{MB-BTJ>tf=)w^7b1K(*GIYR?vG9{llTcIX9sFpr>24SztT2qLr6f~x$oPH8k<(o
zxLy1=<&_Fe5=lWS+KD%7y_)Dy@_wY<;XR?Y7J9?oe!3SW)miA}3U5_m>aX|F6VoO2
zLZ~qRpyA<NvJAwILb8xx(g<L(7!~1Rnx%cBdA2Td5577Q{i%(6#c2n#^0AH#%ROm_
zoy=~TtonFYc3i24w860|PwqTm(z=fE3p%vPj{R=*D1{cdV)7NrRiLA~3+%+$d+uHU
z%6mlNw!6BUX7M>8hohKU7wje68Ky>kr&5^uUX>q6TN05+`cwyG0#I(AER}3H=<R1-
za?q&h7@mI{obe0-Q3%Wcm$toykmEB=;q%}z@Svn+s(FU|ss^kaL%mgY{laRmE0fm$
zI7EIMt0O^3!_J~0wPF-Zgm#k9p@5nm`>t=M<K@u!27<T0Slc2_I7ha#m`p2%9cggt
zul55cczf~?M$?08jP&)Iwp^Hra9opzok7LCWb<%F0%x>Iypv>hX7>1@@~mWr^E38M
zFCwM8Xm#kkU?%?{wI1C18Y4rWVV&t@t<DfTlf4=^@Adx%`DfvKXgod7$bkO8n)oT|
zk%FJZf+?nh8KPD;v|8xfnhOewRw`G<%A#ytkbJ&0>(%%5*@;Mg!=Ov)JWn~a`xQ^D
z5KgEqX)yweg@|9gEn4yE$D{g5Kw;@bn$_{4zXy_VUc?~YNfh<xx*;*`i9Piq#Xmy^
z>DsDmDjjc^U>e~y62j{?rz#!nf>7^rV_LO~wNBD&GV`~r-|do^l6v`7KaIILKQfzN
z=K{>Ps}A{3W`;X=M<;LzJ?E)0NCHxNzmL}ahIze|sS7}7XeEa^6Jul1sXIVuG>uM2
znPoKZG-re%o?TF5!a?H-;1EB&tNCdiD_ml$q(u4i1B_xYlWpLUm)APbBnc|`8vF5-
z)X}Xgu?1>Y(JEc&&F0Dl5M`+a6vyVhxnL!a9zVvRVF+7kH2|~N(4wG)X5%gRYi$d6
zLrGYt`kbmj^^UfmOG-7xd8@$5Xa$2D%0I{ATDAKIUOy_(CKcX*5sI?cPMuz2qrcY=
z<lVzV>^ql5Hk4(JYjswZ?^O*VZ|gz$e)@EG)S`*tRZUqAH_<Y&c}2k?KH{;uV7Yd)
z4=figR$Gnk<3}~t54L9;t}gf<Wyj#7WkC4ZuF~0=l}aT049~u;J$~iSqnAi-PBuqQ
zE6Xe&S8D{5LM!+UZ>DD0r3Q|w%$7?Z<0%TTh%=0Sb6>&|kWk%^(cEl%RkS2Va{mU^
zsysrF8$yKfXi{U9n{y%k%FZn>f+}Y3L&sd=N1TX{zJMU*iX|Kv-TUaCQ~!wlP{rHv
zTu=BZ(8dXnBCB0qLP@84Jg~chog9AwH>o9hD&?^`IZdoXcIeMH^0c>S{ji;QX5gBU
z`M|EDFTbgwQI-D3c&>@*(SgA8pbpL1k#lpwDE(&gu+7?KJ+^-6a;@?0G$$a<w2#yO
zhOsmzQfCZ#1+~Q$(W#xK0vh~BHB|+T#D>#0gyqbwEuFzKqFwR4Hrue&%01SWqQs4U
zBeCQywe~SRRK~PWe;{@}SUo@h%n?ANVKb&V$}x0#kn@$Fh9<mm{F_qyY{gYUhPeS%
zqih`LbMTKV4e-cq)-s7OT$HY3fr&3en7dv$AUND3{pxcRYKffT@QOs%*WvdHryJbK
z`>fiQ8}#SfFctEvzvXM?MwHx|UXJ_c?p;$g35V;0N0JM=)>iBy4FT-xYnTSG&P|@8
zv{6_5kwM(pUbIl0bpN6p0*6TF!9zzChN%iHR_<h0q$KHPhSZUe&$Ela0TmU03!=>;
z->JwQlPXM*TbNO?f@W`B*0gd*fdvrHSjDo>0jbwzmcI~JE)dvfH)|1S$c1eFfOp;e
z=h&DnFNLscJ|`oveY&8&3I%qQdwzeHKVr-9P4acQO?$r@<f)sOttJ$6w2@fZ;#d2#
zmZmCg5ls_Qee^)zVho(PC_4z0ndmUS6G>S#<lg#NR>CoN{aWw9BO(|0ak4PJn;x;s
z)*zkA(WX|4fqSKCX^^n*@u-ac8g?=ftl){nr@5RM4CXt%TefmsJCntQ>phSfMG<e4
zDQ00-v=tmFsHc>)Yo5*HaqNjK(O~m9oVj;(55p`@8(*}z6=}_NNK)8;k{gN?RyTTG
z44ln1Va(>RUEQ)RL0V^dt^nZ}AY6?L9d=v_BM1d&yCM9e{KX{dz;ULp^=kKK+V${S
zK1xv+I?|w9QL(f#PCyo`uM(FqaCt)wIlL4UM)6K+PmLBR6j)k<cYu%mX~w(N`@og6
z$3@)0y<PGx1oP%KmA6VI(@QK9;xi^tng?l@CM`}p*SAwD%l1%es^BaGR9hwAeK)t1
zfjo*Xrn`zj%@jKxOGG=}-nkH<UEX|GrtCjcJ-1xO3unFh&ZTWv6tmFK)Kp$oDT2YY
zsYy1uDx%qo9M`YlxX=D}cbNcpoMGi7zBmVzzG8&>#83h?ZTr>wY|V%)LcPr}Yc`j0
zDh}iUo$NXG-Cjs%%#Dw^0Syi6jct0?DsM3rwi_A}&a~~|AY>(rZp|ZyCjD3({9KHr
z9D=~V<dAwk&7#{TMuf96RdMOy=aNUNKg}T#A3JBuyGq)P5c+SJvNanw<=6)(uJKlc
z>F@`wD82#hn}vb4Kx`5<diA>w!6KEWxE_|pZ7Zxs?IPa9lI)A0pi9<!^U|8E4pXd;
z2x0Csn~11Ra05nH->AzTHX<ft6&dn<6j65Hg(i!=uIGSiR>q}mt3^l-8=ulBPO#%d
z!9G8@gUN=O%!cXud#U=_6h6^hb2P;0eUrH?ra@*9;<ww=0eSeZg*OHo4Ds`{f{RB4
z@J~7O-iKqachwBeyzK`p^;ZRn6!x`>1J-n2$?T}_NXjC9{)S`JK&cnvb)|wDZo1U?
z6?zE=&;N8)Ttf8?j{bc$FOn2yzgmLXd%I1-*DQKZc1(30<V_f=yXvzyIPc=npkV|M
z`u$%pBJ^X*0(f5nAwAx*EaWE3B#MNqX!C0bd=;-4LlTlJF~5II&7{}7{&i;eXxR)L
zV{FRz&G-Zb!p{x~8Ud$OlQV?4fTf+&lw^~p`_QmLe0}}y3cewmBabQ9_p@Y*j`l_X
zZD@F}q^vl_68@4+U=6LL$A;a=khTEc8Kz#GKyZJuW1v%$A+`bB*bqziU6J=2d>_1D
zq0qmfms5G)QHG%V0L07y{@8A8lrZWJ?{#;NYvHFxjP>&S_~Y8!*a442E8)g3ZJ8=u
z(=G8HM56w=b3{2$%xH;K+TuCJaN;F6a0q0th9>d9+**{3+}-C@Mdnqd!!#mI-}zk=
z(VOEd^KYE-*p}&wc&PfW)tcVU!zA6L*r3@uA{l5CgdCxed>dItl#n>G#MAN&OzVaT
zYvj!}+loK&+bWE50wBZ8exL8v*XK;rEK`XII|pyMyWsbWZ~U!?!0Kjv@?R8%jtUul
zP`*U-2_Wl@#8F8_+T?%)Z$VMj0g{A`$O1A^*dXcCoLT0_z^aA^4`;x|-jHTJacUh6
z>EbWyg%vG>!5ROwOiiA3A-gN}ttM?e^-=ZIEQwL>Z_f=4q!=9^W)2&iIFBr1H=+b4
z`4+F~2;NeYQ*!tbx98&oJQ!9T#1KkG<Ml`21cZMeUSaynZn~XneilViYV-<c6B3I4
znkhulQ9S1j#<1W|2V_CcLQzbSZZC%ENr!g@{bu-#2W0OejqCaPV=PIWn1j!5YTkaK
z)-o_2|1;P;xEl{qk2BQcfg{aaSehjzBQyH^Z@7sSbw%vhxUAmSS#kel31a)hmGg}J
z*u-1j<2@FlHsU;T7qZkeMLOny{zS`>E++7{_hLjZ9nIgt%J`7!6YLNU(QRWoF4#f<
ze0x(4;bwcHYXnQ#vO%-j={dz&XO7qsL9sR0zvGinGaO|(A}SFEC$@)BD@o;XxL#Z(
zaqw$CJ8JVaLxkX?s_~p?MV_GF8?rVz;zi6SpXe_W-l8f`O|Q@7EG3jCvd=XlTA=S7
z$2w~SmJdBqGHR~sub+7Yr?m_05!aqDyxOm?v&Eh@J~$oFb&~-hc!oC|8@O3b?#+#$
zpMe9myxDOl79s}Mri-hRe=)lPs}&2%S&9<H8}y3e#kKb4;>D%S4MbIqF)=EwCQo~D
ze*X~}C)U$Pu^ov=$l&mhgH|_wtI=@8lLF##UKC^hB`64feN~Wlv&Xq}WO@+J>|a{D
zTn0QJBG*j=w2wZTJ2y`<%8p(D=9X{o?-1H7X;U^a!}q1b_SdTP+bKYY+}8QJvEdu{
z89Sp!z2sdY(DrZs=-z0a4bGc2OuY?>FxElHzQNca3j!pV<4G6vs^smw0=2>tbHs;q
zTLwR1>F;3R?94>4f=cJv6S00hb^QVAE*Lucw^35O?j$>R)v94EoY1<C^~Bz~e+9Bm
z=-+$_arUZtuMat6p6~THx)#-dpnQ0Bx~@z<wEXa&mIs4YM+2AMLB3mhN!bkHijTIx
zFO(kCb_J48vAx5O$9TzQZ}E@Eb}YD73=Ti7#Uy&|dNZi(G(S`d;t7&uq3;Tca9~Dx
z09`XRBdBAjErhu}<^sXs3i8Hj)v`so&>iYRvtZf+`tL9=U@;etoEBS2m-K8~y>q2h
z+TExjWnE_+v4`$F!uQmhSg1WxuUFSm+o6dmp;MaUae)(u*Vj2R&xg3fmce$t?1#tf
zk0_i&rBmS)WMU!t<>tTkc?r`Xk#~0$KlA6il$KNe(we1If=OgIXYy?vQ|vzRD+{B=
oS{_Y-qD-8?{UU@;`u2yZH+RUI=>Ku7O+hf?7EJA-9$}#V2We-xwEzGB

literal 0
HcmV?d00001

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.4/config.rpath b/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/config.rpath
similarity index 99%
rename from meta/recipes-core/gettext/gettext-minimal-0.19.4/config.rpath
rename to meta/recipes-core/gettext/gettext-minimal-0.19.8.1/config.rpath
index b625621..98183ff 100755
--- a/meta/recipes-core/gettext/gettext-minimal-0.19.4/config.rpath
+++ b/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/config.rpath
@@ -2,7 +2,7 @@
 # Output a system dependent set of variables, describing how to set the
 # run time search path of shared libraries in an executable.
 #
-#   Copyright 1996-2014 Free Software Foundation, Inc.
+#   Copyright 1996-2016 Free Software Foundation, Inc.
 #   Taken from GNU libtool, 2001
 #   Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
 #
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.4/remove-potcdate.sin b/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/remove-potcdate.sin
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.19.4/remove-potcdate.sin
rename to meta/recipes-core/gettext/gettext-minimal-0.19.8.1/remove-potcdate.sin
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.19.4.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.19.8.1.bb
similarity index 93%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.19.4.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.19.8.1.bb
index 1d4a443..26ff199 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.19.4.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.19.8.1.bb
@@ -15,11 +15,10 @@ INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
 LICENSE = "FSF-Unlimited"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1b20675cd5158442f6007d022f46b35b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bd090a20bfcd1a18f1f79837b5e3e91"
 
 inherit native
 
-
 S = "${WORKDIR}"
 
 do_install () {
-- 
2.9.0


