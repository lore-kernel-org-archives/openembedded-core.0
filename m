Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2CA1B74A0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 21:29:56 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id a20-v6so7900022pfo.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 14:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=79kSlY+whXlBEx1BE+YHDvWz0Adhe74aOijLuVYLoe8=;
	b=ZDN1y0CkqAaq1S8UDOblLxTd1tbsWUCRxR51IPTuHZWGC3tOQ3Y8OOuNXA+XFIurMR
	6nQniNhinwYZqH5EQ1jfvHLrA+kcSsJQPN/ZYgmFHRjqPj5ppWqXcNMs6srE9IvNT8uh
	q3R9xWREm1gpvbRpr4jYf6UKEogZHpS0NsykPhvif31vm+Bn11VzXAVYsQ6zy5clidlO
	u+sx6h5dcWS4pmExfiArPvSCMwM21EVCmaXUZV4FCYFMxBtaBGffQV1BUfjdLmySDdTM
	xY5q/05xJX+XMCV1iAjnXMqy594wZ4E0G3ecIkcCqhajQyVorS/vl1eH9iNKQl2qv8B8
	ClnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=79kSlY+whXlBEx1BE+YHDvWz0Adhe74aOijLuVYLoe8=;
	b=HziS29NCRppXtsBfLNBRAhiqzb/P+hKotyEFn34SXOSl3FOvZvg50pbMYJ0V/6XHGz
	BN6yO3YhCwAiB7/bmwYVCuN9vYfOGs4dEpL1X1lAYhHd9dQTdJloJ1e7zkG1PFo6O2tl
	GjerhCZoniwtNPUv9e0RVibHg0ovrnaD4gBXyiY44Hx6lQC6ITv8iXYuoATzI563N54p
	VFUDrWcYo3qovRhIqswz7NbrWwd9q5gmmgmR+0Xp1y73ehZlG7qwsrReXKnrJ1Y+qFd4
	HFTbL3Om38oAotvhZrX2SOQkk4oeovoXaEUM51m4Azyp1HGCtWLritAzFDtVjvb9A/W7
	N8Bw==
X-Gm-Message-State: ALKqPweD9cl907cZlr30K+DjYxYADq2PYw6zn5l/Ek1e8csTmETDczPR
	hTZp9nCmyicyZkuMFHTd7C6dyQ==
X-Google-Smtp-Source: ADUXVKL7nPgmrni0VIcANjXctphSM76MWOApwa2Svfcdpv18UdeqsaJfxvPdC2jRX3NJbE10Mma24A==
X-Received: by 2002:a63:b601:: with SMTP id j1-v6mr56185pgf.335.1527629397769; 
	Tue, 29 May 2018 14:29:57 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	i7-v6sm24362pfa.34.2018.05.29.14.29.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 May 2018 14:29:57 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 14:29:45 -0700
Message-Id: <1527629388-3808-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527629388-3808-1-git-send-email-armccurdy@gmail.com>
References: <1527629388-3808-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 2/5] as-needed.inc: drop ASNEEDED over-ride for openobex
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
X-List-Received-Date: Tue, 29 May 2018 21:29:57 -0000

The over-ride has been merged into the openobex recipe in meta-oe:

  http://git.openembedded.org/meta-openembedded/commit/?id=e59a9738c24ccaeac91740d1f67c607d4ee2a217

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index 9c23564..b163fef 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -1,6 +1,4 @@
 
 ASNEEDED = "-Wl,--as-needed"
 
-ASNEEDED_pn-openobex = ""
-
 TARGET_LDFLAGS += "${ASNEEDED}"
-- 
1.9.1


