Return-Path: <bkylerussell@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 96D3F6E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 02:33:36 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id m101so200192411ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 19:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=O9bjGNLmRNuN9JMokXc1cqMNAR4B2u4Smpa39wYz+pA=;
	b=uIFUh+H7j34YDnG+/zWftOh5TAsDe/0+mJfGlSPj1ESl20g4235yd+m+XQSXYYWsZR
	GvFISXO0ng60suuv8sfiM2HGcJ9tmRjBvavkX6tk6CK2uv4X4cWvcACE0QKfX0RTGXwu
	sOEZ3GT+rEYgxeM4hnFWh54nzh3Iop3R66tdnIGcDPjDZv1G4JINV3LztwTvjLCmcIVq
	46C32hMLP/68516D2mcnao/Ogf0aQM0Fmiiu5abbOlfOMhfD9LSu+LHEb1ZvNcMOovDf
	HGh1cylBkV69Mk7j0FdGi+dXf7WboeQbTaqC6puX+r3SdzR+RM/Xu2qdYfdnqqeBySAK
	0aLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O9bjGNLmRNuN9JMokXc1cqMNAR4B2u4Smpa39wYz+pA=;
	b=PSgXWpiDzhjgcl7VS8o9fjlHS7ny1C49EMEECzTVLiBhD4eA/Nq6GT1QR/jg+IcroJ
	0BTi/UrLAk86htoI0geVYBKq0XO41tQwT3aruXnliyjPPJPz9ki0ZAczMgIeyXKMygVx
	ufI3siaJrictQz206Yk7IsFLpEfBXi1yGzflcSiKx26sjw9ADRCabtShDvBJJso0DfKO
	mmVAdLg+M51IOgVbFBGG5EhM7D1Y36Kk3SShjC/leW6g0yAk3Tg3sLaFvb272ZemX/wf
	4R8RYyUp4hGcZt8VkR+/QLCKYBqtRdf4cL/jg8iwXxPpGYKBPaFkfkhcINQCDCPW7bRK
	NkOQ==
X-Gm-Message-State: AEkoouvK3niv6kM99cJPGa9H69TVYTvAFKeoiAHvHrLeqoloGQ5w+yWDpUlUtMZJGGs4JQ==
X-Received: by 10.107.149.16 with SMTP id x16mr57026958iod.141.1470105216762; 
	Mon, 01 Aug 2016 19:33:36 -0700 (PDT)
Received: from brrussell-Latitude-E6530.natcky.rr.com
	(cpe-76-177-112-62.natcky.res.rr.com. [76.177.112.62])
	by smtp.gmail.com with ESMTPSA id c38sm380726ioj.19.2016.08.01.19.33.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Aug 2016 19:33:36 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2016 22:32:48 -0400
Message-Id: <1470105169-11367-1-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta][PATCH] python-native: Compute prefix based on staging area
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
X-List-Received-Date: Tue, 02 Aug 2016 02:33:37 -0000

This patch is based off the jethro branch, which is where I encountered the issue.
I haven't had a chance to check this on master yet, so it's not clear to me whether
or not this is still an issue there.  I was hoping for some feedback on whether or
not this patch would be feasible for jethro, and whether or not it has already been
addressed in newer versions of the python-native recipe.

Kyle Russell (1):
  python-native: Compute prefix based on staging area

 ...g.py-prefix-should-be-inside-staging-area.patch | 32 ++++++++++++++++++++++
 .../python/python-native_2.7.11.bb                 |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-native/0001-sysconfig.py-prefix-should-be-inside-staging-area.patch

-- 
1.9.1


