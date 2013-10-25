Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6606D2F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 12:33:09 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id e14so6081189iej.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9wOQFh71wZvvwNtIXsSGHFe0nhOOf+gd1XfXEpiH6dM=;
	b=KY3PGSizcTozoNpIYvRKcbvaPEq4Mx6R+50LFLCCUuc8avyVzmuFP9/Te9qFb7gzED
	lNlB8UP8HFJ12mFxBDcJDAA/f36ZDo2lY2xEArS/6tQjreIF57YYuqRLxLv+DbBVZRoP
	TAkSC+sLWouh0KCOA9FSI5EEYD1Jk48XJLNyXSj+QCwwgGDvxjkjyEMnn676VTeDKV+3
	FGNeoD1pSXeIg1MEbEeNXOBw571Ap6F7NzmdzvALtXN5GtVRp7oexOF0lbbIrhKaX2la
	eN27+n4x8LEiUYuRO7Nu6T6VBsodl5B5quNGHpbZyadgj1ufqvJ5CDowagQgU3gBJ8V6
	cQFQ==
X-Received: by 10.50.26.36 with SMTP id i4mr1937975igg.33.1382704391074; Fri,
	25 Oct 2013 05:33:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Fri, 25 Oct 2013 05:32:41 -0700 (PDT)
In-Reply-To: <58deef15f737352489f007488ec2e24bd76be058.1382421718.git.jackie.huang@windriver.com>
References: <cover.1382421718.git.jackie.huang@windriver.com>
	<58deef15f737352489f007488ec2e24bd76be058.1382421718.git.jackie.huang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2013 05:32:41 -0700
Message-ID: <CAMKF1sqwHn4SU1U9_Cp0hsd8EKGYuteazX+OP7T5mQNDztPSsg@mail.gmail.com>
To: jackie.huang@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] midori: exclude from self-hosted for mips64
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
X-List-Received-Date: Fri, 25 Oct 2013 12:33:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 21, 2013 at 11:04 PM,  <jackie.huang@windriver.com> wrote:
> midori depends on webkit-gtk which could not build for mips64.

what issues do you see building webkit-gtk for mips64, IIRC I fixed it
some time ago

