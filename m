Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id BEADD7FD64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 21:53:35 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id g12so6194166ild.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=lNOa9HGa1fIRCvtrQzSUygLi2tyCqWW7lVddgg4bjGQ=;
	b=sPmzvfj3Udzo4LvZff3po2VRKMHC6ED2gh2Bw9yvTfQNPDo3rY6B7IKgKqGMAiW/oy
	4sIhks8V0SB5BnkJRdmCwbGU8RmLeiDs3QH+lmqhwAXMummxXPXHhdEOMxnmeSe/9R4L
	qdEOHArK411eWP4VFnyuhMu806hy2UGk8qGrxhVvr+7gtDGXKroF+5RGzupzUV2cUcuX
	PPwBsBsa2TyYDUPvbcouzzDRktcMHokajlSaKR6s7XYAQRQOrMIkRwCJ3Zotc+ihJtwv
	2Wy2x3NRyec5xW7kHmCKiWFq3GaMB3fTo93u6qnRvOS12aAyUdlxU7wvisH6JBtda3Vg
	y0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=lNOa9HGa1fIRCvtrQzSUygLi2tyCqWW7lVddgg4bjGQ=;
	b=YkmNUK0V0cc+Hdc7a8bZZD+gPeF8OOq6F+tmCJ6DPaS15INxiQzON3J9ilPymAcsvJ
	g6AQPonGky4m34lAcdy0saiYrSJrUqsB6wEP76g/nofZgwO38oo5Wy5/ebxRKhayS1jM
	NT3u3NzBGPXkUp0iRtDkg4QMBn1GAulCeBrAsyx9npxaNyPdfrbQ+MElwu4fBTOXyjnD
	DqJOJkm87FTcWwK9l8VC3Vt2pAWkdU/yJtjsKXWzsqFmbf1R3oQpiNK1n0jqHip4dIpP
	HVRo40qaGVmD7rvBGIEtf2bWppa3gzZD6yQ+/hpFxyK8LgtKUT7NvJpbFjwDlOY20ieL
	rlpw==
X-Gm-Message-State: APjAAAVtWsWRhnEVdaIFSHa6QLQW1IIks1KUfZqtWHEPwd0fbAyHLxcm
	X56V+53ysmol6S36qLPyQV9ji3+r
X-Google-Smtp-Source: APXvYqxLpT8SnI7M8K4XZGIIrhiXPz9BFnwQZkor3ZMCs4HvpAx9XlD1PdmF3DMQc9gS9kGHToWwtA==
X-Received: by 2002:a92:3a9b:: with SMTP id i27mr9641275ilf.39.1576792416316; 
	Thu, 19 Dec 2019 13:53:36 -0800 (PST)
Received: from [10.30.196.43] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	k20sm2275236iog.18.2019.12.19.13.53.35
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 19 Dec 2019 13:53:35 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20191219183759.3122153-1-JPEWhacker@gmail.com>
	<CADkTA4OMM33MdUyup93ga3HGY96WHJtSvLRLWw=YtQSejQ=0gQ@mail.gmail.com>
	<9365317d-d1d5-33f9-6769-14bf8af5a7a4@gmail.com>
	<CADkTA4OBW-n0ki0HsbS1xrSX9ehDawboieMCxOMeyEhH_2=mMw@mail.gmail.com>
	<CAJdd5GZF4HT_UOkYdOMVGMtp2z_A5bCeWW3bEG9+aU6RgeDyQw@mail.gmail.com>
	<CADkTA4N_P0B+GrwUumub+dFCM3mDEb5NMSb-JpUJN+7zK9n28Q@mail.gmail.com>
Message-ID: <969ab908-f227-7e8c-2467-3e1ac72d98da@gmail.com>
Date: Thu, 19 Dec 2019 15:53:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CADkTA4N_P0B+GrwUumub+dFCM3mDEb5NMSb-JpUJN+7zK9n28Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/kernel-yocto: Apply patches from BSP
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
X-List-Received-Date: Thu, 19 Dec 2019 21:53:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12/19/19 3:18 PM, Bruce Ashfield wrote:
> On Thu, Dec 19, 2019 at 3:32 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>> On Thu, Dec 19, 2019 at 1:30 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>> On Thu, Dec 19, 2019 at 1:53 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>>>>
>>>> On 12/19/19 12:45 PM, Bruce Ashfield wrote:
>>>>> On Thu, Dec 19, 2019 at 1:38 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>>>>>> 0f698dfd1c8 ("kernel-yocto: streamline patch, configuration and audit
>>>>>> phases") appears to have inadvertently broken support for BSP .scc files
>>>>>> to provide patches for the kernel. Restore this behavior by adding
>>>>>> $bsp_definition to the list of files processed for patches.
>>>>>> Additionally, the logic can be simplified now that the same elements are
>>>>>> used for both configuration fragments and patches
>>>>> Unfortunately no, we can't do this.
>>>>>
>>>>> It would reapply all the patches that are already integrated into the
>>>>> tree, and that distinction is the key part of that change.
>>>>>
>>>>> What exactly are you trying to do ? Define a userspace BSP ? If so,
>>>>> there are examples of this and I can dig them up and send them along.
>>>> We have a lot of boards running different SoCs (each with a different
>>>> vendor provided kernel) and we are trying to keep our sanity managing
>>>> all of the by using a metadata repo. So for example, we have a recipe
>>>> that pulls in vendor A's kernel directly from the upstream source, then
>>>> our local metadata repo which provides the scc files we need to
>>>> configure that repo. Inevitably, we end up needing to patch these
>>>> kernels, so I was hoping that we could provide the patches in the
>>>> metadata repo and add them to the BSP .scc file, but that wasn't working.
>>>>
>>> Right! It does make sense to keep the configs and patches together in
>>> that meta data repo.
>>>
>>> So you have your own kmeta repo, and that's where the BSP definitions
>>> that are being searched and found. Are those definitions completely
>>> standalone, or are they including some of the common yocto ktype
>>> definitions ? (It makes a difference to how they can be included).
>> I think they are standalone (e.g. they don't include any of the ktype files).
>>
>>
>>> I explained the details of the behaviour in an email on Oct 9th, with
>>> the title: "[yocto] Kernel patches pulled from BSP definition file are
>>> not applied.", so I won't repeat that long description here .. except
>>> to say that it is working as intended (but that doesn't mean it is set
>>> in stone .. see below ..). And yes, there are doc updates that need to
>>> happen for this to more clearly explain the design and options.
>>>
>>> That being said, there are a couple of things that can be done, and
>>> one that works right now:
>>>
>>> - The BSP definition SCC needs to be on the SRC_URI itself (as I
>>> describe in that other email), if your kernel recipe's have different
>>> names, that's doable. If they are under a common recipe, that of
>>> course would be harder (but you could use a variable for the MACHINE
>>> and have it work that way).
>> Does that mean the BSP scc files need to be moved from our metadata
>> repo to live alongside the recipe, or is there some special sauce that
>> allows the scc to be specified in SRC_URI, but pulled from our kmeta
>> repo?
> At the moment, yes.  Since you need to specify it in SRC_URI where the
> fetcher can find it (obviously :D), which implies that it isn't in
> that separate kernel meta repository.
>
> What, if anything, do you currently have on your SRC_URI ? Just the
> kernel repo and your kernel meta data repo ?

Yes, that is all we have.

>
> Let me see if I can come up with a simple way (probably patch) to avoid that.

That would be great! Thanks.

>
> Bruce
>
>>> That's the one that works now.
>>>
>>> A second option would be if I inject some logic to differentiate an
>>> integrated BSP versus one that requires patching. That's a slippery
>>> slope back into the complex logic that used to be in place, but I can
>>> think of a few viable ways to do it.
>>>
>>> Definitely a use case we can support, it'll just take some tweaking.
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>
>>> Bruce
>>>
>>>
>>>
>>>
>>>
>>>>> Bruce
>>>>>
>>>>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>>>>> ---
>>>>>>    meta/classes/kernel-yocto.bbclass | 7 ++-----
>>>>>>    1 file changed, 2 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
>>>>>> index ed9bcfa57c..08c02a8f50 100644
>>>>>> --- a/meta/classes/kernel-yocto.bbclass
>>>>>> +++ b/meta/classes/kernel-yocto.bbclass
>>>>>> @@ -193,12 +193,9 @@ do_kernel_metadata() {
>>>>>>                   if [ $? -ne 0 ]; then
>>>>>>                           bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
>>>>>>                   fi
>>>>>> -       fi
>>>>>>
>>>>>> -       # run2: only generate patches for elements that have been passed on the SRC_URI
>>>>>> -       elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
>>>>>> -       if [ -n "${elements}" ]; then
>>>>>> -               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} ${KERNEL_FEATURES}
>>>>>> +               # run2: generate patches
>>>>>> +               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
>>>>>>                   if [ $? -ne 0 ]; then
>>>>>>                           bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
>>>>>>                   fi
>>>>>> --
>>>>>> 2.23.0
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

