Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 990A277961
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 14:44:28 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n11so14973148wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 07:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WudO/c2qzRsOUQIrr+sVqJefPK7AGh0gmuUPRuQW2FM=;
	b=k8SfIDorCLCQl2pFlYqgtbulyCqG58FSMvW4iXW8kCnnc/2yDrCYuCXm24G1ktTu5b
	Z4Ip9pwILIrM1dOv9FdMoAXyUiOkK6V3mxGZXs2amRLiYa/+DoguaJWfhuq+aiboXfVF
	Nez0tis+u/64mrJ2GGYgFkuBXPlp7zAaDZx+ooUcV48tIWmCCSyMSHyE6ITZChd+pGvv
	K1KgJQEBcdHqo1UxIsSEVayHU6XPaKOuok4TUzhddu2R20ofJixcUZAw+PcWqQz54LXM
	+WNr8r4gIxw4mweg5vdbvhXU4dNMK3wj+hoETIgkgn7PsrSk6cAMa1tgEFGL4/LBSRc8
	/TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WudO/c2qzRsOUQIrr+sVqJefPK7AGh0gmuUPRuQW2FM=;
	b=HqxKpa1mzWnzv3Agn9JUHS6RZvsOOeaQSsBUQdHr9JX6aLQSqs/km2muHZGCx4ub3l
	wbxJLSHAFfyL5r5oYYmk2VSj+z8bqjSiYA9oRi6050At+S/a0rPFH4V2y7HwnDlBOkaU
	Fsv8D+rXGR7Qon0r9rBsuZe1I3yppaCsiizg8BXk9Aks3SnNu/vk3kvHNg+PpMe+PLXy
	8Y5eGQaK3cyb2Q5WhzaJtPyat0JIkoQUZc/8u6jWRhohJNrRHzKTUxHxyv7Wlk7f+mq9
	p+Nb0QO2O4pl/vr+8DfbEAG5b/U1vtqMTZa36Z+sKo6WEV5KXrj4y5lYjzCiVUenlQWm
	gICw==
X-Gm-Message-State: AFeK/H1JD/6ZOHBcBLq5OeDQ1OnO7ZlhsysavCc6yngw/pA2IGeoMxyMEOuljIHxuMzL1ZzEsubZV7CkVjYAiw==
X-Received: by 10.28.140.135 with SMTP id o129mr10548868wmd.101.1490021069499; 
	Mon, 20 Mar 2017 07:44:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Mon, 20 Mar 2017 07:43:58 -0700 (PDT)
In-Reply-To: <CAHiDW_EvTOKpqOACTS6M9Y2_wofaEQ6sL89ThNHem4cPrxLFmQ@mail.gmail.com>
References: <cover.1489534345.git.raj.khem@gmail.com>
	<2a1cd614717f323afc788e24fae76337cffa8816.1489534345.git.raj.khem@gmail.com>
	<CAHiDW_EvTOKpqOACTS6M9Y2_wofaEQ6sL89ThNHem4cPrxLFmQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Mar 2017 07:43:58 -0700
Message-ID: <CAMKF1sqY+nZsj2b9AOq0OUnKpGemjcvT+_wa0m5S7VoGv-r31g@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] musl: Update to latest
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
X-List-Received-Date: Mon, 20 Mar 2017 14:44:30 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 20, 2017 at 1:32 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
>
> On 15 March 2017 at 01:35, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Rich Felker (11):
>>       fix ld-behavior-dependent crash in ppc64 ldso startup
>>       rework ldso handling of global symbol table for consistency
>>       reorder addend handling before symbol lookup in relocation code
>>       emulate lazy relocation as deferrable relocation
>>       fix free of uninitialized buffer pointer on error in regexec
>>       in static dl_iterate_phdr, fix use of possibly-uninitialized aux
>> data
>>       fix possible fd leak, unrestored cancellation state on dns socket
>> fail
>>       fix wide scanf's use of a compound literal past its lifetime
>>       fix one-byte overflow in legacy getpass function
>>       avoid loading of multiple libc versions via explicit pathname
>>       remove unused refcnt field for shared libraries
>>
>> Szabolcs Nagy (1):
>>       treat STB_WEAK and STB_GNU_UNIQUE like STB_GLOBAL in find_sym
>
>
>
> Could the relocation changes here be responsible for these ovmf build
> failures:
>   "GenFw: ERROR 3000: Invalid ... unsupported ELF EM_386 relocation"
> ?
>
Dont understand why musl would affect here.
its using native gcc to build the artifacts its complaining about,

> https://autobuilder.yocto.io/builders/nightly-musl/builds/196/steps/BuildImages/logs/stdio
>
>
> Jussi

