Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id BF8B46BDF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 23:23:24 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so561539eek.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TWf8jvIeXERIR2Vsuunj68IV8IH/2x0oQZ0NIeoleLc=;
	b=U82vQVsH97gxLJWY1BjwjAUoJqdvYiXgHn4cm3rfp7NnmxKVIxM/8iCUQkm35TqCNe
	K1pZzMo8Haeh1YjNbGwrfuIrbNyuZeInq0j2eucAsOQabhzx4oGvTDejhTA2tXpyN5Mp
	EN+pgfscu6mudqY+fgaONNju38V+DMC8/M+/awZ8yKNDGqq/g0vnhVMEt3Grv3fUDb0j
	xF+pp7XbRzYQVeszd3a75s1fAgHwxbGWN506+wkIPzAmXpsHLBOHeuJB2Cgul0Yeadll
	RJPfRa8uhAW3hhI0hv9kgKenCUJ1Z8n0iZRXLIF+s+fLsd0vxWZWtuyfRx6pxR8dGP/4
	x41g==
X-Received: by 10.14.174.195 with SMTP id x43mr7588812eel.47.1377818604978;
	Thu, 29 Aug 2013 16:23:24 -0700 (PDT)
Received: from mizar.localdomain
	(host202-221-dynamic.17-79-r.retail.telecomitalia.it.
	[79.17.221.202])
	by mx.google.com with ESMTPSA id d8sm50007881eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 16:23:24 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2013 01:23:18 +0200
Message-Id: <cover.1377818011.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH 0/2] Simplify the creation of cramfs images
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
X-List-Received-Date: Thu, 29 Aug 2013 23:23:26 -0000

Extending the util-linux recipe allows the creation
of cramfs images with tools contained in oe-core.

The cramfs recipe in meta-filesystems will be removed
so there will be any conflict nor replacement of
cramfs-native.

This fixes as well an HOB bug (missing helper for cramfs).

Andrea Adami (2):
  util-linux: package mkfs.cramfs and fsck.cramfs
  image_types.bbclass: use mkfs.cramfs instead of makecramfs

 meta/classes/image_types.bbclass            | 4 ++--
 meta/recipes-core/util-linux/util-linux.inc | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.8.1.5


