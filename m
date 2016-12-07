Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0792F719A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 13:39:03 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161207133902846_0684;
	Wed, 07 Dec 2016 13:39:02 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=26594 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cEcQy-0001Pf-0d; Wed, 07 Dec 2016 08:38:56 -0500
Date: Wed, 7 Dec 2016 08:37:38 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: =?ISO-8859-2?Q?Maciej_Borz=EAcki?= <maciej.borzecki@rndity.com>
In-Reply-To: <CAD4b0_+EACruAvA839=YTu8=FHAjGcuMzFbaLugJZQD6NOjf2Q@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1612070835310.2008@ca624034.mitel.com>
References: <alpine.LFD.2.20.1612060948001.9434@ca624034.mitel.com>
	<CAD4b0_+EACruAvA839=YTu8=FHAjGcuMzFbaLugJZQD6NOjf2Q@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what is the closest alternative to red hat's ABRT in OE?
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
X-List-Received-Date: Wed, 07 Dec 2016 13:39:05 -0000
Content-Type: multipart/mixed; BOUNDARY="587864349-1131487499-1481117861=:2008"

--587864349-1131487499-1481117861=:2008
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 6 Dec 2016, Maciej Borzęcki wrote:

> On Tue, Dec 6, 2016 at 3:49 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   as in:
> >
> > https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/ch-abrt.html
> >
> > specifically, to manage core files? i would have thought judicious use
> > of "ulimit" would be the solution. others?
> >
>
> If you're using systemd there is systemd-coredump(8).

  already looking into that ... is it safe to say that RH's "abrt" is,
well, exclusive to RH?

  and pretty sure i asked this before ... is there some reasonable
equivalent to "sosreport" for OE?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587864349-1131487499-1481117861=:2008--
