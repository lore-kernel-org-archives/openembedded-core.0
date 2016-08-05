Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 3AEDA770CD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 15:40:45 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160805154044566_0484;
	Fri, 05 Aug 2016 15:40:44 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=37479 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bVhGd-0008RL-8S; Fri, 05 Aug 2016 11:42:35 -0400
Date: Fri, 5 Aug 2016 11:40:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <158a8ce6-3c80-f979-8897-0904cee8cefa@gmail.com>
Message-ID: <alpine.LFD.2.20.1608051137190.18929@localhost.localdomain>
References: <alpine.LFD.2.20.1608051112190.18419@localhost.localdomain>
	<7beea6c4-ad50-25ae-a21a-41f113634d92@gmail.com>
	<alpine.LFD.2.20.1608051129390.18840@localhost.localdomain>
	<158a8ce6-3c80-f979-8897-0904cee8cefa@gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: where is the safest place to put a single-shot "run and reboot" script?
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
X-List-Received-Date: Fri, 05 Aug 2016 15:40:48 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Aug 2016, Khem Raj wrote:

>
>
> On 8/5/16 8:31 AM, Robert P. J. Day wrote:
> > On Fri, 5 Aug 2016, Khem Raj wrote:
> >
> >>
> >>
> >> On 8/5/16 8:14 AM, Robert P. J. Day wrote:
> >>>
> >>>   i have a systemd-based image that, after coming up normally, i want
> >>> to fire off a one-time script which, after completion, reboots. i've
> >>> been told that using systemd's run-postinsts is discouraged and, for
> >>> now, i just want the simplest and quickest solution.
> >>>
> >>>   suggestions?
> >>
> >> https://github.com/systemd/systemd/blob/master/units/systemd-firstboot.service.in
> >
> >   not sure if this makes a difference, but i don't need the
> > "firstboot" functionality as this script is to be run out of a ramdisk
> > so there is no need for it to keep track if it was ever run before. i
> > just need to run the script once the rest of the system is up, then
> > reboot, nothing more.
>
> should this script be run on every reboot ? if thats the case then write
> a normal service and hook it to your final target e.g. graphical.target
> or wherever you want to insert it in boot sequence.

  it *can* be only because this is a specialized image that is meant
to run only once *anyway*. so, yes, that is a cleaner suggestion, i'll
do that.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


