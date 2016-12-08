Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 2E58A6080F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 10:30:26 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161208102957846_0684;
	Thu, 08 Dec 2016 10:29:57 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=11489 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cEvxX-0003Vp-6M; Thu, 08 Dec 2016 05:29:51 -0500
Date: Thu, 8 Dec 2016 05:28:34 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: =?ISO-8859-15?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
In-Reply-To: <CALbNGRTyW4UAamkmVYgJo2R=THjifJjttGv6bK_1EhXe1AxriA@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1612080528150.16123@ca624034.mitel.com>
References: <alpine.LFD.2.20.1612080508460.13529@ca624034.mitel.com>
	<CALbNGRTyW4UAamkmVYgJo2R=THjifJjttGv6bK_1EhXe1AxriA@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what exactly does the "meta-systemd" layer do?
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
X-List-Received-Date: Thu, 08 Dec 2016 10:30:27 -0000
Content-Type: multipart/mixed; BOUNDARY="587864349-276591521-1481192916=:16123"

--587864349-276591521-1481192916=:16123
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 8 Dec 2016, Andreas Müller wrote:

> On Thu, Dec 8, 2016 at 11:11 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   almost certainly a dumb question, but what is the purpose of the
> > meta-openembedded/meta-systemd layer? i can see that the general
> > structure of that layer is a pile of bbappend files of the form:
> >
> >   RPROVIDES_${PN} += "${PN}-systemd"
> >   RREPLACES_${PN} += "${PN}-systemd"
> >   RCONFLICTS_${PN} += "${PN}-systemd"
> >
> > so, in the case of, say, dropbear (which, from oe-core, is already a
> > systemd-controlled activity), i see a simple renaming of the package
> > produced. so instead of "dropbear", i'll get "dropbear-systemd".
> >
> >   what am i missing? what is the purpose of that layer?
> >
> > rday
> >
> The initial systemd support was implemented in meta-systemd and later
> moved to oe-core. In the first implementation service files were
> packed in extra packages named ${PN}-systemd. This was undone when
> moving to oe-core. I think today meta-systemd is only there to keep
> package feeds happy.

  ah, and suddenly, it makes way more sense, thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587864349-276591521-1481192916=:16123--
