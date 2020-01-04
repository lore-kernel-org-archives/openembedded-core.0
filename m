Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id CAAB47F844
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:31 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id b137so24802445pga.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mRk2a3oQtX4sJK+5lOOe462/0JYSVf3VN3quqGx26WE=;
	b=jN/4tzP+EmIHj6xUS+lyGrtrtu8k17Kan+nAq0rQ4ovuBB6noKuFhkJMg4E9Oq+Iqe
	UQbBmRmoIt51nr2G8v+T0UrQuE+gBJKKJfciMBifq3FoT/VqXq3H4H9/qlMu6l8XeNma
	aVWokjhejrvjoNyfNsCCvzCouTIE3eg+xIGQnHCAW7w5mnHM2XnaHlce2NrMlyp3D0/W
	NFXtWD4fAYJB+7X2q3YYWp9G08u087HdDBpSuKWSe7dFbmA5K65PnlfygMN9jjdtcQ2W
	8UG1hjrB3VHjrFNnlvo9FnqXDF50tyUEofMy9qSjALR+sCc3bG7i+YVrNhj6Mg1b3i3x
	/2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mRk2a3oQtX4sJK+5lOOe462/0JYSVf3VN3quqGx26WE=;
	b=gJ1KgtmZb1w79YQebEaisg6Wn0WoGumlOWm+pcb59qtcPZQb2lAzXd/0BrN507UHqO
	qSt54qpBcDZ//VDKm6GYTgg2jOMx7KjUhIPbeTMbDgWj8DV0AWpI1wxtrTuRgjVue+Ym
	AauADfrbIR5E28m9/nYhsd0hLMdmK8BapB2U7c7i5/RAMoy0XunctNZeNQ2GDfFnO74Y
	oupd77DQd78bPCNNQrRfLjq9bsG7kpvZy1Twlx+9aIz9MLHUeLgNb/5iAX/Ji3CfO72E
	4mbX+6dSgEVC9TU/Jqz6TuIinAKQxovDSOclzAvNIUAYP/opD5Hp0bQlFQKraQSUcOC5
	24Lg==
X-Gm-Message-State: APjAAAWXvMZazRtNxFsZMDXyxln1LeH4r5bUUcvUwEYb9hDPX2GiPWaw
	GxQJgQ2C9jVD74zvOfwFg/UUCTjovCY=
X-Google-Smtp-Source: APXvYqyNteIi6HglqZQBVVhpSg5/BFqWy+7M1gKNuMgc1c0i364FuCZRu/eK64CwG8ZLS52YBKRC1Q==
X-Received: by 2002:a63:89c2:: with SMTP id
	v185mr100193341pgd.135.1578155192834; 
	Sat, 04 Jan 2020 08:26:32 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:26:02 -0800
Message-Id: <ad2622b515f30e88977720e60c343cef126575cc.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 21/29] podfix: only alter normal files
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:31 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23d38b2ad6f7a39e5c1ffd092322942474935c33)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/podfix.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/podfix.bbclass b/meta/classes/podfix.bbclass
index 54fff6a0a2..cc8210a27e 100644
--- a/meta/classes/podfix.bbclass
+++ b/meta/classes/podfix.bbclass
@@ -16,6 +16,9 @@ python pod_strip_version() {
     for root, dirs, files in os.walk(d.expand("${D}${mandir}")):
         for filename in files:
             filename = os.path.join(root, filename)
+            if not os.path.isfile(filename):
+                continue
+
             with opener(filename, "rb") as manfile:
                 manpage = manfile.read()
                 m = bad_re.search(manpage)
-- 
2.17.1


