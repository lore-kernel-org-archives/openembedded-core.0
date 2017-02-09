Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 Feb 2017 11:54:58 UTC
Received: from root.phytec.de (mail.phycard.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 5B49271ADD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 11:54:58 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id A2298A003B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 12:50:10 +0100 (CET)
Received: from lws-mklieser.phytec.de ([172.16.26.112])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017020912495362-199224 ;
	Thu, 9 Feb 2017 12:49:53 +0100 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 9 Feb 2017 12:49:39 +0100
Message-Id: <1486640979-23531-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 09.02.2017 12:49:53,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 09.02.2017 12:49:53
X-TNEFEvaluated: 1
Subject: [PATCH] perf: add PACKAGECONFIG for jvmti
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
X-List-Received-Date: Thu, 09 Feb 2017 11:55:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Recent kernel build jvmti, java profiling agent, if a host jdk is
detected. The library will be packaged in -dev and throws a qa error.
Disable the jvmti build per default.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/pe=
rf.bb
index acbb1d9..ffaa5f6 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -21,6 +21,7 @@ PACKAGECONFIG[tui] =3D ",NO=5FNEWT=3D1,libnewt slang"
 PACKAGECONFIG[libunwind] =3D ",NO=5FLIBUNWIND=3D1 NO=5FLIBDW=5FDWARF=5FUNW=
IND=3D1,libunwind"
 PACKAGECONFIG[libnuma] =3D ",NO=5FLIBNUMA=3D1"
 PACKAGECONFIG[systemtap] =3D ",NO=5FSDT=3D1,systemtap"
+PACKAGECONFIG[jvmti] =3D ",NO=5FJVMTI=3D1"
=20
 DEPENDS =3D " \
     virtual/${MLPREFIX}libc \
--=20
1.9.1


