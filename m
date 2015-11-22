Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 1766B6010D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Nov 2015 09:29:34 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20151122092933144_0685;
	Sun, 22 Nov 2015 01:29:33 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [99.240.204.5] (port=57068 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1a0QyS-0007Gp-UP; Sun, 22 Nov 2015 04:30:21 -0500
Date: Sun, 22 Nov 2015 04:29:23 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <56518812.2030705@windriver.com>
Message-ID: <alpine.LFD.2.20.1511220426050.13978@localhost>
References: <alpine.LFD.2.20.1511220407380.13727@localhost>
	<56518812.2030705@windriver.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what is the value of 'BBPATH ?= ""' in layer.conf?
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
X-List-Received-Date: Sun, 22 Nov 2015 09:29:37 -0000
Content-Type: text/plain; charset=US-ASCII

On Sun, 22 Nov 2015, Robert Yang wrote:

>
>
> On 11/22/2015 05:10 PM, Robert P. J. Day wrote:
> >
> >    perusing some wind river layers, and in the layer.conf file here:
> >
> > https://github.com/WindRiver-OpenSourceLabs/wr-kernel/blob/LB21_7.0_RCPL0002/conf/layer.conf
> >
> > i see the opening snippet:
> >
> >    BBPATH ?= ""
> >    # We have a conf and classes directory, add to BBPATH
> >    BBPATH := "${LAYERDIR}:${BBPATH}"
> >
> > what is the purpose of that initial assignment
> >
> >    BBPATH ?= ""
>
> There would be a warning when BBPATH is null, but that had been fixed,
> so we don't need it nowadays.
>
> // Robert

  i thought as much, i just wanted to be sure. i am a rabid minimalist
in that, if a line has no value, it should be removed, mostly to avoid
confusing people like me. :-) i noticed at least a couple WR-OSL
layers that had that construct, you can decide if you care enough
about it to clean it up. thanks for the clarifiation.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


