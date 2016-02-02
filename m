Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8F6771B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 22:12:40 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id n6so142913obv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 14:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EopRtvK7aVE355KCntCmZhy6Cenod5BvjGdhmQKSVCs=;
	b=YzKxL39SIbxEeIY3pKXx/xq7vRtMuq7TIVlXEoq8XyX+5smPUy1rVKojZTMvtG/YQj
	7aYBvPB9lbV0ZELwr7vBAtKBAsdg8ImRqoE0GHCIAO28QIgCoZ6MhdrmILHj6DHq4s3y
	ui5Eq+Sjk7549hYEQW6oxD1rYi0joYluadWGHF8obCRv9OGRDaROy8pwt/P2nJXpUCr5
	7oTe+pM4qVBkgVGKvA3ZWsaDIZPmFc8k+hqeWuSNa9TLAAKVF0GV3UXZMPjN66VmBfnT
	e8C2Au9z6vLx0lt11y16sUQsZsL4A13EiDG+U2CFH3uOvv0ItzB8C6Czd0F0ALSKZSln
	GVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EopRtvK7aVE355KCntCmZhy6Cenod5BvjGdhmQKSVCs=;
	b=JuTyK0J/ztAqefWjZaJz2RbC++USaDq5snsbnKAr2NqPidPpnBal1cepv3RL8mFN/u
	LA1fcfDkYYn1xTl9q5OngfOVC46EzFbXlrGQnoorMhJsORqbx5BZbvuQtS0y5hcLxen5
	wpZLZFzYNHKxnWR9V6HVPVZ7Gt6bFgFSuepjwgwzLWiVAVoAAFJfEa3fZTGN2qfO9JDB
	C6dLBQ6kIzlF0SxjglImt65v8yEvT7tAiGAykBGi2pCUk89IUBA/2IRmWMVsx+KabBbY
	h9IMdNt82dDXORoA0eBjKeP59JnXqPLgYf8GPpZ/j6M7DROfyBx72mvQzJcsEVFsoPVn
	jBqQ==
X-Gm-Message-State: AG10YOS/dzYUvbpPcJEmpjUvvln9k0HmbYkegrRL4uu1iYZFlSSJ9zYP/D5yygr21PnmWQ==
X-Received: by 10.182.106.13 with SMTP id gq13mr26770001obb.38.1454451161476; 
	Tue, 02 Feb 2016 14:12:41 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id q10sm1726245obg.1.2016.02.02.14.12.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 14:12:40 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 14:12:30 -0800
Message-Id: <1454451153-19783-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] gnutls: cleanup + add libidn PACKAGECONFIG option
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
X-List-Received-Date: Tue, 02 Feb 2016 22:12:41 -0000

Andre McCurdy (3):
  gnutls.inc: minor formatting improvements
  gnutls.inc: add gmp to DEPENDS
  gnutls.inc: allow libidn support to be controlled via PACKAGECONFIG

 meta/recipes-support/gnutls/gnutls.inc | 44 ++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 20 deletions(-)

-- 
1.9.1


