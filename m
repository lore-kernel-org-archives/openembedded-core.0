Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RuUAF-0000p6-Pn
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 20:23:47 +0100
Received: by wibhq7 with SMTP id hq7so4724942wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 11:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=5++kP5MvWogW9iOD+sE1XJG2oNnZdsheB5E3iTEF8Uk=;
	b=ZT0NiM1QU1Ei9RiJZ2fZktGeZu6kTg4QGYqAY/4qS4+WOZiH4AaF8yY/U50hEUeMbC
	f3gogwnj4gCsji8+bPIMgrv3ebuEvlB0g5uTNE6D9SZOarExC4QKD6q+leo9ez4iJKts
	0p1hfM3LzulVEPMwD3ky/dl+60s03mGNyFJTU=
Received: by 10.180.93.194 with SMTP id cw2mr29254315wib.0.1328555746706;
	Mon, 06 Feb 2012 11:15:46 -0800 (PST)
Received: from [192.168.0.10] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id
	ep3sm31627222wib.10.2012.02.06.11.15.43 (version=SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 11:15:43 -0800 (PST)
Message-ID: <4F302661.9000400@gmail.com>
Date: Mon, 06 Feb 2012 20:13:37 +0100
From: Peter Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20120112 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1328509284.git.xiaofeng.yan@windriver.com>
	<1624cca695c5baf08d376297f7278732dbcbfba6.1328509284.git.xiaofeng.yan@windriver.com>
	<1328519623.2716.208.camel@x121e.pbcl.net>
	<CAMKF1sqCO2Zz=4K=vSAAHZ1s8z=Hco7TQAWiFGMiXJLQB834pA@mail.gmail.com>
In-Reply-To: <CAMKF1sqCO2Zz=4K=vSAAHZ1s8z=Hco7TQAWiFGMiXJLQB834pA@mail.gmail.com>
Subject: Re: [PATCH 1/2] glib-2.0: Don't check function qsort_r
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
X-List-Received-Date: Mon, 06 Feb 2012 19:23:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2012 04:34 PM, Khem Raj wrote:
> On Mon, Feb 6, 2012 at 1:13 AM, Phil Blundell<philb@gnu.org>  wrote:
>> On Mon, 2012-02-06 at 14:41 +0800, Xiaofeng Yan wrote:
>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>
>>> function "g_qsort_with_data" has two kinds of realization. One calls qsort_r
>>> from libglib, the other realize itself.
>>> qsort_r from libglib cause sort error.
>>> For fixing this problem no checking "qsort_r" in configure.ac.
>>>
>>> [YOCTO #1959]
>> This description doesn't make much sense.  libglib is part of glib-2.0
>> itself; I guess you meant to say that qsort_r is from libc6.  But, even
>> leaving that aside, if qsort_r is broken then the appropriate patch
>> would be to fix it, not just to hack glib to use a standalone
>> implementation.  So this patch seems like the wrong thing by any
>> measure.
>>
>> Does glibc's own testsuite also have failures for qsort_r?
> glibc one works ok last time I checked however uclibc does not implement it
Yes, it does. It was implemented somewhere in between 0.9.32 and 0.9.33 
[1]. Last time I've checked it even worked fine with glib-2.0. You just 
need to change glib_cv_have_qsort to yes in meta/site/common-uclibc.

/ptw

[1] 
http://git.uclibc.org/uClibc/commit/?id=515d54433138596e81267237542bd9168b8cc787



