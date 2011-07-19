Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QjDuS-00069f-2H for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 19:16:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6JHCYm5003642
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 18:12:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02290-10 for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 18:12:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6JHCMHl003634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 18:12:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <85C1F582-84B3-438E-BC95-B25C2659DF18@dominion.thruhere.net>
References: <cover.1310969462.git.dongxiao.xu@intel.com>
	<c4ca6242b49eddc218fa3c0f58d172efc1601c84.1310969462.git.dongxiao.xu@intel.com>
	<FE823AAC-2695-4FB2-9E90-BCD2ED38771B@dominion.thruhere.net>
	<281DBDA2-688D-4559-8191-276A44DEDF70@dominion.thruhere.net>
	<4E245054.4000303@windriver.com> <4E245163.4000809@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D6DF8A02@shsmsx501.ccr.corp.intel.com>
	<85C1F582-84B3-438E-BC95-B25C2659DF18@dominion.thruhere.net>
Date: Tue, 19 Jul 2011 18:12:21 +0100
Message-ID: <1311095541.2344.22.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/4] udev: Change hard coded /usr/lib to support multilib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jul 2011 17:16:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-19 at 09:41 +0200, Koen Kooi wrote:
> Op 19 jul 2011, om 02:30 heeft Xu, Dongxiao het volgende geschreven:
> 
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> >> Mark Hatle
> >> Sent: Monday, July 18, 2011 11:30 PM
> >> To: openembedded-core@lists.openembedded.org
> >> Subject: Re: [OE-core] [PATCH 3/4] udev: Change hard coded /usr/lib to support
> >> multilib
> >> 
> >> Replying to myself.. sorry, I misunderstood the concern.. see below for a new
> >> explanation..
> >> 
> >> On 7/18/11 10:25 AM, Mark Hatle wrote:
> >>> On 7/18/11 7:32 AM, Koen Kooi wrote:
> >>>> 
> >>>> Op 18 jul 2011, om 09:08 heeft Koen Kooi het volgende geschreven:
> >>>> 
> >>>>> 
> >>>>> Op 18 jul 2011, om 08:13 heeft Dongxiao Xu het volgende geschreven:
> >>>>> 
> >>>>>> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> >>>>>> ---
> >>>>>> meta/recipes-core/udev/udev-164/makefile.patch |   16
> >> ++++++++++++++++
> >>>>>> meta/recipes-core/udev/udev-new.inc            |    1 +
> >>>>>> meta/recipes-core/udev/udev_164.bb             |    2 +-
> >>>>>> 3 files changed, 18 insertions(+), 1 deletions(-) create mode
> >>>>>> 100644 meta/recipes-core/udev/udev-164/makefile.patch
> >>>>>> 
> >>>>>> diff --git a/meta/recipes-core/udev/udev-164/makefile.patch
> >>>>>> b/meta/recipes-core/udev/udev-164/makefile.patch
> >>>>>> new file mode 100644
> >>>>>> index 0000000..c46ff4b
> >>>>>> --- /dev/null
> >>>>>> +++ b/meta/recipes-core/udev/udev-164/makefile.patch
> >>>>>> @@ -0,0 +1,16 @@
> >>>>>> +Upstream-Status: Inappropriate [configuration]
> >>>>> 
> >>>>> Could you explain why it's inappropriate for upstream but why we do need it
> >> here?
> >>>> 
> >>>> I asked the udev maintainer:
> >>>> 
> >>>> 14:25 < koen> kay: the udev Makefile.am has 'ln -sf $(libexecdir)/udev-acl
> >> $(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d/udev-acl.ck', any reason for not
> >> using ${libdir} over ${prefix}/lib ?
> >>>> 14:29 < kay> koen: libdir is /usr/lib64 here, can't use that
> >>>> 
> >>>> So upstream is aware of multilib, but wants to put these scripts in a
> >> non-multilib dir. Since I don't have any experience with the fedora/opensuse
> >> way of multilib nor the new oe-core one, could you please explain why oe-core
> >> needs this patch, but fedora/opensuse don't?
> >>> 
> >>> This is likely a problem with the multilib fix.  "libexecdir" is often
> >>> /usr/lib on many distribuions.. however as your other email
> >>> mentioned.. setting it to
> >>> /usr/lib64 is a mistake.  It should be /usr/libexec or /usr/lib64.
> >>> All of the associated multilib packages should work correctly and no
> >>> conflicts introduced with this package (file contents should be
> >>> identical.)
> >>> 
> >>> It should be permissible for libexecdir to be changed in the
> >>> configuration if someone really wants it to be.  By default (in bitbake.conf) it
> >> is:
> >>> 
> >>> export libexecdir = "${exec_prefix}/libexec"
> >> 
> >>> +-	mkdir -p $(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d
> >>> +-	ln -sf $(libexecdir)/udev-acl
> >> $(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d/udev-acl.ck
> >>> ++	mkdir -p $(DESTDIR)$(libdir)/ConsoleKit/run-seat.d
> >>> ++	ln -sf $(libexecdir)/udev-acl
> >>> ++$(DESTDIR)$(libdir)/ConsoleKit/run-seat.d/udev-acl.ck
> >> 
> >> I see libexecdir CAN be changed.. so the above is already possible..
> >> 
> >> The part they had hard coded is "/usr/lib/ConsoleKit"...  There is only one
> >> location in the system for ConsoleKit configuration files/scripts.. and that is
> >> distro specific.  Assuming the oe based distributions use
> >> $(PREFIX)/lib/ConsoleKit.. then the previous was correct.
> >> 
> >> The point being it doesn't matter if it's 32-bit, 64-bit or 24-bit...  only one
> >> ConsoleKit per system should exist.  (There are potentially other files on the
> >> system like this.  I know a recent RPM patch went in that separated
> >> /usr/lib/rpm and /usr/lib64/rpm..  this is also a similar mistake, I just haven't
> >> had time to get a patch out to revert that chunk.)
> > 
> > So for multilib system, we have /usr/lib32 and /usr/lib64 to contain
> only *.so files, while there is still /usr/lib directory which
> contains other types of files, right?
> 
> That's how I read it, but again, I'm no (multi)lib expert :)

Correct.

I would argue that architecture independent data files should really be
in $datadir and that configuration files should be in $sysconfdir.
$libdir should be used for architecture specific library files (likewise
libexecdir for executables). Not everyone is doing this sanely though. I
can understand the rpm issue from a history perspective but consolekit
doing it is plain wrong :/.

Architecture independent executables in the form of scripts are an
interesting case I guess.

Cheers,

Richard




