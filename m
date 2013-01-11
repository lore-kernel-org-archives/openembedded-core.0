Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1Ttiz7-0004CF-GG
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 19:05:43 +0100
Received: from mail-da0-f70.google.com ([209.85.210.70])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 11 Jan 2013 09:49:09 -0800
Received: by mail-da0-f70.google.com with SMTP id t11so1867542daj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 09:49:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:message-id:date:from:organization:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=myVeJ1p3OKGJMWppgY4Goe1uRSVh9ii1kFK1pO6kaQo=;
	b=ESy7tm0e3tKhSuJRjp5Qxt+0WOZ6dImnn6CHEPpCRgLtwWdUKJe7PkXX3MJDY5Msdb
	Z+dAeg4V3UMuG3eq/CuPGzZfnB7ItN8iDYtGfyiFvVhydpEzegoc0Z7hbTpzwYFghAtV
	Q/JOp22e0pj064vbTYw2Mk/Evwll7K422NpoQyx5WBzwxOCTluXEidfHQq3wCwWqVbxh
	yKAen9kD1VaII5lXcuKto5miL0MlkbdHdH9VrmetKopMnEx151Rkjb69fV3InfLpbXLJ
	asioJTvXqa1lKegxOti2p3zha8l4pSSziYWQTVryzfj8sGEfljw7dWHsja1aG2hVOdtM
	8sFA==
X-Received: by 10.68.219.164 with SMTP id pp4mr229877102pbc.72.1357926549441; 
	Fri, 11 Jan 2013 09:49:09 -0800 (PST)
X-Received: by 10.68.219.164 with SMTP id pp4mr229877085pbc.72.1357926549321; 
	Fri, 11 Jan 2013 09:49:09 -0800 (PST)
Received: from [10.6.18.24] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id sb3sm3135273pbc.44.2013.01.11.09.49.08
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 09:49:08 -0800 (PST)
Message-ID: <50F05093.3090201@intel.com>
Date: Fri, 11 Jan 2013 09:49:07 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>
References: <1357843361-18125-1-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LaWTPXh9Ph+LFMK+44t3T+TN-uZXXEwJg7yoOmcUZCL1A@mail.gmail.com>
	<1357862392.4072.3.camel@ted> <1357917120.4072.73.camel@ted>
	<969F26A8BAB325438E7EB80D3C3134FB161DCF13@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB161DCF13@IRSMSX102.ger.corp.intel.com>
X-Gm-Message-State: ALoCoQkAJa7XBH3IseCESgZhPZ5e3rrd6wnxHfyqoqwzJUrCNIcMhzDjMz98uGZh425/a1J9+IHOZ09WCRZYRnrUMzfA15Sw/mL1i3qB/guclRp0s35tgxxJV0UqpiPXSQlnU2jlngiF9suO3/xTBRBlVQ3oFAL2yOW+Uz0i5etu6xj3MjU0kHJoLw14rvE2QjXLBW4Izf8B
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] connman: upgrade to 1.10
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
X-List-Received-Date: Fri, 11 Jan 2013 18:05:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2013 07:35 AM, Iorga, Cristian wrote:
> Hello Richard, Saul,
>
> Which versions of connman upgrade patches were used? V2 or V3?
>
I used the V2 version since that what I had available, I wanted to get a 
sanity run it for that and the gcc multilib changes (which also broke 
gcc-runtime).

Sau!

> Also, does the issue will be present with V3 also?
>
The v3 patch should split out the qemu change from the patch and it 
should be 3 patches total.

Sau!

> Regards,
> Cristian
>
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
> Sent: Friday, January 11, 2013 5:12 PM
> To: Burton, Ross
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH V2] connman: upgrade to 1.10
>
> On Thu, 2013-01-10 at 23:59 +0000, Richard Purdie wrote:
>> On Thu, 2013-01-10 at 20:26 +0000, Burton, Ross wrote:
>>> On 10 January 2013 18:42, Cristian Iorga <cristian.iorga@intel.com> wrote:
>>>> 0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
>>>>      - adapted to the new version
>>>>
>>>> 0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
>>>>      - patch removed (it is included in the new version)
>>>>
>>>> inet-fix-ip-cleanup-functions.patch: added
>>>>      - fix for ip cleanup functions
>>>>
>>>> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>>>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>>>
>>> Also document the point of connman-conf.
>>>
>>>> diff --git a/meta/conf/machine/include/qemu.inc
>>>> b/meta/conf/machine/include/qemu.inc
>>>> index 5d59a7f..41fe552 100644
>>>> --- a/meta/conf/machine/include/qemu.inc
>>>> +++ b/meta/conf/machine/include/qemu.inc
>>>> @@ -10,6 +10,8 @@ XSERVER ?= "xserver-xorg \
>>>>
>>>>   MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
>>>>
>>>> +MACHINEOVERRIDES .= ":qemu"
>>>> +
>>>
>>> Please submit this as a separate patch, it's effectively unrelated to connman.
>>
>> Please don't use "qemu", use something like qemuall or allqemu since I
>> have some thoughts about how this might interact with the qemu class,
>> most involving the word "badly" ;-).
>
> Saul included this change in MUT on the autobuilders. I've just lost a load of time wondering why we had an odd world autobuilder failure:
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-world/builds/439/steps/shell_43/logs/stdio
>
> This override patch was why :(.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



