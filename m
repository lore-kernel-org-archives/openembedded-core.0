Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 4867260017
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 13:14:40 +0000 (UTC)
Received: from [12.20.171.104] (port=34680 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YB1Is-0002sE-Rz; Tue, 13 Jan 2015 08:14:39 -0500
Date: Tue, 13 Jan 2015 05:14:30 -0800 (PST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZSPW=igWoL+-1+dzrMB1_Cr54FOxtaq6H0XWJQmRQKAw@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1501130512080.23356@localhost>
References: <alpine.LFD.2.11.1501130453440.21773@localhost>
	<CAJTo0LZSPW=igWoL+-1+dzrMB1_Cr54FOxtaq6H0XWJQmRQKAw@mail.gmail.com>
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
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: in sysfsutils_2.1.0.bb, is 'S = "${WORKDIR}/sysfsutils-${PV}"' redundant?
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
X-List-Received-Date: Tue, 13 Jan 2015 13:14:49 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1636299937-1421154880=:23356"

--8323328-1636299937-1421154880=:23356
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 13 Jan 2015, Burton, Ross wrote:

>
> On 13 January 2015 at 12:57, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>       setting S that way in the recipe obviously doesn't do any
>       harm, but is it accurate to say that, at least in this case, it's
>       unnecessary?
>
>
> Correct.  A patch from the student is welcome. :)

  actually, there appears to be quite a lot of that scattered
throughout oe-core, so i'm not sure it's worth trying to clean it up
piecemeal as opposed to just doing it in one large patch. as i said, i
realize it doesn't hurt, but i'm a big fan of not having lines where
lines are unnecessary.

  i'll defer to the list ... is it worth tracking down all the recipes
that are doing that and just deleting that redundant line from them?
or is that just unnecessary code churn?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-1636299937-1421154880=:23356--
