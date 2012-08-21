Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3gBT-0003M1-Mb
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 06:35:19 +0200
Received: by dajt11 with SMTP id t11so2253926daj.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 21:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pHszG5zwhpw5yQJydPgd9OB4m0i4ereolvsq6uT/sqY=;
	b=M12sCWYcn/CNbeipUCbv173VoMa5+fDPEXbduW4Vob2o6oulPda7Ibi1BPFsBaYr0l
	ijvkphujp6EqlsoUPeXQAFLCqw4285Pd/N6yPZcU0hJoNtTyvtcc3FQHCYOfap1w78mm
	2veAfHT/zF1ljqMO+rsV1nAfekWVFo+XZtVauwSfxldO4fMneVqNyZ98a823WnKGeqAD
	F1QeiogOR9qtAKIVyGWj0/iAJZ3/zwS7/yrVX9kBxD3LzlHMYxViz17wk9ian6pFa5Ns
	9WvVQhYrNiVB74jfrtol8lKhgJ7fhJqQkrNFtMYaNv6WCcpQYthnP8kNlaGDhjczBJFS
	vyVQ==
Received: by 10.68.241.99 with SMTP id wh3mr40751250pbc.16.1345522995625;
	Mon, 20 Aug 2012 21:23:15 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id io1sm547954pbc.67.2012.08.20.21.23.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 21:23:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 21:22:39 -0700
Message-Id: <1345522959-20853-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] qemu-git: Move to tip of git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 04:35:20 -0000

There are a lot of armv7 and sh4 fixes that
its worth moving to latest version. The patch
forward porting can happen later.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin |  Bin 0 -> 4096 bytes
 meta/recipes-devtools/qemu/qemu_git.bb             |   15 +++++----------
 2 files changed, 5 insertions(+), 10 deletions(-)
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
index e75f240..4c79af9 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -1,25 +1,20 @@
 require qemu.inc
 
-SRCREV = "56a60dd6d619877e9957ba06b92d2f276e3c229d"
+SRCREV = "682527c00409d676c0d3b9fac99ca3b2fdfd6d2c"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PV = "0.14.0"
-PR = "r4"
+PV = "1.1+git"
+PR = "r0"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}/:${FILE_DIRNAME}/qemu-git/"
 FILESDIR = "${WORKDIR}"
 
 SRC_URI = "\
     git://git.qemu.org/qemu.git;protocol=git \
-    file://no-strip.patch \
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
1.7.9.5



