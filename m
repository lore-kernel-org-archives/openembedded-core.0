Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 71E4776E09
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 13:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7VDrpM1027107; Mon, 31 Aug 2015 14:53:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gY6HhsJgW3ZF; Mon, 31 Aug 2015 14:53:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7VDrcdM027098
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 31 Aug 2015 14:53:49 +0100
Message-ID: <1441029218.26554.21.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Mon, 31 Aug 2015 14:53:38 +0100
In-Reply-To: <CAP9ODKrn8285URXOwLeR2Z_M=sAj0Y0MR_ZsL_D4mbA=UHi_zQ@mail.gmail.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<cover.1440680489.git.jussi.kukkonen@intel.com>
	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
	<7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
	<CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>
	<CAHiDW_FTdPR1gP12VLfVtijg5NVpYPCm_3vmDga-O_8KoHkDag@mail.gmail.com>
	<CA+chaQe6ayG9k1Hh9sqN+EaBr8GskHMWVQ_L9LqycVhSJN3YqA@mail.gmail.com>
	<1440843517.32588.7.camel@linuxfoundation.org>
	<CAP9ODKrn8285URXOwLeR2Z_M=sAj0Y0MR_ZsL_D4mbA=UHi_zQ@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Mon, 31 Aug 2015 13:53:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-08-31 at 10:22 -0300, Otavio Salvador wrote:
> On Sat, Aug 29, 2015 at 7:18 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2015-08-29 at 10:43 +0200, Martin Jansa wrote:
> >> Did you enable thumb in that qemuarm build?
> >>
> >>
> >> It's disabled by default and multiple components are broken when you
> >> enable it, see:
> >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
> >
> > I'm going to draw a line here. People are asking that the old version of
> > gmp be brought back due license issues, fine. It doesn't mean that all
> > the bugs in said old release should be fixed.
> >
> > If thumb on arm with old gmp is an issue for people, I'd suggest that
> > those people figure out which patches are needed and send the patches.
> > Asking Jussi to deal with this isn't right/fair though.
> 
> I disagree. If it will be merged it ought to support what we are
> testing nowadays otherwise the backlog will be kept growing forever...

We cannot reasonably expect Jussi to do this work. 

OE needs to move onward, be it with kernel versions, compiler versions
or library versions since not to do so effectively will result in OE
becoming obsolete and out of touch.

The GNU world moving to *GPLv3 is unfortunate in some ways but isn't
something I/we have any choice over.

We have a commitment right now to have some older licenced recipes. To
make those work, *someone* is going to have to step up and work on them.
Who is going to do it?

By your comment, I should just refuse the old gmp version entirely?

Cheers,

Richard


