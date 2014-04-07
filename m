Return-Path: <sgh@sgh.dk>
Received: from mx-aarh-3.stofanet.dk (mx-aarh-3.stofanet.dk [212.10.10.13])
	by mail.openembedded.org (Postfix) with ESMTP id A8EB06F8E4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 21:21:16 +0000 (UTC)
Received: from 5634f347.rev.stofanet.dk ([86.52.243.71] helo=asrock)
	by mx-aarh-3.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1WXGyh-0001Kz-22
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Apr 2014 23:21:15 +0200
Received: from koontz.sgh.dk (localhost [127.0.0.1])
	by asrock (Postfix) with ESMTP id 1C95D7EC32;
	Mon,  7 Apr 2014 23:21:15 +0200 (CEST)
From: =?UTF-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Apr 2014 23:20:55 +0200
Message-Id: <1396905655-4084-1-git-send-email-sgh@sgh.dk>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: =?UTF-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
Subject: [PATCH] mesa: Avoid picking up the "local" wayland-scanner.
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
X-List-Received-Date: Mon, 07 Apr 2014 21:21:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The generated headers turn out wrong and breaks compilation if
the local version is different from the target version.

Signed-off-by: S=C3=B8ren Holm <sgh@sgh.dk>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index afc795c..822b236 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -65,6 +65,7 @@ MESA_LLVM_RELEASE ?=3D "3.3"
 PACKAGECONFIG[gallium-llvm] =3D "--enable-gallium-llvm --with-llvm-share=
d-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_=
ENABLED} else ''}"
 export WANT_LLVM_RELEASE =3D "${MESA_LLVM_RELEASE}"
+export WAYLAND_SCANNER =3D "${STAGING_DIR_NATIVE}/usr/bin/wayland-scanne=
r"
=20
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append =3D " -fno-omit-frame-pointer"
--=20
1.9.1


