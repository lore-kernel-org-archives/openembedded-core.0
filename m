Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 23AEA6A95B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:43:46 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VEGkO-0006sz-Gg; Tue, 27 Aug 2013 12:43:40 +0200
Message-ID: <1377600219.5452.60.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 27 Aug 2013 11:43:39 +0100
In-Reply-To: <521BFA2A.4090508@linux.intel.com>
References: <1377596639-26980-1-git-send-email-lizhijian@cn.fujitsu.com>
	<521BFA2A.4090508@linux.intel.com>
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] grep-2.5.1a: fix grep for LSB compliance
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
X-List-Received-Date: Tue, 27 Aug 2013 10:43:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-08-26 at 18:00 -0700, Saul Wold wrote:
> On 08/27/2013 02:43 AM, Li Zhijian wrote:
> > add patch from grep-2.5.1-55.el5.src.rpm and
> > enable configration option of --without-include-regex
> >
> > LSB core-tests failed at /tset/LI18NUX2K.L1/utils/grep-tp/T.grep-tp 5,T.egrep-tp 5
> > which is intend to verify this utility can perform pattern matching in searches
> > without regard to case if -i option is specified.
> >
> > Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> >   SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
> >              file://uclibc-fix.patch \
> > @@ -13,8 +13,25 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
> >              file://gettext.patch \
> >              file://fix64-int-to-pointer.patch \
> >              file://Makevars \
> > -           file://grep-CVE-2012-5667.patch \
> 
> Why are you removing this patch?

He didn't actually remove it, he just moved it further down the list.
But...

> >              file://fix-for-texinfo-5.1.patch \
> > +           file://grep-2.5.1-fgrep.patch \
> > +           file://grep-2.5.1-bracket.patch \
> > +           file://grep-2.5-i18n.patch \
> > +           file://grep-2.5.1-oi.patch \
> > +           file://grep-2.5.1-manpage.patch \
> > +           file://grep-2.5.1-color.patch \
> > +           file://grep-2.5.1-icolor.patch \
> > +           file://grep-skip.patch \
> > +           file://grep-2.5.1-egf-speedup.patch \
> > +           file://grep-2.5.1-dfa-optional.patch \
> > +           file://grep-2.5.1-tests.patch \
> > +           file://grep-2.5.1-w.patch \
> > +           file://grep-P.patch \
> > +           file://grep-CVE-2012-5667.patch \
> > +           file://grep-empty-pattern.patch \
> > +           file://grep-bz460641.patch \
> > +           file://grep-bz434934.patch \
> > +           file://grep-man-label.patch \

... it's fairly hard to believe that all these patches are really
necessary to fix the problem with "grep -i" that's described in the
checkin message.  It looks as though a more accurate description of this
change would be something like "grep-2.5.1a: import all patches from
RHEL".

Also, although adding --without-included-regex probably is a good thing
(and probably ought to be done for grep-2.14 as well) it's not very
obvious that this has anything to do with the LSB fix either.

p.



