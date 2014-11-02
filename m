Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-04.prod.phx3.secureserver.net
	(p3plsmtpa08-04.prod.phx3.secureserver.net [173.201.193.105])
	by mail.openembedded.org (Postfix) with ESMTP id A3E486E5DC
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Nov 2014 10:48:44 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa08-04.prod.phx3.secureserver.net with 
	id Aaoj1p0080BVjqb01aojWR; Sun, 02 Nov 2014 03:48:44 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Nov 2014 04:48:36 -0600
Message-Id: <1414925318-15353-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [PATCH 0/2] support numeric owner/group tar image format
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
X-List-Received-Date: Sun, 02 Nov 2014 10:48:48 -0000

A classic approach to building SD card images with varying rootfs sizes
is to create the filesystem and unpack a tar rootfs image onto it.  When
done outside pseudo the encoded user and group names from the tar file
are converted to identifiers using host files, which often result in
incorrect assignment for common names like messagebus and ntp.

A solution is to create the rootfs archive using the numeric values
obtained from the target /etc files under pseudo, rather than the
corresponding names.  This series provides this function as a new image
file format "nug.tar".

Peter A. Bigot (2):
  image_types.bbclass: whitespace and reorder
  image_types.bbclass: add tar --numeric-owner support

 meta/classes/image_types.bbclass | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

-- 
1.8.5.5


