Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id EFA946A4E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:56:21 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id l18so258695wgh.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=B626soVeCF+bg4l4ynka7DewP6J+Bvk0Ab/P9Azl79I=;
	b=h+EDTNVK3D3pupknr6khPDlCDbgNz/gCx1fC+6NMOT+aXsSyiI5iJTSWZ1p4WI94l1
	AleW+lo1VOw8c8SPBDvcg7l8sDl1LJBmrCCzIPjTXmBgk3I1cT+hgK4K9AUAQJoWbR7k
	hlR8DOdz03CIQjr5Imn3sytOrgr2kErmmZZLuWx5F8fxZE7z6ssmh7wMfbcX9aeOjO9Y
	h9ETnJZUcTBnbpP5pceGzCeqBWR6NpdkMza7M/4qqcAZUbI6moeRDNzAu5n+vhLaNTL/
	FbRe0dnR3Eik9Yw1pLkCemechnGez2hjldd1b0piOwXUiDgR5yWl7h8XzFgaHFYoQi8q
	YH0A==
X-Received: by 10.180.160.167 with SMTP id xl7mr18613902wib.62.1369922182695; 
	Thu, 30 May 2013 06:56:22 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm38247963wic.0.2013.05.30.06.56.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:56:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:52:42 +0100
Message-Id: <d858d63bea21a9be9b183fcca3d5fc5b6df4a7b6.1369921759.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl9WWlMBqe2t08+aszB0XTv2JN0PnCFsGaLPEjdOt1vrEvBdcBncacY402bDtaq18NHnlYm
Subject: [PATCH 08/14] gtk+3: explicitly disable introspection
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
X-List-Received-Date: Thu, 30 May 2013 13:56:22 -0000

If someone is/has been using meta-gir then it's possible for this floating
option to become enabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
index 3c03add..9bd5b9d 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
@@ -43,6 +43,7 @@ EXTRA_OECONF += " \
                  --disable-xinerama \
                  --enable-modules \
                  --disable-cups \
+                 --disable-introspection \
 "
 
 do_install_append() {
-- 
1.7.10.4


