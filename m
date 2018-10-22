Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 04ABD7453F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:05:28 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d10-v6so5524132wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3goRVqUfqbJq1GUkU5yYFKqb2hyxzc+Ecpfw1n72MdI=;
	b=t3GkvWCiCoyo+uKnvus175b+gFv390O2mvz0gjWpwH3dERgUS4AlH6HJWOyrkFrnQx
	6jdEEuE+VK41Z6HqGQDb4yEE1dAFOqxIOyZkLTWxr9NK7d572KTM85rdrXmgQndPdsUL
	bkwYJsEejBjbJ9UYdkzNYbZQRIbuLLnIIiFtLIDJnOhqZXYSb9EHQDyHV2F8lIrirWmk
	FEeJe2oOgmhzqkG7PIOJZuGo3aPK3OdTg2A8uMZpMNWyzHwQUGOGFBbZ87baEp/UgDvM
	hGyVFmdY5bZJD6LGRXvMz0HDeXSZPJQCEPHPIrt66AVjh52wwomasdV1lt7ukTiwxIDf
	s9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3goRVqUfqbJq1GUkU5yYFKqb2hyxzc+Ecpfw1n72MdI=;
	b=j0Ky3X+cWhDHGzwQcTJ+0CidCE3Y0NzPpLTpj/uepUneb2++suFHiTzRoaZEisGmA8
	uVxxhWL8K+0syZ0sn1uDiANBUqUVSUvYg0cAccrgT+RlvJY7QpA98EXq9P83hJRkmOTC
	JeU2tfQeDWKRWY2bD1x7sbdEVN6+mQQTZ4QrxiyrgJWKQg2ugmk9q3rnOg0vICo31+SC
	qVwSLBimFBh1IyBHbzD5t5RMQYEIJppcRLfs1u0GjXegWV3u5oEEcUoqVi/An+l/o4aW
	9qUPttC9r4DansGV9q5jndrVkkRpYyTctNj7fdJmIny7VRoQguo2XCdUtmFYCUxqF7aW
	BCKQ==
X-Gm-Message-State: ABuFfoj+VZ1N2Dvy+1tKIlfmBTY/PoZs9c//RxuTUctmaQUdx2MtRPpL
	uJtzvnn9vSHT+uM1kG7t5dfO/MQoV/o=
X-Google-Smtp-Source: ACcGV61AwelWYkHS3+6qPNH34wjm/DDeDtt7hPpOmy68KgukARSfqKto4ZE1n7mDmqj1IQ0eT4CzYA==
X-Received: by 2002:a5d:44ce:: with SMTP id
	z14-v6mr48431953wrr.286.1540217129670; 
	Mon, 22 Oct 2018 07:05:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o130-v6sm9209989wmd.11.2018.10.22.07.05.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 07:05:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:05:05 +0100
Message-Id: <1540217112-24479-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 06/13] openssh: Update to 7.9 primarily bug fixes
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
X-List-Received-Date: Mon, 22 Oct 2018 14:05:29 -0000

see: https://lwn.net/Articles/768991/

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssh/{openssh_7.8p1+git.bb => openssh_7.9p1+git.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_7.8p1+git.bb => openssh_7.9p1+git.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb b/meta/recipes-connectivity/openssh/openssh_7.9p1+git.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
rename to meta/recipes-connectivity/openssh/openssh_7.9p1+git.bb
index f54dfb5..d79ffe1 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.9p1+git.bb
@@ -28,7 +28,7 @@ SRC_URI = "git://github.com/openssh/openssh-portable;branch=master \
 
 PAM_SRC_URI = "file://sshd"
 
-SRCREV = "cce8cbe0ed7d1ba3a575310e0b63c193326ae616"
+SRCREV = "aede1c34243a6f7feae2fb2cb686ade5f9be6f3d"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


