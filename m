Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 717987327F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 13:41:13 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160602134112911_0685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2016 06:41:12 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=42339 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1b8Stg-0003fx-5a for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2016 09:42:52 -0400
Date: Thu, 2 Jun 2016 09:40:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1606020932230.27421@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: easiest way to patch some headers in gcc-5.2 source?
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
X-List-Received-Date: Thu, 02 Jun 2016 13:41:14 -0000
Content-Type: text/plain; charset=US-ASCII


  for backward compatibility reasons, i need to patch some header
files in gcc-5.2 to change some quoted includes to angle bracket-style
includes.

  i have the patch, and this change is only to make the resultant
cross-compiler work properly, but i figure the easiest thing to do is
just apply the patch to *all* gcc-5.2 compilations (native, cross,
whatever) since it's all fairly innocent and won't break anything that
already works.

  from what i see, in all the recipes and inc files under
oe-core/meta/recipes-devtools/gcc/, i can just add the application of
that patch to the gcc-source_5.2.bb recipe, which will then apply to
all gcc-5.2 compilation output, is that correct? so i'd create me a
little gcc-source_5.2.bbappend file and add my patch to SRC_URI.

  does all that sound reasonable? am i reading this correctly?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


