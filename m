Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7BDD160684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 14:03:58 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id y21so221558650lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 06:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EjeCdSsE/pvt0hlH9w6Lw5pW/wI64b7NZ6C4Pj89tZE=;
	b=Mgv97QEnucea+TaBkkzMYAAQV/7347VTPHBr0w/wAJAASA3GkN8G89J+qcTACC/eqv
	ODk/SLTHYAqYprc4N57ZUjJJVnGjsKxDMsMlE2Z/9OtnQQUIehy4UIbaiKR872z313kG
	BoMGMeySZ/chfu9t2kGLK4oVM3C30vEdbYOGHMsPmvKqAaK9EcxC38GU/eOk6yGcrz6Y
	O3rtcPGbzbe1ov33zSP6kqPWq4/n3pPWxwHNuM0xTGNl3wxf7CZtRkP+dSbhjrVz4wub
	QfIPezCnzbcajfpgIkoTAS/VRs4H2841OIi6GxY+SNq7l1HLAaYQjqeC8cPCrM8ttkJM
	3vGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EjeCdSsE/pvt0hlH9w6Lw5pW/wI64b7NZ6C4Pj89tZE=;
	b=UJExoBXhVCiJk2N4W43wZ0EPNkna2wWy2RTrJsXhzVoTeT2kcpEgy5OQnmG0uyrF2e
	4gwPkMni09W7ZYMhqaw+wKMtDKOa8g4bDYfxT6xsIdC8k0aELiXPCXyTtaZiOiU9/hoV
	trH+MhTM1FI60z11WqRri1ay3Tex4MsN2CTvK+yVhkdWpp0hWNpFCvRZSAjzaF4iHXC3
	dE7SfaG5eVFDEXhtf2ykkZkjUeZB9+5wB/9UZPoHxFGxckf6yGGucG/DBJ2+W3ZoiH6o
	j5IpQ0tN73dM1mJKuK5pQEppLmXqaTa7L29cpeFvLCPK0B34ul5rEfQbA8h1rMdlyG5X
	yAQQ==
X-Gm-Message-State: AIkVDXIxA1tlm9hgrR7MNVsakvLErfbfrlG25+7Ez6vmSYZjY68U05TdRM5EaVb4Jmalxg==
X-Received: by 10.46.71.12 with SMTP id u12mr14253062lja.7.1483020239804;
	Thu, 29 Dec 2016 06:03:59 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	y131sm12961910lfd.36.2016.12.29.06.03.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 06:03:58 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Dec 2016 15:03:46 +0100
Message-Id: <1483020228-1267-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <b7a30224-1198-ac92-7f70-708196ca7814@mender.io>
References: <b7a30224-1198-ac92-7f70-708196ca7814@mender.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Thu, 29 Dec 2016 14:04:01 -0000


Rebased patchset, otherwise identical to the last one:

* Removed e2tools recipe.
* Switched to using 'debugfs' instead of 'e2ls' in selftest.

-- 
Kristian

