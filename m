Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id EC20B60112
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Nov 2015 09:10:59 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20151122091059411_0484
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Nov 2015 09:10:59 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=56556 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1a0QgW-0008Jd-Ce for openembedded-core@lists.openembedded.org;
	Sun, 22 Nov 2015 04:11:48 -0500
Date: Sun, 22 Nov 2015 04:10:51 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1511220407380.13727@localhost>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: what is the value of 'BBPATH ?= ""' in layer.conf?
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
X-List-Received-Date: Sun, 22 Nov 2015 09:11:04 -0000
Content-Type: text/plain; charset=US-ASCII


  perusing some wind river layers, and in the layer.conf file here:

https://github.com/WindRiver-OpenSourceLabs/wr-kernel/blob/LB21_7.0_RCPL0002/conf/layer.conf

i see the opening snippet:

  BBPATH ?= ""
  # We have a conf and classes directory, add to BBPATH
  BBPATH := "${LAYERDIR}:${BBPATH}"

what is the purpose of that initial assignment

  BBPATH ?= ""

if that variable has no value, won't it just expand to the empty
string so that the eventual effect is the same? or is there something
more subtle happening here?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


