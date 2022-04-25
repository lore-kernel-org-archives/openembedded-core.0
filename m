Return-Path: <seebs@seebs.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0064C4332F
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:10 +0000 (UTC)
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.33561.1650910611834580723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 11:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=LhX7OY1v;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id B95292E891F;
	Mon, 25 Apr 2022 13:16:50 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1650910611; bh=ROhu9wsa1x8+0ma0VVvZb3CmDy3QblOVBDwCkRX9hGw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LhX7OY1v5T/qKIFRDMa0gBoaT0eqm7+3FLw3UProP7euoPGjnzP3rVmQWdOvOwQUU
	 gIviNB9mtGjOuCj7Z5Zja708woSME/L+9WJ+goNuGDyYmr5VKBn8s7myItGmVXv2xf
	 ANxIbf6KXhfxwhMkuP2pwgu1wJysikFRHzq9hYv5wz/SPglfoAKh0c4ObFLbO3LJAW
	 SGA7uhw+3tTNfhlyh7tsu8IdValyBlX+LlnP3Z8x3D5Q8BAbG2wJOW1/prvC9XtTB3
	 Y/JFMaDuSWb8TVDWZI5rv6aHMBxIo+vnDECnYXMMDrp4+KQmVGRVHqlSauGhpqTv3s
	 8RoNkK0M78L7A==
Date: Mon, 25 Apr 2022 13:16:48 -0500
From: Seebs <seebs@seebs.net>
To: "C. Andy Martin" <cam@myfastmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pseudo][PATCH] do not abort on hard link path
 mismatch
Message-ID: <20220425131648.3c43999f@seebsdell>
In-Reply-To: <fcecdd1b-567d-4a1f-b622-828362f2fd35@www.fastmail.com>
References: <20220425144924.1033647-1-cam@myfastmail.com>
	<20220425104456.1a8e3531@seebsdell>
	<fcecdd1b-567d-4a1f-b622-828362f2fd35@www.fastmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164840

On Mon, 25 Apr 2022 14:01:58 -0400
"C. Andy Martin" <cam@myfastmail.com> wrote:

> I agree this is not the ideal solution. However, I was basing this
> compromise on this commit:

Yeah. Come to think of it, directory mismatches are already probably
blowing up differently because we're more concerned about that.

Probably okay.

-s

