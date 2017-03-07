Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 24E7C77579
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 11:14:03 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20170307111401484_0485;
	Tue, 07 Mar 2017 11:14:01 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=21362 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1clD3x-0007AJ-OT; Tue, 07 Mar 2017 06:13:53 -0500
Date: Tue, 7 Mar 2017 06:13:51 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <158ae21e-23b2-aa04-4977-0e640e1f6e55@windriver.com>
Message-ID: <alpine.LFD.2.20.1703070613280.6444@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702191313250.8096@localhost.localdomain>
	<CAJTo0LbM=BKU5CEcr5mVV0cw_VJS_NsCR992Q5RgpH_x8LRHOw@mail.gmail.com>
	<alpine.LFD.2.20.1702200654200.27683@localhost.localdomain>
	<CAJTo0LYVkVgQ3DgEvRU-Ey+x=3pFJD=t=cddD6_d88bXXD9OYw@mail.gmail.com>
	<158ae21e-23b2-aa04-4977-0e640e1f6e55@windriver.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: something seems to have happened to "gpgme" in latest oe-core
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
X-List-Received-Date: Tue, 07 Mar 2017 11:14:04 -0000
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Mar 2017, Mark Hatle wrote:

> FYI, I'm experiencing the same issue on master.
>
> --Mark
>
> On 2/20/17 11:40 AM, Burton, Ross wrote:
> >
> > On 20 February 2017 at 11:54, Robert P. J. Day <rpjday@crashcourse.ca
> > <mailto:rpjday@crashcourse.ca>> wrote:
> >>   gpgme config.log attached.
> >
> > cc1: warning: include location "/usr/include/python2.7" is unsafe
> > for cross-compilation [-Wpoison-system-directories]
> >
> > It decided to try looking on your host for Python libraries for
> > some reason. You'll have to dig into configure.ac
> > <http://configure.ac> to figure out why (or just turn Python
> > explicitly off).

  glad to see i'm not the only person ... anyone have a fix?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


