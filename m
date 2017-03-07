Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id F210E7782F
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 15:58:12 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id a6so2906327lfa.0
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 07:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=9IiJi9ruZz1lSqblP/6ROxnIo14v73eA8VQmpRfPx2g=;
	b=jAfFvQ1PS4lDyu6KijOwc6zPYdJYkKZp+FV17zVPy2WfW/Kfur0l9nvYstcROjagfC
	1RsYo/lUoF1l83MyLil47/CatiLV+7j1fG+Eg8AId2lOvJqR532M303L/zUdDtxv6bqv
	9uH0vhpmTs2MQ594Cge4QWLkLJtCutG6rYGS2rQmPmss+ruArcGrG3wTW5O7zg737RuT
	Jy+hL2Z7bpQYsO/MCzXmGXm3dP68sijw7cvBBEoLDWohS2qTKRiGrJcwjfFTuFAFVr6q
	2Nio6+v2z2EDfEFPLyj89wzt5TwyUgpg0WTeNSKX10g1djRSJyQzc2k48wZbc0bykONa
	rV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=9IiJi9ruZz1lSqblP/6ROxnIo14v73eA8VQmpRfPx2g=;
	b=bNdFQREBLea/GblN54gJLI0rYEa07ChHhrxOZMlzWwq2b9SBfc2xqPZXmgMp2bM3tC
	uEobZ9EvJxKSq5IOoWVFc1SuGG11liRNeCwTIXhoQP6HQ1bGTvMJ80wke1MTonAThJT5
	eXxjKJpMQb0BDRp9Rh+ALGOeyTquXNHw/cOhyPOJ08uQTl7U8Snep/soDpA5Jv76aoak
	b2eSrJVRJgdu6DhBsVe6Gj9tCsN+M23/htrnXyaxU3bmzU4lB7heoBbSe4R+3lltgIWC
	W3ZgFaGmYLWFug4jtDY6Y5yOD+BsfZAsGMA0+/kHV78Bu3By74UV4jFd57oEWJOTFrm9
	UG/g==
X-Gm-Message-State: AMke39kyGfMmvSvcX0dJxFn0G3K/6guV3NCAxMtRH9WMugvTvIXncu8JT+sAb0iMVlUbvQ==
X-Received: by 10.46.78.1 with SMTP id c1mr361330ljb.77.1488902293114;
	Tue, 07 Mar 2017 07:58:13 -0800 (PST)
Received: from [10.20.41.60] ([77.88.92.6])
	by smtp.googlemail.com with ESMTPSA id
	o5sm69068lfo.35.2017.03.07.07.58.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Mar 2017 07:58:12 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <502e675a-bdaa-3acd-5343-5cb2f40f2a7a@mender.io>
	<CAHiDW_HwmNybt8AuLWBtMSW=8R1SO3GBChRmwtCkWkmq3bFB0g@mail.gmail.com>
	<44423ebc-3760-3da5-2cc0-45a95f62ac7c@mender.io>
	<CAMKF1soHSjdEKaOomKaXfVWqF-xY1h+Cxeuhv5ivNMZV-z02_g@mail.gmail.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <cc22a650-9b6d-4063-97ac-940157681403@mender.io>
Date: Tue, 7 Mar 2017 16:58:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soHSjdEKaOomKaXfVWqF-xY1h+Cxeuhv5ivNMZV-z02_g@mail.gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: Recipe specific sysroots: New failure to compile Go
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
X-List-Received-Date: Tue, 07 Mar 2017 15:58:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 28/02/17 19:59, Khem Raj wrote:
> On Tue, Jan 24, 2017 at 3:34 AM, Kristian Amlie
> <kristian.amlie@mender.io> wrote:
>> On 24/01/17 11:17, Jussi Kukkonen wrote:
>>> On 24 January 2017 at 11:36, Kristian Amlie <kristian.amlie@mender.io
>>> <mailto:kristian.amlie@mender.io>> wrote:
>>> [snip]
>>>
>>>     /home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-native-1.4.3/pkg/tool/linux_amd64/6l:
>>>     readsym out of sync
>>>     | WARNING: exit code 2 from a shell command.
>>>     | ERROR: Function failed: do_compile (log file is located at
>>>     /home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/temp/log.do_compile.10566)
>>>     ERROR: Task
>>>     (virtual:native:/home/jenkins/workspace/yoctobuild/oe-meta-go/recipes-devtools/go/go_1.7.4.bb:do_compile)
>>>     failed with exit code '1'
>>>     -----------------------------------------------
>>>
>>>     Note in particular the "readsym out of sync", which appears to be the
>>>     heart of the problem.
>>>
>>>     Using git bisect I have verified that it is the commit
>>>     9107d6ca144ac1f6169830dee25dae2dad775333, the introduction of recipe
>>>     specific sysroots, that breaks the build. However, I cannot see an
>>>     obvious link between the two, the error looks very internal to Go. Any
>>>     clue what's going on?
>>>
>>>
>>> This could be a symptom of a missing dependency in the go (or
>>> go-bootstrap) recipe: the recipe specific sysroot only contains the
>>> specified build dependencies unlike the previous system where the
>>> sysroot typically contained loads of other things as well.
>>
>> Probably. I've been looking at the dependencies for gcc-cross, which
>> should be similar, but no luck so far.
>>
> did you get to bottom of this issue ?

Yes, it was fixed by these two commits in poky and oe-meta-go, respectively:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=2313a77d8474c742e1cd8cee246f6c05847dd3c6

https://github.com/mem/oe-meta-go/commit/fc6d8ac2951aa4548c2e1c67d1f3437eb2a8981f

-- 
Kristian

