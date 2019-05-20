Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3D77E073
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 21:15:54 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id n19so7852786pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oTA8NwaFe6j3hR6FGtYc7rwMgCrMFEFZ2b8ViPYTdpo=;
	b=rEMG4RqsTpPS4YfD+0Sc6LSb15L66WH3PJJge0OjdY2DXqgmaYQ+Jb8xUTWNb3btqR
	gejxvjybELOW9Y6yu0qdtYZgjGEAvb80Je+JrAvFfd6DHsX4LbrH8BBkakGntcGaxJSD
	Qv1UnkBEOHIF94pSwWV2i0SlyDSrjyDzbGctRQs+rGUoQPkHVuD7YNdADUVpSUB4xQbc
	thugOd+ON3m9CsmM+ECg1+xPZMrZs43GaPlnBPOkCzo38ohFoARQhTLnPZl69RCyakCr
	N/8DeP3AUcRZIhcCQsda9Y2fxsNxHJk3ISDV/ODzoH8iBF73Ot/1JWnBYqO0YWW3dVGe
	msMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=oTA8NwaFe6j3hR6FGtYc7rwMgCrMFEFZ2b8ViPYTdpo=;
	b=oliErJ87kUqRfDpZsS21SHRfkgDFY765bhsDSOcDg1BLCoRll7GKLsh4YxTt+wn+9I
	gMMgDS3pqudJzKOrUUNLPWPDxMc83uN9qgdDOwCkvHrY/uht1GRIUdVGsI/MfwDkRLcK
	7TwMdfyll+Q49pzKweHisteZe6ZnnyYOPxY6dplHBMRLZB9ms3yfOpUrLSx62bew94wX
	S7Q6KmI1IuS6BCtWjJSZ6kCnug8gP/8oN+TVCbX5T43kZEBZ49h3ZMXouuDreRnRw1IF
	VB1qa5vDKm5cAM5uE8TDVn3BpKuqQRa9cMQbignRg/9xc5IrsdB6oRnDpCC9mHBZP7O5
	ZUJg==
X-Gm-Message-State: APjAAAVZftiPnwcOtRaZvNU452GEKcrQQb65c43S2/r8pumjxLXRdfk5
	21jB1rmo0K5AQxTqAaBB2lY=
X-Google-Smtp-Source: APXvYqzU72XS9RcfJkUfPCc8iRI8uQnGni+O2Y2Jdy3Ul2biGhfu6IEpNX+6FJV5NkAsYYljkYc58Q==
X-Received: by 2002:a63:1d02:: with SMTP id d2mr78020699pgd.26.1558386955028; 
	Mon, 20 May 2019 14:15:55 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	y13sm23893936pfb.143.2019.05.20.14.15.53
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 14:15:54 -0700 (PDT)
To: Randy MacLeod <randy.macleod@windriver.com>,
	richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org,
	"Yang, Liezhi" <Liezhi.Yang@windriver.com>,
	"Burton, Ross" <ross.burton@intel.com>, "Hao, Kexin"
	<Kexin.Hao@windriver.com>
References: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
	<20190514035716.27376-2-Randy.MacLeod@windriver.com>
	<4588fa927b2e10223bab39d65aab4184db783f49.camel@linuxfoundation.org>
	<8f1030b6-b831-7ac8-88e3-1208272d7533@windriver.com>
	<19e3463fcf6a41f0c35b7227760bd1f2cf6aeac5.camel@linuxfoundation.org>
	<c6d172d4-80f4-d91b-662f-b9b1de85f032@windriver.com>
	<0332c9bc1d4a9d3b841a1afb658dfd952e2e3d80.camel@linuxfoundation.org>
	<ff3995a4-6c30-0e36-53ad-d02f7d037f81@windriver.com>
	<67d2a4e8-7101-f16c-a734-f3a75c17ba24@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e7cb792e-2e15-f8f3-a3cb-aa6b63e56889@gmail.com>
Date: Mon, 20 May 2019 14:15:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <67d2a4e8-7101-f16c-a734-f3a75c17ba24@windriver.com>
Subject: Re: [PATCH 2/5] valgrind: do not strip the package or ptests
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
X-List-Received-Date: Mon, 20 May 2019 21:15:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/15/19 12:11 PM, Randy MacLeod wrote:
> On 5/14/19 10:22 PM, Randy MacLeod wrote:
>> ...
> 
>> It's tempting to just bump the timeout to 300 seconds
>> since anything that fails with that timeout really should
>> be fixed. The right thing is to pass the timeout from ptest-runner
>> down to valgrind's vg_regtest script. If we have people who set
>> timeouts to a non-default value and will be running valgrind's
>> ptest then I could do that.
>>
>> Since I'm a completist, I'm going to try qemumips64 next! :)
> 
> Okay, so maybe I'm not a MIPS64 completist!
> 
> 

Let me try to help a bit.

> qemumips64 hangs on drd/tests/annotate_barrier. I'm not sure why.
> 
> When run under gdb:
> 
> (gdb) bt
> #0  vgPlain_machine_get_hwcaps () at ../../valgrind-3.15.0/coregrind/m_machine.c:1910
> #1  0x00000000580b5a80 in valgrind_main (argc=<optimized out>, argv=0x580bb430 <_start_in_C_linux+224>, envp=0x120015520)
>      at ../../valgrind-3.15.0/coregrind/m_main.c:1375
> #2  0x00000000580bb430 in _start_in_C_linux (pArgc=0xffffffabe0) at ../../valgrind-3.15.0/coregrind/m_main.c:2985
> #3  0x00000000580b47e8 in __start ()
> Backtrace stopped: frame did not save the PC
> (gdb) bt full
> #0  vgPlain_machine_get_hwcaps () at ../../valgrind-3.15.0/coregrind/m_machine.c:1910
>          have_MSA = 1 '\001'
>          saved_set = {sig = {0, 0}}
>          tmp_set = {sig = {8, 0}}
>          saved_sigill_act = {sa_flags = 0, ksa_handler = 0x0, sa_mask = {sig = {0, 0}}, sa_restorer = 0xffffffae8e}
>          tmp_sigill_act = {sa_flags = 1073741824, ksa_handler = 0x58036f90 <handler_unsup_insn>, sa_mask = {sig = {0, 0}}, sa_restorer = 0xffffffae8e}
>          r = <optimized out>
>          __PRETTY_FUNCTION__ = "vgPlain_machine_get_hwcaps"
> 
> 
> 1905          /* MSA instructions */
> 1906          have_MSA = True;
> 1907          if  (VG_MINIMAL_SETJMP(env_unsup_insn)) {
> 1908             have_MSA = False;
> 1909          }else  {
> 1910             __asm__ __volatile__(".word 0x7800088E");/* addv.b w2, w1, w0 */


I think its stuck executing this instruction which is checking for ASE 
support and I guess we do not have ASE enabled in qemumips64 base arch 
emulation, or the instruction behaves differently on 32bit and 64bit ABIs


> 1911          }
> 
> The qemumips64 ptests for valgrind are now on the back burner.
> 


> -- 
> # Randy MacLeod
> # Wind River Linux
> 
> 

