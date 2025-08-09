Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E34AC87FCB
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 18:22:53 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.11543.1754763768989659145
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 11:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EtQSDBIY;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6157c81ff9eso4838218a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 11:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754763767; x=1755368567; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xeEHLkEAAO6VjuOEdaWTjl7uSb2m1ROhZDLpOSM2BbI=;
        b=EtQSDBIY56q6qhqToO8KEBDR/c5xvjWYGbWmPscvpxoNvJQszaLwWLoo5bhR8w2RNM
         TtJMbRkJ7oFYCLhvkNIiv2hiL/ktTRRlbJYRgJYpPq3fNhWzqY8xN5QSU8gYdWQ5uFov
         w3g7qRu/eFejoMOuGIob8yN1j5akzH9g9SErZy4kAbHF6bFjF7RQP8TsTHkyaRbqzCKi
         R9ivAUNLLkSDKvPPDx3geCiHyvz44cWFxvwuV0nr80u2oUzOcKA/iZD5tvMyG7uBVXc2
         5QLY7Chxegp7q5MKwsPzYaKkDPtyovMOLp8OL3T3M5QhdMQwXybaBOreaG/dDxJfBnx6
         Tg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754763767; x=1755368567;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xeEHLkEAAO6VjuOEdaWTjl7uSb2m1ROhZDLpOSM2BbI=;
        b=kgQuCxXNnr6Z0PxB5JDe2K/axFyHn3b3rpdT2dXAuscTUoJprjr4XOpeyfTk9w5jPK
         J//5MRmzXqV5W4YY7CmKEGtejRXhesjv5dNQnpuUAcIWNmmCPAMZtfdKjoFy8DOZq7zs
         tvmfRqZ/1jiFlC/wsgfIaoXvvWcz3CDdHQpq3ionVp0HjFqgAetD1Ocd274TSJGYRtg9
         sJhNfP+OshLiU5PxBETEAx30EHOyqpkrPTkqQlVB47UOD4r6TB+ZBkHSgCkiC9gElNcg
         +JlmtVkexycAqbZKJySHPJLSRCMdEkfzQvdN9Ur61EyhVffg2PSVjzpusuwy3byMEM1t
         NRXg==
X-Gm-Message-State: AOJu0Yw8aQQ/uVSTmH/p80U7J3HhtFgtTJ/OOjaOb/ONTHW6IkSUDqoa
	02wdHsnomVgYqPAcgrEjdHguuVjqn81UHhOSv51+QZoL5xpDPMemgZ7dg186DQ==
X-Gm-Gg: ASbGncug086iHoZ9MOt7fAFAD0EIVqIYkGqwHyGW0ZXxQAy9ZnatYmlebFUllTbEYRA
	dTpuEm14JtilZk/0YaIgMLn9D0XtQWVF3ppSEwlSsvbZqJW5IA7xOKGVLCYXMQ6PdpEQ3SI+Lt1
	n7k7i0GbVIHIx4lwHFMD6ygoGfx4ymZlHkNmj+f+dqcGKFesN2IUM0PdgWFLXmG91U+HMgfhv/Z
	HXbDOXGHXMo7FHTLsvKkIXNxGhGtui+AStQZ2drrnCvLF+6sVSylf2+S2N5hjd5wa1lpHKzaPey
	AdgqNyIPRRo0ZiAKwWDa/bbiKZwUwSODtgX3OKJkbtJ4d09W0uLz/AhaWKah5FtpD7qC0cHOw+J
	sFwCuX5nyXTWjyCEpcn/K97QMgCG+JF7nQIZru+9C
X-Google-Smtp-Source: AGHT+IGtPGSqaSTiS5YLT4OYrL5AKZ8pzXXlPRHwdkQl9xlygsnfx4hSrrrIFxdmpItx2CBKL7zdKQ==
X-Received: by 2002:a17:907:d87:b0:ae0:ce90:4b6c with SMTP id a640c23a62f3a-af9c650d656mr643258266b.49.1754763766863;
        Sat, 09 Aug 2025 11:22:46 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af92b650c8asm1553104866b.65.2025.08.09.11.22.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Aug 2025 11:22:46 -0700 (PDT)
Message-ID: <623a5903-68b7-4c74-a753-637ebbf8c1e5@gmail.com>
Date: Sat, 9 Aug 2025 20:22:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] webkitgtk: fix compiling for 32-bit Arm
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
References: <20250807172009.3692562-1-skandigraun@gmail.com>
Content-Language: en-US
In-Reply-To: <20250807172009.3692562-1-skandigraun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 18:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221687

I see this is not in master yet - please ignore this patch in this case.

A fix appeared meanwhile in the upstream repo, will send a patch with a
backport of that.

On 8/7/25 19:20, Gyorgy Sarvari wrote:
> When compiling for 32-bit Arm taget, the compilation fails with the
> following error:
>
> | .../webkitgtk/2.48.5/sources/webkitgtk-2.48.5/Source/JavaScriptCore/offlineasm/ast.rb:1004:in 'Instruction#lowerDefault': Unhandled opcode addq at WebAssembly.asm:739 (due to WebAssembly.asm:739) (LoweringError)
>
> The cause is a recent commit, which introduced an assembly opcode
> without gating it, however this opcode is not available on all
> platforms.
>
> To avoid the problem, add a patch that reverts this commit on 32-bit Arm
> architectures until this is fixed upstream (bugreport submitted).
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...ck-289651.534-safari-7621-branch-a8d.patch | 160 ++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.48.5.bb  |   3 +
>  2 files changed, 163 insertions(+)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Revert-Cherry-pick-289651.534-safari-7621-branch-a8d.patch
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Revert-Cherry-pick-289651.534-safari-7621-branch-a8d.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Revert-Cherry-pick-289651.534-safari-7621-branch-a8d.patch
> new file mode 100644
> index 0000000000..1dc4dc7b69
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-Revert-Cherry-pick-289651.534-safari-7621-branch-a8d.patch
> @@ -0,0 +1,160 @@
> +From 35e52b719635a004e19726674fd03b4bb3d8f043 Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Thu, 7 Aug 2025 18:02:37 +0200
> +Subject: [PATCH] Revert "Cherry-pick 289651.534@safari-7621-branch
> + (a8d546461042). https://bugs.webkit.org/show_bug.cgi?id=292621"
> +
> +This commit causes a build failure on 32-bit arm:
> +webkitgtk-2.48.5/Source/JavaScriptCore/offlineasm/ast.rb:1004:in 'Instruction#lowerDefault': Unhandled opcode addq at WebAssembly.asm:739 (due to WebAssembly.asm:739) (LoweringError)
> +
> +The reverted commit[1] is fixing a potential undefined behavior due
> +to uninitialized memory content, which, by looking at the code, has been present 
> +since 08.2024. (The commit references a bugreport which requires elevated access 
> +rights, so no details are available)
> +
> +[1]: https://github.com/WebKit/WebKit/commit/846b3f034f0021a0e45358b904682bc3de367605
> +
> +Upstream-Status: Inappropriate [cross-compiling workaround. bugreport: https://bugs.webkit.org/show_bug.cgi?id=297062]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + Source/JavaScriptCore/llint/WebAssembly.asm | 49 +++++----------------
> + Source/JavaScriptCore/wasm/js/JSToWasm.cpp  | 36 +++------------
> + 2 files changed, 18 insertions(+), 67 deletions(-)
> +
> +diff --git a/Source/JavaScriptCore/llint/WebAssembly.asm b/Source/JavaScriptCore/llint/WebAssembly.asm
> +index 1ac3e2accf3c..754909f8c63e 100644
> +--- a/Source/JavaScriptCore/llint/WebAssembly.asm
> ++++ b/Source/JavaScriptCore/llint/WebAssembly.asm
> +@@ -692,6 +692,17 @@ end
> +     loadp Callee[cfr], ws0 # WebAssemblyFunction*
> +     loadp WebAssemblyFunction::m_instance[ws0], wasmInstance
> + 
> ++    # Memory
> ++    if ARM64 or ARM64E
> ++        loadpairq JSWebAssemblyInstance::m_cachedMemory[wasmInstance], memoryBase, boundsCheckingSize
> ++    elsif X86_64
> ++        loadp JSWebAssemblyInstance::m_cachedMemory[wasmInstance], memoryBase
> ++        loadp JSWebAssemblyInstance::m_cachedBoundsCheckingSize[wasmInstance], boundsCheckingSize
> ++    end
> ++    if not ARMv7
> ++        cagedPrimitiveMayBeNull(memoryBase, wa0)
> ++    end
> ++
> +     # Allocate stack space
> +     loadi WebAssemblyFunction::m_frameSize[ws0], wa0
> +     subp sp, wa0, wa0
> +@@ -709,51 +720,15 @@ if ASSERT_ENABLED
> +     end)
> + end
> + 
> +-    # a0 = current stack frame position
> +-    move sp, a0
> +-
> +-    # Save wasmInstance and put the correct Callee into the stack for building the frame
> +-    storep wasmInstance, CodeBlock[cfr]
> +-
> +-if JSVALUE64
> +-    loadp Callee[cfr], memoryBase
> +-    transferp WebAssemblyFunction::m_boxedJSToWasmCallee[ws0], Callee[cfr]
> +-else
> +-    # Store old Callee to the stack temporarily
> +-    loadp Callee[cfr], ws1
> +-    push ws1, ws1
> +-    loadp WebAssemblyFunction::m_boxedJSToWasmCallee[ws0], ws1
> +-    storep ws1, Callee[cfr]
> +-end
> +-
> +     # Prepare frame
> +     move ws0, a2
> +     move cfr, a1
> ++    move sp, a0
> +     cCall3(_operationJSToWasmEntryWrapperBuildFrame)
> + 
> +-    # Restore Callee slot
> +-if JSVALUE64
> +-    storep memoryBase, Callee[cfr]
> +-else
> +-    loadp [sp], ws0
> +-    addq 2 * SlotSize, sp
> +-    storep ws0, Callee[cfr]
> +-end
> +-
> +     btpnz r1, .buildEntryFrameThrew
> +     move r0, ws0
> + 
> +-    # Memory
> +-    if ARM64 or ARM64E
> +-        loadpairq JSWebAssemblyInstance::m_cachedMemory[wasmInstance], memoryBase, boundsCheckingSize
> +-    elsif X86_64
> +-        loadp JSWebAssemblyInstance::m_cachedMemory[wasmInstance], memoryBase
> +-        loadp JSWebAssemblyInstance::m_cachedBoundsCheckingSize[wasmInstance], boundsCheckingSize
> +-    end
> +-    if not ARMv7
> +-        cagedPrimitiveMayBeNull(memoryBase, wa0)
> +-    end
> +-
> +     # Arguments
> + 
> + if ARM64 or ARM64E
> +diff --git a/Source/JavaScriptCore/wasm/js/JSToWasm.cpp b/Source/JavaScriptCore/wasm/js/JSToWasm.cpp
> +index 10f0771538e6..812b9ae70af3 100644
> +--- a/Source/JavaScriptCore/wasm/js/JSToWasm.cpp
> ++++ b/Source/JavaScriptCore/wasm/js/JSToWasm.cpp
> +@@ -241,6 +241,11 @@ MacroAssemblerCodeRef<JITThunkPtrTag> createJSToWasmJITShared()
> + 
> +         jit.loadPtr(CCallHelpers::addressFor(CallFrameSlot::callee), GPRInfo::regWS0);
> +         jit.loadPtr(CCallHelpers::Address(GPRInfo::regWS0, WebAssemblyFunction::offsetOfInstance()), GPRInfo::wasmContextInstancePointer);
> ++        // Memory
> ++#if USE(JSVALUE64)
> ++        jit.loadPair64(GPRInfo::wasmContextInstancePointer, CCallHelpers::TrustedImm32(JSWebAssemblyInstance::offsetOfCachedMemory()), GPRInfo::wasmBaseMemoryPointer, GPRInfo::wasmBoundsCheckingSizeRegister);
> ++        jit.cageConditionally(Gigacage::Primitive, GPRInfo::wasmBaseMemoryPointer, GPRInfo::wasmBoundsCheckingSizeRegister, GPRInfo::regWA0);
> ++#endif
> + 
> +         // Now, the current frame is fully set up for exceptions.
> +         // Allocate stack space
> +@@ -254,44 +259,15 @@ MacroAssemblerCodeRef<JITThunkPtrTag> createJSToWasmJITShared()
> +         stackOverflow.append(jit.branchPtr(CCallHelpers::LessThanOrEqual, GPRInfo::regWS1, CCallHelpers::Address(GPRInfo::wasmContextInstancePointer, JSWebAssemblyInstance::offsetOfSoftStackLimit())));
> + 
> +         jit.move(GPRInfo::regWS1, CCallHelpers::stackPointerRegister);
> +-        jit.move(CCallHelpers::stackPointerRegister, GPRInfo::argumentGPR0);
> +-
> +-        jit.storePtr(GPRInfo::wasmContextInstancePointer, CCallHelpers::addressFor(CallFrameSlot::codeBlock));
> +-
> +-        // Save the current Callee before putting in our boxed callee for the stack visitor
> +-#if USE(JSVALUE64)
> +-        jit.loadPtr(CCallHelpers::addressFor(CallFrameSlot::callee), GPRInfo::wasmBaseMemoryPointer);
> +-        jit.transferPtr(CCallHelpers::Address(GPRInfo::regWS0, WebAssemblyFunction::offsetOfBoxedJSToWasmCallee()), CCallHelpers::addressFor(CallFrameSlot::callee));
> +-#else
> +-        jit.loadPtr(CCallHelpers::addressFor(CallFrameSlot::callee), GPRInfo::regWS1);
> +-        jit.push(GPRInfo::regWS1);
> +-        jit.push(GPRInfo::regWS1);
> +-        jit.transferPtr(CCallHelpers::Address(GPRInfo::regWS0, WebAssemblyFunction::offsetOfBoxedJSToWasmCallee()), CCallHelpers::addressFor(CallFrameSlot::callee));
> +-#endif
> + 
> +         // Prepare frame
> +-        jit.setupArguments<decltype(operationJSToWasmEntryWrapperBuildFrame)>(GPRInfo::argumentGPR0, GPRInfo::callFrameRegister, GPRInfo::regWS0);
> ++        jit.setupArguments<decltype(operationJSToWasmEntryWrapperBuildFrame)>(CCallHelpers::stackPointerRegister, GPRInfo::callFrameRegister, GPRInfo::regWS0);
> +         jit.callOperation<OperationPtrTag>(operationJSToWasmEntryWrapperBuildFrame);
> +-
> +-        // Restore Callee slot regardless
> +-#if USE(JSVALUE64)
> +-        jit.storePtr(GPRInfo::wasmBaseMemoryPointer, CCallHelpers::addressFor(CallFrameSlot::callee));
> +-#else
> +-        jit.transferPtr(CCallHelpers::Address(CCallHelpers::stackPointerRegister, 0), CCallHelpers::addressFor(CallFrameSlot::callee));
> +-        jit.addPtr(CCallHelpers::TrustedImm32(2 * 8), CCallHelpers::stackPointerRegister);
> +-#endif
> +-
> +         static_assert(CCallHelpers::operationExceptionRegister<operationJSToWasmEntryWrapperBuildFrame>() != InvalidGPRReg, "We don't have a VM readily available so we rely on exception being returned");
> +         JIT_COMMENT(jit, "Exception check: ", CCallHelpers::operationExceptionRegister<operationJSToWasmEntryWrapperBuildFrame>());
> +         buildEntryFrameThrew.append(jit.branchTestPtr(CCallHelpers::NonZero, CCallHelpers::operationExceptionRegister<operationJSToWasmEntryWrapperBuildFrame>()));
> +         jit.move(GPRInfo::returnValueGPR, GPRInfo::regWS0);
> + 
> +-        // Memory
> +-#if USE(JSVALUE64)
> +-        jit.loadPair64(GPRInfo::wasmContextInstancePointer, CCallHelpers::TrustedImm32(JSWebAssemblyInstance::offsetOfCachedMemory()), GPRInfo::wasmBaseMemoryPointer, GPRInfo::wasmBoundsCheckingSizeRegister);
> +-        jit.cageConditionally(Gigacage::Primitive, GPRInfo::wasmBaseMemoryPointer, GPRInfo::wasmBoundsCheckingSizeRegister, GPRInfo::regWA0);
> +-#endif
> +-
> + #if CPU(ARM64)
> +         jit.loadPair64(CCallHelpers::Address(CCallHelpers::stackPointerRegister, 0 * 8), GPRInfo::regWA0, GPRInfo::regWA1);
> +         jit.loadPair64(CCallHelpers::Address(CCallHelpers::stackPointerRegister, 2 * 8), GPRInfo::regWA2, GPRInfo::regWA3);
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
> index 947996450d..1fa735e06e 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
> @@ -19,6 +19,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
>             file://fix-ftbfs-riscv64.patch \
>             "
> +SRC_URI:append:arm = "file://0001-Revert-Cherry-pick-289651.534-safari-7621-branch-a8d.patch"
> +SRC_URI:append:armeb = "file://0001-Revert-Cherry-pick-289651.534-safari-7621-branch-a8d.patch"
> +
>  SRC_URI[sha256sum] = "bb64ed9d1cfd58e8b5e89ccad71dd31adfed56336bad7695031ad0b668e1987c"
>  
>  inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen


