Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id D572C73802
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 14:16:50 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so520862wiw.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 06:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2LD7JccLQ3mdiXl+xp0s4mXksdHJ8kmrBKM9cd6z5vU=;
	b=FBV+HUv15hZ6W24qDAmmsQNm8AEV9oRDPb43EV0loIGtgpOOPlVOS33Xg9RwAB5dH5
	eVsYwZxHSycaDCIlWMA0rklOs56cK+JRNnPkUkj+giEht/tUJrxK2SCaxqeka81QQPsB
	Fu3KqM+UMwNXfZ/0nB0TUOMlCXstkO/YN6g+4/lHYawF7Qf6W+8dLgtFIlMo9iWWQ1wE
	6hSwFDd9mR+TarXOFovhvzhSONyQ9lts3FAOUmDdv7E4MpAWsE5Dc083w9YBqtijfLaf
	OvdXZf6kXMQaT7/edPOmVwCj3QIsL/90KPi7w1UiPUFIePeuQKDbouX3AfsnP3+W7VUa
	tEhA==
X-Gm-Message-State: ALoCoQlnSWE8PsEtveu0G3Z/Czt8le5xakY6eZ/0B9cxaUvCLi5/6huAM9p2iluJiTyW3ArXKGCd
X-Received: by 10.194.95.200 with SMTP id dm8mr28852116wjb.122.1425046610882; 
	Fri, 27 Feb 2015 06:16:50 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id dm6sm2991830wib.22.2015.02.27.06.16.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 06:16:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 14:14:22 +0000
Message-Id: <1425046462-10303-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1425046462-10303-1-git-send-email-ross.burton@intel.com>
References: <1425046462-10303-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] owl-video: remove
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
X-List-Received-Date: Fri, 27 Feb 2015 14:16:51 -0000

The testapps packagegroup was the only user of owl-video, and now that has been
replaced by gst-player this can be deleted.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-sato/owl-video-widget/libowl-av_git.bb |   24 ------------
 .../owl-video/owl-video-widget.desktop             |   10 -----
 .../owl-video/owl-video-widget.png                 |  Bin 4923 -> 0 bytes
 .../owl-video/stock_media-play.png                 |  Bin 329 -> 0 bytes
 .../owl-video-widget/owl-video/stock_volume-0.png  |  Bin 570 -> 0 bytes
 .../owl-video/stock_volume-max.png                 |  Bin 689 -> 0 bytes
 .../owl-video/stock_volume-med.png                 |  Bin 630 -> 0 bytes
 .../owl-video/stock_volume-min.png                 |  Bin 570 -> 0 bytes
 .../recipes-sato/owl-video-widget/owl-video_git.bb |   41 --------------------
 9 files changed, 75 deletions(-)
 delete mode 100644 meta/recipes-sato/owl-video-widget/libowl-av_git.bb
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/owl-video-widget.desktop
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/owl-video-widget.png
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/stock_media-play.png
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/stock_volume-0.png
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/stock_volume-max.png
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/stock_volume-med.png
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/stock_volume-min.png
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video_git.bb

diff --git a/meta/recipes-sato/owl-video-widget/libowl-av_git.bb b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
deleted file mode 100644
index 2b768d5..0000000
--- a/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "OpenedHand Widget Library Audio/Video"
-HOMEPAGE = "http://www.o-hand.com"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
-
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ac14b7ca45afea5af040da54db270eb0 \
-                    file://libowl-av/owl-video-widget.h;endline=22;md5=0d4caab10952acdf470086c25c7f70c8 \
-                    file://libowl-av/owl-audio-player.h;endline=22;md5=4af2d44f206a086f9f03881236f7390b"
-
-SECTION = "x11"
-DEPENDS = "gtk+ gstreamer gst-plugins-base"
-RDEPENDS_${PN} = "gst-meta-base"
-RRECOMMENDS_${PN} = "gst-meta-audio gst-meta-video"
-
-SRCREV = "03030c41ea578cfa74a2ffceb875675b248318ae"
-PV = "0.1+git${SRCPV}"
-PR = "r3"
-
-
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
diff --git a/meta/recipes-sato/owl-video-widget/owl-video/owl-video-widget.desktop b/meta/recipes-sato/owl-video-widget/owl-video/owl-video-widget.desktop
deleted file mode 100644
index e7af07e..0000000
--- a/meta/recipes-sato/owl-video-widget/owl-video/owl-video-widget.desktop
+++ /dev/null
@@ -1,10 +0,0 @@
-[Desktop Entry]
-Name=Video
-Exec=video
-Icon=video-player
-Terminal=false
-Type=Application
-Categories=AudioVideo;Video;Player;
-X-MB-SingleInstance=true
-StartupNotify=true
-Comment=Video Player
diff --git a/meta/recipes-sato/owl-video-widget/owl-video/owl-video-widget.png b/meta/recipes-sato/owl-video-widget/owl-video/owl-video-widget.png
deleted file mode 100644
index f463fe186481fa752a44aaae5dd020a1c37fa3df..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 4923
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

diff --git a/meta/recipes-sato/owl-video-widget/owl-video/stock_media-play.png b/meta/recipes-sato/owl-video-widget/owl-video/stock_media-play.png
deleted file mode 100644
index c2b9c582a16d56bd6d50715b4b92f0b8e55d33f0..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 329
zcmeAS@N?(olHy`uVBq!ia0vp^5+KaM1|%Pp+x`GjY)RhkE<hRxemd{22U45`9+AZi
z4BUbs%vhfiKM^SS($mE;#N+tg^BegNI>;RV82@yc+$@vpce4aLpBtF^-f!>~Wfszr
zc=?9YrAN+L>BicMj%PZvI*$JLv;Hvq|M$O78tUUY9dx}Hy!pBA58KJWKAZb@Un{97
z<dkm_6#BsH#OC*Wv6vH^MDmWi>rZh=KA5w3g1%B;GS9EWEGw6>?RnoRW2boQfVPlp
zpti6B2RnlR%R$vrAmeUa$JwfAbDresS`NL;42#`9?_s!Xa?sNM(OLh(rSb;H5^kHN
zea;k$54<;#@$@Exc|B7ec^xo{(m1ZEUA<4+_WsnMQ*N^!rcBj&%%HHT=l?OeY_`y=
T|5)_oKq2Dk>gTe~DWM4f|J;2Q

diff --git a/meta/recipes-sato/owl-video-widget/owl-video/stock_volume-0.png b/meta/recipes-sato/owl-video-widget/owl-video/stock_volume-0.png
deleted file mode 100644
index f3f57143d4e01b82dda70a79732b6240cd199ab7..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 570
zcmV-A0>%A_P)<h;3K|Lk000e1NJLTq000;O000;W1^@s6;CDUv00006VoOIv00000
z008+zyMF)x010qNS#tmY3ljhU3ljkVnw%H_000McNliru)&?6C9WcUiC$Inj0mn&1
zK~zY`?Uc()TR{}YfA>Zki%@dA)+XRm7d9qVcPg}nP&bhf!HsUZsxE{gS&POO{t*Td
zk!GW0)zW2KAq8I>A8^%x?IMguXlPZ&%}lsRDY;iS77rYlnRDj*=A7>^@L>1Gre-GI
zc)4d*3!cw^Uj>XiCvboR)ZQt929L+%`sj~af*R*0k?fOt-PRWF)!@%t!(_ABN?s_I
zmOzW0OYKx!L8Z5YgG0P}`5F!0@uHK)hG+T#TId#F+f4-qAORxb2&YYF1OfrNyLvE9
zlW*%^b^ZXbX6I5np;#KX1OR;c{E<STKr+$K-u^B>ex6Y0f2_lux6%NhSS%uhU~_AO
zqvIni%c5K^>+qLbPf;)!BpPjJA+ta<(vA=UA%qSuDv_H#SCGkMDpNE&H?unYZiG^)
z1i;Gjhc%V9t%UYuhH`UqYP>g*?2`uv`%;at;RQ^$N&-HI8-VZq*l5hQ50_L0e&9k+
zoEr_KT0a8nl|KQV&Q8zgt$_7b<@u}qziw85dbJ;@a{$#Uovwi2z&Y?s?OhWXiljz?
z>%DH@r6Rd<(<0*^XHI>5>Z6lhMRt?-SCUXHZ2;K0l;pp%YlkF}Rd}@(1poj507*qo
IM6N<$f(9${$^ZZW

diff --git a/meta/recipes-sato/owl-video-widget/owl-video/stock_volume-max.png b/meta/recipes-sato/owl-video-widget/owl-video/stock_volume-max.png
deleted file mode 100644
index 03f5a03b45015227b67c665dee75513e5b6855bb..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 689
zcmV;i0#5yjP)<h;3K|Lk000e1NJLTq000;O000;W1^@s6;CDUv00006VoOIv00000
z008+zyMF)x010qNS#tmY3ljhU3ljkVnw%H_000McNliru)&?6C9tTn3(R=^^0zOGZ
zK~zY`?Ul=G6Hye#e=~`X3PK{d5Ud$!?Ir~^O`-)CDyR^ui-?GHQ^ChZ-P#nyh1kUE
zO8pBOx+tNMKFCTbMZpJDtR^6}h1jmcXaqyVGH%W-*Xab3?i9~vzPWSmch33Fxp&~d
z{WX>ux!1RueP*-d^Yibf0i%(Rl}Nw066tWu0W@-eEiO_=Bkc$7xPzF@kSCK#we-{F
z(hU@?L^@n9q)NaSpi_77>o4aooO2ZJ>4}_C<cAJM$mjEaWDazf3#pQoNauvK1bhOH
z0+a3v*0miNxWuWGr%~ib4)@Z&cb`h2PtRQNn8*XL41~NYFaQT28j13?;~RlMfaAwb
zV45ax-o8fDc}6l<YfC_v;8hKKSMYrH8Iw~_iO1r6URq@C#VqxDU48C#_er!rAb43}
z&mI6&Div(o=EKJYR#sOC27}aUHTC(G$9RT;1;HH(H=LqSC`2q4XEZxXEE>nQZEV{{
z(;L?)b^?on+coT6K{lIRpP~m3N2YIFze%-P1t2#*F(Yn8X|(FgnBYA!sv82V34x*d
zksF^dhBJ51K7R6ODl>c^eHhAxl%ZA9C5;A%0582HGG((L*b1}(Z9{{%=PWC9ad7As
z+DX>0iz3i3Qx(>xYJ(Yo57+_h0(MKe7O?;7waZuJ5bhMertcy>8y~O@*e*{~GWLsv
zb>KVjLrL0<86H*mHOYK}9pIM)SyP9y)d21_L+g)EE;^^x|ADayKc_(t3^~mX|CId(
X&^^J%JCVzU00000NkvXXu0mjfEuAP@

diff --git a/meta/recipes-sato/owl-video-widget/owl-video/stock_volume-med.png b/meta/recipes-sato/owl-video-widget/owl-video/stock_volume-med.png
deleted file mode 100644
index f774e42bb188975ae550e824c3a142597eb3d05a..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 630
zcmV-+0*U>JP)<h;3K|Lk000e1NJLTq000;O000;W1^@s6;CDUv00006VoOIv00000
z008+zyMF)x010qNS#tmY3ljhU3ljkVnw%H_000McNliru)&?6C9XcYU&aMCe0s~1z
zK~zY`?Uc`J6G0TmKf8%PDhP?-L8xZI>cxVZCaJxtpu*B#Qc96rDrmi^SKERo(Jj@#
zqM-*VMzp0Tr4$eTfQr@RQd21P97a<xL@ev&O&AwRvcZFb50-f|^Y(q;_x%|7FaL~8
z&)ggA<UhMz=c}vl769vy0~pQ$cA0mM>-moBo#+@qJI`jb`sjPWq!%bQ1BsfOk<npa
z>wSI6A?^J1sU(F$;g`sP-p!@SlH+>wKo3xA#-Negv9T*$yl@Ha{7nA<hr5sH00zy-
zMV|w5tr%E<50FZx_;U0su~>|AXU}8XHgDd(*7iAIQ6kr8W#D+L8Z;QZSbomaXHUqa
zGkhwqv+{D8dcCf%2Z9bZmnKWV$+l_$P^nZ<O7Y?28e5;Yh{xm9YBhcRDrheSUTeFH
z5{U%qbcWgdEa_ARr4&jjjC>R5njT=iZ3g*#zR^Vw9?mS>ym5<awF<!eqsNP4R+K{P
zy3B<cK1)9P{`B3Uk<np)W25X#3tPeTIIj1;*&Nu$Y6+v=Ko`(8HF0OfaT1p&rfy?Q
zvI$ZIa#HA)QAdD%zyaVOa0qaKW8>GaUK0lU#V%Ajv_ybCz+PExi8u=E0Civ+_$K?%
z0GdVANLfU5ANV04J9;R?0tC-2qdpON==`wHwbg;$Z$TW_vt+VE2l02yPyEEC+~}H!
QKL7v#07*qoM6N<$g0^-Ym;e9(

diff --git a/meta/recipes-sato/owl-video-widget/owl-video/stock_volume-min.png b/meta/recipes-sato/owl-video-widget/owl-video/stock_volume-min.png
deleted file mode 100644
index f3f57143d4e01b82dda70a79732b6240cd199ab7..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 570
zcmV-A0>%A_P)<h;3K|Lk000e1NJLTq000;O000;W1^@s6;CDUv00006VoOIv00000
z008+zyMF)x010qNS#tmY3ljhU3ljkVnw%H_000McNliru)&?6C9WcUiC$Inj0mn&1
zK~zY`?Uc()TR{}YfA>Zki%@dA)+XRm7d9qVcPg}nP&bhf!HsUZsxE{gS&POO{t*Td
zk!GW0)zW2KAq8I>A8^%x?IMguXlPZ&%}lsRDY;iS77rYlnRDj*=A7>^@L>1Gre-GI
zc)4d*3!cw^Uj>XiCvboR)ZQt929L+%`sj~af*R*0k?fOt-PRWF)!@%t!(_ABN?s_I
zmOzW0OYKx!L8Z5YgG0P}`5F!0@uHK)hG+T#TId#F+f4-qAORxb2&YYF1OfrNyLvE9
zlW*%^b^ZXbX6I5np;#KX1OR;c{E<STKr+$K-u^B>ex6Y0f2_lux6%NhSS%uhU~_AO
zqvIni%c5K^>+qLbPf;)!BpPjJA+ta<(vA=UA%qSuDv_H#SCGkMDpNE&H?unYZiG^)
z1i;Gjhc%V9t%UYuhH`UqYP>g*?2`uv`%;at;RQ^$N&-HI8-VZq*l5hQ50_L0e&9k+
zoEr_KT0a8nl|KQV&Q8zgt$_7b<@u}qziw85dbJ;@a{$#Uovwi2z&Y?s?OhWXiljz?
z>%DH@r6Rd<(<0*^XHI>5>Z6lhMRt?-SCUXHZ2;K0l;pp%YlkF}Rd}@(1poj507*qo
IM6N<$f(9${$^ZZW

diff --git a/meta/recipes-sato/owl-video-widget/owl-video_git.bb b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
deleted file mode 100644
index db83154..0000000
--- a/meta/recipes-sato/owl-video-widget/owl-video_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "OpenedHand Widget Library video widget"
-HOMEPAGE = "http://o-hand.com/"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
-LICENSE = "LGPLv2.1 & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ac14b7ca45afea5af040da54db270eb0 \
-                    file://src/video.c;endline=22;md5=e8e9f23c3691c11af7d8fc03264ca9da \
-                    file://src/bacon-volume.c;endline=20;md5=798804562b24e30bac482ba91c45e46d"
-SECTION = "x11"
-DEPENDS = "libowl-av"
-
-SRCREV = "07ab48f331a5e6e0d169e4892c7eb1fc22dc0b9d"
-PV = "0.1+git${SRCPV}"
-PR = "r2"
-
-S = "${WORKDIR}/git"
-
-SRC_URI = "git://git.yoctoproject.org/${BPN} \
-           file://owl-video-widget.png \
-           file://stock_media-play.png \
-           file://stock_volume-0.png \
-           file://stock_volume-min.png \
-           file://stock_volume-med.png \
-           file://stock_volume-max.png \
-           file://owl-video-widget.desktop"
-
-inherit autotools pkgconfig
-
-do_install_append () {
-	install -d ${D}/${datadir}/pixmaps
-	install -m 0644 ${WORKDIR}/stock_media-play.png ${D}/${datadir}/pixmaps
-	install -m 0644 ${WORKDIR}/stock_volume-0.png ${D}/${datadir}/pixmaps
-	install -m 0644 ${WORKDIR}/stock_volume-min.png ${D}/${datadir}/pixmaps
-	install -m 0644 ${WORKDIR}/stock_volume-med.png ${D}/${datadir}/pixmaps
-	install -m 0644 ${WORKDIR}/stock_volume-max.png ${D}/${datadir}/pixmaps
-	install -m 0644 ${WORKDIR}/owl-video-widget.png ${D}/${datadir}/pixmaps
-
-	install -d ${D}/${datadir}/applications
-	install -m 0644 ${WORKDIR}/owl-video-widget.desktop ${D}/${datadir}/applications
-}
-
-FILES_${PN} += "${datadir}/video"
-- 
1.7.10.4


