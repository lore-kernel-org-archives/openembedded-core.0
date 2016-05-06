Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 41D71731C4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 15:47:11 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y7so10723046pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=OpXUN6jCq8lMVOUgFnT4+j1GrdFihdH2ECb2PLUdyKA=;
	b=TMDOGQHVwnpflG1yQEbUB6A6Zj1t9KVcEC5Q7sQ7+anWHjfaiCVjz4JTWIdtJcqkCS
	pGJrR9KpvwWd/RMYI2YOIQGuphr229My8nOflQ5g7CM+j0d3r0nJ/XLKOh5M20faEpvY
	X4qeFT4E+Pdlew7lGcigImD76Weyv+gJydmTk+G4eYazgaDZNFv7gA8FL+tcOPFGIj7P
	tYE188o3aW2Rk66MsBB+xn9/khFVWKse11jEFhpoYsDbDXm+6zTXFMPtPkeAgKFljMKS
	l46AM7uEh6dvL23SOsyFeBuaQ+k5wgWB7H3e9liTt8Qx/YiacMkrACoqfJr7555846kJ
	pVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=OpXUN6jCq8lMVOUgFnT4+j1GrdFihdH2ECb2PLUdyKA=;
	b=IxcKF3RDPJN5BprKDY8p7k1S2DPgPjN5yUwJRnqsc3uzZTZtuwPDBKLy6eGLzJuUFi
	MLlVgt/L5BBkEnCBtjoYuAqpL5lMsz1kSi554sDPuoJNen1zxUMCy5QohnbeCV947n0L
	aDn3YsZtIX7eywqSR4qvYPHC7mJyZolBNcpOaRUpEVmPYM+qlczt4XyVPEbQHCiADvuM
	/ZDS2WGwZRFwd95JnO9CQZsAIlbx/cesVPr/+aIBhQWrd5cXMB0YYHZLtxdF/YBJxFMb
	tjWVGl0iprNlvsqUE8HynNi+NwasYmBc3Z3NQMQVHx1y9lAFey4H3VFRDKT9HNuQs5im
	mXUg==
X-Gm-Message-State: AOPr4FVqkmcDi73RM3Ijz5qyoALpz/Vj9MNX8V9mizuPKdcMAgu1/qnoaGPIWvmQJnPaVQ==
X-Received: by 10.98.79.199 with SMTP id f68mr30040595pfj.44.1462549632320;
	Fri, 06 May 2016 08:47:12 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:6856:c509:b9ca:c5c1?
	([2601:202:4000:1239:6856:c509:b9ca:c5c1])
	by smtp.googlemail.com with ESMTPSA id
	g77sm21936471pfg.78.2016.05.06.08.47.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 May 2016 08:47:11 -0700 (PDT)
To: Joshua G Lock <joshua.g.lock@linux.intel.com>,
	akuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
References: <1461867811-7837-1-git-send-email-akuster808@gmail.com>
	<1462355553.6485.5.camel@linux.intel.com> <572A0450.10100@mvista.com>
	<1462400231.6485.19.camel@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <572CBC7E.9080407@gmail.com>
Date: Fri, 6 May 2016 08:47:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1462400231.6485.19.camel@linux.intel.com>
Subject: Re: [master][krogoth][PATCH 1/2] qemu: Security fix CVE-2016-2857
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
X-List-Received-Date: Fri, 06 May 2016 15:47:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 05/04/2016 03:17 PM, Joshua G Lock wrote:
> On Wed, 2016-05-04 at 07:16 -0700, akuster wrote:
>>
>> On 05/04/2016 02:52 AM, Joshua G Lock wrote:
>>>
>>> Hi Armin,
>>>
>>> On Thu, 2016-04-28 at 11:23 -0700, Armin Kuster wrote:
>>>>
>>>> From: Armin Kuster <akuster@mvista.com>
>>>>
>>> I've been seeing:
>>>
>>> "qemu: uncaught target signal 11 (Segmentation fault) - core
>>> dumped"
>>>
>>> when trying to build gobject-introspection for qemux86 recently and
>>> narrowed it down to this change, if I revert this patch the use of
>>> qemu-native by gobject-introspection no longer causes a
>>> segmentation
>>> fault.
>> well that is not good. To be clear, this is a build issue not an
>> execution issue? I would like to better understand what went wrong to
>> tighten up my processes.
> 
> It's an execution issue for qemu-native, the segmentation error occurs
> when trying to build gobject-introspection (which calls qemu-native).
> 
> I didn't try calling qemu-native any other way (runqemu, etc) to see
> whether it was something specific to the way gobject-introspection
> calls qemu.
> 

I can not reproduce this issue. I have used two different build systems.
I have another I will try.

so the testcase be?

1) bitbake core-image-sato
2) runqemu qemux86

I am surprised the AB didn't catch this prior to release.


>>>
>>>
>>> Are we missing some related patches for this CVE fix? 
>> The only commit identified for is the on this patch came from.
>>
>> I haven't dug
>>>
>>> into the details, but noticed that Fedora's CVE-2016-2857
>>> diffstat[1]
>>> is much larger than ours[2].
>> The Fedora change includes several other CVE fixes
>> +# CVE-2016-2538: Integer overflow in usb module (bz #1305815)
>> +Patch0103: 0103-usb-check-RNDIS-message-length.patch
>> +Patch0104: 0104-usb-check-RNDIS-buffer-offsets-length.patch
>> +# CVE-2016-2841: ne2000: infinite loop (bz #1304047)
>> +Patch0105: 0105-net-ne2000-check-ring-buffer-control-registers.patch
>> +# CVE-2016-2857: net: out of bounds read (bz #1309564)
>> +Patch0106: 0106-net-check-packet-payload-length.patch
>> +# CVE-2016-2392: usb: null pointer dereference (bz #1307115)
>> +Patch0107: 0107-usb-check-USB-configuration-descriptor-object.patch
>> +# Fix external snapshot any more after active committing (bz
>> #1300209)
>> +Patch0108: 0108-block-set-device_list.tqe_prev-to-NULL-on-BDS-
>> remova.patch
>>
>> which we seem to be missing some as well.
> 
> Several (possibly all) of those are in the 2.5.1 upgrade I proposed. 

There are over 50 commits in that release, some of them extend
functionality which is why I am a bit hesitant in upgrading Krogoth at
this time. Dot releases tend to be the cleaner method to loads for back
ports. I need to think about this a bit more.


Is anyone else seeing a problem?

- Armin
> 
> Regards,
> 
> Joshua
> 

