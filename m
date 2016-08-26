Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phytec.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id C0DDF734B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 10:16:10 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 45481A00259
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 12:16:19 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016082612161015-108743 ;
	Fri, 26 Aug 2016 12:16:10 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 12:16:04 +0200
Message-Id: <1472206573-29621-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 26.08.2016 12:16:10,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 26.08.2016 12:16:10
X-TNEFEvaluated: 1
Subject: [PATCH 0/9] remove EXTRA_OEMAKE workaround
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
X-List-Received-Date: Fri, 26 Aug 2016 10:16:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

since 2-2-2016 the EXTRA=5FOEMAKE default has been set empty. The
"-e MAKEFLAGS=3D" got removed. I guess it is time to clean up the recipes
which need to work around those defaults. I tried my best to walk
through the include hierarchy to find any double workarounds. But
everything seems fine and a handful of different machines and distros
build fine. I hope this is reasonable.

Regards, Stefan

Stefan M=C3=BCller-Klieser (9):
  autotools.bbclass: remove EXTRA=5FOEMAKE workaround
  distutils-common-base.bbclass: remove EXTRA=5FOEMAKE workaround
  kernel.bbclass: remove EXTRA=5FOEMAKE workaround
  ifupdown: remove EXTRA=5FOEMAKE workaround
  musl: remove EXTRA=5FOEMAKE workaround
  lsof: remove EXTRA=5FOEMAKE workaround
  linux-libc-headers: remove EXTRA=5FOEMAKE workaround
  systemtap: remove EXTRA=5FOEMAKE workaround
  x264: remove EXTRA=5FOEMAKE workaround

 meta/classes/autotools.bbclass                                | 2 --
 meta/classes/distutils-common-base.bbclass                    | 2 --
 meta/classes/kernel.bbclass                                   | 4 ----
 meta/recipes-core/ifupdown/ifupdown=5F0.8.2.bb                  | 2 --
 meta/recipes-core/musl/musl=5Fgit.bb                            | 2 --
 meta/recipes-extended/lsof/lsof=5F4.89.bb                       | 2 --
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 3 ---
 meta/recipes-kernel/systemtap/systemtap-uprobes=5Fgit.bb        | 2 --
 meta/recipes-multimedia/x264/x264=5Fgit.bb                      | 2 --
 9 files changed, 21 deletions(-)

--=20
1.9.1


