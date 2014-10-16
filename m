Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 34B0E60DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 18:38:52 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id rd3so3942970pab.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 11:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=V157cLMFzRJQDM++irqc9pBkuKozSKE5yy0a33Fr1Wc=;
	b=hFH6eHgVaCbgGZ6vZCKUobkmmWa0UoJ7NMhf5pmf0YW3fDrSU9QMT0ifMd9YFTB3ba
	Gl4hjPDGBTlquzwfdZfcJO0eTo3Fc4fB5E7fv4qIX0g6farkNNXWcC1MYG7+J2XzbxWY
	dsCAhTR+purX43yFNa/1VQfONqpqLYg6Ptya2OcU6YSs3258ashPHHW9CK6ke9TKVeNc
	KiXB48h1oxY9BaO8CUktJD0+2UNC8cL/jCPgQg3LMn5iMl/GogcJ+8G7XY9OJ1JRMFml
	ibZAdObOoJ3r8P3VHJ6VHhhJ7KNkBz/4tViigLFogRKcye/19UdHD28m2C3XzN/9OqzC
	ug6A==
X-Received: by 10.66.124.136 with SMTP id mi8mr3078482pab.105.1413484734277;
	Thu, 16 Oct 2014 11:38:54 -0700 (PDT)
Received: from [192.168.18.12] (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	wr8sm20344735pbc.52.2014.10.16.11.38.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Oct 2014 11:38:52 -0700 (PDT)
Message-ID: <544010BA.8060808@gmail.com>
Date: Thu, 16 Oct 2014 11:38:50 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	"Burton, Ross" <ross.burton@intel.com>
References: <3230301C09DEF9499B442BBE162C5E482576880D@SESTOEX04.enea.se>	<CAJTo0La=7QNS53qZDgShj+9yr6Ge0hyk9HFAdS+Ue0bZAkck4A@mail.gmail.com>	<CAJTo0La9iMQ4ZiSuTFo35271c2McpzkSvugOEqL6dBNoncdkZQ@mail.gmail.com>	<CAJTo0LYNjC6knwruug3cNP6DTwYGvBzDAxgseUnaVWRx0d+Y0g@mail.gmail.com>
	<CAP9ODKrgD2WDQFd=-xPw6NvV-W-CLkVhzXMH_jAmES7z83JOXw@mail.gmail.com>
In-Reply-To: <CAP9ODKrgD2WDQFd=-xPw6NvV-W-CLkVhzXMH_jAmES7z83JOXw@mail.gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Truly scary SSL 3.0 vuln to be revealed soon:
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
X-List-Received-Date: Thu, 16 Oct 2014 18:38:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/2014 11:27 AM, Otavio Salvador wrote:
> On Thu, Oct 16, 2014 at 1:45 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 15 October 2014 16:31, Burton, Ross <ross.burton@intel.com> wrote:
>>> There's a openssl 1.0.1j out now (fixing FOUR (!) CVEs, including
>>> "disabling SSLv3 didn't work"...).  I think considering the situation
>>> we'd take the upgrade for dizzy, even though we've frozen.  Anyone
>>> volunteering to take lead of upgrading dizzy to 1.0.1j and backporting
>>> the relevant patches to the previous releases? (eg daisy is on
>>> 1.0.1g).
>>
>> For anyone else interested, I've currently got 1.0.1j patches for
>> dizzy in testing.  There's been debate over whether we backport the
>> fixes to daisy's 1.0.1g, or upgrade as the number of fixes is
>> growing...
>
> I think the upgrade is the way to go. We are likely to break 1.0.1g
> someday during backporting of security fixes.
>

In this case I would agree.  Updating daisy makes sense as we are only 
dealing with a minor version update.

- Armin

