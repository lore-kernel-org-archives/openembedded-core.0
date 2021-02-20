Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web12.1467.1613783586746187064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 17:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=HXAmiepC;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 37B12B5D;
	Fri, 19 Feb 2021 20:13:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Feb 2021 20:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=QvB27T7/x2rk2
	c9YLtnnOGsnfnXlzRPye0EDi/SDwTs=; b=HXAmiepCOFVKWM5OHzUBovCVHPQ18
	69XWji/PjYdoqvLQQrsHAHyjHA3DGglcjrvhiduzlnN0KkghUNeYMCITzzTUDiuO
	Q5bonpisuCGqsJ9lSfVxEE84h8adHlI+RngNwMCIvQkc8W5V5YDUsNB7Cij3dJx3
	E3CODdwxAlPxjiUFk/kiMfEvOAtkJcBElXV2rDjjSK8fmvb6vUDBL/r3FR/D2YO4
	99c+elaSrTOB90mPHS5MfftqzBIlnFDB6mQYJvojBUZg5FSpY024ua6iwefZbr4Q
	l/OUSjzSGzLwELQzaHKXrh4GCIg4wc9oCWhmUcGjnmEvn4ymX51fPddXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=QvB27T7/x2rk2c9YLtnnOGsnfnXlzRPye0EDi/SDwTs=; b=B0gW1t7o
	8SewXlKF5YtDsbKisOEx+zzXgZ7wie0LKy/TrqkOFsDiytmPkMTe+UFmBtyh8/Nl
	MK7+H/bdZLM/73l9deVWiFFfZo3IBx+nc3IHHjlpryKknx5tIE8fGTxUuTfjGrwh
	gB9Mxaq5laAL9k2OKygIQkZHnTOk8tSUPjla5p5j+4TzZUxpEkIAe7/jprupJLUg
	+7Xbnq+taFV3ZahBp0XS1qJ3RmgXWXS1hopTXzE21YG2VXDrDbq8wCKYPLuYjeDc
	kuRnMIQt/3kJZhqBN0cmrRLafqN9/EVoQir5cIsPff/rXm8Zfieb2BwJd1DMBwWL
	K5PKFuqsrWbHPg==
X-ME-Sender: <xms:IWIwYKAT5eaaXMVsBQ3X4Tpwj4Mr2amJ1qJKOZFpa9v1Z0YwOKNTDQ>
    <xme:IWIwYEg3oT70yOkD1Ol8OACy1pg_YtxifDdQ8WotQ9GKXEYK14b7kGokF4oLPcsp-
    9HWfySlx9g6E2SyFw0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeejgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvghi
    ucfihhgvrhiirghnuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenucggtffrrg
    htthgvrhhnpeettddvffefkeetveekteeiveeggeevieeiudejfeeitedvkeelvdekheej
    lefffeenucfkphepkeeirddufedtrddugeeirdduvddvnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgt
    ohhm
X-ME-Proxy: <xmx:IWIwYNmRD-ACeS-Q9YdzX9g6Ga5RBlZ_c1wUURLz6D9rwki1NXRiGg>
    <xmx:IWIwYIx7mUq8xob1fK0fOaqRMXOcL7-AOIU9y6iODNwwtgKcSMVMFw>
    <xmx:IWIwYPQmrTELcYTjIzf8tvk0NDPWRAZAc8DM720PvZi95OXiTENWpA>
    <xmx:IWIwYCMLSllm66vWmYyaovH_88WzyVoQWxhPxl2uChzCTO2zjwPmmg>
Received: from qwirkle.internal (host86-130-146-122.range86-130.btcentralplus.com [86.130.146.122])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3FA7624005D;
	Fri, 19 Feb 2021 20:13:05 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 3/4] oeqa/commands: Fix compatibility with python 3.9
Date: Sat, 20 Feb 2021 01:12:54 +0000
Message-Id: <20210220011255.823050-3-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210220011255.823050-1-andrei@gherzan.com>
References: <20210220011255.823050-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Python 3.9 dropped isAlive() so use the preferred is_alive().

(From OE-Core rev: 9bb06428cbb2ac0f3d98a1696f050d3393385503)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/commands.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 8b3e12038d..a71c16ab14 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -125,11 +125,11 @@ class Command(object):
 
     def stop(self):
         for thread in self.threads:
-            if thread.isAlive():
+            if thread.is_alive():
                 self.process.terminate()
             # let's give it more time to terminate gracefully before killing it
             thread.join(5)
-            if thread.isAlive():
+            if thread.is_alive():
                 self.process.kill()
                 thread.join()
 
-- 
2.30.1

