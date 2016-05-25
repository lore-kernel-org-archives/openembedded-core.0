Return-Path: <andrew@bradfordembedded.com>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 79A4E6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 19:46:34 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 7421A20469;
	Wed, 25 May 2016 15:46:35 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute1.internal (MEProxy); Wed, 25 May 2016 15:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	bradfordembedded.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=OjNmM
	hD6ayJSdVk1PzXZ/i5gbgI=; b=fYwEjX0bZxjPO/snbeNPDTbL86piRxIHCvRuN
	3CDR7D35kyv2OqrG/JnAw4BT4/e+fvUuAmPX0pHsJOgZawecu4/8y0ILdLcQ5cPM
	Vj8q6bHmGjjqTdqiDHnhEVg9ELLi8iVjLPhQRVy2A33DfEtxL2OpD0OJ/Nds0YZS
	QLuIfM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=OjNm
	MhD6ayJSdVk1PzXZ/i5gbgI=; b=nTMqQCM1iwxZj8UW5r/DGXVlXG/3mLa1+IdS
	eDKMt5kcVoKbU95Ls1UbhF7l+ctxogVtQ1mYwaZQDHrV4pzrfOfjtjGd/gU6/6Vv
	6+V2DXYsoSvKNk4sIsHVeAF7gtKh/ZX584JgFhOl3fgUcKK/PbbHg7P44INQZXbZ
	+Rr6rMU=
X-Sasl-enc: z6bkI8hBabVFMFYdyHUpFUJsadkxMTiJAwA49myetdbv 1464205595
Received: from kaim-eeyore.kodakalaris.net (clr-vpn01.kodakalaris.com
	[198.140.222.129])
	by mail.messagingengine.com (Postfix) with ESMTPA id 12CF8CCD9F;
	Wed, 25 May 2016 15:46:35 -0400 (EDT)
From: Andrew Bradford <andrew@bradfordembedded.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 15:46:09 -0400
Message-Id: <1464205571-26293-2-git-send-email-andrew@bradfordembedded.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1464205571-26293-1-git-send-email-andrew@bradfordembedded.com>
References: <1464205571-26293-1-git-send-email-andrew@bradfordembedded.com>
Cc: Andrew Bradford <andrew.bradford@kodakalaris.com>
Subject: [PATCH 1/3] oe-buildenv-internal: Add P4CONFIG to BB_ENV_EXTRAWHITE_OE
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
X-List-Received-Date: Wed, 25 May 2016 19:46:37 -0000

From: Andrew Bradford <andrew.bradford@kodakalaris.com>

So that the user's P4CONFIG variable can be used by recipes which
utilize the perforce fetcher.

References [YOCTO #6303]

Signed-off-by: Andrew Bradford <andrew.bradford@kodakalaris.com>
---
 scripts/oe-buildenv-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 81ee784..e51b950 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -114,7 +114,7 @@ BB_ENV_EXTRAWHITE_OE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
 HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
 all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
 SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
-SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA"
+SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA P4CONFIG"
 
 BB_ENV_EXTRAWHITE="$(echo $BB_ENV_EXTRAWHITE $BB_ENV_EXTRAWHITE_OE | tr ' ' '\n' | LC_ALL=C sort --unique | tr '\n' ' ')"
 
-- 
2.8.1


