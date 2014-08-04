Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id B345460703
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 11:19:58 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20140804111958036
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 11:19:58 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=60507 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XEGIz-0008Ut-B3 for openembedded-core@lists.openembedded.org;
	Mon, 04 Aug 2014 07:19:53 -0400
Date: Mon, 4 Aug 2014 07:19:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.11.1408040630210.6237@localhost>
Message-ID: <alpine.LFD.2.11.1408040716390.7019@localhost>
References: <alpine.LFD.2.11.1408040630210.6237@localhost>
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
Subject: Re: a few questions on the proper use of TEMPLATECONF
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
X-List-Received-Date: Mon, 04 Aug 2014 11:20:02 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-13654955-1407151192=:7019"

--8323328-13654955-1407151192=:7019
Content-Type: TEXT/PLAIN; charset=ISO-8859-7
Content-Transfer-Encoding: 8BIT


  short followup to my earlier post ... it seems like
oe-setup-builddir doesn't do a whole lot of input validation. for fun,
i tried to define a new project using /tmp for TEMPLATECONF, knowing
there was nothing valid there to be used as sample files, and here's
what i got (in part):

cp: cannot stat ¡/tmp/local.conf.sample¢: No such file or directory
You had no conf/bblayers.conf file. The configuration file has been
created for
you with some default values. To add additional metadata layers into
your
configuration please add entries to this file.

The Yocto Project has extensive documentation about OE including a
reference manual
which can be found at:
    http://yoctoproject.org/documentation

For more information about OpenEmbedded see their website:
    http://www.openembedded.org/

sed: can't read /tmp/bblayers.conf.sample: No such file or directory

  in the end, despite the obviously fatal errors, i got a new build
directory with no local.conf, and an empty bblayers.conf. that doesn't
really match what the error messages were telling me above.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-13654955-1407151192=:7019--
