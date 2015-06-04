Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 820947574D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 03:31:26 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so21142344pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 20:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Nnj76z3fpymDiUe4xXm4Z5dy3e2hUZlQrwzIW4yVtSw=;
	b=oKOjbHPImt/aal8TrVz8ZmiCcC7CHC9EYKqSU49XnOgpyMFsvRr5cQc1Qt9PO+xbR2
	OtXfRX5Atqb7vYZFw3/OVbzf+SIrXyNg0pPQMclIdx21iTy+G6UV+WUkPbXDZFlptNn7
	RxCsMWq8TUQTNwiIBfIQ9VLFSsy+lDMhZt2S59eHrP0VQsgTiEf1incfO+kY1MMw4dwg
	jEpibWT7EvRMNgECIYwXspaKWEixmk6bMcXOaJKHG1gQMxMXb0QDSHx4ANHBMW5+6nEX
	XTZZM/eFdPTKHu0/mgom416lpkXrkMYFWuLUrWlahQ/4VI4L3sef6AbR2g28GJgqgSYu
	vBpA==
X-Received: by 10.70.133.66 with SMTP id pa2mr65591202pdb.164.1433388687843;
	Wed, 03 Jun 2015 20:31:27 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id ms7sm2144901pdb.11.2015.06.03.20.31.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 20:31:27 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 20:31:06 -0700
Message-Id: <1433388666-8923-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433388666-8923-1-git-send-email-armccurdy@gmail.com>
References: <1433388666-8923-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/4] x264: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 03:31:26 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 0e856b3..9d893f0 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -52,4 +52,5 @@ do_install() {
 
 # PIC can't be enabled for 32-bit x86
 INSANE_SKIP_${PN}_append_i586 = " textrel"
+INSANE_SKIP_${PN}_append_i686 = " textrel"
 
-- 
1.9.1


