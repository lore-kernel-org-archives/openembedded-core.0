Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id EA4F778E49
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 19:21:19 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id y144-v6so10552093wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 12:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TaTD8iHb+rlyi8utIPREkCw3kLcrqjTZymc51sMFImE=;
	b=aVmeRh+VKy1CQkiT7utNbYJbE1pIzrwxlkX1jRBZ97KgWuLriL6RVqN/3l3bC0czRe
	d80D04WgQYMJX2fnu2qPw/PAi5zYzJn1tm/EwjutLIDX7XLe5v10G68Obuj9E5gHn+EC
	/cenB5X80TGVcZ9hPMmfLRvQ5L2jbYLgeQZB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TaTD8iHb+rlyi8utIPREkCw3kLcrqjTZymc51sMFImE=;
	b=RWA17jXwqtSyZ92ELOk0R49xZtZs9pWyRe2canlxXp0bm9Z8lh/E5SH6DDKma40VpF
	mXvrVvVjyT+tUfg8hoekw+3iLQ3OKRDfHR1IeCDde8Ajq4tfrmHzri+2uH8ULi0drhnt
	ScHyZlegZnDy5cuA8gQAnat8OEwym2UkRGH4tDThq95ogEoiNT13AtHOiZZZWwT3Ii+1
	Yk1DI4EFvk+mByzMYpkRTcL8T3Oc+pQJWdl9AkwpqOEYtXNGVdV1jU5SgaqQui8W6tAy
	aiDcB50X1trVPx1O61GkUvGAbtJgPh/OBuH8CAHcDjV4vwNHQfoHKbxCRcrV9NJghGE0
	qOKQ==
X-Gm-Message-State: ABuFfoheHmvUNCLLNTWTqLYuCSPulStn9PPfJfdJequ90eyV1NgTVaUN
	9StV169EM4cE7O7wTZdyB3g2fChMY10=
X-Google-Smtp-Source: ACcGV63Nm58nBLIMFcfTvQ3dePrDVhXEieUH4W1F19P/VLPgXsqPmiV4fbCxNjNH9etYrBdqu8u20w==
X-Received: by 2002:a1c:1fc2:: with SMTP id
	f185-v6mr2672207wmf.18.1539285680210; 
	Thu, 11 Oct 2018 12:21:20 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	203-v6sm11408363wmn.34.2018.10.11.12.21.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 12:21:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 20:21:16 +0100
Message-Id: <20181011192116.30034-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011192116.30034-1-richard.purdie@linuxfoundation.org>
References: <20181011192116.30034-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] oeqa/manual/oe-core: Drop image build during taskexp test
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
X-List-Received-Date: Thu, 11 Oct 2018 19:21:20 -0000

Building an image takes time and isn't necessary to test taskexp,
we can drop this step.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/manual/oe-core.json | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/oeqa/manual/oe-core.json b/meta/lib/oeqa/manual/oe-core.json
index 0e8f01a9123..d893d849fb3 100644
--- a/meta/lib/oeqa/manual/oe-core.json
+++ b/meta/lib/oeqa/manual/oe-core.json
@@ -216,10 +216,6 @@
           "expected_results": ""
         },
         "4": {
-          "action": "bitbake core-image-full-cmdline   \n",
-          "expected_results": "Image should be successfully built   \n"
-        },
-        "5": {
           "action": "bitbake -u taskexp -g core-image-full-cmdline    \n\nNOTE: To execute the last command of this test, it's necessary that the machine is executing an X11 server, or if that's not the case (for example, if running the test on a headless server), it is required to enable ssh X11 forwarding on both, the server and the client, and have the X11 server running on the client.    \n\nThe instructions to enable X11 forwarding vary between distributions. But for example, these are the steps to enable it between a server running openSUSE Leap 42.1 and a client with Fedora 24:  \nA. On the server, make sure /home//.ssh/config contains the line:  \n     ForwardX11 yes  \nB. On the server, make sure xauth is installed by running:  \n      which xauth  \nC. On the client, connect to the server, enabling X11 forwarding, for example by using:  \n      ssh -X user@server    \nNOTE 2: depexp was renamed to taskexp on 2.3 M4",
           "expected_results": "Verify that a \"dependency explorer\" is opened and file \n   dependencies are listed  "
         }
-- 
2.17.1


