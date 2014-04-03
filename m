Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id C0C3E6F4C4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 16:23:26 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3G00CE0QUPOU50@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 03 Apr 2014 11:23:13 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9EDD6201AC; Thu,
	03 Apr 2014 12:23:12 -0400 (EDT)
Date: Thu, 03 Apr 2014 12:23:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Paul Barker <paul@paulbarker.me.uk>
Message-id: <20140403162312.GB3370@denix.org>
References: <1396313895-21200-1-git-send-email-denis@denix.org>
	<CANyK_8cu-czs-qmB1PJHosLt-TYnmu=u8F9J9ip1MmVZuE7zVA@mail.gmail.com>
	<CANyK_8f0=bEjKFZGMW7cTEL-_BiXPo9a93zrvz_gwYkH4Nn5vg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CANyK_8f0=bEjKFZGMW7cTEL-_BiXPo9a93zrvz_gwYkH4Nn5vg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [dora][PATCH] opkg-utils: Update to latest git master
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
X-List-Received-Date: Thu, 03 Apr 2014 16:23:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 01, 2014 at 02:04:03PM +0100, Paul Barker wrote:
> On 1 April 2014 13:29, Paul Barker <paul@paulbarker.me.uk> wrote:
> > On 1 April 2014 01:58, Denys Dmytriyenko <denis@denix.org> wrote:
> >> From: Denys Dmytriyenko <denys@ti.com>
> >>
> >> The latest commit in opkg-utils allows packages created by opkg-build to be read
> >> by dpkg-deb again.
> >>
> >> (Based on OE-Core master rev: 219944af2700ce9dbc425fac384cd32b0a802123,
> >> but all of the update-alternative fixes from master are skipped)
> >>
> >> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >> Cc: Paul Barker <paul@paulbarker.me.uk>
> >> ---
> >>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> >> index 279cb74..fef0d13 100644
> >> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> >> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> >> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> >>                      file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
> >>  RDEPENDS_${PN} = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
> >>  RDEPENDS_${PN}_class-native = ""
> >> -SRCREV = "757a1664a440c60e8126443bf984e4bdf374c327"
> >> +SRCREV = "c33b217016ee911718b10c9d57f9912935baf5a9"
> >>  PV = "0.1.8+git${SRCPV}"
> >>
> >>  SRC_URI = "git://git.yoctoproject.org/opkg-utils \
> >> --
> >> 1.9.1
> >>
> >
> > Personally I would prefer rebasing the existing patch and fixing the
> > merge conflict, maintaining the patch author and existing sign offs
> > and adding your sign off to the end. I don't know if there's a policy
> > on this for Yocto Project.

Of course you would, wouldn't you? :) I'm not looking for any extra credit 
here, but it wasn't trivial to merge the existing commit while backporting to 
dora and re-creating it was much easier. There were past precedents of that, 
where backport fixes were "based on" the commit, instead of the actual direct 
merge or cherry-pick of it...


> > I've Cc'd Robert Yang as he's the stable branch maintainer for Dora as
> > per https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance
> >
> 
> Infact, NACK on this. opkg-utils/Makefile @
> c33b217016ee911718b10c9d57f9912935baf5a9 lists update-alternatives to
> be installed on 'make install'.
> 
> If you want just this fix, you need to keep SRCREV as is and add the
> change from c33b217016ee911718b10c9d57f9912935baf5a9 as a new patch
> within oe-core.

Well, I've been using this patch in dora for some time now and it works just 
fine. But I understand there might be a conflict between update-alternatives, 
so one of the possible workarounds would be to remove the new binary from the 
package. Although that would make it even less of a backport and rather a new 
implementation on its own... Anyway, this dpkg-deb strictness is just so 
annoying!

-- 
Denys

