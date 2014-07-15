Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id C8865701AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:50:13 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20140715155012167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:50:12 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [69.196.158.250] (port=55168 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X74zW-0000jW-5q; Tue, 15 Jul 2014 11:50:06 -0400
Date: Tue, 15 Jul 2014 11:49:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <53C5477D.3030501@linux.intel.com>
Message-ID: <alpine.LFD.2.11.1407151148030.6425@localhost>
References: <alpine.LFD.2.11.1407150923000.13777@localhost>
	<53C5477D.3030501@linux.intel.com>
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
Subject: Re: curious about why bitbake.conf setting of FILES_${PN}-bin
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
X-List-Received-Date: Tue, 15 Jul 2014 15:50:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 15 Jul 2014, Saul Wold wrote:

> I just did a basic search and could not find any reference and I
> know that PACKAGES/FILES is "greedy" meaning once a file is consumed
> by a FILES entry it's not available again.  Should probably be added
> to the PACKAGES and / or FILES.

  i *know* i've read that before somewhere, just don't remember where.
the only reference i've seen recently is, coincidentally,
lib_package.bbclass:

#
# ${PN}-bin is defined in bitbake.conf
#
# We need to allow the other packages to be greedy with what they
# want out of /usr/bin and /usr/sbin before ${PN}-bin gets greedy.
#
PACKAGE_BEFORE_PN = "${PN}-bin"

  anyone know if it's somewhere in one of the yocto manuals?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


