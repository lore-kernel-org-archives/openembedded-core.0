Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1D571AFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 09:07:06 +0000 (UTC)
Received: from dastp.fritz.box ([80.147.195.117]) by mail.gmx.com (mrgmx002
	[212.227.17.190]) with ESMTPSA (Nemesis) id 0LkOaJ-1c7gy73jvX-00cPEE;
	Thu, 16 Feb 2017 10:07:01 +0100
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 10:06:24 +0100
Message-Id: <20170216090624.3925-1-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Provags-ID: V03:K0:MImVwvl2bWuF1GcKJroKoW069U2fi9O52tnD6GmrpcxsD2f+9i1
	HunzgBrs6eA3P1hC1iu8UJVC8/p0i+AXFd0Jt9E4l/Zg5uvOSZQCnksjMhSZkkJBGEvcNGP
	wkQCvu6etsHYvTnAhx1aoRfIqX5aJfMdq8OROAVn9ydhaeQIBSW1kwub9EdTD+Pd6etMqTH
	FxxpDM7IRWWzUD6RCa2bg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:8jKS1d7Efxw=:xyyMKO7dyQTku/KJBj9jnI
	mB9BppNiAslylPlVqTQf6w9Qen9upIvnxnqzoczKA//82wy1e6z1f81xVOUXXYuya400jSPR+
	SQj94ahFLCZMQhSduuuYpSPhMMk05WKR9aPA7cWKIRlatfn1Hz0O9F0Y1TmzDsWqCxa6xQ3kD
	QMfTzm+EMMmdb/O3ohjDbvHYQkUZE+p1Mb0Jmx2FwOSh5QXqpkRHQoOIWB+XNB6JNVe/qhwvJ
	d5Q/YSbwZmixo5ZXurzgkkuFVDYPt1nMvB/4FzgSGecMLms7YVP5fDWmN/hLDQCsIJDt1T2Er
	z4iXSuZsVXoW6l1tkMEkVXnRIxtJb94/9bnr/FWhVAMogEcdenqnovFCOPDtqJ/zUe6wvtycq
	t9t+DGUl5E4ThiZa4MoCJy4czL0PRd8pZr8wLBHpwywvUC0bjbWSn1VkrQwOAFWVmWM9biKyc
	hfxPmUb6LSY04WZ8QgE03f7Yig/wT541f9QuXns1DpPpZoVUcvXcmcSg1YtkFjRYhdkL/o0/w
	mhLIW09vWuzTKn9Wk/m9y1+L0Ff8OTjX2lh8hfYIm6/Vmfsyq0SuShAWXNFC01a8pY5WDp8j6
	3amNVJaQf0Xg1gDFeaS5Yno9BojrWr6Qc3sGhiP5MWPNpfCR5tluQttHFJJTn/oP8Oy/ArBnc
	a+2oH1xb8FrHpYvjXIDWBeSvll5U37S/uaYrlqy+Utwrp02HX9zixXvDu5Gnqa3cZGOEbQfp2
	Z5w/BZqJY66fvCG56wTNsifLqQDyGSSsXY8TcfdDsUvFwuZQSUASl62xIQK0n2rA3hfnUOjl5
	7xfyPCl
Cc: bigeasy@linutronix.de
Subject: [PATCH] bitbake.conf: Point KERNELORG_MIRROR to cdn.kernel.org
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
X-List-Received-Date: Thu, 16 Feb 2017 09:07:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use cdn.kernel.org to distribute the server load and improve download speeds.
Leave www.kernel.org in MIRRORS as a fallback.

See https://www.kernel.org/introducing-fastly-cdn.html

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e421650db8..16235a43d2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -584,7 +584,7 @@ GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
 GNU_MIRROR = "http://ftp.gnu.org/gnu"
 GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
 GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
-KERNELORG_MIRROR = "http://kernel.org/pub"
+KERNELORG_MIRROR = "http://cdn.kernel.org/pub"
 SOURCEFORGE_MIRROR = "http://downloads.sourceforge.net"
 XLIBS_MIRROR = "http://xlibs.freedesktop.org/release"
 XORG_MIRROR = "http://xorg.freedesktop.org/releases"
-- 
2.11.0


