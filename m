Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id C983377187
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 23:28:51 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gi1so1037282pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U3dwSvlhHOWc7znYMt7McTgnZjDPNYG69+hqGeF+RKQ=;
	b=U4zZ1FgiB3jCzTItrcXvFjKiQsGLqtEJjfPqZcY43yxLcTLKtlLYdtZ3G5HezmTjaF
	VuaT13KWYNjr0LoZDVsHXdkfgyIJTjhmNrbFaqI8e3CU8zozKklaM11Khs/nk7lMD6C9
	UCDRSazVPNnSqHR6tE/FhDPZy3JQ1WuUQPxOl1Dt58M3eA4Owz2bDJl60TUuct9iyKSd
	+j1vnQzl3AET9FzIZ7wliC6elJzm9WOmQx93PrWJzpatp0cWVSl1R1aTXa5g3py2UDlH
	4n6ykyAPbp7BUsumXc2qp2x+UesiywbN7JRgwLR+ko3byVfccGAvoMge2w23Zj8CKqCn
	O25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U3dwSvlhHOWc7znYMt7McTgnZjDPNYG69+hqGeF+RKQ=;
	b=V+M1xFQWcO8hS8SMJRBaHnWqKbrDwe6J3YlA6Ix0sY25JMF8tts4DBF5QE+imHDhem
	d5wvUD4+GN3fI0ReR9PrJqF3Ya0z6KLjaTBrfiDze6l30Yo0PIM/nsPe6hSOqvdQcQPl
	nqSZVUlyg4DXP/u1JvBkGF0TO/1Gy11WRnq/VkOnAJ/8dGDettA1QR7Y6Xm2B4+PzZjG
	qDPH45GlHSH5dlV4EdMYDkFy9k5pMIuwdAXTBBuyZxfF81GlPHYGtTkbMlK71M6zlKD4
	i4LSG69zR43K9s8SfP565DF7CHlXuf2gvyWGuzTYJ4ggCSgdOXOPH6nOEntT/RmIA6B1
	gs4A==
X-Gm-Message-State: AG10YORfJsLuPEBq5ytiNs7LQHwSBeqHM0d3gwCCpipBnesLMupo/4QVEhBs2hC5BWVCKw==
X-Received: by 10.66.122.97 with SMTP id lr1mr45837264pab.68.1453937332139;
	Wed, 27 Jan 2016 15:28:52 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	h66sm11422372pfj.52.2016.01.27.15.28.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 15:28:51 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 15:28:36 -0800
Message-Id: <1453937316-1311-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
References: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] glib.inc: limit ARM_INSTRUCTION_SET over-rides to armv4/armv5
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
X-List-Received-Date: Wed, 27 Jan 2016 23:28:52 -0000

The original over-ride dates back to 2007:

  http://git.openembedded.org/openembedded-core/commit/?id=fc5366261e12c100e18dc1d9ef0b86b91500e355

There are no obvious issues seen now when building glib-2.0 v2.46.2
in thumb2 for Cortex A15.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index eff5997..14722db 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -54,7 +54,9 @@ FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py"
 FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d \
                                ${datadir}/bash-completion"
 
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
 USE_NLS = "yes"
 
 do_install_append () {
-- 
1.9.1


