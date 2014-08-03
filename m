Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 27B4761585
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Aug 2014 06:56:12 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20140803065612777
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Aug 2014 06:56:12 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=59412 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XDpiB-0001mL-Jk; Sun, 03 Aug 2014 02:56:07 -0400
Date: Sun, 3 Aug 2014 02:56:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20140802200959.GA22882@haswell>
Message-ID: <alpine.LFD.2.11.1408030254520.10897@localhost>
References: <alpine.LFD.2.11.1408021229180.24061@localhost>
	<CAMKF1srw7Rho8mFxL9nfB-wm3OQsx8QPV_DMqEQ4Miv8uxiFdg@mail.gmail.com>
	<alpine.LFD.2.11.1408021555440.5174@localhost>
	<20140802200959.GA22882@haswell>
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
Subject: Re: can pkg_{pre, post}rm functions be run at all for image creation?
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
X-List-Received-Date: Sun, 03 Aug 2014 06:56:15 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 2 Aug 2014, Khem Raj wrote:

> On 14-08-02 15:57:00, Robert P. J. Day wrote:
> > On Sat, 2 Aug 2014, Khem Raj wrote:
> >
> > > On Sat, Aug 2, 2014 at 9:34 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > > > say, pkg_prerm() functions would never be written with respect to the
> > > > variable ${D}, which would be relevant only during image creation. but
> > > > i can see things like this in sysklogd.inc:
> > > >
> > > > pkg_prerm_${PN} () {
> > > >         if test "x$D" = "x"; then
> > >
> > > note that its not ${D} (bitbake context) but $D which is evaluated
> > > in the context when the script is run.
> >
> >   i still don't understand ... what are the possible values of $D
> > here, and what would they represent?
>
> At build time it will not be expanded by bitbake like ${D} is. but
> during image creation it will be. But when doing on-device install
> of this package $D will be empty. Its a way to differentiate actions
> during image creation and on-device install/update/remove

  but the yocto dev manual states pretty clearly that pkg_prerm and
pkg_postrm functions are *not* used during image creation. so you're
saying they are? under what circumstances?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


