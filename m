Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBB4074753
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 14:08:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4SE7Y6i010051
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 May 2018 07:08:26 -0700
Received: from yow-masselst-lx1.localnet (128.224.21.83) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 28 May 2018 07:07:54 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 May 2018 10:07:54 -0400
Message-ID: <1836266.iKU578Kg5i@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CANNYZj-6rir5zZ336Oz80jXL_w-7veu1o3LwDU78_-7EpqgSwg@mail.gmail.com>
References: <1527514686-21442-1-git-send-email-mark.asselstine@windriver.com>
	<CANNYZj9-6cXUBtrrrVTUgj=qYsJTQ6JGTZdYydXJBRX+gUQQCg@mail.gmail.com>
	<CANNYZj-6rir5zZ336Oz80jXL_w-7veu1o3LwDU78_-7EpqgSwg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] recipe_links.bbclass: introduction
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
X-List-Received-Date: Mon, 28 May 2018 14:08:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, May 28, 2018 9:52:16 AM EDT Alexander Kanavin wrote:
> (don't forget devtool also has 'edit/find/update-recipe' commands).

Since it keys off the FILE and BBINCLUDED as parsed it follows along with the 
devtool workspaces just fine. There should be no confusion added and if 
anything seeing the link to the bbappend in the devtool workspace being 
included in the links should add a level of comfort.

This was sent for RFC quite a while ago, I am only now getting around to 
pushing for proper inclusion.

Mark

> 
> Alex
> 
> 2018-05-28 16:50 GMT+03:00 Alexander Kanavin <alex.kanavin@gmail.com>:
> > 2018-05-28 16:38 GMT+03:00 Mark Asselstine 
<mark.asselstine@windriver.com>:
> >> This is a new class which can be used (for example via USER_CLASSES in
> >> local.conf) to make your build more development friendly. When
> >> included this class will create symlinks to the various bb and
> >> bbappend files in WORKDIR.
> > 
> > I do think this is a great idea, I only want to ask, how well this
> > integrates with devtool workflows?
> > Particularly, 'devtool add/modify/upgrade' do their own recipe copying
> > and manipulation, so we should make sure this does not increase the
> > confusion.
> > 
> > Alex





