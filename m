Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDCC371D9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:20:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBDFKSd7014399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 13 Dec 2016 07:20:28 -0800
Received: from yow-masselst-d1.localnet (128.224.56.91) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Tue, 13 Dec 2016 07:20:27 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 10:20:25 -0500
Message-ID: <2300280.p2E0ZC6noH@yow-masselst-d1>
Organization: Wind River Internation Inc.
User-Agent: KMail/5.1.3 (Linux/4.4.0-21-generic; KDE/5.18.0; x86_64; ; )
In-Reply-To: <CAJTo0Lb0SgZH9LQyqwdXm858XTk6RQD0HTGBnZ1g-sXoy_HbjQ@mail.gmail.com>
References: <1481571408-19983-1-git-send-email-mark.asselstine@windriver.com>
	<3629007.TMJVuC0a6H@tal>
	<CAJTo0Lb0SgZH9LQyqwdXm858XTk6RQD0HTGBnZ1g-sXoy_HbjQ@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: disable 'libdir' QA check
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
X-List-Received-Date: Tue, 13 Dec 2016 15:20:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, December 12, 2016 9:17:14 PM EST Burton, Ross wrote:
> On 12 December 2016 at 20:51, Mark Asselstine <mark.asselstine@windriver.com
> > wrote:
> > 
> > I think the discussion I pointed to in the commit log closes the door on
> > any
> > such change. Specific the comment from Lennart --
> > https://github.com/systemd/systemd/issues/3810#issuecomment-235290526
> > 
> > They don't want the library to be found in the default search path, they
> > want
> > to maintain this as a "hidden, internal resource".
> 
> Oh if it's an implementation detail of systemd and not a user-facing
> library then I can see their argument I guess.
> 
> Don't agree with it though.  But, the point is that as long as the parts of
> systemd that could realistically be multilibd are in $libdir then this
> isn't a problem.

It is definitely an internal infra item for systemd and not seen as a 'public' 
library so I think we are best to run with it. I am with you that I don't 
necessarily agree with it. Khem, does this satisfy your concerns?

Mark

> 
> Ross



