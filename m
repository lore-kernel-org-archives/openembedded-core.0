Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id E638B6E660
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 19:42:43 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id j59so113679874uaj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 12:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=XkLoK0neSLh8f/m4DKj8GpRXdZiOZNQ6PMLGGACdj2I=;
	b=s3YUe3N85iGoHWvsbwjVL8SXGupI5/J7DaGkLez7x2Bt8gTFICFJ25DEMSqNTf1beo
	yh3+yyrGDsEk5I2b7OZ7ocHjGOEHFnaDkxj8B/SuzZh5CCshEG6AGQLQpxkQzx6TAOnC
	z8s0IIUJwUL8f7973WWyNNffmi5aDFsy3HeZhn3tig7wv6DWDmhA2IO8AnuOYpC5HX0T
	5/GEqE2dL5Fisqpmj+1a+F3RqFNO4AseiVhrLB6AvFIlGakVbhGHvkLwKer7bhxMW5Jl
	H47vzyOXvQ9rCRdSFppj30543DM5v0Wx3MwAHdknfWQ8uiuO8yXiMk+mBi2XZu2l8k5f
	tZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=XkLoK0neSLh8f/m4DKj8GpRXdZiOZNQ6PMLGGACdj2I=;
	b=cyh3RCLnybwH/FD0fhFw4WlXQ1H0RZC978C+QCH+o9j9u37dP2V+kE4ZdmnoAZcvLO
	h0l6M9mleFPVS2SMVNAwDowATiMNa5StJjlGohwPGoUfQruPqk9bSbx7TVhQ8G7URn7e
	S+AeiwasF+ttXxV1sGsQ0h/2yzuElMLTIcoSFkBmX9XJ4kwjHtCRg2yhXQd/LbmxfrR4
	2vaJnG/39rrdl9w2GfIxaY4Ai0GLkTVTDq9GoJk6qyaCPd3UeevSIpV2RH/HlwhbgoZg
	vmatzVDEmR27YQgZCrM2uekYrH0lNW/2yazLezRIEpBN6EdcpiMRiGCxhvluzfBZbJZP
	UYnA==
X-Gm-Message-State: AEkoouupwqH8uaKq95fwqkvXviW/OG4B/vTAO+0TO4paXLHTTdAHdJP8Inww8J+UuTe+WQ==
X-Received: by 10.176.6.9 with SMTP id f9mr24102180uaf.89.1470080564171;
	Mon, 01 Aug 2016 12:42:44 -0700 (PDT)
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com.
	[209.85.213.45]) by smtp.gmail.com with ESMTPSA id
	o75sm5540205vkc.23.2016.08.01.12.42.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Aug 2016 12:42:43 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f45.google.com with SMTP id n129so106502621vke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 12:42:43 -0700 (PDT)
X-Received: by 10.31.161.81 with SMTP id k78mr27241336vke.122.1470080562064;
	Mon, 01 Aug 2016 12:42:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.138.78 with HTTP; Mon, 1 Aug 2016 12:42:40 -0700 (PDT)
In-Reply-To: <724fa3d2-1c27-a315-54da-02934bf062f2@gravedo.de>
References: <7603e18c-345c-ddcf-cd95-14df64b60077@gravedo.de>
	<CADkTA4Ng8BoOou9UiS_dh8+x=Z2_1OJYPiWYkkD2cD3MHk0pxA@mail.gmail.com>
	<724fa3d2-1c27-a315-54da-02934bf062f2@gravedo.de>
Date: Mon, 1 Aug 2016 16:42:40 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrsuE54Yn7n7vk2KVuV21t+wDgaS_NXj817tPHp3ZkFYA@mail.gmail.com>
Message-ID: <CAP9ODKrsuE54Yn7n7vk2KVuV21t+wDgaS_NXj817tPHp3ZkFYA@mail.gmail.com>
To: Simon Fels <morphis@gravedo.de>
Cc: Yocto Project Discussion <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Snaps on Yocto/OpenEmbedded
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
X-List-Received-Date: Mon, 01 Aug 2016 19:42:46 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 1, 2016 at 4:14 PM, Simon Fels <morphis@gravedo.de> wrote:
> On 01.08.2016 16:06, Bruce Ashfield wrote:
>>
>>
>> On Mon, Aug 1, 2016 at 7:32 AM, Simon Fels <morphis@gravedo.de
>> <mailto:morphis@gravedo.de>> wrote:
>>
>>     Hey everyone,
>>
>>     I've worked on a new layer recently which brings snaps to any
>>     Yocto/OpenEmbedded based system.
>>
>>     If you have never heard about snaps yet you will find most details at
>>     http://snapcraft.io/ but generally snaps are a new packaging format made
>>     with security and fast updates in mind and allows applications to be
>>     packaged once but run everywhere no matter of the distribution used or a
>>     particular device type.
>>
>>     The layer is currently named meta-snappy and is available at
>>     https://github.com/morphis/meta-snappy
>>
>>
>> I had a quick browse this morning, and one question that jumped to mind was
>> if the oe-meta-go layer was causing problems for go/go-cross support ? I was
>> carrying some go/go-inc changes in meta-virtualization as well, but recent reports
>> are that oe-meta-go should work for everything now.
>>
>> I'm just asking, since it doesn't make sense for meta-virt or other layers to
>> continue to carry go build infrastructure when it could be unified.
> When I started to put meta-snappy together I ran into different problems
> with oe-meta-go and then reused what you put into meta-virt. I have the
> point on my TODO list to check if we can just switch to oe-meta-go
> rather than shipping go-cross on our own.

The meta-golang seems to be the most up to date one. Likely the best
one to try to converge as a single place for go-cross provider.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

