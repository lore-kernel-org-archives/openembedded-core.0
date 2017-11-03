Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2807835C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:55:03 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id m18so3318742pgd.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4OfLP7AKvjqiZGcpLzrTwJMVGQinidPJtaSa2PZaojQ=;
	b=a8+h9pcTYFA5KBIynaFonMlJfrNnPjQJkskfHTW9EoFnK1Olvf1Eemji9S401Ns6/C
	f4qM9Ipc4CdMegRDZFL1h0ThU85FCG+glT/bIMs+T+21eV8cnPN006Gwjq9xHW9NUZNN
	THt8xfswHXT/ra8eegR8+cjZ7wwHlf1dzXLkERPF8aRhNNvWy6V2RGk69+tcaoWWYxpM
	Dn061+7WOCNLsThR5O3N7tC8I1XU45KrOY3fFSQoEX5RGglqMMFGnugOiIaSfIxsThKc
	mWBIywvbnZTZZS/ToL9wG2ekEjXMLx+Wfq2Jxpk7oQaidete7GW7jW2KOHjkPnvEtdw2
	X7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4OfLP7AKvjqiZGcpLzrTwJMVGQinidPJtaSa2PZaojQ=;
	b=JjwAipjNXM7+4brSfKGcYede8UAiTkvpsZVO2ShEXBcSZDHJBYtQLp83G+P4sNFcCG
	QvwIHCFzsJ2zaPL9FWz8274MDVmmXufITHT1h70CqfDo+3eJUmVR4ltMoMh3XU+Dfnrp
	3sYuI3vCZBfUSmZot1v3iuuvQLTgqTP4Gru1ZIh3G+itww7I4gHslM5+LHtFcp8lQYpf
	4cPx/PwGNsrqrkWKdQFW8TmVmOwJcXw5HXAFwmhUmJNiNKZrjlFuzbtbljq/MRtrEoyK
	Xll0ZDVFtbPltH2UHAWcCjqELCXLQ9CyTk2b7dWYL2Cyig0RC9Uogf5nhgyebxdI7OAj
	GoAQ==
X-Gm-Message-State: AMCzsaVRwyBLIGJf6ODZPMsihK3JTmOJ7IGkvgpBIPf11D62OHrvqPjW
	IT8DDxypzikIruyo1wZC9Ro=
X-Google-Smtp-Source: ABhQp+TEkBJ8AM7mcaYD6hNApfxycwuF9n5aMbTTMdnI1/Np13c/OoVJH+wRrSun98QgygrhY+lQGQ==
X-Received: by 10.99.109.2 with SMTP id i2mr7852895pgc.194.1509738904822;
	Fri, 03 Nov 2017 12:55:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.55.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:55:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:47 -0700
Message-Id: <b16c2c394b387f2e80de8774c799c8d1c7041a41.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
Subject: [PATCH 13/15] gnutls: update to 3.5.16
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
X-List-Received-Date: Fri, 03 Nov 2017 19:55:03 -0000

This is a bug fix release on the
current stable branch. Note that, I've also switched the release
cadence to bi-monthly as less and less bug fixes/updates accumulate
each month on this branch.

** API and ABI modifications:
No changes since last version.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/{gnutls_3.5.13.bb => gnutls_3.5.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.5.13.bb => gnutls_3.5.16.bb} (61%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.5.13.bb b/meta/recipes-support/gnutls/gnutls_3.5.16.bb
similarity index 61%
rename from meta/recipes-support/gnutls/gnutls_3.5.13.bb
rename to meta/recipes-support/gnutls/gnutls_3.5.16.bb
index 35d7d09..635c519 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.16.bb
@@ -4,7 +4,7 @@ SRC_URI += "file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
             file://arm_eabi.patch \
            "
-SRC_URI[md5sum] = "4fd41ad86572933c2379b4cc321a0959"
-SRC_URI[sha256sum] = "79f5480ad198dad5bc78e075f4a40c4a315a1b2072666919d2d05a08aec13096"
+SRC_URI[md5sum] = "4c39612f1ec3ef7ed79cfb8936fa8143"
+SRC_URI[sha256sum] = "0924dec90c37c05f49fec966eba3672dab4d336d879e5c06e06e13325cbfec25"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


