Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A22B474CF6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 22:52:55 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id w129so13078795pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 15:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OKlrtfAzQWECVop8Cb9EYlQdCkDSrn1br0O5x+oNN/k=;
	b=GZLZWXlVLwtFaLel6twpEBzsj0vf8swIPbdHVRB9/dWl06I4Zrw1b7RL3lzitbRXXs
	l10Ei94HFBID9w/Qy2LjiDQit3gnRYk0yQk2ZeFsxwshbNVr/WZAveUvn4VCpP3UAKJh
	97XPF5Hf0oh9qyiJpZ1vXG2A5+/j6rS4nt0+FvinnZWbufR4bBXty6s6hSsIVNO1Nwe6
	xu2JBDl/9eRsHiAwzTqdTh7kiYyUDy9bvviQxrwkjwaW/mylDaeB/b1BnKnJ2TMN8mIs
	o4COvPviWyFAVSZtluW5QC61NVQ6o5E4OrRQjwmUJoqOJirBlEDizUwgL+Lp62BUPxIb
	ysWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OKlrtfAzQWECVop8Cb9EYlQdCkDSrn1br0O5x+oNN/k=;
	b=K8SssojzvZ+P7nzqPIX3axARUVjpzM0sOIUDTWOC1OPxJCI90zR2lyRAI9Fe4P/YGa
	ngbCmL7jSfcJD8pwM3JaAs1bpxU6gn0BP6FzuoDbG6qTZoWT6Jb/sOMc9Mj/ChFRrfY5
	U2hVHDui+Zm1ukFlHw4Y1aj/GzhqXpW+QGTGca2KxScgFkXxPlfQzutdLEPaGlTq/uBM
	k+mYFqmYmaFEf8lkNURl3iPV8ktaBs5dvdQnvDcv+401r1X8Dv5444XZwqcipjjQ/5Pj
	bglfeymRkurMeuBOlyO0yTLbYWGpwgfvgKT5xiZYBP1uy72x6coCLb9Nfu1M2gFkMCZE
	It8A==
X-Gm-Message-State: ALQs6tAByMlYOzBuBEvFvDi8RpT/fWtnahGTpOwTLKd/VhyQiIa2Osxv
	1w/UkLhyr4wrUwduIeAezRjcNA==
X-Google-Smtp-Source: AB8JxZoEnKc9ZxtlieHbuOiyTpKp1j6p/OlsZD8O7VgFigULKj+gk0oIdzPhW9XK1YY1orjy2rgCcg==
X-Received: by 2002:a17:902:680e:: with SMTP id
	h14-v6mr28765655plk.90.1525474376381; 
	Fri, 04 May 2018 15:52:56 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	w26sm41378391pfi.17.2018.05.04.15.52.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 15:52:55 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:52:43 -0700
Message-Id: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/8] tune-corei7.inc: minor comment tweak to align with tune-core2.inc
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
X-List-Received-Date: Fri, 04 May 2018 22:52:55 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-corei7.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-corei7.inc b/meta/conf/machine/include/tune-corei7.inc
index 9ce731c..d06af47 100644
--- a/meta/conf/machine/include/tune-corei7.inc
+++ b/meta/conf/machine/include/tune-corei7.inc
@@ -8,7 +8,7 @@
 #
 DEFAULTTUNE ?= "corei7-64"
 
-# Pull in the previous tune in to pull in PACKAGE_EXTRA_ARCHS
+# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
 require conf/machine/include/tune-core2.inc
 
 # Extra tune features
-- 
1.9.1


