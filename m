Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Smtqp-0006eO-DF
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 23:44:39 +0200
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 05 Jul 2012 14:33:33 -0700
Received: by yenq6 with SMTP id q6so7478299yen.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 14:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=WrOBbaZgKn7cC1pmTm4IqROYrx66LE+A0ZG7o0Krmis=;
	b=S9fVfeiBh6+AX0On7+/xbCw+3r/YMY1ItH9a80zcfSOvhdK+zHYWkzrht6R24cViQ+
	6xfUexP7P+WMxDytzeHXAe7UWo1u1xT4DJboeCbX8H5lGeGd4A6qaGeROuqrIDoKEvyf
	NPVToksfkqnS8nT+0+0aVEUNOy1mengKyXqezJxyz2AgHO4cNQrvgN8ESIpkMPWenHno
	O3qmtTtQXuaiHWgmgyJJezls1dmP6kKP57eUY+qC1m2wHjfWISuqB9DUylc+XClh6xxs
	V6GEUVqV8yG4YJMFtDXp2fe/oklVTPZxg70keJJAwMQbEjugRr/MAWKhNiMTv1+wF91q
	rHPQ==
Received: by 10.66.74.3 with SMTP id p3mr40059099pav.49.1341524011782;
	Thu, 05 Jul 2012 14:33:31 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id gj8sm20451715pbc.39.2012.07.05.14.33.29
	(version=SSLv3 cipher=OTHER); Thu, 05 Jul 2012 14:33:30 -0700 (PDT)
Message-ID: <4FF60815.4040909@intel.com>
Date: Thu, 05 Jul 2012 14:33:09 -0700
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
In-Reply-To: <CAEsOVNf0s+QBs_NYiquUTU8zew052PKx6uEwUEwPBBHzbnVLUA@mail.gmail.com>
X-Gm-Message-State: ALoCoQkMfVwgYPeD/F/ATb/yUyy9tMpJrW/Y3+KctxJUx5nFgIlrmlQX6sphELatCVbFiJIPKUyw
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
X-List-Received-Date: Thu, 05 Jul 2012 21:44:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2012 01:52 PM, McClintock Matthew-B29882 wrote:
> On Thu, Jul 5, 2012 at 2:59 PM, Scott Garman <scott.a.garman@intel.com> wrote:
>> On 07/05/2012 11:29 AM, McClintock Matthew-B29882 wrote:
>>>
>>> Can we add this to denzil branch? (post 1.2.1 is fine) - I realize
>>> this is somewhat a new feature though but it would be helpful to have
>>> it in denzil.
>>
>>
>> Ok, I've now created a contrib branch to start tracking changes for 1.2.2,
>> and have included this commit:
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next-1.2.2
>>
>> The usual caveats apply - I can rebase this branch at any time, etc.
>
> Are you missing a patch on this series? ChecksumError class does not exist...
>
> commit 2f009e5b?

What is the title of that commit? I'm not seeing it.

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center




