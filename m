Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 90AC37317E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 23:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0BNZ6Q5028967; Mon, 11 Jan 2016 23:35:06 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Q_2Ji6SaKy4K; Mon, 11 Jan 2016 23:35:06 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0BNZ39w028964
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 11 Jan 2016 23:35:04 GMT
Message-ID: <1452555303.28375.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Date: Mon, 11 Jan 2016 23:35:03 +0000
In-Reply-To: <67FE2658-C78E-468E-9D8E-6EE0CB927555@gmail.com>
References: <1452277369.7598.136.camel@linuxfoundation.org>
	<10682729.sQ8qah7Y6F@peggleto-mobl.ger.corp.intel.com>
	<E820897B-DAC3-4691-A276-923CB1C48FB0@gmail.com>
	<1731469.ftd10BAJx1@peggleto-mobl.ger.corp.intel.com>
	<67FE2658-C78E-468E-9D8E-6EE0CB927555@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pixz: Add 1.0.6
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
X-List-Received-Date: Mon, 11 Jan 2016 23:35:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-01-11 at 15:21 -0800, Khem Raj wrote:
> > On Jan 11, 2016, at 2:36 PM, Paul Eggleton <
> > paul.eggleton@linux.intel.com> wrote:
> > 
> > On Mon, 11 Jan 2016 13:17:14 Khem Raj wrote:
> > > > On Jan 11, 2016, at 1:07 PM, Paul Eggleton <
> > > > paul.eggleton@linux.intel.com>
> > > > wrote:>
> > > > On Mon, 11 Jan 2016 09:36:36 Paul Eggleton wrote:
> > > > > On Mon, 11 Jan 2016 09:26:39 Paul Eggleton wrote:
> > > > > > On Fri, 08 Jan 2016 18:22:49 Richard Purdie wrote:
> > > > > > > xz gives better compression results than bzip/gz but is
> > > > > > > often slower.
> > > > > > > Using parallel compression mitigates this somewhat and is
> > > > > > > particularly
> > > > > > > useful for the SDK.
> > > > > > > 
> > > > > > > Signed-off-by: Richard Purdie <
> > > > > > > richard.purdie@linuxfoundation.org>
> > > > > > > 
> > > > > > > diff --git a/meta/recipes-support/pixz/pixz_1.0.6.bb
> > > > > > > b/meta/recipes-support/pixz/pixz_1.0.6.bb new file mode
> > > > > > > 100644
> > > > > > > index 0000000..e6e4ac2
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta/recipes-support/pixz/pixz_1.0.6.bb
> > > > > > > @@ -0,0 +1,14 @@
> > > > > > > +SUMMARY = "Parallel, indexed xz compressor"
> > > > > > > +
> > > > > > > +DEPENDS = "xz libarchive"
> > > > > > > +
> > > > > > > +SRC_URI =
> > > > > > > "https://github.com/vasi/pixz/releases/download/v${PV}/${
> > > > > > > BPN}-${PV}.tar
> > > > > > > .
> > > > > > > xz
> > > > > > > "
> > > > > > 
> > > > > > Can we rely on this never changing? I thought we'd
> > > > > > experienced problems
> > > > > > with github's release tarballs being generated on the fly
> > > > > > in the past...
> > > > > 
> > > > > Another thing, this seems to fail to build without asciidoc:
> > > > > 
> > > > > ------------ snip ------------
> > > > > checking for src/pixz.1... no
> > > > > checking for a2x... no
> > > > > configure: error: AsciiDoc not found, not able to generate
> > > > > the man page.
> > > > > ------------ snip ------------
> > > > > 
> > > > > This is also related to not supporting B != S, since
> > > > > src/pixz.1 does
> > > > > exist,
> > > > > just in S and not B. If you inherit autotools-brokensep
> > > > > instead of
> > > > > autotools it works.
> > > > 
> > > > Possibly a bit obvious, but even inheriting autotools-brokensep
> > > > isn't
> > > > enough, because if it runs "make clean" on re-executing
> > > > do_configure,
> > > > src/pixz.1 gets deleted and you get the same issue.
> > > 
> > > Adding --without-manpage might get you past this issue.
> > 
> > I'm afraid that's not a valid option for this configure script.
> > 
> > I had more shenanigans trying to build the target version. In the
> > end I needed
> > to add "ac_cv_file_src_pixz_1=yes" to EXTRA_OECONF and inherit
> > pkgconfig.
> > 
> 
> I think you are missing
> https://github.com/vasi/pixz/commit/936d8068ae19d95260d3058f41dd6cf71
> 8101cd6
> 
> which is committed after 1.0.6 release. It should be back ported.
> may be not use tarball but straight use
> SRCREV=“936d8068ae19d95260d3058f41dd6cf718101cd6”
> with git fetcher might be better.

As Randy mentions, should we use the -T option to xz instead though?

Cheers,

Richard

