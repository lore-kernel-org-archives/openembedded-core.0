Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id B2CBC75877
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 14:09:04 +0000 (UTC)
Received: by wicmz13 with SMTP id mz13so63012208wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=zFlO9Wd+W/+0+fIUP2AQLx5wTsSvKZNsd/vujgBP2QM=;
	b=Wv9/yGd1EA7KgxE7yrzPLShbyp+jXcRIaDoG9/wZIjLu4tuuyPBusjSM98CVkdzRLZ
	NE144eYfzXstgdZlP4SgNU82yUDqXqTtLaz1B2LijMxSr4xq2KDAjCkUIDOZGd3bN/nG
	BVIKWcY7JCXlhGayYn69FmPyFK26JMcFNkCCsDh+g1accf3MwxCRZzcPKybIYbaoEjOP
	QMEsNBnsBZiJvq86QSBgN7t8ze3ffHWbQIYsgmSBLoQIDTKVwDmLDcy225DY0TDpZU1n
	fdDxWUfsN0opgi4//Z9u9Bu9Qosqy+OErkE+QDCmu9YO4Y6WLB3GTpr+6WuYdlHkUNt7
	LY9A==
X-Gm-Message-State: ALoCoQm+/XmD/bIoH7WHPvaPSPHEglccNpZ4XWpfmdm+zdu8QoR78q6qT10hE6LxRWzsddWkOCAf
X-Received: by 10.194.88.69 with SMTP id be5mr68050233wjb.149.1436796544384;
	Mon, 13 Jul 2015 07:09:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f3sm14841438wiz.13.2015.07.13.07.09.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Jul 2015 07:09:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jul 2015 15:03:02 +0100
Message-Id: <cdc9d2a3801efc4843ee58f9225674bcc3d4c6e8.1436795781.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
Subject: [PATCH 4/7] boost: add dirs
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
X-List-Received-Date: Mon, 13 Jul 2015 14:09:07 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/boost/boost.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index cf4faca..27d489f 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -154,6 +154,7 @@ do_boostconfig() {
 	sed -i '/^using python/d' project-config.jam
 }
 
+do_boostconfig[dirs] = "${S}"
 addtask do_boostconfig after do_patch before do_configure
 
 do_compile() {
-- 
2.1.4


