Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T9IVQ-0003Rg-GX
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 18:31:08 +0200
Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 05 Sep 2012 09:18:43 -0700
Received: by daks35 with SMTP id s35so518595dak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 09:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=wCFv9bLiUeF699Guv1ILCCGmk29c7aFnWe6Llp6qS0o=;
	b=Bm3PfNFlWppbHIFsuxEElFcjImzuIV/tPfusO50NoHRSKcWad9zorzMsu7UoqtyqGZ
	wPrBtMDGXr11nartsKEufVsdovarL78+5GO3zhIPc0LQ5DBD7T0ziXMgg6IkMckuOwzp
	xpYi+9xvru/0LUeIWX+19VGeqQg7rjFrpkS/TUtB0/eNflqZmOBwwrhH91fK9lMAZbhm
	yzv7C06h1jLOfHbA63Lu+BPGGg+FZ7UDnLNeQU7OefZi1MQ53s3CnY+EpI8VbVzUK9rM
	66FO0RjCMEkQ7XWBpFrDBAgyPO7HkKR6w5H4dyG42NRFrqFTiKKsOJdHYfVzlzaMM24r
	7oMQ==
Received: by 10.68.220.104 with SMTP id pv8mr55230903pbc.119.1346861920907;
	Wed, 05 Sep 2012 09:18:40 -0700 (PDT)
Received: from [10.1.10.35] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id lb1sm1715793pbc.47.2012.09.05.09.18.38
	(version=SSLv3 cipher=OTHER); Wed, 05 Sep 2012 09:18:39 -0700 (PDT)
Message-ID: <50477B58.3080609@intel.com>
Date: Wed, 05 Sep 2012 09:18:32 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5040A5BB.7040601@r-finger.com>
	<20120903070832.GC3205@jama.jama.net>
	<5045C60B.1020600@r-finger.com>
	<20120904092321.GC3372@jama.jama.net>
In-Reply-To: <20120904092321.GC3372@jama.jama.net>
X-Gm-Message-State: ALoCoQmEAEWhdZ+VYpdlczemuuaQOW+xdG+lpzOUyY+vgTFkAI+7Gbmpt8lIJ+Ue8GQvPypX5llZ
Subject: Re: runstrip() in package.bbclass fails when run against a kernel module
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
X-List-Received-Date: Wed, 05 Sep 2012 16:31:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2012 02:23 AM, Martin Jansa wrote:
> On Tue, Sep 04, 2012 at 10:12:43AM +0100, Tomas Frydrych wrote:
>> Hi,
>>
>> On 03/09/12 08:08, Martin Jansa wrote:
>>> On Fri, Aug 31, 2012 at 12:53:31PM +0100, Tomas Frydrych wrote:
>>>>
>>>> runstrip() in package.bbclass fails when run against a kernel module,
>>>> because it tries to do a bitwise & with a 'None' argument. This throws:
>>>> TypeError: unsupported operand type(s) for &: 'NoneType' and 'int'.
>>>
>>> Was this for denzil?
>>>
>>> In master it was fixed a month ago by:
>>> http://git.openembedded.org/openembedded-core/commit/meta/classes/package.bbclass?id=a834ab8a6d53cae504fa112a89bab93d726539ec
>>>
>>> Don't know why they merged your patch to master too now..
>>
>> Yes, I run into the bug on Denzil and did not see the alternative fix in
>> master; either one of those fixes the problem, of course.
>
> Yes but having both in master doesn't make much sense, and someone
> already asked the older fix to be merged to denzil.

Yes, Koen included it in his most recent denzil pull request. I have it 
queued in my denzil-next test branch and I'm waiting for autobuilder 
time to validate it before I submit a pull request to move it all into 
oe-core denzil:

http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


