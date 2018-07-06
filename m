Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 52E157458C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 15:40:51 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id r24-v6so11224647ioh.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 08:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rJi3OCX72K4OTPp1UCy5V1PHc6AgmE47S2STf8Fmjr8=;
	b=XHHiQuVelFnljYvEcKGtsqc2tYI+y8rnQPhKIE8SgHRVyYesbVsRXEB0ThyqkQIDF1
	Y+4R+nip9YKCnPw5UJr7gA+qo8iPvQ+tQNziRkPsKS5iObY9fTMORId1KsBdn3G8Hwcp
	gj9C9Dt9vvAI54GuD73cvZrzF5uRHjYzHZtM/9Qtl8xt2YtvAekW42KhOs8eyNv1glxL
	lHVpPGJpCinhHeEyBPZOxJZVbDoiuQ9uZJXfL/DN3jRjIAlrFJVSCh0xuPmn35LTlr9K
	IWZdqSzGpiUUmZFUs1+zNkMEY+D4sVgvv91yfkDIdUbFxuP6OwDLyHslqq0q/tk6p7H7
	O5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rJi3OCX72K4OTPp1UCy5V1PHc6AgmE47S2STf8Fmjr8=;
	b=fSoaz1LojSvmg76hC/4mDjWDXnZgemJU87M57XwoXY+LgfJoFgHC+MvOZqztrA6XBN
	Cbhy9EjGoj8nZkS08sBdoyE+gUAt6YxOAQuLZbFBxA3JVwNsfzXCGjMgbLozPzrDYf7E
	L9uMFZB4YoKsYnN31QVxuqjPUS6di+VF25N6iKZj0+kMsVubmNpGanaE+8NlgOD/uhiB
	3Gse6+r1e38XNiRXZFGIBKRqeVJBUsS6tRsesz4eev5m5v+kGuegeNEnfiHCsKm6opae
	RT5j/mgAptsE9gdPVM77UkTJOAVOk5y9HjRxKUmfJ8r4/6aPr3+0KYXXNFzoH7PkqMeh
	5hJA==
X-Gm-Message-State: APt69E1d0PAi6JCHONQWA7kXKmsCr3MX0ZrBKSN75a8L3C427nRZgaEb
	kQa8wfBD8D5B8MUNnr97Ulef9NLF
X-Google-Smtp-Source: AAOMgpdOUSh9w4wqbkddQcgD4eTlW1ed8ohor0m8cDk0oKjXbcq5qTtpdgAa/KIhzOzW+AbDca2gSw==
X-Received: by 2002:a6b:4a15:: with SMTP id
	w21-v6mr8357630iob.277.1530891652165; 
	Fri, 06 Jul 2018 08:40:52 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	v190-v6sm3663726itc.30.2018.07.06.08.40.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Jul 2018 08:40:51 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri,  6 Jul 2018 10:40:17 -0500
Message-Id: <20180706154018.28658-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180706154018.28658-1-JPEWhacker@gmail.com>
References: <20180706154018.28658-1-JPEWhacker@gmail.com>
Subject: [PATCH 2/3] classes/sstate: Remove trailing whitespace
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
X-List-Received-Date: Fri, 06 Jul 2018 15:40:51 -0000

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 1a95f8f2b90..a78d07c41d3 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -407,7 +407,7 @@ python sstate_hardcode_path_unpack () {
         bb.note("Replacing fixme paths in sstate package: %s" % (sstate_hardcode_cmd))
         subprocess.check_call(sstate_hardcode_cmd, shell=True)
 
-        # Need to remove this or we'd copy it into the target directory and may 
+        # Need to remove this or we'd copy it into the target directory and may
         # conflict with another writer
         os.remove(fixmefn)
 }
-- 
2.17.1


