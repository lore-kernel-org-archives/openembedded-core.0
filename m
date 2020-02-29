Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8137C61A4E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 15:12:06 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id l7so3298409pff.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 07:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fqK6e5oqNwVoBfUfpIRg0YnIIt/fohF/DjVuETqNz5s=;
	b=Q8+sYhO95vusU/Q1h/HokVQV65loaIgOlyQk4RSOmWYxRq2LL2H7nXW7iZGitu/orr
	u5XICxVxsnnkNmPnf3j/kw53fcqrjM9zt/vlWnKFTNbHz8cJrK9HgodZXDGFEombJPnS
	pxOwcFJrawwV10q776s8D4VVH/AqOJ9VHtUaVOI9893lVf70yQh+cndTG3Kv2y9ExXpf
	uBwesNxKgBCc6qU9c74fi9F7hTic0yNWBLDLheBeyuhTh9rRfP0vQYTf4Vuz84dlD97b
	+g4dXhWK5RL87Rbdhn/TV0O2ZBEpXHWcJFjVY23X+7b0lUx/EJwN0eyV4aIrR9ZIvLJD
	HC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fqK6e5oqNwVoBfUfpIRg0YnIIt/fohF/DjVuETqNz5s=;
	b=KVFIW5TQvUf6PCtf4M1Ew3Q3OqI0mlnT53bJEXtZM9RTsF0rteT9kbO/awQirSi5RB
	O91OIIG9Yl0a5GOmsFafInje7bVMW1g5Ik0OHioB9nO7G34nb189gedtVcQU3yUl1wXR
	aErYxd/tu+kniZFEduDda9D3Xb9yUAcBZNoG4I6VOowTYNi3pV8i/CsDycpTFi4RKFyr
	8XPcO+niPv05GyjFEpQ4d03MbiJT92Z4XHk7sKjdUbddoIe9i9nnzzoeujHixecfzJzj
	hlV8NU6Pr8OUJPKGiivSJxVxeIIqwFpaF8NM6cp9f8Nj1FK9r5W9qZFeUFZV7Vu7ePQZ
	7dzA==
X-Gm-Message-State: APjAAAVsxK19kNJEcTDp8sFGjb1VCWsR7cM0y1Xqx0CJ0eupxDd0o4Zd
	u/cs20sAEfxUA47WjpZWVZHdydsi9ks=
X-Google-Smtp-Source: APXvYqzgAnzwQYyrVh/ntCy6IQgpGbgItlcSyaQf3TaLawd6Ux88Wn8702avueO6AUZjOj7PvL7kOg==
X-Received: by 2002:aa7:991d:: with SMTP id z29mr9668344pff.35.1582989127062; 
	Sat, 29 Feb 2020 07:12:07 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:8446:2edf:6d4c:9a00?
	([2601:646:9200:4e0:8446:2edf:6d4c:9a00])
	by smtp.gmail.com with ESMTPSA id
	c26sm15660207pfj.8.2020.02.29.07.12.06
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 29 Feb 2020 07:12:06 -0800 (PST)
To: Petr Vorel <petr.vorel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20200228175731.10604-1-petr.vorel@gmail.com>
	<e64730b1908726a7e8ca4dd5e27b0f7567dd0a57.camel@linuxfoundation.org>
	<20200229064656.GA4045619@x230>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <0147f807-be3c-27e0-e05c-73ac0311045e@gmail.com>
Date: Sat, 29 Feb 2020 07:12:05 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200229064656.GA4045619@x230>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Sat, 29 Feb 2020 15:12:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/28/20 10:46 PM, Petr Vorel wrote:
> Hi Richard, Khem,
> 
>>> Changes v4->v5:
>>> * Put back 0002-kernel-controllers-Link-with-libfts-explicitly-on-
>>> mu.patch
>>> as it still needed on MUSL (although it should not be needed,
>>> strange).
>>> Reported by Anuj Mittal
> 
>> I'm sorry to say that this still isn't quite right for musl:
> 
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1634
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1630
> 
>> Still having the fts issue :(
> OK, step1b is still problematic:
> /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20200120-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/9.2.0/ld: /usr/src/debug/ltp/20200120-r0/git/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c:3224: undefined reference to `fts_read'
> /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20200120-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/9.2.0/ld: /usr/src/debug/ltp/20200120-r0/git/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c:3224: undefined reference to `fts_read'
> /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20200120-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/9.2.0/ld: /usr/src/debug/ltp/20200120-r0/git/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c:3269: undefined reference to `fts_close'
> /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20200120-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/9.2.0/ld: /usr/src/debug/ltp/20200120-r0/git/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c:3277: undefined reference to `fts_close'
> 
> At least we know, that once we solve this problem, we can remove
> 0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
> 
> Please, how to reproduce this build locally? Is it:
> . oe-init-build-env
> TCLIBC=musl bitbake ltp
> 
> Or do I need to put something into config files conf/local.conf
> or conf/bblayers.conf ?
> 
> I need to double check if musl-fts is really built and whether the order of
> -lfts is correct. But all this has been solved even for static build for Buildroot,
> so I guess it's some issue related to openembedded. Unfortunately, I'm not much
> experienced in openembedded (stepped in, because nobody else has updated LTP
> package yet).
> 
> Khem, any idea, what can be wrong?

I have added -lfts to LIBS and sent v6 of this patch

> 
> Kind regards,
> Petr
> 

