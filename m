Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2635370016
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 17:49:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 27 Jun 2016 10:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,537,1459839600"; d="scan'208";a="725783807"
Received: from rvardha1-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.76])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jun 2016 10:49:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Jun 2016 05:49:39 +1200
Message-ID: <2291068.MjvgqpAC42@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.7-200.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAJTo0LbncHa8b_1cWuKyo7AROcqiHhAG2A0rxNTCavnmin6ySw@mail.gmail.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
	<506ececdce893c5b3d930faba0c808f797d8dc79.1466683248.git.paul.eggleton@linux.intel.com>
	<CAJTo0LbncHa8b_1cWuKyo7AROcqiHhAG2A0rxNTCavnmin6ySw@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 02/10] classes/cmake: enable progress for do_compile
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
X-List-Received-Date: Mon, 27 Jun 2016 17:49:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 27 Jun 2016 17:16:31 Burton, Ross wrote:
> On 23 June 2016 at 13:06, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
> > cmake outputs percentage complete as part of its compilation process, so
> > we can enable BitBake's new progress scanning for do_compile here.
> 
> Some recipes, such as clang, have something like sub-builds:
> 
> [  0%] Configuring NATIVE LLVM...
> [  0%] Building CXX object
> lib/TableGen/CMakeFiles/LLVMTableGen.dir/Main.cpp.o
> [ 20%] Building CXX object
> lib/TableGen/CMakeFiles/LLVMTableGen.dir/SetTheory.cpp.o
> [ 20%] Building CXX object
> lib/TableGen/CMakeFiles/LLVMTableGen.dir/Error.cpp.o
> ...
> 100%] Built target NATIVE_LIB_LLVMSUPPORT
> [100%] Building native TableGen...
> [ 16%] Building CXX object
> utils/TableGen/CMakeFiles/obj.llvm-tblgen.dir/AsmMatcherEmitter.cpp.o
> [ 33%] Built target obj.llvm-tblgen
> [100%] Built target LLVMSupport
> [100%] Built target LLVMTableGen
> [100%] Linking CXX executable ../../bin/llvm-tblgen
> [100%] Built target llvm-tblgen
> [100%] Built target LLVM-tablegen-host
> [  0%] Configuring NATIVE LLVM...
> [ 20%] Built target LLVMTableGen
> ...
> 
> The first few lines which went to 100% controlled the progress bar, but
> that took about 5 seconds.  The rest of the build takes about 15 minutes
> and for all that time the bar is pegged at 100%.

Great, that's just broken... any suggestions on what to do about it?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

