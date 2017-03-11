Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id E5F897309B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 09:58:16 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170311095815376_0685;
	Sat, 11 Mar 2017 01:58:15 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=40610 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cmdmq-000637-Ow; Sat, 11 Mar 2017 04:58:08 -0500
Date: Sat, 11 Mar 2017 04:57:58 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <97985b49-64ba-3fae-58a6-6eee4ad8126c@gmail.com>
Message-ID: <alpine.LFD.2.20.1703110455070.18594@localhost.localdomain>
References: <alpine.LFD.2.20.1703110315570.17105@localhost.localdomain>
	<97985b49-64ba-3fae-58a6-6eee4ad8126c@gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how does files/fs-perms.txt affect building base-files rpm?
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
X-List-Received-Date: Sat, 11 Mar 2017 09:58:17 -0000
Content-Type: text/plain; charset=US-ASCII

On Sat, 11 Mar 2017, Khem Raj wrote:

> On 3/11/17 12:30 AM, Robert P. J. Day wrote:
> >
> >   potentially a dumb question, but do the settings in
> > files/fs-perms.txt affect the building of the base-files rpm just
> > as they would affect the building of any other rpm?
>
> it should be executing fixup_perms() in PKGD before splitting the
> package, so yes it should run for all recipes.

  so it is possible that, despite the manual settings in the
base-files do_install() task, fs-perms.txt might override some of
those settings. i'm not saying i've seen anything like that, just
clarifying the possibility.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


