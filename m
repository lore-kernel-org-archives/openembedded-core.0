Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5803077175
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:09:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Feb 2016 12:09:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,391,1449561600"; d="scan'208";a="904956498"
Received: from npanwar-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.174.40])
	by orsmga002.jf.intel.com with ESMTP; 03 Feb 2016 12:09:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 04 Feb 2016 09:09:53 +1300
Message-ID: <1478930.Uaq5cohNMu@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.4-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <34309FCD-61ED-4DC8-BD3C-219DE8924BDA@gmail.com>
References: <56B25500.7030402@gmail.com>
	<34309FCD-61ED-4DC8-BD3C-219DE8924BDA@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: binutils upgrade to 2.26 failure - unsupported reloc 42 against global symbol __gmon_start__
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
X-List-Received-Date: Wed, 03 Feb 2016 20:09:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 03 Feb 2016 11:56:45 Khem Raj wrote:
> > On Feb 3, 2016, at 11:29 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> > 
> > My chromium build is now failing due to:
> >    commit 86ade2cc2553c942d9526c5323a11ae151653505
> >    
> >        binutils: Upgrade to 2.26
> > | 
> > | FAILED: x86_64-oe-linux-gcc  -m64 -march=corei7 -mtune=corei7
> > | -mfpmath=sse -msse4.2
> > | --sysroot=/z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-64
> > | -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,now -Wl,-z,relro
> > | -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC
> > | -B/z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chromium/49.0.
> > | 2612.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/Release/bi
> > | n -Wl,--disable-new-dtags -m64 -Wl,-O1 -Wl,--as-needed -Wl,--gc-sections
> > | -o chrome_sandbox -Wl,--start-group
> > | obj/sandbox/linux/suid/chrome_sandbox.process_util_linux.o
> > | obj/sandbox/linux/suid/chrome_sandbox.sandbox.o -Wl,--end-group
> > | /z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chromium/49.0.26
> > | 12.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/Release/bin/
> > | ld: error:
> > | /z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-64/usr/lib/../lib/
> > | crti.o: unsupported reloc 42 against global symbol __gmon_start__
> > | ../sysdeps/x86_64/crti.S:66: error: unsupported reloc 42
> > 
> > Any suggestions on how to approach this?
> 
> do a clean build. Its mixing objects

Should we have bumped PR somewhere to avoid this?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

