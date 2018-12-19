Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 30F027BFBC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 07:29:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2018 23:29:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,371,1539673200"; d="scan'208";a="119597364"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.21.206])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2018 23:29:37 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 15:29:27 +0800
Message-Id: <20181219072929.5870-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219072929.5870-1-anuj.mittal@intel.com>
References: <20181219072929.5870-1-anuj.mittal@intel.com>
Subject: [PATCH 7/9] common-licenses: update Libpng license text
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
X-List-Received-Date: Wed, 19 Dec 2018 07:29:37 -0000

The new libpng license comprises the terms and conditions from the zlib
license, and the disclaimer from the Boost license. The legacy libpng
license license, used until libpng-1.6.35, is appended to the
new license, following the precedent established in the Python Software
Foundation License version 2.

See for details:

https://sourceforge.net/projects/libpng/files/libpng16/1.6.36/

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/files/common-licenses/Libpng | 200 +++++++++++++++++-------------
 1 file changed, 111 insertions(+), 89 deletions(-)

diff --git a/meta/files/common-licenses/Libpng b/meta/files/common-licenses/Libpng
index a9d5b031b0..62ab8e48dc 100644
--- a/meta/files/common-licenses/Libpng
+++ b/meta/files/common-licenses/Libpng
@@ -1,112 +1,134 @@
-
-This copy of the libpng notices is provided for your convenience.  In case of
-any discrepancy between this copy and the notices in the file png.h that is
-included in the libpng distribution, the latter shall prevail.
-
-COPYRIGHT NOTICE, DISCLAIMER, and LICENSE:
-
-If you modify libpng you may insert additional notices immediately following
-this sentence.
-
-This code is released under the libpng license.
-
-libpng versions 1.2.6, August 15, 2004, through 1.4.5, December 9, 2010, are
-Copyright (c) 2004, 2006-2010 Glenn Randers-Pehrson, and are
-distributed according to the same disclaimer and license as libpng-1.2.5
-with the following individual added to the list of Contributing Authors
-
-   Cosmin Truta
-
-libpng versions 1.0.7, July 1, 2000, through 1.2.5 - October 3, 2002, are
-Copyright (c) 2000-2002 Glenn Randers-Pehrson, and are
-distributed according to the same disclaimer and license as libpng-1.0.6
-with the following individuals added to the list of Contributing Authors
-
-   Simon-Pierre Cadieux
-   Eric S. Raymond
-   Gilles Vollant
+COPYRIGHT NOTICE, DISCLAIMER, and LICENSE
+=========================================
+
+PNG Reference Library License version 2
+---------------------------------------
+
+ * Copyright (c) 1995-2018 The PNG Reference Library Authors.
+ * Copyright (c) 2018 Cosmin Truta.
+ * Copyright (c) 2000-2002, 2004, 2006-2018 Glenn Randers-Pehrson.
+ * Copyright (c) 1996-1997 Andreas Dilger.
+ * Copyright (c) 1995-1996 Guy Eric Schalnat, Group 42, Inc.
+
+The software is supplied "as is", without warranty of any kind,
+express or implied, including, without limitation, the warranties
+of merchantability, fitness for a particular purpose, title, and
+non-infringement.  In no even shall the Copyright owners, or
+anyone distributing the software, be liable for any damages or
+other liability, whether in contract, tort or otherwise, arising
+from, out of, or in connection with the software, or the use or
+other dealings in the software, even if advised of the possibility
+of such damage.
+
+Permission is hereby granted to use, copy, modify, and distribute
+this software, or portions hereof, for any purpose, without fee,
+subject to the following restrictions:
+
+ 1. The origin of this software must not be misrepresented; you
+    must not claim that you wrote the original software.  If you
+    use this software in a product, an acknowledgment in the product
+    documentation would be appreciated, but is not required.
+
+ 2. Altered source versions must be plainly marked as such, and must
+    not be misrepresented as being the original software.
+
+ 3. This Copyright notice may not be removed or altered from any
+    source or altered source distribution.
+
+
+PNG Reference Library License version 1 (for libpng 0.5 through 1.6.35)
+-----------------------------------------------------------------------
+
+libpng versions 1.0.7, July 1, 2000 through 1.6.35, July 15, 2018 are
+Copyright (c) 2000-2002, 2004, 2006-2018 Glenn Randers-Pehrson, are
+derived from libpng-1.0.6, and are distributed according to the same
+disclaimer and license as libpng-1.0.6 with the following individuals
+added to the list of Contributing Authors:
+
+    Simon-Pierre Cadieux
+    Eric S. Raymond
+    Mans Rullgard
+    Cosmin Truta
+    Gilles Vollant
+    James Yu
+    Mandar Sahastrabuddhe
+    Google Inc.
+    Vadim Barkov
 
 and with the following additions to the disclaimer:
 
-   There is no warranty against interference with your enjoyment of the
-   library or against infringement.  There is no warranty that our
-   efforts or the library will fulfill any of your particular purposes
-   or needs.  This library is provided with all faults, and the entire
-   risk of satisfactory quality, performance, accuracy, and effort is with
-   the user.
+    There is no warranty against interference with your enjoyment of
+    the library or against infringement.  There is no warranty that our
+    efforts or the library will fulfill any of your particular purposes
+    or needs.  This library is provided with all faults, and the entire
+    risk of satisfactory quality, performance, accuracy, and effort is
+    with the user.
+
+Some files in the "contrib" directory and some configure-generated
+files that are distributed with libpng have other copyright owners, and
+are released under other open source licenses.
 
 libpng versions 0.97, January 1998, through 1.0.6, March 20, 2000, are
-Copyright (c) 1998, 1999 Glenn Randers-Pehrson, and are
-distributed according to the same disclaimer and license as libpng-0.96,
-with the following individuals added to the list of Contributing Authors:
+Copyright (c) 1998-2000 Glenn Randers-Pehrson, are derived from
+libpng-0.96, and are distributed according to the same disclaimer and
+license as libpng-0.96, with the following individuals added to the
+list of Contributing Authors:
 
-   Tom Lane
-   Glenn Randers-Pehrson
-   Willem van Schaik
+    Tom Lane
+    Glenn Randers-Pehrson
+    Willem van Schaik
 
 libpng versions 0.89, June 1996, through 0.96, May 1997, are
-Copyright (c) 1996, 1997 Andreas Dilger
-Distributed according to the same disclaimer and license as libpng-0.88,
-with the following individuals added to the list of Contributing Authors:
+Copyright (c) 1996-1997 Andreas Dilger, are derived from libpng-0.88,
+and are distributed according to the same disclaimer and license as
+libpng-0.88, with the following individuals added to the list of
+Contributing Authors:
 
-   John Bowler
-   Kevin Bracey
-   Sam Bushell
-   Magnus Holmgren
-   Greg Roelofs
-   Tom Tanner
+    John Bowler
+    Kevin Bracey
+    Sam Bushell
+    Magnus Holmgren
+    Greg Roelofs
+    Tom Tanner
+
+Some files in the "scripts" directory have other copyright owners,
+but are released under this license.
 
 libpng versions 0.5, May 1995, through 0.88, January 1996, are
-Copyright (c) 1995, 1996 Guy Eric Schalnat, Group 42, Inc.
+Copyright (c) 1995-1996 Guy Eric Schalnat, Group 42, Inc.
 
 For the purposes of this copyright and license, "Contributing Authors"
 is defined as the following set of individuals:
 
-   Andreas Dilger
-   Dave Martindale
-   Guy Eric Schalnat
-   Paul Schmidt
-   Tim Wegner
-
-The PNG Reference Library is supplied "AS IS".  The Contributing Authors
-and Group 42, Inc. disclaim all warranties, expressed or implied,
-including, without limitation, the warranties of merchantability and of
-fitness for any purpose.  The Contributing Authors and Group 42, Inc.
-assume no liability for direct, indirect, incidental, special, exemplary,
-or consequential damages, which may result from the use of the PNG
-Reference Library, even if advised of the possibility of such damage.
+    Andreas Dilger
+    Dave Martindale
+    Guy Eric Schalnat
+    Paul Schmidt
+    Tim Wegner
+
+The PNG Reference Library is supplied "AS IS".  The Contributing
+Authors and Group 42, Inc. disclaim all warranties, expressed or
+implied, including, without limitation, the warranties of
+merchantability and of fitness for any purpose.  The Contributing
+Authors and Group 42, Inc. assume no liability for direct, indirect,
+incidental, special, exemplary, or consequential damages, which may
+result from the use of the PNG Reference Library, even if advised of
+the possibility of such damage.
 
 Permission is hereby granted to use, copy, modify, and distribute this
 source code, or portions hereof, for any purpose, without fee, subject
 to the following restrictions:
 
-1. The origin of this source code must not be misrepresented.
-
-2. Altered versions must be plainly marked as such and must not
-   be misrepresented as being the original source.
-
-3. This Copyright notice may not be removed or altered from any
-   source or altered source distribution.
-
-The Contributing Authors and Group 42, Inc. specifically permit, without
-fee, and encourage the use of this source code as a component to
-supporting the PNG file format in commercial products.  If you use this
-source code in a product, acknowledgment is not required but would be
-appreciated.
-
-
-A "png_get_copyright" function is available, for convenient use in "about"
-boxes and the like:
-
-   printf("%s",png_get_copyright(NULL));
-
-Also, the PNG logo (in PNG format, of course) is supplied in the
-files "pngbar.png" and "pngbar.jpg (88x31) and "pngnow.png" (98x31).
+ 1. The origin of this source code must not be misrepresented.
 
-Libpng is OSI Certified Open Source Software.  OSI Certified Open Source is a
-certification mark of the Open Source Initiative.
+ 2. Altered versions must be plainly marked as such and must not
+    be misrepresented as being the original source.
 
-Glenn Randers-Pehrson
-glennrp at users.sourceforge.net
-December 9, 2010
+ 3. This Copyright notice may not be removed or altered from any
+    source or altered source distribution.
 
+The Contributing Authors and Group 42, Inc. specifically permit,
+without fee, and encourage the use of this source code as a component
+to supporting the PNG file format in commercial products.  If you use
+this source code in a product, acknowledgment is not required but would
+be appreciated.
-- 
2.17.1


