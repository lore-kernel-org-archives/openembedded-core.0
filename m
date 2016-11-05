Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id E0AF271C26
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Nov 2016 00:04:25 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so9224405pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 17:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=liNvvwxEdgpOmCkSRIsNocdR9+yfZbxV+MQNSOdMl8c=;
	b=ZQlf6I214PoTUAT17lcxZbPymoYJ7fsefXePjB0bascOEEGXGbjnaHwzB6ygZjfmtl
	QzRPL/CHoB9z0nC4ONXnNg38ODpPGefj19NgW43KHUmfn0czSC8KnCDgw0SshE3BO9xx
	18bMWjqRgmq87gM7da1GnPJbzG6KcDxZsnA5dmv/JvWJLXfW2Fai4aJ8y3lkl+UJDD7N
	ANSgxFtJ6sDuing5cWYYR+mk/qiZkXoAEr3WhuBAnpT78hqP8az11cyNOqNjhwhrsgiv
	r35Kz410/MLyYXAAgOQwJY8SpJAZFRu/RchdiarhU36Qu0Z3cP3JUhV8Toy4IHKd5Llq
	FYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=liNvvwxEdgpOmCkSRIsNocdR9+yfZbxV+MQNSOdMl8c=;
	b=jOiJeEk6Por6LEsLIGCSB6yHNUIc+8h4ormcU5MlH+oMO1sfzONbSvUk6XR/1bgKGk
	EZoPuBij7OAXK9R8s4kt4oXKG90RtuioDsZYWcb/wnSS/9b1e1ANgoZXyCxD7fHecCxL
	jPdM+zxSxPOdoSjJ7AA40a9uM+yH9/bDhBb8WgVTQighrDN4flp8aUJ/crfnqtn7xMBU
	lMWL3jSnUtrKaObEjx/rPy7Fll+Ng6OtxxuWPhenNW9BVvJL+QpgfXrtJmZ0tRs082G6
	ljl1V964FDebuALGElbvz1RArafnJZDfUwfX0pdS4sYZJsa1APW073l2SRYYopCkjNVP
	0LFg==
X-Gm-Message-State: ABUngvfMsfMYlGZ0s0+q+iTZVx2zvaEIonXomrWfMnQqayFFp+mscsq9m6QQW7aOSOOt/Q==
X-Received: by 10.99.176.7 with SMTP id h7mr25826652pgf.170.1478304267332;
	Fri, 04 Nov 2016 17:04:27 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:e83e:7662:2fe9:93ef])
	by smtp.gmail.com with ESMTPSA id
	rx1sm22874671pab.32.2016.11.04.17.04.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Nov 2016 17:04:26 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>, Koen Kooi <koen.kooi@linaro.org>
References: <1476952202-8842-1-git-send-email-koen.kooi@linaro.org>
	<CAJTo0LaC2t1BN9VpKRx4W7fMT88mDdmCBYhzgBgvsdDJXhNk_w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <d1bde394-d86a-518d-ea44-68c4fbe788e3@gmail.com>
Date: Fri, 4 Nov 2016 17:04:25 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaC2t1BN9VpKRx4W7fMT88mDdmCBYhzgBgvsdDJXhNk_w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk
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
X-List-Received-Date: Sat, 05 Nov 2016 00:04:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 10/20/16 4:05 AM, Burton, Ross wrote:
> 
> On 20 October 2016 at 09:30, Koen Kooi <koen.kooi@linaro.org
> <mailto:koen.kooi@linaro.org>> wrote:
> 
>     +BBCLASSEXTEND = "native nativesdk"
> 
> 
> The native form fails on Debian stable hosts:
> 
> | make[2]: Entering directory
> '/data/poky-master/tmp-glibc/work/x86_64-linux/libbsd-native/0.8.3-r0/build/src'
> | ../x86_64-linux-libtool  --tag=CC   --mode=compile gcc  -DHAVE_CONFIG_H  
> -I.. -isystem ../../libbsd-0.8.3/include/bsd/ -include ../config.h
> -DLIBBSD_OVERLAY -DLIBBSD_DISABLE_DEPRECATED -D__REENTRANT
> -isystem/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/include
>  -isystem/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/include -O2
> -pipe -c -o getentropy.lo ../../libbsd-0.8.3/src/getentropy.c
> | x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I.. -isystem
> ../../libbsd-0.8.3/include/bsd/ -include ../config.h -DLIBBSD_OVERLAY
> -DLIBBSD_DISABLE_DEPRECATED -D__REENTRANT
> -isystem/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/include
> -isystem/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/include -O2
> -pipe -c ../../libbsd-0.8.3/src/getentropy.c  -fPIC -DPIC -o .libs/getentropy.o
> | In file included from /usr/include/x86_64-linux-gnu/sys/syscall.h:31:0,
> |                  from ../../libbsd-0.8.3/src/getentropy_linux.c:29,
> |                  from ../../libbsd-0.8.3/src/getentropy.c:28:
> | ../../libbsd-0.8.3/src/getentropy_linux.c: In function ‘getentropy_getrandom’:
> | ../../libbsd-0.8.3/src/getentropy_linux.c:203:17: error: ‘__NR_getrandom’
> undeclared (first use in this function)
> |    ret = syscall(SYS_getrandom, buf, len, 0);
> |                  ^
> | ../../libbsd-0.8.3/src/getentropy_linux.c:203:17: note: each undeclared
> identifier is reported only once for each function it appears in
> 
> It's not wrong - there's no actual definition of __NR_getrandom in
> /usr/include here.


Do you have libbsd pre-installed on your build system ?

> 
> Ross
> 
> 

