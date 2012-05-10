Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SSbRb-0003qX-MG
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 00:02:43 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga09.intel.com with ESMTP/TLS/RC4-MD5; 10 May 2012 14:52:32 -0700
Received: by pbbro8 with SMTP id ro8so8261669pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 14:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=YC4+zmiDdqtXe0QKHuqFeiC+BPu5Uq3DqauedBjE2yI=;
	b=PNoxf1hMg4KuvSUxm0XwCrS0dQKTXyOr6QxwwesOEXdSOvXb0G9nE9SF+xpnR+d6R7
	Adx3G2QDqTOr+tS1Ez0PF7xUTO884njJPoeapHTj0AA9wkUm6Bp8ywvpjFPPnBEUmk5Z
	RbdFBwjVanpictD9iUyClfyXS9j2cf5rzJXMXJXN+qDmY4cqxmpCFoTEQu+Ch2Z2Hr8d
	mMCYA/l09kIN5bGwPxu5ApzbGfTU7K4gPQB39Hx41B/qRoKz3YVZQZxKRcEqtGW2Fq8U
	PArJqMmsGbLIiNb/FMgX5FyF0QV13M57Kh9McoFX6sbJje9HwAfgt1rE++NRH2qd+4nN
	C+Iw==
Received: by 10.68.224.196 with SMTP id re4mr23178659pbc.111.1336686752443;
	Thu, 10 May 2012 14:52:32 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id pl7sm10621450pbb.59.2012.05.10.14.52.30
	(version=SSLv3 cipher=OTHER); Thu, 10 May 2012 14:52:31 -0700 (PDT)
Message-ID: <4FAC3892.7030206@intel.com>
Date: Thu, 10 May 2012 14:52:18 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1336684128-29514-1-git-send-email-cazfi74@gmail.com>
	<4FAC3559.6080609@intel.com>
	<CAF6bG8f21DjmQjGKmb1z4JQ8fvdguR6zGaPoGgsPW_HVDz516Q@mail.gmail.com>
In-Reply-To: <CAF6bG8f21DjmQjGKmb1z4JQ8fvdguR6zGaPoGgsPW_HVDz516Q@mail.gmail.com>
X-Gm-Message-State: ALoCoQko4FaRLnO8/YyZaFfCwbuHIWzeCj4xiWVzqicUW85T2PrJ9c7C5JxK8lM89gnGE4rgNl5Y
Subject: Re: [PATCH] expat: update to upstream version 2.1.0
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
X-List-Received-Date: Thu, 10 May 2012 22:02:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2012 02:49 PM, Marko Lindqvist wrote:
> On 11 May 2012 00:38, Scott Garman<scott.a.garman@intel.com>  wrote:
>>
>> Hi Marko,
>>
>> As the maintainer of the expat recipe, I appreciate your submission. However
>> I'm a bit wary of removing the autotools patch
>
>   Not removed, but adjusted to apply over expat-2.1.0.
>
>   However, part of the old patch was removal of libtool.m4 include from
> configure.in, but new version leaves libtool handling to configure.in
> as is.

You're right, I guess I scanned the diff too quickly and read it mistakenly.

I can run it through my autobuilder overnight, so no worries about 
testing. The upgrade looks pretty straightforward.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


