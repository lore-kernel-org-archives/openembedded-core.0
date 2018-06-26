Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D7303745B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 23:10:04 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id j3-v6so51807pfh.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 16:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=gzAzMKsrm6/VJ6M+d/3ujwyuJUWNHfR0IClXrUaP4uk=;
	b=Tt7Db9TZRFaB4bvcSQqEz3Upbdsz9K176jCMFW5tN4GDslQBq3mvt5YJ1xXC/B/8a7
	Pw4vbXIdzeZIf0ONcAkFJbmc/RI/U8H9saH+zldCi7gcU/G0KYzm+0l30C8ZdMybX3WC
	grNz3JLrctn1q6yRrEgY4z7Nia05WpIdFeEiZko18H0HkfGA7ZvmDcYYsQTfScE59v9i
	W2JvHIAlaAUHhFl5Fjx1nmaJQ1lAj6kK2jEUzHedjCga/603Rd22oy7uZs/Xm1o3jFw6
	b+ANXppMY3CGHoo0SAlykju2bXBqkKWqEkifVwPXl0OGY8xPYT7pl7CBaGcDLhxv1lbK
	l/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=gzAzMKsrm6/VJ6M+d/3ujwyuJUWNHfR0IClXrUaP4uk=;
	b=ePW+N3zvWb3hQqlWZx7z/yTBheqorFjcJBte4UW55hVc+RmabeujThbSUXAerDAeWE
	YHr4hVs77jWWbRbGQRFXDFgWy1oc94ht2cPGQw+7r9LTHJSVym4OyqA4uxv+Z9XH9XnA
	tMVDTflaHVGvQ4kIbNFc9RSlNe2yoldFsG5ixDsOgXPpEROltGcsNe0EQE5ISKnsc6EX
	tOLf5pjPhYV2DsY90u/K8vUWae8nSPbrLEur0LabugLr3r9ilerL/iieI6LED8X2PiuS
	H9YvLi8VH0VGVgznQBklaXLZB07mVY1gpXFuApYoG1/WMG1ek+yr+ul7Un8G5zt0oHN+
	q9yA==
X-Gm-Message-State: APt69E3UD+QN6+D+Gw3IiiLUw8bmfczy75wdUrYRHTIAaX//hXbxgIw6
	XMz6fpDYsFi3Xl+TfAsPFbk0Qg==
X-Google-Smtp-Source: ADUXVKJV08Nc0eEXzJQGqWPkUlrMUdSsJCAOvTH8+t+ZuQW7Nn29aZTGeVSVZ+q/c/St+GoUDjDaRg==
X-Received: by 2002:a65:4a42:: with SMTP id
	a2-v6mr2995008pgu.367.1530054605876; 
	Tue, 26 Jun 2018 16:10:05 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:d981:fc82:1d49:d690?
	([2601:202:4000:1184:d981:fc82:1d49:d690])
	by smtp.gmail.com with ESMTPSA id
	4-v6sm6486264pfi.78.2018.06.26.16.10.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 16:10:05 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <CAEUSe78jgx_SYGcPc87F7F80UwDDnnr06sy6hB8K=ha=j8TG9A@mail.gmail.com>
	<3149f073-f524-d9ce-ad7e-e8a7c09e4dc1@gmail.com>
	<CAEUSe7-+VYOFA5X5fFR-=fsuzY_RREZ2V_myWTia=dDe7NkPZQ@mail.gmail.com>
	<CAEUSe7_AH1r9=g_HT-SYZXwyA3oWWxiJQ8z5GrYa31Uf21u0_A@mail.gmail.com>
	<11604122-a4df-e93c-6f34-baa7fe733723@gmail.com>
	<CAJ86T=WsQL-sH_Q75nhV_7U_68RENKeePTLQwPTqDZ7zwvHq6Q@mail.gmail.com>
	<CAEUSe7-NkJJR=ppBd5AoahaRygd4CrcbwgeLTo5VLcWXEiiX2w@mail.gmail.com>
	<3c778e17-bb7f-e934-e3ce-6f969defdac9@gmail.com>
	<CAJ86T=V+LjeDqJVug87__MTZT4=aovpij7Q680OD4ywjsGJVgQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e8cb7b00-f921-15dd-2705-0759d09fbb8c@gmail.com>
Date: Tue, 26 Jun 2018 16:10:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=V+LjeDqJVug87__MTZT4=aovpij7Q680OD4ywjsGJVgQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH 1/2] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Tue, 26 Jun 2018 23:10:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 06/26/2018 03:54 PM, Andre McCurdy wrote:
> On Tue, Jun 26, 2018 at 3:33 PM, akuster808 <akuster808@gmail.com> wrote:
>> On 06/18/2018 12:20 PM, Daniel Díaz wrote:
>>> On 11 June 2018 at 16:46, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>> On Mon, Jun 11, 2018 at 2:38 PM, akuster808 <akuster808@gmail.com> wrote:
>>>>> On 06/11/2018 10:30 AM, Daniel Díaz wrote:
>>>>>> Ping on this series for Morty.
>>>>> this is in the stable/morty-next branch which is on hold for the current
>>>>> morty QA.
>>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=stable/pyro-next&id=76ffc6b7e5ff6f2bab6e53bb07f52a25fcb81ac9
>>>> That's a link for stable/pyro-next.
>>>> The change doesn't seem to be in stable/morty-next though:
>>>>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stable/morty-next
>>> Is there anything from my side that needs to be done for this patch?
>> Nope. I have it in the stable/moryt mut branch and trying to address
>> build issues.
> Is there anything we can do to help with that?
Too early to know. thanks for the offer. This is my first opportunity to
re-run morty-nmut.
>  The delta between morty
> and stable/morty-nmut is only 6 patches (and only 5 between morty and
> stable/morty-mnut), so if these changes introduced the build issue it
> should be relatively easy to track down.
its not always the patches. we have newer OS to deal with, build burps etc.

I know later today how it goes.

regards,
Armin
>
>   89940cc libnl: fix CVE-2017-0553
>   dc6a0c4 staging.bbclass: use single quotes for path passed to file in is_elf()
>   bd2fd02 package.bbclass: Add '-b' option to file call in isELF
>   39c8e98 package.bbclass: use single quotes for path passed to file in isELF()
>   8a1b2b8 gdb: fix header ordering for TRAP_HWBKPT
>   c944c71 glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions


