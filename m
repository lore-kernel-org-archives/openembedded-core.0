Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 379C560119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 21:24:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 06 Jul 2016 14:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,321,1464678000"; d="scan'208";a="841751071"
Received: from chiulunr-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.210])
	by orsmga003.jf.intel.com with ESMTP; 06 Jul 2016 14:24:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 07 Jul 2016 09:24:03 +1200
Message-ID: <1788025.i9tQxG4ZVx@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.7-202.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAMKF1spDqBxSpQ_kumzEgUR1YeEKOka+5yNoKH=ZdJHOAaZ8ow@mail.gmail.com>
References: <cover.1467838464.git.paul.eggleton@linux.intel.com>
	<9e9da3e1b8034b9c233471e6053c920aa6476bad.1467838464.git.paul.eggleton@linux.intel.com>
	<CAMKF1spDqBxSpQ_kumzEgUR1YeEKOka+5yNoKH=ZdJHOAaZ8ow@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc-runtime: add SUMMARY values
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
X-List-Received-Date: Wed, 06 Jul 2016 21:24:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 06 Jul 2016 14:03:53 Khem Raj wrote:
> On Wed, Jul 6, 2016 at 1:55 PM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > It's useful to know what the various libraries are that get produced by
> > gcc-runtime, as well as to have a specific SUMMARY for the recipe.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  meta/recipes-devtools/gcc/gcc-runtime.inc | 27
> >  +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > b/meta/recipes-devtools/gcc/gcc-runtime.inc index 99f50f8..8e42a57 100644
> > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > @@ -1,5 +1,7 @@
> > 
> >  require gcc-configure-common.inc
> > 
> > +SUMMARY = "Runtime libraries for GCC compilers"
> > +
> > 
> >  # Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPLv3"
> >  # All gcc-runtime packages are now covered by the runtime exception.
> >  LICENSE = "GPL-3.0-with-GCC-exception"
> > 
> > @@ -135,73 +137,98 @@ FILES_${PN}-dbg += "\
> > 
> >  "
> >  
> >  FILES_libg2c = "${target_libdir}/libg2c.so.*"
> > 
> > +SUMMARY_libg2c = "Companion runtime library for g77"
> > 
> >  FILES_libg2c-dev = "\
> >  
> >      ${libdir}/libg2c.so \
> >      ${libdir}/libg2c.a \
> >      ${libdir}/libfrtbegin.a \
> >  
> >  "
> > 
> > +SUMMARY_libg2c-dev = "Companion runtime library for g77 - development
> > files"> 
> >  FILES_libstdc++ = "${libdir}/libstdc++.so.*"
> > 
> > +SUMMARY_libstdc++ = "C++ standard library for g++"
> 
> Drop for g++ here, something like GNU Standard C++ Library is better
> in general replace g++/gcc with GNU
> 
> >  FILES_libstdc++-dev = "\
> >  
> >      ${includedir}/c++/ \
> >      ${libdir}/libstdc++.so \
> >      ${libdir}/libstdc++*.la \
> >      ${libdir}/libsupc++.la \
> >  
> >  "
> > 
> > +SUMMARY_libstdc++-dev = "C++ standard library for g++ - development
> > files"
> > 
> >  FILES_libstdc++-staticdev = "\
> >  
> >      ${libdir}/libstdc++*.a \
> >      ${libdir}/libsupc++.a \
> >  
> >  "
> > 
> > +SUMMARY_libstdc++-staticdev = "C++ standard library for g++ - static
> > development files"
> same here Header files and libraries for C++ development
> 
> >  FILES_libstdc++-precompile-dev =
> >  "${includedir}/c++/${TARGET_SYS}/bits/*.gch"> 
> > +SUMMARY_libstdc++-precompile-dev = "C++ standard library from gcc -
> > precompiled header files"> 
> >  FILES_libssp = "${libdir}/libssp.so.*"
> > 
> > +SUMMARY_libssp = "Stack smashing protection library for gcc"
> 
> same here

My aim was to give some explanation as to why these things might be installed 
if a user was to find them in their image. Are these libraries used by other 
compilers?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

