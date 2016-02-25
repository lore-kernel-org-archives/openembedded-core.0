Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D5C7777176
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 08:48:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2016 00:48:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,497,1449561600"; d="scan'208";a="54459155"
Received: from unknown (HELO jlock-mobl1.gar.corp.intel.com) ([10.252.4.104])
	by fmsmga004.fm.intel.com with ESMTP; 25 Feb 2016 00:48:02 -0800
Message-ID: <1456390081.3610.8.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 25 Feb 2016 08:48:01 +0000
In-Reply-To: <CAJ86T=WjZLqr4QH+ahJ-xMpnaePw+YpD4zt8CB76g9BYy+JzDg@mail.gmail.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<4df77b79cf9ded923721b47de270b2c43c21cc18.1456325292.git.joshua.g.lock@intel.com>
	<CAJ86T=WjZLqr4QH+ahJ-xMpnaePw+YpD4zt8CB76g9BYy+JzDg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/10] hardlink: add new recipe
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
X-List-Received-Date: Thu, 25 Feb 2016 08:48:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-02-24 at 14:57 -0800, Andre McCurdy wrote:
> On Wed, Feb 24, 2016 at 6:52 AM, Joshua Lock <joshua.g.lock@intel.com
> > wrote:
> > 
> > ---
> >  meta/recipes-extended/hardlink/hardlink_0.3.0.bb | 19
> > +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 meta/recipes-
> > extended/hardlink/hardlink_0.3.0.bb
> > 
> > diff --git a/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
> > b/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
> > new file mode 100644
> > index 0000000..2e06ac2
> > --- /dev/null
> > +++ b/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY = "hardlink is a tool which replaces multiple copies of a
> > file with hardlinks."
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM =
> > "file://hardlink.c;endline=22;md5=168464a4fc92fa7389c53b0755b39fbb"
> > +
> > +SRC_URI = "http://jak-linux.org/projects/hardlink/${BPN}_${PV}.tar
> > .xz"
> > +SRC_URI[md5sum] = "72f1a460adb6874c151deab766e434ad"
> > +SRC_URI[sha256sum] =
> > "e8c93dfcb24aeb44a75281ed73757cb862cc63b225d565db1c270af9dbb7300f"
> > +
> > +DEPENDS = "libpcre attr"
> According to the style guide, DEPENDS should come between
> LIC_FILES_CHKSUM and SRC_URI.

Good catch, I'll re-order.

Thanks,

Joshua


