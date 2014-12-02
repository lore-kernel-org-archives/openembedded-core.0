Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id B87AD6AC4A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 15:53:58 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so30484211wib.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 07:53:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=wyIg3npV/Mzp9tU7CyJ6+CfA3D0Ke7YyMdcFFBZimyg=;
	b=Lleev+nHxyQLqpTRx+UlZgNDC7drjM6jllWI3mMoFMZErDXWxajo7kyjmi15Yq5Vxs
	FpK772iyRvsHkuLfaXHTnC3BZrDXlwjDPQms1dYhK6mYJAWwkOyik0TQtyipiXSXMw/F
	L+FZFfsReQbHpgpB3S2cwPPOT07UsIT04T4cHZSFPP7OLmRzOdphN9OnQV6Si6384wTi
	e9xCQQX0pgpx9yWDCT2BVbGjlmRlqGk0f6BX0M3Upvk6hjO73ResRyhxMLOAcXJrS14N
	PorbFvZZUPcfx2AMNudOUaTsGAshyAYDWUb+9oxcsUMVkYbn69mx/3lQM0HDUPMenVy5
	5weQ==
X-Gm-Message-State: ALoCoQkVwo9oKm5sp7AmfZcERAlintvO49+uS7IwpkMp4YZ93CXTqcEoZpe5z7c/xQkzjemmKYZM
X-Received: by 10.181.13.7 with SMTP id eu7mr6453834wid.72.1417535639429;
	Tue, 02 Dec 2014 07:53:59 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id j2sm32437034wjs.28.2014.12.02.07.53.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Dec 2014 07:53:58 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 15:53:25 +0000
Message-Id: <acd4cdf33e2f4162b15691d6c29d5bed17d16bac.1417535164.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1417535164.git.ross.burton@intel.com>
References: <cover.1417535164.git.ross.burton@intel.com>
In-Reply-To: <cover.1417535164.git.ross.burton@intel.com>
References: <cover.1417535164.git.ross.burton@intel.com>
Subject: [PATCH 3/4] weston: fix plugin location in FILES
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
X-List-Received-Date: Tue, 02 Dec 2014 15:53:59 -0000

The plugins are installed to ${libdir}/weston, not ${libexecdir}.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.6.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.6.0.bb b/meta/recipes-graphics/wayland/weston_1.6.0.bb
index efbbbe0..d30e48b 100644
--- a/meta/recipes-graphics/wayland/weston_1.6.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.6.0.bb
@@ -79,7 +79,7 @@ do_install_append() {
 
 PACKAGES += "${PN}-examples"
 
-FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${datadir}"
+FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libdir}/weston ${datadir}"
 FILES_${PN}-examples = "${bindir}/*"
 
 RDEPENDS_${PN} += "xkeyboard-config"
-- 
1.7.10.4


