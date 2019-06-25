Return-Path: <n.merinov@inango-systems.com>
Received: from mail.inango-sw.com (mail.inango-systems.com [213.136.71.184])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8127E269
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 12:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 5BF3B7A236E;
	Tue, 25 Jun 2019 15:39:40 +0300 (IDT)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id XA8GXIioq2EQ; Tue, 25 Jun 2019 15:39:38 +0300 (IDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id E2DEC7A23D0;
	Tue, 25 Jun 2019 15:39:37 +0300 (IDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com E2DEC7A23D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1561466377;
	bh=OYhozUZ115+jld/1q7/xaTEn0IxJkfpQ3dSioTm+xZ4=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=biywEJKTYEfQTc24eR0x8R3INmiDDqdc7Ez6Ys9MrbJDv06V6EvIius1jxJusjIh5
	j1xTOkQagl7STz/94XVqgYHYKevMwDZlduavG67pUXMtqV4I+T8LDgAWYZXc7pLPU0
	cXSioeMmuG3Dm8XzzTDe7B/vlLNGLzB3oP/wQ2lqi5/5l77aEKWStilCt/heArM1xk
	3PeXcnQ4zf24Fo/KzvjpOU9DVugIQz7nX0/r13h7ou5JtrxK2IHDZZrHKzCtlmFOUl
	3X0vO7d7faeEHLfw9YAS8OlBA1IT6YdxvhcTxDivQiWSt8KHYTxLN3OFHM/un1OJJA
	niuWYrKrZrArw==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mVumeAcxfFP9; Tue, 25 Jun 2019 15:39:37 +0300 (IDT)
Received: from mail.inango-sw.com (mail.inango-sw.com [172.17.220.3])
	by mail.inango-sw.com (Postfix) with ESMTP id B2E9D7A236E;
	Tue, 25 Jun 2019 15:39:37 +0300 (IDT)
Date: Tue, 25 Jun 2019 15:39:36 +0300 (IDT)
From: Nikolai Merinov <n.merinov@inango-systems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <1029454405.2067.1561466376798.JavaMail.zimbra@inango-systems.com>
In-Reply-To: <24b339d3b414d7f32a9525e2480d2c7c4ffa0aa3.camel@linuxfoundation.org>
References: <20190514150416.10902-1-n.merinov@inango-systems.com>
	<75cc94f6-8e4c-68ff-3c65-a2b8f98e8842@gmail.com>
	<1186752783.2036656.1561040167582.JavaMail.zimbra@inango-systems.com>
	<1341931304.2173628.1561371858860.JavaMail.zimbra@inango-systems.com>
	<24b339d3b414d7f32a9525e2480d2c7c4ffa0aa3.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Originating-IP: [172.17.220.3]
X-Mailer: Zimbra 8.8.9_GA_3006 (ZimbraWebClient - GC74 (Linux)/8.8.9_GA_3006)
Thread-Topic: cmake.bbclass: pass mandatory compiler flags through
	CMAKE_<LANG>_COMPILER_ARG1
Thread-Index: Z8hiRc7jnEMzvFUP+H+jdliQHODChg==
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] cmake.bbclass: pass mandatory compiler flags through CMAKE_<LANG>_COMPILER_ARG1
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
X-List-Received-Date: Tue, 25 Jun 2019 12:39:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Richard,

Can you help me to understand how I can reproduce this issue on local build? I want to try to debug it.

Regards,
Nikolai

----- Original Message -----
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "n merinov" <n.merinov@inango-systems.com>
Cc: "openembedded-core" <openembedded-core@lists.openembedded.org>
Sent: Tuesday, June 25, 2019 1:03:11 PM
Subject: Re: [OE-core] [PATCHv3] cmake.bbclass: pass mandatory compiler flags through CMAKE_<LANG>_COMPILER_ARG1

On Mon, 2019-06-24 at 13:24 +0300, Nikolai Merinov via Openembedded-
core wrote:
> Patch updated with "Signed-off-by" field as required by automatic
> checks.
> 
> ----- Original Message -----
> From: "openembedded-core" <openembedded-core@lists.openembedded.org>
> To: "Khem Raj" <raj.khem@gmail.com>
> Cc: "openembedded-core" <openembedded-core@lists.openembedded.org>
> Sent: Thursday, June 20, 2019 7:16:07 PM
> Subject: [OE-core] [PATCHv2] cmake.bbclass: pass mandatory compiler
> flags through CMAKE_<LANG>_COMPILER_ARG1
> 
> Hi,
> 
> Updated patch for the current "master" branch is attached.
> 
> > have you also tried building SDK and see if these changes are
> > reflected in SDK as well ?
> 
> I checked that the changes reflected in the Extensible SDK for the
> "core-image-sato" image of the poky.
> 
> Regards,
> Nikolai
> 
> ----- Original Message -----
> From: "Khem Raj" <raj.khem@gmail.com>
> To: "n merinov" <n.merinov@inango-systems.com>, "openembedded-core" <
> openembedded-core@lists.openembedded.org>
> Sent: Tuesday, May 21, 2019 1:41:46 AM
> Subject: Re: [OE-core] [PATCH] cmake.bbclass: pass mandatory compiler
> flags through CMAKE_<LANG>_COMPILER_ARG1
> 
> On 5/14/19 8:04 AM, Nikolai Merinov wrote:
> > The CMake takes mandatory compiler arguments from the following
> > variables:
> > - CMAKE_SYSROOT -- path to sysroot that should be passed to
> > compiler.
> > - CMAKE_<LANG>_COMPILER_TARGET -- target architecture, used for
> > compilers
> >    that supports several targets through command line options.
> >    e.g. "clang --target ${CMAKE_C_COMPILER_TARGET}".
> > - CMAKE_<LANG>_COMPILER_EXTERNAL_TOOLCHAIN -- path to external
> > toolchain,
> >    used for compilers that support build with external toolchain.
> >    e.g. "clang --gcc-toolchain
> > ${CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN}".
> > - CMAKE_<LANG>_COMPILER_ARG1 -- other mandatory arguments to a
> > compiler
> >    command.
> > 
> > CMAKE_<LANG>_COMPILER_ARG1 is the most suitable variable to pass
> > mandatory
> > arguments, that belongs to CC variable with other build systems, to
> > a
> > compiler.
> > 
> > Additionally usage of CMAKE_<LANG>_COMPILER_ARG1 instead of
> > CMAKE_<LANG>_FLAGS reduce the risk that a variable can be overrided
> > by
> > CMakeLists.txt files.
> 
I'm afraid this caused a number of build failures and selftest issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/236

(most of the selftest failures there for example are from this, as is 
https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/746/steps/7/logs/step7b
)

Cheers,

Richard

