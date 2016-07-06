Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 034B460119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 21:31:17 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id i30so16447938qtd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 14:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P5RzN1Aa+yT7aiKHCsygAvZFKGxxhYbXVKGnoiA74ss=;
	b=kg37pJXVzx1zNaWbrEdiNertF1+1IvNRHiUsksDWVL5qAv1zLtGXkRyeZqi9CnEgDk
	DoR9jGrPGsllWktlG5WF+s4H3ftXltGqv/LRheK7dlkiJ2m+XflD75DMCDF5IN/Mvlum
	gYkAAJHW4oCIx3xnq6Jzt8c3jneKtqQf5aoUreD9zsmiGl2/NkRqBXKFMu5sYw5ofx1Z
	xpqIIbUCIaj9hwn3Rsy4Ho85Er3sBJUW0Qc7zFN7gPV9q1vLsMeSG7e+/KLR1PZtkdfP
	Z0E/RVdZxzD5GfAUHSpsgyR8aY90J3kViRhUGN93ilEmnO2Kx6BdUbJL+jh79k03ZN8V
	sdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P5RzN1Aa+yT7aiKHCsygAvZFKGxxhYbXVKGnoiA74ss=;
	b=j087DU4pJbBjf9yb3YuG+HFmdOQXyWLZZNvBEzTqis+6yctl8rMuQZPR333go6Fd76
	yLo/ObKivM2OpTmqDzzx212oIR/dNZCUC8nRbt5PAL3d5NB5zTX+ZnVLcp3aWhIwmFRW
	gN6wkw6sDtwZS0Vcpmv2B6pa7wwowr724Qqlq1v1Xf09dDhFvG4rfiq3ERc/EvFpYYKd
	+p+iKSQC1pk7Bs6ZUbuUh4xRqU2IPsZCxY80492Mt3OlVxZo++2J4o9ulYz+Sjtg/NkZ
	mEk5D/LdMN44kXH6BKW5Wqxf08CEpRmzhD4r5XYEcaCvzScbxE6O6qtS8+ydYgY5vLMz
	VEWA==
X-Gm-Message-State: ALyK8tLxxUXlzXLpi7cCm1yGqp+QcJyMRMh6HpGyQOGMrxIOre3SrE++9NhL+f4qfWxOEppMuTDau9Cn5s2Y4g==
X-Received: by 10.200.50.77 with SMTP id y13mr38223955qta.5.1467840678239;
	Wed, 06 Jul 2016 14:31:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Wed, 6 Jul 2016 14:30:48 -0700 (PDT)
In-Reply-To: <1788025.i9tQxG4ZVx@peggleto-mobl.ger.corp.intel.com>
References: <cover.1467838464.git.paul.eggleton@linux.intel.com>
	<9e9da3e1b8034b9c233471e6053c920aa6476bad.1467838464.git.paul.eggleton@linux.intel.com>
	<CAMKF1spDqBxSpQ_kumzEgUR1YeEKOka+5yNoKH=ZdJHOAaZ8ow@mail.gmail.com>
	<1788025.i9tQxG4ZVx@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2016 14:30:48 -0700
Message-ID: <CAMKF1sqLzVgDExTa71Ae7D_Ov1bokFii7f-tTXRr0wLnGFzO7Q@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Wed, 06 Jul 2016 21:31:18 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 6, 2016 at 2:24 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wed, 06 Jul 2016 14:03:53 Khem Raj wrote:
>> On Wed, Jul 6, 2016 at 1:55 PM, Paul Eggleton
>>
>> <paul.eggleton@linux.intel.com> wrote:
>> > It's useful to know what the various libraries are that get produced by
>> > gcc-runtime, as well as to have a specific SUMMARY for the recipe.
>> >
>> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> > ---
>> >
>> >  meta/recipes-devtools/gcc/gcc-runtime.inc | 27
>> >  +++++++++++++++++++++++++++
>> >  1 file changed, 27 insertions(+)
>> >
>> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> > b/meta/recipes-devtools/gcc/gcc-runtime.inc index 99f50f8..8e42a57 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> > @@ -1,5 +1,7 @@
>> >
>> >  require gcc-configure-common.inc
>> >
>> > +SUMMARY = "Runtime libraries for GCC compilers"
>> > +
>> >
>> >  # Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPLv3"
>> >  # All gcc-runtime packages are now covered by the runtime exception.
>> >  LICENSE = "GPL-3.0-with-GCC-exception"
>> >
>> > @@ -135,73 +137,98 @@ FILES_${PN}-dbg += "\
>> >
>> >  "
>> >
>> >  FILES_libg2c = "${target_libdir}/libg2c.so.*"
>> >
>> > +SUMMARY_libg2c = "Companion runtime library for g77"
>> >
>> >  FILES_libg2c-dev = "\
>> >
>> >      ${libdir}/libg2c.so \
>> >      ${libdir}/libg2c.a \
>> >      ${libdir}/libfrtbegin.a \
>> >
>> >  "
>> >
>> > +SUMMARY_libg2c-dev = "Companion runtime library for g77 - development
>> > files">
>> >  FILES_libstdc++ = "${libdir}/libstdc++.so.*"
>> >
>> > +SUMMARY_libstdc++ = "C++ standard library for g++"
>>
>> Drop for g++ here, something like GNU Standard C++ Library is better
>> in general replace g++/gcc with GNU
>>
>> >  FILES_libstdc++-dev = "\
>> >
>> >      ${includedir}/c++/ \
>> >      ${libdir}/libstdc++.so \
>> >      ${libdir}/libstdc++*.la \
>> >      ${libdir}/libsupc++.la \
>> >
>> >  "
>> >
>> > +SUMMARY_libstdc++-dev = "C++ standard library for g++ - development
>> > files"
>> >
>> >  FILES_libstdc++-staticdev = "\
>> >
>> >      ${libdir}/libstdc++*.a \
>> >      ${libdir}/libsupc++.a \
>> >
>> >  "
>> >
>> > +SUMMARY_libstdc++-staticdev = "C++ standard library for g++ - static
>> > development files"
>> same here Header files and libraries for C++ development
>>
>> >  FILES_libstdc++-precompile-dev =
>> >  "${includedir}/c++/${TARGET_SYS}/bits/*.gch">
>> > +SUMMARY_libstdc++-precompile-dev = "C++ standard library from gcc -
>> > precompiled header files">
>> >  FILES_libssp = "${libdir}/libssp.so.*"
>> >
>> > +SUMMARY_libssp = "Stack smashing protection library for gcc"
>>
>> same here
>
> My aim was to give some explanation as to why these things might be installed
> if a user was to find them in their image. Are these libraries used by other
> compilers?

yes, clang can use the gcc runtime, I am sure
intel compiler can use it on linux as well and so
will others who target linux

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

