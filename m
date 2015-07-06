Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7183465CCC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:50:37 +0000 (UTC)
Received: by iecvh10 with SMTP id vh10so121757580iec.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=e1XJrhVIdJ8TD8iC0EgXnm1Qo2dIz+Tcc8ujQxVtRN8=;
	b=l96s2Csy1pzwTsscZTNX5x25zh7pqpETaRtREen4YfEoPP3lYfwEGOWvPaqtcLrbms
	keS6TCL2azezh5HWWnHwXDh7GODhp6NzNpZ22fm9P+anF/7FBXovNxRB9gnZH4eESuAr
	3zKOxbB4GyVoOwml6yDz7KdmVaLlQhVHancVGmlOku3T9/L48MYc7TuQ6MJHshPqmm1v
	e4XIZ43SEBQV1F02DuO/MVh5QMWEra47X9eH5mjz4cln0ZZ+o08U1zN+P6sltBDcLRnk
	kQCJ2mclOUT1cV03yL9cTNt2bCb+IhEOHv79BSl+LFUTBnyAFRQp/BxzYQNRmheXLq1i
	o4HA==
X-Received: by 10.107.34.193 with SMTP id i184mr1241541ioi.56.1436215837893;
	Mon, 06 Jul 2015 13:50:37 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c41sm13182955iod.8.2015.07.06.13.50.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 13:50:37 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 13:49:57 -0700
Message-Id: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 00/13] fix 'Upstream-Status: Inappropriate' typos
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
X-List-Received-Date: Mon, 06 Jul 2015 20:50:38 -0000

Upsteam -> Upstream
Various variations on Inappropriate -> Inappropriate

Andre McCurdy (13):
  distrodata.bbclass: fix typo, Upsteam -> Upstream
  dpkg: fix typo in tar-error-code.patch, Upsteam -> Upstream
  base-passwd: fix typo in add_shutdown.patch
  glibc: fix typo in add_resource_h_to_wait_h.patch
  dosfstools: fix typo in nofat32_autoselect.patch
  flex: fix typo in do_not_create_pdf_doc.patch
  pkgconfig: fix typo in fix-glib-configure-libtool-usage.patch
  python-numpy: fix typo in no-host-paths.patch
  rpm: fix typo in rpm-realpath.patch
  rpm: fix typo in rpm-reloc-macros.patch
  valgrind: fix typo in valgrind-remove-rpath.patch
  texinfo: fix typo in dont-depend-on-help2man.patch
  libffi: fix typo in fix-libffi.la-location.patch

 meta/classes/distrodata.bbclass                                         | 2 +-
 meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch            | 2 +-
 meta/recipes-core/glibc/glibc/add_resource_h_to_wait_h.patch            | 2 +-
 meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch    | 2 +-
 meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch                    | 2 +-
 meta/recipes-devtools/flex/files/do_not_create_pdf_doc.patch            | 2 +-
 .../pkgconfig/pkgconfig/fix-glib-configure-libtool-usage.patch          | 2 +-
 meta/recipes-devtools/python/python-numpy/no-host-paths.patch           | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-realpath.patch                        | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch                    | 2 +-
 meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch     | 2 +-
 meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch     | 2 +-
 meta/recipes-gnome/libffi/libffi/fix-libffi.la-location.patch           | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

-- 
1.9.1


