Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5139B6C54F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 21:50:32 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id w17-v6so5963874ybl.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 13:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HCZGKqQ3MW1B4DZGpO7VTcZWhqpPzV/3AaON6q7L/LI=;
	b=iId6lDUmCcYcxQx3Yh0PkkcHOMJV35GNtzfzMAO5udPll+Z3Bf7VkSZSNTQmVlf0nu
	Par+tU8MnHOYOd0T6LXtCubFUZmhVYmQCyzHGvigfjHA7V04YUwOKrWqj08ukKHzCgN7
	JUk529swO5+WoP00PtRz7VfqKvL6+2FSkawgbmHdbPc/W06JFY/JJrscvWfb6fLSiTSL
	0C10Dr1nSc+wNZ+eVvV5S9TkCfxCR33Y9My5LhumOa9xmCs3LUGWigIWPZ7npO13SFGZ
	R55zwskloUXSjx/HVT6PctTGgD65n6Gj9lbF+I6rSbr1x8sxKX72Q04jCINz/LAwHxy9
	8lFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HCZGKqQ3MW1B4DZGpO7VTcZWhqpPzV/3AaON6q7L/LI=;
	b=Fv8JvFzw2FQFXA4LRf0AxX9kc3FMyAWKVol57I5NGvXXJWUUhiXa9nTEKoFaDlsp3d
	5Wy4X9p6KvmX604Pc4BzlUj6h2yPOF6L0QRH8sMCplDgC908A+l4SW0VFui0eSnGXINH
	qYuIgFLNS/XmMOYVD3ozFd1bqjle0g7PR2fmSoM585nQBhZr49e+uzHZJa9So0fvG2l5
	Bqs2zLST8vexyjyA1lWE6UKDUM1rkx1c9hNxEqOP08ifa2qalFybTWdJoTrWJAekwsCQ
	LIDlQVe0+D1y/gpWiQfZfGfVUxzs8FwdfLmpPGKnLB75N8MrXTBiAUPN0Mzx/vPdLQr9
	AfIA==
X-Gm-Message-State: AA+aEWZ2N7qJoHJ8u4N4QsLmlobtylC3DYvHUmxWIYHVevRokoVkkf8s
	HUSzkqlPeVZibsmaxWgT7v+0VHwKBR8qJS4DgOBevA==
X-Google-Smtp-Source: AFSGD/VasQuNi9p4d5av6QPvI0+C4I838WgiCR1Rwt0GRG270J2ixF7gWNK4OTCgongaG5Pdp/99rS9zS02vhRGSiTM=
X-Received: by 2002:a25:5a46:: with SMTP id o67mr9386807ybb.215.1543873833072; 
	Mon, 03 Dec 2018 13:50:33 -0800 (PST)
MIME-Version: 1.0
References: <20181130215537.29981-1-JPEWhacker@gmail.com>
	<20181201030142.9385-1-JPEWhacker@gmail.com>
	<c492b503-696b-9cad-0f69-9bd9129a6e14@gmail.com>
	<CAMKF1soDs+MZ3G5e2_MDvO2r+bPy+ofLn5UEEvUQ3jcteU=Y3A@mail.gmail.com>
In-Reply-To: <CAMKF1soDs+MZ3G5e2_MDvO2r+bPy+ofLn5UEEvUQ3jcteU=Y3A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 3 Dec 2018 22:50:20 +0100
Message-ID: <CALbNGRT1=wNg2DrGYT8xq2gCVU4jgaF91Ex0ea56on7SfVvBFw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] classes/waf: Fix builds when B != S
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
X-List-Received-Date: Mon, 03 Dec 2018 21:50:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 3, 2018 at 9:14 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Dec 1, 2018 at 4:09 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hi Joshua
> >
> > There is a build failure for a2jmidid see
> >
> > http://errors.yoctoproject.org/Errors/Details/202833/
> >
> > Seem to be related can you validate
> >
> > On 11/30/18 7:01 PM, Joshua Watt wrote:
> > > Waf requires that the current working directory be ${S} (the location of
> > > the wscript) when building. Most of the time, this was true only because
> > > B defaults to S. However, anything that changed that behavior (notably,
> > > using externalsrc) would break the recipe. Remedy this by explicitly
> > > changing cwd to ${S} when running waf commands. As a happy side effect,
> > > B can be set up for "out of tree" builds to keep the source directory
> > > clean.
>
> I have sent a workaround for a2jmidid to ml which means we can go
> ahead with this change in OE-Core
>
> > >
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >   meta/classes/waf.bbclass | 8 +++++---
> > >   1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> > > index 19e93761b39..8e6d754c299 100644
> > > --- a/meta/classes/waf.bbclass
> > > +++ b/meta/classes/waf.bbclass
> > > @@ -1,6 +1,8 @@
> > >   # avoids build breaks when using no-static-libs.inc
> > >   DISABLE_STATIC = ""
> > >
> > > +B = "${WORKDIR}/build"
> > > +
> > >   EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
> > >
> > >   python waf_preconfigure() {
> > > @@ -22,16 +24,16 @@ python waf_preconfigure() {
> > >   do_configure[prefuncs] += "waf_preconfigure"
> > >
> > >   waf_do_configure() {
> > > -     ${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF}
> > > +     (cd ${S} && ./waf configure -o ${B} --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
> > >   }
> > >
> > >   do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
> > >   waf_do_compile()  {
> > > -     ${S}/waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
> > > +     (cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)})
> > >   }
> > >
> > >   waf_do_install() {
> > > -     ${S}/waf install --destdir=${D}
> > > +     (cd ${S} && ./waf install --destdir=${D})
> > >   }
> > >
> > >   EXPORT_FUNCTIONS do_configure do_compile do_install
> > >
> --
Hmm - the a2jmidid shows what's going to happen: All packets shipping
older waf need workaround hacks. This should not be the way to go
because then we can remove waf.bbclass entirely.

Andreas

