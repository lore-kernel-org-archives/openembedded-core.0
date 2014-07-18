Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 15A5B70692
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 21:27:07 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20140718212708419
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 21:27:08 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=51033 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X8FgE-0000IN-Lb; Fri, 18 Jul 2014 17:27:02 -0400
Date: Fri, 18 Jul 2014 17:26:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0Lbefya8wCNvhfVXXytN+HH0nuMbsEO7XPfTk5kVzQ0XxA@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407181726070.25832@localhost>
References: <alpine.LFD.2.11.1407181455510.13980@localhost>
	<CAJTo0Lbefya8wCNvhfVXXytN+HH0nuMbsEO7XPfTk5kVzQ0XxA@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: patches can be either ".patch" or ".diff" files, yes?
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
X-List-Received-Date: Fri, 18 Jul 2014 21:27:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 18 Jul 2014, Burton, Ross wrote:

> On 18 July 2014 19:58, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >  not sure where i saw this recently (i'll track it down), but some OE
> > or yocto doc claimed that patch files *must* be suffixed with
> > ".patch". i'm pretty sure it can be either .patch or .diff, correct?
> > as in, it's perfectly valid to do this in a .bbappend file:
> >
> >      SRC_URI += "file://0001-first-change.patch"
> >      SRC_URI += "file://0002-first-change.patch"
> >      SRC_URI += "file://0003-first-change.diff"
> >
> > as long as the filenames match, of course. yes?
>
> For a file to be handled automatically as a patch it must be .diff
> or .patch, and it appears that it can be optionally compressed
> (identifying extensions being .Z .gz .bz2), so foo.patch and
> bar.diff.gz are both automatically applied patches.

  quite so, i just noticed that in patch.bbclass, good to know.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


