Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id A617E73216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 16:14:33 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1K00BQ9IG3WFF0@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 26 Jan 2016 10:14:27 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=kj9zAlcOel0A:10 a=7aQ_Q-yQQ-AA:10	a=0gcC27t9AAAA:8 a=sozttTNsAAAA:8
	a=fxJcL_dCAAAA:8 a=_534liOZib7jk8kT8F8A:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0EC19161E1C; Tue,
	26 Jan 2016 11:14:27 -0500 (EST)
Date: Tue, 26 Jan 2016 11:14:27 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-id: <20160126161427.GF1652@denix.org>
References: <1453779264-8652-1-git-send-email-denis@denix.org>
	<CAP9ODKoPmBQpmvChLUOADj1B2m-DUPJCeG-cB7Gk1BrPvk4byg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKoPmBQpmvChLUOADj1B2m-DUPJCeG-cB7Gk1BrPvk4byg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] stress-ng: add 0.05.09
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
X-List-Received-Date: Tue, 26 Jan 2016 16:14:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jan 26, 2016 at 02:01:14PM -0200, Otavio Salvador wrote:
> On Tue, Jan 26, 2016 at 1:34 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > A clean room re-implementation and extension of the original stress tool.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
> >
> > diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb b/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
> > new file mode 100644
> > index 0000000..2e92c53
> > --- /dev/null
> > +++ b/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
> > @@ -0,0 +1,15 @@
> > +SUMMARY = "A tool to load and stress a computer system"
> > +HOMEPAGE = "http://kernel.ubuntu.com/~cking/stress-ng/"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > +
> > +SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.gz"
> > +
> > +SRC_URI[md5sum] = "fe65047991f654ffaac3c59ea9537763"
> > +SRC_URI[sha256sum] = "d785b5f2df042d42c43ddfd5bbafa19151ed96f0c483d7f44c737f492b52ddd6"
> > +
> > +CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"' -O2"
> 
> Where version comes from?

From the Makefile

-- 
Denys

