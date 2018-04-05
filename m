Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id C33C374DE2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 16:52:08 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id 61-v6so17989076plb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2018 09:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IGRbOdbaMjuCtj/8VvRhjikaJikbUw3AkaBIyl+loOM=;
	b=tuuRroGe1DIWPAo9b+yhSWA6uGSk3/2mk4oX88aTLcL+eohlMFg+1nbZh/vhSKNUX9
	JVXuT9lgfMw3V1sfAsCwIYZfIBO6r8bBd+kRgnS2T2wWOpniW8XL8/Qvo8t8vqRRsccn
	nVdcYji8XuWSDvcTCPygnP/OGvvfHMy0CI2BHqL/hAFnys4tBsKB/Kg5v3dQNatY+v43
	GkVIcCp3FcLKm1HWYou+dgyiH4K0FOECz2aEtI8fUJKSJiwJPJjmo3ETCBmeq8PuycxX
	wKt2VIICRn8EyJW97Eaz+lc+lhtrGxoFmCuBPdahgJ0KFT8wT5tm7pepoQ8vtY1AN3C0
	uUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IGRbOdbaMjuCtj/8VvRhjikaJikbUw3AkaBIyl+loOM=;
	b=WNrmlRVjhE9O0vuy4d+bBLujXhcamV+bmdJ4uHKrhOMmc2F03mJnqaZdA+yE9iuMDF
	jkBC7/wUnUc4uUuW0hkWQJPsRuWmzC1bJTqhw04pG8YRSnURWUmzxpbkFgrfG7ZN/LGU
	YjVoYUVJ8zah+LHnczcrEpytODLBEhenfOnva1tPpVdtceB+3AXRTWUDod/38j4scDoz
	XIuGskGxRxLWJgNnUJC2VQm1+g+7rIHZP/e278QfDN9vMDDSywEN/aS4M3+RoazVrPCG
	9wAdVVRHMFy9idLBxnQjXqVOFMxUVxS/BCAvqfpe8z3HetVSbaUoYRcwJb4bLzyDFzpb
	tqoQ==
X-Gm-Message-State: ALQs6tC44FAq5951hGx9tNxLw4MUeLbxzL0az/9DbgMBJOoVKAZYCQ+d
	oUE41U2EvOjvrurwoFbJve4SLdg8Oj7b8ePdT6k=
X-Google-Smtp-Source: AIpwx4/O+pw5exLFGhlgMh7QZLR1WzlW9IlLIMI3a8xX5fLX8DO3B05GEiuxWorALw6cgAgqa65gdQTMDd8EiARObVU=
X-Received: by 10.99.107.196 with SMTP id g187mr6693023pgc.384.1522947129010; 
	Thu, 05 Apr 2018 09:52:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.172.5 with HTTP; Thu, 5 Apr 2018 09:51:38 -0700 (PDT)
In-Reply-To: <4815bfcf-28c7-0154-c2cd-71e307ffcf90@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
	<20180404111321.10824-14-alexander.kanavin@linux.intel.com>
	<1ee35204-4a8b-d22c-7225-1408f2a09d17@gmail.com>
	<4815bfcf-28c7-0154-c2cd-71e307ffcf90@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Apr 2018 09:51:38 -0700
Message-ID: <CAMKF1sqXczYe9Ly8Y8v_-txrKg0-DLF1L8E9CFp2ecdpyVyHBQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/22] icu: update to 61.1
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
X-List-Received-Date: Thu, 05 Apr 2018 16:52:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 5, 2018 at 2:32 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 04/05/2018 03:20 AM, Khem Raj wrote:
>>
>> On 4/4/18 4:13 AM, Alexander Kanavin wrote:
>>>
>>> License-Update: copyright years updated, added terms for Google
>>> double-conversion
>>
>>
>> should this change to terms reflect in LICENSE filed as well.
>
>
> The LICENSE is set to ICU, which I take means "review manually". It consists
> of separate terms for different componetns that icu is made of.
>

Yes thanks, I guess thats reasonable.

> Alex

