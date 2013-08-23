Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC40608A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 07:24:00 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id w20so204986lbh.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 00:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oaRxTnqhpuDcspKReQ1mOr7+4C84K+X1k5wXd75XS00=;
	b=RayevcHku1tLL2hPnPP0FWwyqk5bN8NyoIoY5JtTQ4bsI43NC9+7ALz5AM9zoxvlb/
	X1M+e0fCVNesqLDx2Tf3NZa1Owf/82z1wksNNEenWIgxADE3YoAaQi9EU8l58v451j1i
	z3WBmdg1Bdxsl8QURClJ7wdKI+8uL3inxFLS+W9YMz2v1A5wLcH+eTZ4ROIroThWohlM
	ZWnWHNo0t1oVRRXljv27ePQkXEl910rcjRQP6icPZ7uW/7LRqafKMBnOCPe+dj4sKTPf
	R+uGBzEnybyK61keQ83Uj0xvPKWNoSq88QMYIG35iqMsb0OAmFja5BDmFFEXjPorlmpd
	sgoA==
X-Received: by 10.112.143.3 with SMTP id sa3mr10057971lbb.12.1377242640146;
	Fri, 23 Aug 2013 00:24:00 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id f17sm6223117lbo.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 00:23:59 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VCliv-00081x-HK; Fri, 23 Aug 2013 10:23:57 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 10:23:55 +0300
Message-Id: <cover.1377242514.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] Updates to new bugfix releases
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
X-List-Received-Date: Fri, 23 Aug 2013 07:24:02 -0000

A couple of updates to upstream bugfix releases.

The following changes since commit e473e60d5572f36829068f6d3db9ce9ba9633d71:

  mkfontscale: This no longer needs a full libx11, xproto suffices (2013-08-22 18:29:50 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/up
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/up

Marko Lindqvist (2):
  gettext: update to upstream version 0.18.3.1
  ccache: update to upstream version 3.1.9

 .../gettext/{gettext-0.18.3 => gettext-0.18.3.1}/parallel.patch   |    0
 .../{gettext-minimal-0.18.3 => gettext-minimal-0.18.3.1}/COPYING  |    0
 .../Makefile.in.in                                                |    0
 .../Makevars.template                                             |    0
 meta/recipes-core/gettext/gettext-minimal-0.18.3.1/aclocal.tgz    |  Bin 0 -> 37591 bytes
 .../config.rpath                                                  |    0
 .../remove-potcdate.sin                                           |    0
 meta/recipes-core/gettext/gettext-minimal-0.18.3/aclocal.tgz      |  Bin 37586 -> 0 bytes
 ...inimal-native_0.18.3.bb => gettext-minimal-native_0.18.3.1.bb} |    0
 .../gettext/{gettext_0.18.3.bb => gettext_0.18.3.1.bb}            |    4 ++--
 meta/recipes-devtools/ccache/{ccache_3.1.8.bb => ccache_3.1.9.bb} |    5 ++---
 11 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-core/gettext/{gettext-0.18.3 => gettext-0.18.3.1}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3 => gettext-minimal-0.18.3.1}/COPYING (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3 => gettext-minimal-0.18.3.1}/Makefile.in.in (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3 => gettext-minimal-0.18.3.1}/Makevars.template (100%)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.3.1/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3 => gettext-minimal-0.18.3.1}/config.rpath (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3 => gettext-minimal-0.18.3.1}/remove-potcdate.sin (100%)
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.3/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.18.3.bb => gettext-minimal-native_0.18.3.1.bb} (100%)
 rename meta/recipes-core/gettext/{gettext_0.18.3.bb => gettext_0.18.3.1.bb} (97%)
 rename meta/recipes-devtools/ccache/{ccache_3.1.8.bb => ccache_3.1.9.bb} (43%)

-- 
1.7.10.4


