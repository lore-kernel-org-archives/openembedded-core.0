Return-Path: <philip.balister@gmail.com>
Received: from mail-qe0-f51.google.com (mail-qe0-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 968B560C23
	for <openembedded-core@openembedded.org>;
	Sun, 29 Dec 2013 18:27:41 +0000 (UTC)
Received: by mail-qe0-f51.google.com with SMTP id 1so10701935qee.24
	for <openembedded-core@openembedded.org>;
	Sun, 29 Dec 2013 10:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=CHL2VrPrZgeh/W0R1sPl4xN7W17wVRxgswpzMxSnBVc=;
	b=r2UJE6ZH63GZBm1A0CwezoKGrGHCiGFdyXsEUzuYDQ2sSAsYIYc+3Lm/CHW5yFfTrW
	x2ZCb5uFhwNQWNwAyBqAuyw6MsliOD0TfmSRUFX8vyeOT+ATa37NYMmJxJAOv+Yi1AF/
	uOQj+POAPi18QfosaMvRJoVd291dekjbDFA9Q+cv37c9VIKWgxGR9VTJlceNjin88aet
	4QgptSGC/p04UYIfDNDx09eTqzUwokThfafSFU2RHwAf/ZmrinaicMAD57G5Wk7gIQul
	+7XRLxND+xAGP40KG/TKXutHkYPoK50RFbGbZzbvpv99BmcCYV9VXk3WCiakc/rPnxEe
	jm0A==
X-Received: by 10.224.51.74 with SMTP id c10mr99476681qag.7.1388341662137;
	Sun, 29 Dec 2013 10:27:42 -0800 (PST)
Received: from localhost.localdomain
	(pool-71-171-43-170.ronkva.east.verizon.net. [71.171.43.170])
	by mx.google.com with ESMTPSA id lc1sm65140616qeb.5.2013.12.29.10.27.41
	for <openembedded-core@openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Dec 2013 10:27:41 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@openembedded.org
Date: Sun, 29 Dec 2013 13:27:37 -0500
Message-Id: <1388341658-8266-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.8.3.1
Subject: db : Include C++ binding library in Berkeley DB
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
X-List-Received-Date: Sun, 29 Dec 2013 18:27:42 -0000

v2 resolves an rpath issue in the native-sdk.


