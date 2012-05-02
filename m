Received: from mail-pz0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPgj7-0000Jb-7v
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:04:45 +0200
Received: by mail-pz0-f45.google.com with SMTP id v2so493772dad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 13:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=MIMUSSEBUYZLwnQfPQ0A808P1+QX+lnGjYWcWwjc1Ms=;
	b=mwqstS7ElC1AK+f/Bx2ts62GsGA1BnF8t4mZx1G5sxmjdHSwXzH3WUQalud2lcw+B4
	Fzget53Zj5OMQyExc2mqaoHuUPb+W96loO3Cueoj8tVJk0H+KqxD7jlgRwU2MDSiwj0/
	7/MB6aPJHjjUwhjqHT896AjyA5oTkmMJJZsfOGIRvpSEoQ5bE9qekWuvXQE1fczct91T
	K+N8cC2VfAnRPD8q5qa3Pgf8udD4YzQ+2RN7RibziDfTjGwKjfNT6zyY7myJQylPcewZ
	jBPuV9FxOQEEWf48TeEXlu6VeEqw8V7AhySQaDFB4ZcIys4iK7Vgu3ci1uhU0CKtPsh1
	7lZg==
Received: by 10.68.212.193 with SMTP id nm1mr610441pbc.156.1335992102407;
	Wed, 02 May 2012 13:55:02 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pg6sm2949558pbb.41.2012.05.02.13.55.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 13:55:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 13:53:57 -0700
Message-Id: <8a8244b52f00dfa050e24bb233cef31e5a4d91e9.1335991900.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
References: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335991900.git.raj.khem@gmail.com>
References: <cover.1335991900.git.raj.khem@gmail.com>
Subject: [PATCH 4/7] qemu-git: Move to tip of git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2012 21:04:45 -0000

There are a lot of armv7 and sh4 fixes that
its worth moving to latest version. The patch
forward porting can happen later.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin |  Bin 0 -> 4096 bytes
 meta/recipes-devtools/qemu/qemu_git.bb             |   18 +++++-------------
 2 files changed, 5 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin

diff --git a/meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin b/meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
new file mode 100644
index 0000000000000000000000000000000000000000..c4044296c51529878f5d2a46230949d09ef1d4e2
GIT binary patch
literal 4096
zcmeHJQEMDk6h4#Pn8Z}5VUd7UHb$_7oo16ZWvl_Wq7bx}RV;`Ib~1CD44Ivo&djz(
z20DZ^Sm;B1^P!YL$|?xr50Dxx<W1-=Nb#jAB1A;VL+N<VoqKm?mo4n8m<wmm`OZ1_
zyXT&{cV+<&$6*H!JMdrW!2M?){{b*MgY{|vBVVIFj`A$ZQ4}1?4fK1d-SMjkR6spQ
z_GQ*+=6p}1edN8j-n~$%zt8GvfO5${M!BlzGeJ!LBFYOW#4B+{V8!s70opWVtXD3@
zDYsT7E6WA+<uUG+56Lw@`umUh__@Kqf6n8Nx^M%7WfVF8S{METF%22NokAEuO`<ed
z!}V9WmvV;4>hcYvi`OX{&F6WBRnw|kl?KhhA=dzmNj!qa7`0aw&RpKS@@VUVz<iB3
zMpQ$|xW4%zN%nJ?dQI!dwdlD}J%p)_T~Q;N05Shf4N8(@M;Ibka{YvEauGg?vIjtA
zbqtD8FaGQiqq(Cfl+!&ZM!lezVg)+I$)>XgU6}SL_e61d_GCWQDdT+4h>0J6J|vY6
z?n%vooL{&VPxp1(X12&CZmJJ@_@6`fnCE!)^YzN9>I}3^S{w(>9Y>+QAbsI`)YLe%
zhsb^kg>uN3pwJm3OoIDU=pIs8v?nECzNOo>lb47s&EaP<^|yU5q9tpZ%W9g#!{`Jv
zr|0H!wb2^S$51#BeALr<I95i*YdC^h)=oK8XTDy_e`39s6Efd#dZB8#PUySXQy=qb
zi2XtSc~LLG(q`vgB_qvg-;s)C8L6AkMN@f2<h+bp)Cgs?d9P4!Wp?qtu*JH{JmPj=
z9X5+MwRTe6R?5lm8zJYFbLBH3ET5Y^zkF@UH=8!Po3GplAFV<2I`~fY=BxF=C+}Vd
z-|60b7yIC&+PdqT)q3&`#C`C|bJS5^Z@xl5eDtl8^${oMHJ06gIf&9&36H?r)A;V4
z#+S@==jEcgSd;QG&rb6RyBX$`vA~Dw|Jwn1zD7)T#WL6@;i|`=;hOjXG2Diyht{Ia
zU{W_tp9O(xFxw7bGO#{l!uHt`7`AJysF!?pxyc-36&9O84uw{OE$RWwxh&Ptjb*0V
zmcvvc1M`U<9+ne0ptr1=y`Obs#c{9N%v@sN>&_Cx0<&mZafTbZr#AFp1v*?A3Nlm0
zZzgj>xMKNXQ@2&xYBnqPS-@>HKdpGnx?^IqQWS)y+YFH+ToxY7u|nTegHZRwP8V}b
zSae+sEb;%K*M1#ny}qNsYkLXA5B@1?u>#SJLhH*7Xlm<8f;#-X1y`fH6W_i8$-egB
zukYdwC~E6a_+TB*MCN`S^Bz_3)<>=KiD-M`L~SkEkMBZtb6dHCdSP>WD2n&sT(mn?
z+PpV(Q@b~GE4~eH#;xQaDju($jbT{3o+O+D*Tz`w>>7;I`r2-i+`I$ItrjS_{sHo6
zTN_Ym=RSmE(Ze$(%wLGV!aq8Lpw!l&igq#Dm@1(jj;@#MaSO(y^{Eo=O`A-R1mJvJ
aoLIp7h<sDgFE5ple~0izly{QHzx@jx&XA}8

literal 0
HcmV?d00001

diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index bcec9bb..6d2011c 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -1,28 +1,20 @@
 require qemu.inc
 
-SRCREV = "56a60dd6d619877e9957ba06b92d2f276e3c229d"
+SRCREV = "cf36b31db209a261ee3bc2737e788e1ced0a1bec"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PV = "0.14.0"
-PR = "r3"
+PV = "1.0+git"
+PR = "r0"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}/:${FILE_DIRNAME}/qemu-git/"
 FILESDIR = "${WORKDIR}"
 
 SRC_URI = "\
     git://git.qemu.org/qemu.git;protocol=git \
-    file://qemu-git-qemugl-host.patch \
-    file://no-strip.patch \
-    file://fix-nogl.patch \
-    file://qemugl-allow-glxcontext-release.patch \
-    file://linker-flags.patch \
-    file://qemu-vmware-vga-depth.patch \
-    file://enable-i386-linux-user.patch"
-
+    file://powerpc_rom.bin \
+    "
 S = "${WORKDIR}/git"
 
 DEFAULT_PREFERENCE = "-1"
-
-
-- 
1.7.5.4



