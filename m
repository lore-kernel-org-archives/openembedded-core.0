Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id BCD996D39D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 13:44:50 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VgakR-0008Ia-TC; Wed, 13 Nov 2013 14:44:48 +0100
Message-ID: <1384350284.17320.2.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 13 Nov 2013 13:44:44 +0000
In-Reply-To: <528380F8.5020705@windriver.com>
References: <cover.1384305535.git.mark.hatle@windriver.com>
	<20f7dafc5f5948e7954203a0d57c25b68a419568.1384305535.git.mark.hatle@windriver.com>
	<20131113081253.GB3663@jama>
	<1384341268.12863.6.camel@phil-desktop.brightsign>
	<528380F8.5020705@windriver.com>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Wed, 2013-11-13 at 07:39 -0600,
	Mark Hatle wrote: > On
	11/13/13, 5:14 AM, Phil Blundell wrote: > > On Wed,
	2013-11-13 at 09:12 +0100, 
	Martin Jansa wrote: > >> On Tue, Nov 12, 2013 at 07:23:22PM -0600,
	Mark Hatle
	wrote: > >>> When the -symlinks package was removed and an RPROVIDES
	was added,
	nothing > >>> was put in to cause the removal of the older package
	in an upgrade. > >>> > >>> Signed-off-by: Mark Hatle
	<mark.hatle@windriver.com>
	> >>> --- > >>> meta/recipes-devtools/binutils/binutils.inc | 1 + > >>>
	1 file changed, 1 insertion(+) > >>> > >>> diff --git
	a/meta/recipes-devtools/binutils/binutils.inc
	b/meta/recipes-devtools/binutils/binutils.inc > >>> index
	17c66bc..ea2383e
	100644 > >>> --- a/meta/recipes-devtools/binutils/binutils.inc > >>>
	+++
	b/meta/recipes-devtools/binutils/binutils.inc > >>> @@ -21, 6 +21,
	7 @@ FILES_${PN}
	= " \ > >>> ${prefix}/${TARGET_SYS}/bin/*" > >>> > >>> RPROVIDES_${PN}
	+=
	"${PN}-symlinks" > >>> +RREPLACES_${PN} += "${PN}-symlinks" > >> > >>
	IIRC
	for opkg backend you need also RCONFLICTS for opkg to really remove >
	>>
	old ${PN}-symlinks. > > > > Also for dpkg. If you have Replaces:
	without Conflicts:
	then this just > > means that the replacing package is allowed to
	overwrite files in the > > replaced one,
	not that the replaced one will actually be
	uninstalled. > > This seems incredibly strange to me. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] binutils: Ensure old -symlinks packages get removed
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
X-List-Received-Date: Wed, 13 Nov 2013 13:44:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-11-13 at 07:39 -0600, Mark Hatle wrote:
> On 11/13/13, 5:14 AM, Phil Blundell wrote:
> > On Wed, 2013-11-13 at 09:12 +0100, Martin Jansa wrote:
> >> On Tue, Nov 12, 2013 at 07:23:22PM -0600, Mark Hatle wrote:
> >>> When the -symlinks package was removed and an RPROVIDES was added, nothing
> >>> was put in to cause the removal of the older package in an upgrade.
> >>>
> >>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>> ---
> >>>   meta/recipes-devtools/binutils/binutils.inc | 1 +
> >>>   1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> >>> index 17c66bc..ea2383e 100644
> >>> --- a/meta/recipes-devtools/binutils/binutils.inc
> >>> +++ b/meta/recipes-devtools/binutils/binutils.inc
> >>> @@ -21,6 +21,7 @@ FILES_${PN} = " \
> >>>   	${prefix}/${TARGET_SYS}/bin/*"
> >>>
> >>>   RPROVIDES_${PN} += "${PN}-symlinks"
> >>> +RREPLACES_${PN} += "${PN}-symlinks"
> >>
> >> IIRC for opkg backend you need also RCONFLICTS for opkg to really remove
> >> old ${PN}-symlinks.
> >
> > Also for dpkg.  If you have Replaces: without Conflicts: then this just
> > means that the replacing package is allowed to overwrite files in the
> > replaced one, not that the replaced one will actually be uninstalled.
> 
> This seems incredibly strange to me.

Well, perhaps, but it's always been that way.  See the documentation for
Replaces:

http://www.debian.org/doc/debian-policy/ch-relationships.html#s-replaces

p.





