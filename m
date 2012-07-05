Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SmuNk-0007WF-Cb
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 00:18:40 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 05 Jul 2012 15:07:34 -0700
Received: by pbbro8 with SMTP id ro8so13142518pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 15:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=z1ZAZTC/hu/43XlghHNhY/zwYMCVjJR5Eeh65OAWVbU=;
	b=Yt9swrbVIvRgvImcAjndfw3jVX8GU0CEfnhTY4pbhF+iUZGdmJg8PrxTbyJ+HpPBl2
	7Nx+m9MlDfmLKVXZZj7SJwyU3fZL8u/7MEkEoBbHEAdcs+iatOFcvk1pQJe5GMGakimv
	8ZFNjwrz1Djp+gTtopncVNVWzQ+jqLfM+tvZYvU2P4w7i58ZRTVEWCSVln9EsnL5smZ1
	QwtbAnIYCglAj+r+r1E6q2qaAP/+CebmoG+iaoWXeIWAM2puiMvbpwHXTfaplT5fA0g9
	AGb19u/rEW5OMuFUpz4E/LZQkrzJul7ES+SBSe3Fwn0XNJNCik9clarDnhFcHAWt4f89
	B20g==
Received: by 10.68.223.164 with SMTP id qv4mr13501049pbc.20.1341526053019;
	Thu, 05 Jul 2012 15:07:33 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id pp2sm19734606pbb.1.2012.07.05.15.07.30
	(version=SSLv3 cipher=OTHER); Thu, 05 Jul 2012 15:07:32 -0700 (PDT)
Message-ID: <4FF6101C.1070104@intel.com>
Date: Thu, 05 Jul 2012 15:07:24 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1340682796-11569-1-git-send-email-b19537@freescale.com>
	<4FEC908A.3000205@linux.intel.com>
	<CAEsOVNerdO8m=0LHYUy8sn+6W=aOiEQS18vOQy8DYqWQeDxA+Q@mail.gmail.com>
	<4FF5F219.8000103@intel.com>
	<CAEsOVNf0s+QBs_NYiquUTU8zew052PKx6uEwUEwPBBHzbnVLUA@mail.gmail.com>
	<4FF60815.4040909@intel.com>
	<CAEsOVNeMe1CQEj4V6et+uUsEct0HEETLs6yFL03YteBQyywT_A@mail.gmail.com>
In-Reply-To: <CAEsOVNeMe1CQEj4V6et+uUsEct0HEETLs6yFL03YteBQyywT_A@mail.gmail.com>
X-Gm-Message-State: ALoCoQn6z8/52zjDey9U2+hMY3WNBjdq4BFpVaBm3fTBGCLOOXIunXh5+7uBrmlHJ+6ln9Tsk01q
Subject: Re: linux-dtb: add multi-dtb build support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2012 22:18:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2012 02:37 PM, McClintock Matthew-B29882 wrote:
> On Thu, Jul 5, 2012 at 4:33 PM, Scott Garman <scott.a.garman@intel.com> wrote:
>> On 07/05/2012 01:52 PM, McClintock Matthew-B29882 wrote:
>>>
>>> On Thu, Jul 5, 2012 at 2:59 PM, Scott Garman <scott.a.garman@intel.com>
>>> wrote:
>>>>
>>>> On 07/05/2012 11:29 AM, McClintock Matthew-B29882 wrote:
>>>>>
>>>>>
>>>>> Can we add this to denzil branch? (post 1.2.1 is fine) - I realize
>>>>> this is somewhat a new feature though but it would be helpful to have
>>>>> it in denzil.
>>>>
>>>>
>>>>
>>>> Ok, I've now created a contrib branch to start tracking changes for
>>>> 1.2.2,
>>>> and have included this commit:
>>>>
>>>>
>>>> http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next-1.2.2
>>>>
>>>> The usual caveats apply - I can rebase this branch at any time, etc.
>>>
>>>
>>> Are you missing a patch on this series? ChecksumError class does not
>>> exist...
>>>
>>> commit 2f009e5b?
>>
>>
>> What is the title of that commit? I'm not seeing it.
>
> $ git show 2f009e5b
> commit 2f009e5b1e4e0a4148ab7d5c60bf0e7a193faa2e
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Sun May 13 12:00:45 2012 +0000
>
>      bitbake/fetch2: Improve visibility of checksum warnings when
> fetching from mirrors
>
>      When fetching from mirrors, checksum errors would get buried in the
>      logs. This raises their profile so a warning is logged on the console
>      when fetcher checksum issues are encountered, even if other attempts
>      are made to get the file (which may or may not have the same issue).
>
>      (Bitbake rev: d43fafd7f01b5534499b45213197d8ccececdbc4)
>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Ok, this applies then to the poky-based tree, not the oe-core one.

I just tried merging this in but I get conflicts with one of Khem's 
patches. I'm leaving imminently for vacation so I will take a closer 
look at this early next week.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center




