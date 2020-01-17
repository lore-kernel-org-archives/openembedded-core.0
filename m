Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id A54A87FBFD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:39:21 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id w62so12332214pfw.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 10:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EV9ojxYAp9KV/wyr08crXdpBYf133YMVXn15qmuFnbA=;
	b=c8ntHyUsPBCo8mzRNJyuHtklvMd99gPupI90LrdiSFRvv0FESyxqvoq2L1oBsHeK2v
	ifJAKaLXo6QvWYrm6aU4stuzeWd3LlATVM279ZQ9taRnqj2Er5SAleSTEOl7454kue/z
	y88xA7Hya9ZI78TcJrnrUOoU3XEpVTKrb+C0AJuQSISuLK+DgVy572b8VzQGyFYmUy/B
	02IoUWLiOgzhs1N+FUqtb7SIMpv19P1i74vcUMXNgufYzmrzLbFHIezaIR3eZeGKhVpP
	APWMgv0mbCZCsRbEQTuyP4SDDbGjlF6lqt/D+pCOtfM/bp/TmaO+Ka7DNj92xvIWXGI2
	OFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=EV9ojxYAp9KV/wyr08crXdpBYf133YMVXn15qmuFnbA=;
	b=SJAUPIf8HvAOQZa3UaAZdLs7rjuT6xEIKrLL8OjKQfz7OVwx2QSad+C1zdYgivXnbO
	z2afp08sfpQ1smbbKgRrZuWr/OQvJ+6fxcrk0cHuItkcOTn5+dnoY2KmA77G4oSdGOb8
	+dbhO0Da10bOV9iXWGxyw68EaaqmWYB9IECl45eVFIjGZvg/P+Alj/E3ZpiwSSrwovPt
	zx8fpetbzDKzY+YNqRXe/c4tw9HmwaYOqoclowCAtHQz2XeoQq6KPSzppljHZ0p2sPva
	KR1QfzBcTON3pNWs5msYOPSLMEZNP60XX1raCTLlGdmKcmFtI9b2//mZ6SYoHH5SguA0
	P59A==
X-Gm-Message-State: APjAAAWiDWiPOQbs97VPcA3yYSgJMWYKD+wy44BNJoiKQClsLWjTQ0PZ
	jBh4R8uunUmmRhG/3kCRY5w=
X-Google-Smtp-Source: APXvYqyux2YO40/nH+C+Axky437cN/HKsl+u6WapHOHnWfTpGlQPHKIpTckmGlxaiWRbd/4lPBW6GQ==
X-Received: by 2002:a63:f04c:: with SMTP id s12mr46771154pgj.408.1579286362028;
	Fri, 17 Jan 2020 10:39:22 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:6d1f:200c:159c:4a81?
	([2601:646:9200:4e0:6d1f:200c:159c:4a81])
	by smtp.gmail.com with ESMTPSA id f1sm8122993pjq.31.2020.01.17.10.39.20
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 17 Jan 2020 10:39:21 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <886f1102228414559c078203bcde660cfc807d2f.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <f0bf0f91-b6a0-f22b-37a4-8d72daf8a2cd@gmail.com>
Date: Fri, 17 Jan 2020 10:39:20 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <886f1102228414559c078203bcde660cfc807d2f.camel@linuxfoundation.org>
Cc: "Orling, Timothy T" <timothy.t.orling@intel.com>
Subject: Re: Building older releases on modern distros (and vice versa)
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
X-List-Received-Date: Fri, 17 Jan 2020 18:39:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/17/20 9:59 AM, Richard Purdie wrote:
> We've been discussing how we could:
> 
> a) build old releases on newer distros
> 
> as well as
> 
> b) how we could build new releases on old distros.
> 
> Our proposed answer has been "buildtools-extended-tarball" which
> includes nativesdk-gcc.
> 
> We need b) so we can install this on Centos7 and stop having to work
> around its really old compiler. In general this should improve our
> ability to support stable branches in general.
> 
> I wanted to stress test a) a bit, partly to prove that b) could work
> longer term.
> 
> I did this by attempting to build buildtools-extended-tarball on pyro
> which has a gcc v6 and then using that to build morty on an Ubuntu
> 18.04 system.
> 
> It wasn't plain sailing, I had to:
> 
> * Upgrade the uninative in pyro
> * Switch to xz uninative to allow latest uninative to work
> * Patch binutils to fix an ld.so.conf relocation issue
> * Add an ld.so.conf to buildtools
> * Add the buildtools-extended-tarall recipe
> 
> Patches are in:
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/pyro
> 
> (some need forward porting to master)
> 
> Having got the output from the pyro build, in the morty build I added
> buildtools tarball to PATH before running the build. I had to disable
> uninative since it was going to get in the way and conflict:
> 

do we intend to generate extended buildtools tarballs for all releases 
if it works out well ?

> $ x86_64-buildtools-extended-nativesdk-standalone-2.3.4.sh
> 
> Extended Build tools installer version 2.3.4
> ============================================
> Enter target directory for SDK (default: /opt/poky/2.3.4): ./buildtools
> You are about to install the SDK to "/media/build1/poky-morty/buildtools". Proceed[Y/n]?
> Extracting SDK...............done
> Setting it up...done
> SDK has been successfully set up and is ready to be used.
> Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
>   $ . /media/build1/poky-morty/buildtools/environment-setup-x86_64-pokysdk-linux
> 
> 
> $ .  /media/build1/poky-morty/buildtools/environment-setup-x86_64-pokysdk-linux
> $ source oe-init-build-env
> $ mkdir classes
> $ touch classes/uninative.bbclas
> $ bitbake bash
> 
> 
> 
> 
> 
> 


