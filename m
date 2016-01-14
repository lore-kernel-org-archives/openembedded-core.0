Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id EFCCE731EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:58:31 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id q21so33905202iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Bgh8VqxX7014M8FjQxk1paARcOBtTue4tObDzm7eM5A=;
	b=V6Pn1lkq5UWMfTWc2ug3ymppWHTEsVoQk9GMovgUGb7Dg18mA7ZFshqcOc8C/HfhmC
	bO9xuyGLuEmdKfrtomdxZxDnoPOYHCIdUXCWKskLBG1/+lNsHQvZB/v/e4sbp6PXWo02
	farwTUMG2kTSoVsM3ygeTovpAZZ2ioqqTgjeNTJc2Y0Y7Ae9s40tJVWaFTINbMx6OSb6
	MJ003Ic4bY2ZOvO+fEBc2uwDeNdO9cQB/+r1BcP1rtBgRVjseDdNVMuoTqn1CDBei7NF
	7orOiooUIFaFXmZ1XyqiKdhl0nePBdr0u/WkG/S+dW5mXpUQ5qEzFdQrQsFfyShFUTDJ
	Zdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Bgh8VqxX7014M8FjQxk1paARcOBtTue4tObDzm7eM5A=;
	b=EMQe4FcF4ZzUtymNiuueAx1Sq0UM9wWsfrYRLGjSvbsHfnHFwhe1FGvZFN2bPL0bQZ
	NoDB+HEFyO6IIZH9P4QVF6vi9dtHIprfUHG1x2ElTZXooBw2DF76wi6+RX8nyI1d4H/z
	Xf0HhwqoMfceotkMaiZdqDWx8EL/9zMk7rbtjzYdtsl1PHBxXOwUcXPR9htLQU2ab+D7
	0eWDTxtnUYKR3pDPU7c+5ezySUJwj2R2hwaNLJE5hZRbY6bGFM4I5cT+o9nGp+XmjfUm
	7SN8nHPiuWq/YSQ7AYheYdedwzxOTFzbFfy6ElyhRWl8Wjo1hWqccWD1H16NA5oD0lsZ
	tj9g==
X-Gm-Message-State: ALoCoQkmB/tHOfmMpsmqIl6HOtuxt+8X0I4COxwsXWdWnDIFNUuGdpWQPPCkVa5T0YjK25tn0y4ie0xluMCrQAeVJDbF+N7N7Q==
X-Received: by 10.107.134.78 with SMTP id i75mr6666620iod.74.1452805112830;
	Thu, 14 Jan 2016 12:58:32 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	204sm3203278iob.44.2016.01.14.12.58.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 12:58:32 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:56:31 -0600
Message-Id: <1452804997-20926-4-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
References: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
Subject: [RFC][PATCH 3/9] bash-completion.bbclass: add class
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
X-List-Received-Date: Thu, 14 Jan 2016 20:58:32 -0000

Add bash-completion.bbclass which will package bash completion files in
a subpackage ${PN}-bash-completion. Use of this class will ensure
consitent handling of bash completions across recipes.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/classes/bash-completion.bbclass | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta/classes/bash-completion.bbclass

diff --git a/meta/classes/bash-completion.bbclass b/meta/classes/bash-completion.bbclass
new file mode 100644
index 0000000..74a878e
--- /dev/null
+++ b/meta/classes/bash-completion.bbclass
@@ -0,0 +1,5 @@
+PACKAGES += "${PN}-bash-completion"
+
+FILES_${PN}-bash-completion = "${datadir}/bash-completion ${sysconfdir}/bash_completion.d"
+
+RDEPENDS_${PN}-bash-completion = "bash-completion"
-- 
2.4.5


