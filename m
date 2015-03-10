Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 043E473A68
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 16:30:48 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so30030294wiw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 09:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4PQPkNZJcypy6dVg0fGM7Csj7oTEQhtG2lEYAylundk=;
	b=dWzhTzTI7nOLk9inRArT1jAHqraqR3sPzgPXxtvmPOBc/PTUmdqRuXoT2a8xiKZ0Ga
	q+P7HOzEnUwrb6Y4T1MwQWRxYbEae6sZ9fBrWyvR2PSoipLarvgoaoCzhwm9IkCtepJP
	EGPwOBvuQ9a3j1NMwFbBYVBzWrXBCR972ymuJUlbONFYe7QFRo/OsYdaavWV8pBLJaqC
	HMpo8dlGMfKS8nT4BUIEe+hWpQ+82pFe3areMi8KfApZ5lPs+YB81enoqcyzls7iXISl
	F3FqRMmt9TLlyU1SQWR4u2dCMuAJludHFlTeRBd6MXghaqzUshVpflQ9wLcPdEdFx7mY
	TM9Q==
X-Gm-Message-State: ALoCoQmm3liZs68Nu7K08avFuOd/EeU6iaSi8cqq2KZHA2w3BXslCN3umBn9gi7mHuA8YSmETQJF
X-Received: by 10.194.71.175 with SMTP id w15mr67387138wju.16.1426005049855;
	Tue, 10 Mar 2015 09:30:49 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id hw7sm1587414wjb.24.2015.03.10.09.30.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 09:30:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 16:28:08 +0000
Message-Id: <1426004888-15913-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] layer.conf: bump version as error-report interface changed
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
X-List-Received-Date: Tue, 10 Mar 2015 16:30:50 -0000

The error-report tooling command-line options were changed and anyone doing
automated builds and using error-reports needs to know what options to parse.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/layer.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index e5e1f06..573579a 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_PRIORITY_core = "5"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_core = "4"
+LAYERVERSION_core = "5"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 
-- 
1.7.10.4


