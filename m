Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.18595.1595424687254984647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 06:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=oNkdfTgz;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=564; q=dns/txt; s=axis-central1;
  t=1595424687; x=1626960687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fEb85y9O/V0mVAigME2vWtDR0bQho7m+HvW4LHZDxJQ=;
  b=oNkdfTgzDt4CKgnUHeJvJH0gWQdOl1JfGbEU+usVAioUbRNn9ihHkWkZ
   aEf5pTJrciAPgF9ZSca853+sP9zObFBMQzIY8Z53MtW+TmSIbeiuy/x3F
   chUo9zzi0P0WE0X7dw+L3TbMtUDzG2pXtTmjypS9nthMQ9kJ3m/hVPgMy
   3rXLIaKjHhQJk++26UUksiPUsQgE4uSfst4MmofEgOgzjZrQQLASNkSBN
   xLuPbqoAaT1+lhXHcVry04/5bSeZ7LathSUOLb8IG2A9v92vGIobgHHlk
   zk/aZKxoQyzIKJx3eAbjepSSanNl7ILI77ci0MPPdW1eiPx5VQxi4QhUt
   A==;
IronPort-SDR: c282OrG7xGMGuY3boxhn1Uz4+4lXHl9hbagXuv6sa34UfWKraQOVkFD30JddzLqjH+2qojdbsl
 i11mVPQamkZehq2+9K5D006Ow+NGU3RsZqeHFs47OFabowXNvYwZTGxClKvN0zwmqOxf9RZQdk
 T4mI8Q+zplYioMDNjj9kxT5XzlGg/druruIotju8tjXjGnpl+gkWALOOrJFhsKNoaHXiM5jyPk
 jVmdKWzpABZ496vAVcFOaOvr2U/gHovAFXa6BSj49QXMWg17RlvoVo7Zem3GeApbCMlQkNFE66
 5wo=
X-IronPort-AV: E=Sophos;i="5.75,383,1589234400"; 
   d="scan'208";a="10790842"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v5 01/13] package_manager: Move to package_manager/__init__.py
Date: Wed, 22 Jul 2020 15:31:08 +0200
Message-ID: <20200722133120.11484-2-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200722133120.11484-1-fredrigu@axis.com>
References: <20200722133120.11484-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This is part of a refactor that will split the package manager
code so that it's possible to use other package managers in other
layers.
---
 meta/lib/oe/{package_manager.py => package_manager/__init__.py} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/lib/oe/{package_manager.py => package_manager/__init__.py} (100%)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager/__init__.py
similarity index 100%
rename from meta/lib/oe/package_manager.py
rename to meta/lib/oe/package_manager/__init__.py
-- 
2.20.1

