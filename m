Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id CAD7F7FD6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 18:53:03 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id z12so5722524iln.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 10:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=7vdp+b8epEdtTIgyqs2Tf+VGd4o70Ja3Mx1MU+wIyK4=;
	b=tAcVabAEMSfUycpObe1/CsJjX+9adXEIe5DbJpC/HfRxFv+IqcLT+pIfl6YxmOZi7R
	UZQ9rK8a1/uy5L8nVVyLtlGfYQbnex39RrRZ8kkOuGgDyS8Mqwdne8jO8Ib8inpDBnML
	k81OKYOjEl8SA+wehVHy203QEuShp59ZXh+YAAoU+XeSPy68vXp39xOOKyUJimHhLj3G
	lj+gWezdNa6+VY/b6Xc6WEN4uX8bf1VLdhnl7dbHfDI0JnK4IqNPgrQgucgsrUa4Mn33
	lhwATDzLXrigmgUeFllHB+Ffi0waoiwm5eiWgNTfS0Oi9VPWCzg4GUisZa7cVTOIBR2G
	KLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=7vdp+b8epEdtTIgyqs2Tf+VGd4o70Ja3Mx1MU+wIyK4=;
	b=hwkBfbIveKMkauFj8F0PmEeFBbwO+prSFlivBGOO8ka9Ffnfo7/iDVRNj/2Yg/kdyn
	WYS/PBdSUtCesSLjkY61IA1EUoI3UTrU1BxlXwAJ8Cn3b/lNIFVUL+TggnDqa32IDDrP
	y4hDVNwmJzpHkIq+KGhAYmkBBIfwzQLg1OVHhCb/z7D/73yCvqfFIeJ3AnnXpPJUEtFE
	Ln+XTvwdZt+7TJ4MdhOzfa6/wRq0k19+DsyRaz/NicOdMUiLxg/XBt1uqHlVOlkF2C5L
	ISagqFLY1e+h8JdtaLnjdWVJ+vkzLujoj8mumDtKqzUuvFdFA5DJ/nluCJhUbe/OAVLy
	SUWA==
X-Gm-Message-State: APjAAAW3SW67MBrKcTfaVwYhH2VqjgYmO7dIPjtjypbSFS9usEfJAqAg
	/HEF5reRLivwrUUXO07tIE4zR92mMiA=
X-Google-Smtp-Source: APXvYqzlqmVEdKoh8Om+yzh0XUtNi6N8iRZmDLRaijayEt5AvgwjE9Kti8xPzMdPdCdLKkagHNIomQ==
X-Received: by 2002:a92:af08:: with SMTP id n8mr8237743ili.217.1576781584701; 
	Thu, 19 Dec 2019 10:53:04 -0800 (PST)
Received: from [10.30.196.43] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	j88sm2863540ilf.83.2019.12.19.10.53.03
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 19 Dec 2019 10:53:04 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20191219183759.3122153-1-JPEWhacker@gmail.com>
	<CADkTA4OMM33MdUyup93ga3HGY96WHJtSvLRLWw=YtQSejQ=0gQ@mail.gmail.com>
Message-ID: <9365317d-d1d5-33f9-6769-14bf8af5a7a4@gmail.com>
Date: Thu, 19 Dec 2019 12:53:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CADkTA4OMM33MdUyup93ga3HGY96WHJtSvLRLWw=YtQSejQ=0gQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Dec 2019 18:53:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12/19/19 12:45 PM, Bruce Ashfield wrote:
> On Thu, Dec 19, 2019 at 1:38 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>> 0f698dfd1c8 ("kernel-yocto: streamline patch, configuration and audit
>> phases") appears to have inadvertently broken support for BSP .scc files
>> to provide patches for the kernel. Restore this behavior by adding
>> $bsp_definition to the list of files processed for patches.
>> Additionally, the logic can be simplified now that the same elements are
>> used for both configuration fragments and patches
> Unfortunately no, we can't do this.
>
> It would reapply all the patches that are already integrated into the
> tree, and that distinction is the key part of that change.
>
> What exactly are you trying to do ? Define a userspace BSP ? If so,
> there are examples of this and I can dig them up and send them along.

We have a lot of boards running different SoCs (each with a different 
vendor provided kernel) and we are trying to keep our sanity managing 
all of the by using a metadata repo. So for example, we have a recipe 
that pulls in vendor A's kernel directly from the upstream source, then 
our local metadata repo which provides the scc files we need to 
configure that repo. Inevitably, we end up needing to patch these 
kernels, so I was hoping that we could provide the patches in the 
metadata repo and add them to the BSP .scc file, but that wasn't working.


>
> Bruce
>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   meta/classes/kernel-yocto.bbclass | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
>> index ed9bcfa57c..08c02a8f50 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -193,12 +193,9 @@ do_kernel_metadata() {
>>                  if [ $? -ne 0 ]; then
>>                          bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
>>                  fi
>> -       fi
>>
>> -       # run2: only generate patches for elements that have been passed on the SRC_URI
>> -       elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
>> -       if [ -n "${elements}" ]; then
>> -               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} ${KERNEL_FEATURES}
>> +               # run2: generate patches
>> +               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
>>                  if [ $? -ne 0 ]; then
>>                          bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
>>                  fi
>> --
>> 2.23.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

