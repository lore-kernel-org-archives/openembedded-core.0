Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id DE2A47890C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 13:39:39 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id m69-v6so3251157lfe.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2018 05:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kkAHvq178pV/xDl7Jal9iJXC+lsFBEqqEzTk0WVDJ1c=;
	b=nOTj7tnBgP0MxIQoTOfBupy5U76FKVOkOWnXYnsEUPKdJT27D6iXo7txeO12ig1owj
	Dg0q0TJZ9hPQ7h6WqX6qZu9rQ0k8X/CJmStKXYg+ASNtPGPWqR08j2iLdRVsyxbT1wl+
	UbSWG86DTU5FDdm7fOX4c7GgV/bY8CXghjB9E3Wx+JHwIeRwaH/+l8f0Cu2hy7CExoxZ
	MTk4+aDM8+LAmsOLcP4iyoHzB7dF2Qr6CHhBgdzZK6naBMlCpS35dXqWuqhH7HQvZIYG
	lcANQsfksqGqYQtqaC7kplw2bJ8C/gujPixqCewhU23CEkZquvznc48sY8vakNU6T1EC
	t+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kkAHvq178pV/xDl7Jal9iJXC+lsFBEqqEzTk0WVDJ1c=;
	b=pYGVpZkauAvd7LnntmuPJtqnNWG9V9AHyZvs3O1WhO6rnTs1MHK9Uu4VoQiq6miVom
	wpqD5xKvFtdNYMb7TbiqpMPMXiqPTYA5NKRbvfvbjbUyo3f2u88qWjc61VwPtoeMPWcm
	vhb/Ji9ROwavA9zjrdceRoutN48XtXa0xK8ebRrHouQykJZ4fSVIZM1rFroZRQL/aYHJ
	8j047Y5bOmpnF2kIvxUPcCT2v3mGTPRJo2CDyZ5tcgErkgmh5y65LLlwvH7Sq6jkaBOX
	A0QjnfQ6Ug3/wj3sHfgTCmOq42o5Va2cozbrXNEPA2qR591y69DFPR3gBBAn8Rg36R38
	3neQ==
X-Gm-Message-State: AElRT7H6AyL1xZnMsT4cg9tQaN5IGiMx8AlLWZ/d3qyXW6mOkt2HYLQe
	ILA2RlgytUa/qcvtGiocH/OHs1t1QfKLSRpldAI=
X-Google-Smtp-Source: AG47ELthZGw8ndSWWhXBTMADfejyEPV22Oej6DjfnhUlsc2uUr7fqQvBc6Tuf2Y2qauJyernapJ0aUqwOLG5y1vBueU=
X-Received: by 10.46.20.30 with SMTP id u30mr16438225ljd.12.1520429980192;
	Wed, 07 Mar 2018 05:39:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Wed, 7 Mar 2018 05:39:39 -0800 (PST)
In-Reply-To: <CAJTo0Lahsa_Bnzuw2yXQypkfk+qSVxmuPP1YAJUKw5euzocL4w@mail.gmail.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
	<f5971af169fa67412a2d66f3ba1e1596ea439ca7.1520359364.git.bruce.ashfield@windriver.com>
	<CAJTo0Lahsa_Bnzuw2yXQypkfk+qSVxmuPP1YAJUKw5euzocL4w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Mar 2018 08:39:39 -0500
Message-ID: <CADkTA4N=mX__4a9ZpMXvL0uj1sOkLYMA1UTh3=gUWGkpeQXGew@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] linux-yocto: aufs and systemtap
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
X-List-Received-Date: Wed, 07 Mar 2018 13:39:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 7, 2018 at 3:38 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 6 March 2018 at 18:11, Bruce Ashfield <bruce.ashfield@windriver.com>
> wrote:
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
>> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
>> index ae9e7691367d..1ccbf6283e43 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
>> @@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.14.24"
>>  KMETA = "kernel-meta"
>>  KCONF_BSP_AUDIT_LEVEL = "2"
>>
>> -SRCREV_machine ?= "fccf7693fe5dd00d7b6d391b7405b5d58eb959f2"
>> -SRCREV_meta ?= "426c8aa4862f95e84ec163b942b92726d3ef978f"
>> +SRCREV_machine ?= "09828ddd8d8c91b2d68afdcd8eb99a48e0253582"
>> +SRCREV_meta ?= "54b3e9b768651ca15bf65ae1c72dfe6d957285f0"
>
>
> ERROR: linux-yocto-tiny-4.14.24+gitAUTOINC+54b3e9b768_09828ddd8d-r0
> do_fetch: Fetcher failure: Unable to find revision
> 09828ddd8d8c91b2d68afdcd8eb99a48e0253582 in branch
> v4.14/standard/tiny/common-pc even from upstream
> ERROR: linux-yocto-tiny-4.14.24+gitAUTOINC+54b3e9b768_09828ddd8d-r0
> do_fetch: Fetcher failure for URL:
> 'git://git.yoctoproject.org/linux-yocto.git;branch=v4.14/standard/tiny/common-pc;name=machine'.
> Unable to fetch URL from any source.
> ERROR: linux-yocto-tiny-4.14.24+gitAUTOINC+54b3e9b768_09828ddd8d-r0
> do_fetch: Function failed: base_do_fetch

Interesting. I'll see what script has gone insane and re-submit a v2.

Bruce

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

