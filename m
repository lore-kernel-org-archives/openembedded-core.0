Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6811E71ADD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 23:07:43 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0TN7cFX020777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 29 Jan 2018 23:07:39 GMT
Message-ID: <1517267258.3090.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jan 2018 23:07:38 +0000
In-Reply-To: <CAMKF1sqrT9Fd92FnVyeZ+esWEF-2NUwjow-5hv4GjQnHJ_QqqA@mail.gmail.com>
References: <20180127070626.27581-1-raj.khem@gmail.com>
	<CAJTo0LZ=m04zzX5XunL3Ht4t=b9dAiAfwdfkARcH6nyFTL1Y1w@mail.gmail.com>
	<CAMKF1sqrT9Fd92FnVyeZ+esWEF-2NUwjow-5hv4GjQnHJ_QqqA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meson: Adjust for clang compiler
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
X-List-Received-Date: Mon, 29 Jan 2018 23:07:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-01-29 at 09:44 -0800, Khem Raj wrote:
> On Mon, Jan 29, 2018 at 9:21 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > 
> > On 27 January 2018 at 07:06, Khem Raj <raj.khem@gmail.com> wrote:
> > > 
> > > 
> > > Remove hardcoding c/c++ compiler to be gcc alone, its
> > > possible to use clang as replacement for cross compilers
> > > from meta-clang, therefore set clang/clang++ if
> > > TOOLCHAIN = "clang"
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/classes/meson.bbclass | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta/classes/meson.bbclass
> > > b/meta/classes/meson.bbclass
> > > index 91ac652651..cd3497a802 100644
> > > --- a/meta/classes/meson.bbclass
> > > +++ b/meta/classes/meson.bbclass
> > > @@ -40,6 +40,11 @@ EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
> > >  MESON_CROSS_FILE = ""
> > >  MESON_CROSS_FILE_class-target = "--cross-file
> > > ${WORKDIR}/meson.cross"
> > > 
> > > +CCOMPILER ?= "gcc"
> > > +CXXCOMPILER ?= "g++"
> > > +CCOMPILER_toolchain-clang = "clang"
> > > +CXXCOMPILER_toolchain-clang = "clang++"
> > > +
> > 
> > Can we do this in bitbake.conf instead of repeating ourselves?
> having it in meson bbclass keeps it to meson based recipes,
> bitbake.conf is a bit too generic.

Yes, I do worry a bit about namespace pollution from bitbake.conf
already...

Cheers,

Richard



