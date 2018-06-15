Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7C77556C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 06:44:42 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id c10-v6so4008566pgu.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 23:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=32crmDu77PKMJnFIphDVV4IbtTd0wpcPNsLDYh5hrGs=;
	b=V9TDQ0+aDMHJthtYIvLGsp3toNiYuvvMnTvqQULKfN1Fp8KGENDL/xeXXU4eunFYHG
	2YSmMUtJnr3WbhpEAyC7cCo7pR5qdGFL2KJdpx0HUSE5nwlV7LLI8IeNV8B8l4E9o63Q
	TB9utRepiH9tbLgG200Wnwy6t75OfAoULxxczsU2j9sIIBue/axI8rtn0eIK/2lFzUeU
	TxxkQM4w6ew+9i0pyd7+JIB+Mqv4pV7KAjKkMxJqX6FN4T2oqf0ykOWdiYL0nZEWtjIi
	QN2mQdQc2P/nyUZC9lszGxCWP99P4SH/heEn+ygVoEeh88b2WzB1fKhlzmgMBtXGHE/F
	7obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=32crmDu77PKMJnFIphDVV4IbtTd0wpcPNsLDYh5hrGs=;
	b=UXx6KsYL0xku0u8OWUTURDm9WmEOPHcwQmdG6BtN5qJOC4NLfC/PnMi0CviE5mBEUN
	qq+P1ywFd/Q1Vf/oR8Tf1MTHNBv1JJ3pR19tFq5R0YKkFUlvmqMPk8eKNAxwBCn4OmaI
	7tReS9J0av4bCBZEXiYHYjnDy9W7sQlWv6NMepyrIsAlMUsNdnAe4tPWe1VEpQ2yBTUh
	ReQCADegm11qQrI43UXmj/wqOz5CvGa3DWwv70oSCuwgvp7W6VOzc6XkhiTuOBLY+1Kg
	/RAhsj38AuR0tiWqTU70cDc+fYxqryMZyCGzyGfC3b25kR8o6LTwstmw3JeAd6VmEVBp
	OecA==
X-Gm-Message-State: APt69E15m3+YT9RuFf+utUkaUN0mO85gLof36OyRYm3QR/tdBS0/sN1g
	KYFwA3zL7it3kRCfMpTxp7Tfhhlv
X-Google-Smtp-Source: ADUXVKK216sZNbCIbGZDlimxOOvOC3W0csSgV3AaFFWDTeEbz/rxeYhugUDi+9moorW97aQkiDIy6w==
X-Received: by 2002:a62:e903:: with SMTP id j3-v6mr504098pfh.228.1529045082868;
	Thu, 14 Jun 2018 23:44:42 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:f5fe:f3c:9298:284e])
	by smtp.gmail.com with ESMTPSA id
	y81-v6sm11363336pfd.178.2018.06.14.23.44.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jun 2018 23:44:41 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <20180531062031.40334-1-mingli.yu@windriver.com>
	<1527772404.16911.155.camel@linuxfoundation.org>
	<5B10A3D7.20309@windriver.com>
	<CANNYZj_3y_uP4a188SREALPvpBL=xnu=QZAW9s7V9iSG2a-t9Q@mail.gmail.com>
	<5B10DBE5.5050603@windriver.com>
	<62a9d51c-67da-353b-778e-b8af72408413@gmail.com>
	<CANNYZj-JRVCWfRr++c6YQzEtq1WgmhUgf8CwAx4_N6PEdXrYHg@mail.gmail.com>
	<ef063f72-b7b0-e48b-fd50-1f0d05b22255@gmail.com>
	<94dbb164-5f36-de0f-9d2f-c3e9f4afc6f5@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <399d37ef-b872-cae7-f086-818127a588b7@gmail.com>
Date: Thu, 14 Jun 2018 23:44:40 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <94dbb164-5f36-de0f-9d2f-c3e9f4afc6f5@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Improve reproducibility
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
X-List-Received-Date: Fri, 15 Jun 2018 06:44:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/1/18 12:34 PM, Alexander Kanavin wrote:
> On 06/01/2018 09:33 PM, Khem Raj wrote:
>>> The .s file is not generated and it does not contain any .file
>>> directives. The .o file also does not contain the path. It appears in
>>> the final .so library at linking stage.
>>
>> Can you share the linker cmdline ?
> 
> https://pastebin.com/WK9GVDfj
> 
> Note that of the three assembly-generated object files, only the path to 
> the first shows up in the .so - because of assembly labels I believe.
> 

Thanks for sharing this. If there is a no file directive in an object 
file then linker will use whatever is specified on linker cmdline so 
thats what we see, We should define FILE symbol explicitly for .S files 
here, for C/C++ files compiler does that automatically.

Other files dont make a claim in final symbol table since this one file 
alone has cross referencing to symbols from other objects.

Something like this will help

Index: boost_1_67_0/libs/context/src/asm/make_i386_sysv_elf_gas.S
===================================================================
--- boost_1_67_0.orig/libs/context/src/asm/make_i386_sysv_elf_gas.S
+++ boost_1_67_0/libs/context/src/asm/make_i386_sysv_elf_gas.S
@@ -23,7 +23,7 @@
   * 
---------------------------------------------------------------------------------- 
  *
   * 
                  *
 
****************************************************************************************/
-
+.file "make_i386_sysv_elf_gas.S"
  .text
  .globl make_fcontext
  .align 2
Index: boost_1_67_0/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
===================================================================
--- boost_1_67_0.orig/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
+++ boost_1_67_0/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
@@ -23,7 +23,7 @@
   * 
---------------------------------------------------------------------------------- 
  *
   * 
                  *
 
****************************************************************************************/
-
+.file "make_x86_64_sysv_elf_gas.S"
  .text
  .globl make_fcontext
  .type make_fcontext,@function

> Alex

