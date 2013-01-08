Received: from mail-la0-f42.google.com ([209.85.215.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsTfD-0000qa-L4
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 08:32:05 +0100
Received: by mail-la0-f42.google.com with SMTP id fe20so99820lab.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 23:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=2GDiSXQC6rlDIGF7TzGpJxqmSkCmEI8YmZVtwDJ4Wn4=;
	b=s/cinbbeN5a+8cISNZ9iwtJCJZJGVGea2i3uF7r/m2sQpY2XwcueywkWPoNK96pOpD
	ZMFZwWgb17LdpEIrOhubfZRhtlg9yY9mOgoIUrNrC28vtBqyK/YMh8zCoMmAB7pjBlGf
	DXNEHIAA6zh6vhtPtMHSUFiBmBj4Sq8MrYBWJHIMP2ACUaIx7E941wk98Fq/mc6uItMY
	UrbF81OCokrgE183wpx28a3EjOZIIVtSHdNOeGRjHEQ8JWbIGvUKAIIdcsWQZl5I7ppX
	i5pRN7Yrif7tmMes88zeEADltEScLvOit1Gy1CYEOnVHFMPg9A6WYTYomHwjU0tHNw/c
	PbjA==
X-Received: by 10.152.122.133 with SMTP id ls5mr61717796lab.9.1357629409035;
	Mon, 07 Jan 2013 23:16:49 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id er8sm22111523lbb.9.2013.01.07.23.16.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 23:16:48 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TsTQU-0005k5-0l
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 09:16:46 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 09:16:32 +0200
Message-Id: <1357629404-22020-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: Prepare recipes for automake-1.13 (batch 1 / v3)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 07:32:16 -0000

Another round of Upstream-Status improvements.
- Use "Backport" where appropriate
- Use [additional info] instead of (additional info)
- Some new info (first fixed upstream pkg-config version etc)
- Added reason for "Inappropriate" statuses

Also fixed patch name in commit messages:
obsolete-automake-macros.patch -> obsolete_automake_macros.patch

 Dropped already accepted patches from the batch


 - ML


