Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 93F936FF6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 16:16:50 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id t74so156646951ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 09:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q+0yYhr5v1CUCkrtqYOwq+H8h8howQb/PzGZ+L45ILI=;
	b=zWPDuyIafFW1Lw1/E4Wio3H0Vs2SZbOglc0VPl3KMO+0iEMIijMewghOHfex5x1max
	k+2wgp3hxOiQPOcBA6dzFEXG9QmbHT7mKgAp2T+JejONC5uhQH/M5VLCrrK5xQIxerA5
	8h6ke5sod3iSWpVK8IPc8MhaOP2jPtmGg1utaWqsY9R7Mygbi3CAbjq/za1tJYfgX28w
	UlslUhc7wpsVm7Vn9P8b/uA6GnaPLYHnAdZ62Cwc66MAi+BxhQpPR6snc0winSs6PwsL
	Ru7AR4/U+OONXOnLOOvORZt1sOthduxJY5yRCyjQkJIdcVEWSzkwIogexgCeohI+A9JI
	kaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q+0yYhr5v1CUCkrtqYOwq+H8h8howQb/PzGZ+L45ILI=;
	b=m28V6eDKQxSe4/xrqTxUN0dfjQpbPGLdsigLieCdSyw5JHj+UyVBJZmfbbKfJrQXOO
	lKDW5VSJnAcXs39VmVMeK7PHcpZhiyo3Eeo78xBn8YnFfhbvTJP7LnWfEnD5iSyUxo+8
	EgT6Qe0CfvtN+pkRXsi0+Sc3RorHX4yLMwvgOJyyNy+zwkikqLKblU45xRPxxX33QRLJ
	DaK9MNWR4flHoytiVrr86Jb96h+atLZEjNaXwsKlmf+CLNRA2IxIkJmEhAiTH8vwdkOH
	5EdwIxHHCQbZ1RVciIp4355gqGFYadL03hLpvDX+NTG3GOPx0n78MgCjx63xZ2/ao7fY
	TZHw==
X-Gm-Message-State: ALyK8tJtRChsyGb+5KBt0GTXK5vTbKVkGNQ9UjGGopfndUKtiWSWxh/KBAeKUs3P+5x+Wj3nLn6ZUsjpHhWBozXl
X-Received: by 10.107.154.210 with SMTP id c201mr1467965ioe.99.1467044210854; 
	Mon, 27 Jun 2016 09:16:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Mon, 27 Jun 2016 09:16:31 -0700 (PDT)
In-Reply-To: <506ececdce893c5b3d930faba0c808f797d8dc79.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
	<506ececdce893c5b3d930faba0c808f797d8dc79.1466683248.git.paul.eggleton@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Jun 2016 17:16:31 +0100
Message-ID: <CAJTo0LbncHa8b_1cWuKyo7AROcqiHhAG2A0rxNTCavnmin6ySw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Mon, 27 Jun 2016 16:16:51 -0000
Content-Type: multipart/alternative; boundary=001a1140fab60ee56b053644d9b2

--001a1140fab60ee56b053644d9b2
Content-Type: text/plain; charset=UTF-8

On 23 June 2016 at 13:06, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> cmake outputs percentage complete as part of its compilation process, so
> we can enable BitBake's new progress scanning for do_compile here.
>

Some recipes, such as clang, have something like sub-builds:

[  0%] Configuring NATIVE LLVM...
[  0%] Building CXX object
lib/TableGen/CMakeFiles/LLVMTableGen.dir/Main.cpp.o
[ 20%] Building CXX object
lib/TableGen/CMakeFiles/LLVMTableGen.dir/SetTheory.cpp.o
[ 20%] Building CXX object
lib/TableGen/CMakeFiles/LLVMTableGen.dir/Error.cpp.o
...
100%] Built target NATIVE_LIB_LLVMSUPPORT
[100%] Building native TableGen...
[ 16%] Building CXX object
utils/TableGen/CMakeFiles/obj.llvm-tblgen.dir/AsmMatcherEmitter.cpp.o
[ 33%] Built target obj.llvm-tblgen
[100%] Built target LLVMSupport
[100%] Built target LLVMTableGen
[100%] Linking CXX executable ../../bin/llvm-tblgen
[100%] Built target llvm-tblgen
[100%] Built target LLVM-tablegen-host
[  0%] Configuring NATIVE LLVM...
[ 20%] Built target LLVMTableGen
...


The first few lines which went to 100% controlled the progress bar, but
that took about 5 seconds.  The rest of the build takes about 15 minutes
and for all that time the bar is pegged at 100%.

Ross

--001a1140fab60ee56b053644d9b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 June 2016 at 13:06, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><span class=3D"">cmake=
</span> outputs percentage complete as part of its compilation process, so<=
br>
we can enable BitBake&#39;s new progress scanning for do_compile here.<br><=
/blockquote></div><br>Some recipes, such as clang, have something like sub-=
builds:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
"><div class=3D"gmail_extra">[ =C2=A00%] Configuring NATIVE LLVM...</div><d=
iv class=3D"gmail_extra">[ =C2=A00%] Building CXX object lib/TableGen/CMake=
Files/LLVMTableGen.dir/Main.cpp.o</div><div class=3D"gmail_extra">[ 20%] Bu=
ilding CXX object lib/TableGen/CMakeFiles/LLVMTableGen.dir/SetTheory.cpp.o<=
/div><div class=3D"gmail_extra">[ 20%] Building CXX object lib/TableGen/CMa=
keFiles/LLVMTableGen.dir/Error.cpp.o</div><div class=3D"gmail_extra">...</d=
iv><div class=3D"gmail_extra"><div class=3D"gmail_extra">100%] Built target=
 NATIVE_LIB_LLVMSUPPORT</div><div class=3D"gmail_extra">[100%] Building nat=
ive TableGen...</div><div class=3D"gmail_extra">[ 16%] Building CXX object =
utils/TableGen/CMakeFiles/obj.llvm-tblgen.dir/AsmMatcherEmitter.cpp.o</div>=
<div class=3D"gmail_extra"><div class=3D"gmail_extra">[ 33%] Built target o=
bj.llvm-tblgen</div><div class=3D"gmail_extra">[100%] Built target LLVMSupp=
ort</div><div class=3D"gmail_extra">[100%] Built target LLVMTableGen</div><=
div class=3D"gmail_extra">[100%] Linking CXX executable ../../bin/llvm-tblg=
en</div><div class=3D"gmail_extra">[100%] Built target llvm-tblgen</div><di=
v class=3D"gmail_extra">[100%] Built target LLVM-tablegen-host</div><div cl=
ass=3D"gmail_extra">[ =C2=A00%] Configuring NATIVE LLVM...</div><div class=
=3D"gmail_extra">[ 20%] Built target LLVMTableGen</div><div class=3D"gmail_=
extra">...</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">The first few lines which went to=
 100% controlled the progress bar, but that took about 5 seconds.=C2=A0 The=
 rest of the build takes about 15 minutes and for all that time the bar is =
pegged at 100%.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div></div></div></div>

--001a1140fab60ee56b053644d9b2--
