Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TE2Cm-0007ZZ-Hy
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 20:07:28 +0200
Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 18 Sep 2012 10:54:46 -0700
Received: by pbcwy7 with SMTP id wy7so464981pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 10:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=na/TuvwNp4EZ6oz0hlyx/1i9Qms4fUg+Ap+seHFFrwg=;
	b=YD7AoZPZdylWlWmEW6TzXSvqLa5l1OZl6fWQNvY+qoACsVlFuCxzH5Jylo09RyOCEK
	xvnWENdXkeESMuycWXui7FSMuqBglVXUFFFP2g/DNGdVsusZSsWIj45Gb6IDLejzZ7eQ
	qlqkmr/fqM9mAleEqewp6/dckEcc92KfI19GsNtJ+kktElWjWoNShoQ9GizGge6Mx71N
	AiHV1LGzxVaIbqrdMuEOS0q9EIuD10d2F4ox5xlckjQVZhMF49fjSDtlTGw7wCuHZDMK
	KBovmA2wLwGlqh8hhpux9Yi4bf1ztzNqAkKV9hr4RXMwpn/zNMMh1Vt5OkgIFNXqfE/N
	YzhQ==
Received: by 10.68.240.7 with SMTP id vw7mr758962pbc.152.1347990886308;
	Tue, 18 Sep 2012 10:54:46 -0700 (PDT)
Received: from [10.1.10.30] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id qb6sm319740pbb.18.2012.09.18.10.54.42
	(version=SSLv3 cipher=OTHER); Tue, 18 Sep 2012 10:54:45 -0700 (PDT)
Message-ID: <5058A3D2.5010106@intel.com>
Date: Tue, 18 Sep 2012 09:39:46 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1347457260-25574-1-git-send-email-mark.asselstine@windriver.com>
	<5050D255.9030401@linux.intel.com>
	<32086337.ec4RMj2Chr@yow-masselst-d1>
In-Reply-To: <32086337.ec4RMj2Chr@yow-masselst-d1>
X-Gm-Message-State: ALoCoQn+4aLb8fBbKKSUp39NwIxIlkjCD4oPIWgm0cloH1rNkTNmt5j+/GYmPjpmrWnExxRUwYUR
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: remove unused 'etc' directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 18:07:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2012 12:35 PM, Mark Asselstine wrote:
> On September 12, 2012 11:20:05 Saul Wold wrote:
>> I assume this patch is for Denzil?  It seems that the current OE-Core
>> master has etc in that list.
>>
>> Please confirm
>>
>> Sau!
>
> Saul,
>
> Sorry I got mixed up on my branches there and didn't notice your change,
> thanks for straightening me out. Scott any chance we can get Saul's commit
> 963742f5a9bc [kernel: Fix packaging issue] cherry-picked to Denzil?
>
> Mark

Hi Mark,

Yes, I have just pulled that into my sgarman/denzil-next branches, to be 
queued up for Autobuilder testing ASAP.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


