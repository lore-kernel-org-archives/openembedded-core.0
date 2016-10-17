Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id B928471AF8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 14:04:03 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161017140336034_0684;
	Mon, 17 Oct 2016 14:03:36 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=53426 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bw8Vl-00033t-N8; Mon, 17 Oct 2016 10:03:29 -0400
Date: Mon, 17 Oct 2016 10:02:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Phil Blundell <pb@pbcl.net>
In-Reply-To: <1476712219.31169.2.camel@pbcl.net>
Message-ID: <alpine.LFD.2.20.1610170957520.8690@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610170751190.7117@ca624034.mitel.com>
	<1476712219.31169.2.camel@pbcl.net>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: SERIAL_CONSOLE versus SERIAL_CONSOLES?
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
X-List-Received-Date: Mon, 17 Oct 2016 14:04:04 -0000
Content-Type: multipart/mixed; BOUNDARY="587864349-2029214155-1476712678=:8690"
Content-ID: <alpine.LFD.2.20.1610171002310.8850@ca624034.mitel.com>

--587864349-2029214155-1476712678=:8690
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LFD.2.20.1610171002311.8850@ca624034.mitel.com>

On Mon, 17 Oct 2016, Phil Blundell wrote:

> On Mon, 2016-10-17 at 07:57 -0400, Robert P. J. Day wrote:
> >
>   so is it a fair statement that, pedantically, i might as well just
> > define everything in terms of SERIAL_CONSOLES and think that way?
> >
>
> Yes.  SERIAL_CONSOLE predates SERIAL_CONSOLES and remains supported
> in the configuration for backwards compatibility.  New
> configurations and recipes should probably use SERIAL_CONSOLES and
> ignore SERIAL_CONSOLE entirely.

  i'm good with that, thanks, and one more question related to setting
baud rate for the console port, if i may. what is the precedence order
for the baud rate that is actually used, given that there are a number
of places this can be specified?

  i'm building a systemd-based system, and i'm looking at the
do_install() code in systemd-serialgetty.bb, and as i see it, if one
is using u-boot and a device tree, the baud rate can be specified in a
number of places.

1) apparently, a number of boards defined in u-boot can set the baud
rate in their ft_board_setup() routine.

2) u-boot can pass the baud rate on the kernel command line

3) the device tree blob for the target board might have the baud rate
hard-coded in the DTB

4) using SERIAL_CONSOLES

  am i missing anything? if i follow the code, i'm sure i can puzzle
it out eventually.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587864349-2029214155-1476712678=:8690--
