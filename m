Return-Path: <jefro.net@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id C01F0607F8;
	Wed, 22 Jun 2016 06:13:24 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id w1so6152872vka.1;
	Tue, 21 Jun 2016 23:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to;
	bh=590SFT4TaxlCNdr0j3VEQur0AIOrELVyJ59DFlgG4Fk=;
	b=NIPh5wrKB4shG+YPncNxxedCKVxHAjWp4ca2N7bi00DtFcbGhS2PBw+J6bQzFxZh6h
	OmjVGuA1eUWZkYb9HyZPBa/579x8CMxzZKCiy+70vQ2VO2KPXj8Wz2naFsmnOg8IndAu
	EKR5ljIIn7lVqVAKqSjmgkoELkSmCYUP3HoHIS1TZut9H7CrNnnnb0GCzpu8iLu9Wmhm
	Ebh6BeJcAwNQN2wDE7ffDcThSeIKMPv/lLjLgg63IMtO5UlFnN2BUmSxlVPxXISqWFS1
	qlneTdUL2zpirgtlRKljGStqwi4GGiWDWTnHVI6CmkkZ+xFmFT2ZfXcsXx7q3QPEL4rO
	4NIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
	:to; bh=590SFT4TaxlCNdr0j3VEQur0AIOrELVyJ59DFlgG4Fk=;
	b=AKRdqiC7EKQFhRWrRjjj86EvQ7JSfuAiyf1yTDd/ZwgkUMJDvA90sXlguppILch1yw
	jWf9RYlNyoTNkzitMUMmCjEMzb0YsUmbbCi1HFAXGhEJ47ySwQWoNvZucug1SjeyI1dz
	UyrE8R7hOAW6WBVDFgAb/0Yn/dGY/U5bnMjAx5j9s+kokxZR0oXZ91PqjI9mVSJmLBrr
	Ug7GLBA9M4llvoA4SfuAFFd4Wb5DQ9i8nLY4gaeZWsTGFI1/OfMRwjZp2+5ukwfUR2wb
	pBWn/bUyiHWaelzU5F8b8O8YCQ3n2uSJCt5vkgXKkb1r0u+FldjcdPahBJq49Krnq32M
	GBRg==
X-Gm-Message-State: ALyK8tKTeJzjBV5aWjyrXmyK0RCo3/Mv08UQhXjFlBoYSl5p9EP3TfJ+C6mSLEbvJhMyhE5RsfOaOZKYGgg5YA==
X-Received: by 10.31.227.196 with SMTP id a187mr12107486vkh.116.1466576004645; 
	Tue, 21 Jun 2016 23:13:24 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.103.68.65 with HTTP; Tue, 21 Jun 2016 23:13:05 -0700 (PDT)
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Tue, 21 Jun 2016 23:13:05 -0700
X-Google-Sender-Auth: XrBW79hJthLU1s_dM7TQog3e0Us
Message-ID: <CA+YB3rapfPf_s6sWGxR+Ya9oCQMnsMp7vPYGDO4n2Ws=-6bm6w@mail.gmail.com>
To: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Yocto Project <yocto@yoctoproject.org>
Subject: Yocto Project Developer Day & OEDEM at ELCE this fall
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
X-List-Received-Date: Wed, 22 Jun 2016 06:13:25 -0000
Content-Type: text/plain; charset=UTF-8

Hi all - in case folks are starting to make travel arrangements for
ELCE in Berlin this October, we are planning both a YP DevDay (paid
training event) and OEDEM (OpenEmbedded members & developers meeting).
We don't have venues yet, but these two events will likely occur on
the Monday and Friday before and after ELCE, Oct 10 and Oct 14. We
aren't sure yet which will be on which day, but chances are good that
DevDay will be on Monday and OEDEM on Friday.

I will keep these lists informed as we move forward.

Also, the CFP for ELCE, OpenIOT Summit, and LinuxCon EU are still
open, so please get your talks in. ELCE is here:

http://events.linuxfoundation.org/events/embedded-linux-conference-europe

Please feel free to let me know of any questions.

-- 
Jeff Osier-Mixon - Open Source Community Engineer, Intel Corporation

