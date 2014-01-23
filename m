Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id AEB6B6B05F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 08:26:32 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id y6so1202488lbh.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 00:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=U3NJzw5ZEjUWayfYvAbBvv4KUczmoLNZ83RfVC3a8Is=;
	b=yuC4I8KCWeXHy1220PXOFMBIWnfdMl72Ppd6+0Ca528IY56LLlnZduHI3QTyTNKBJy
	mfRKXVl/3OsjoqdBAjDEutBN1i7Ofa8RNcNiyIm93ZoUExWfCJmSM3gv6SDGmjqZ4LS2
	Zuu+pq2khZeJuAAehC2SyAmrK1ufCr5WWz9NX3cpdDHr9UdqhnEOQ7fOMTiUTD8g/EOm
	dHbKg99UN585lzYXOoDDX+x7Cmdi+YX8tMe680CTqDVPAsfPkI+SzIhWs9Wm/NiCtfYD
	6oTFoSTMv9+Supr7VGMgSHhUTLzm5YF0KHweqCYOuAZXu/PfrAv9K3PY2TPsTvV4OOC8
	rSdQ==
X-Received: by 10.112.64.166 with SMTP id p6mr4089904lbs.10.1390465592134;
	Thu, 23 Jan 2014 00:26:32 -0800 (PST)
Received: from [79.102.97.51] (c-4f666133-74736162.cust.telenor.se.
	[79.102.97.51])
	by mx.google.com with ESMTPSA id a8sm14471224lae.5.2014.01.23.00.26.30
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 Jan 2014 00:26:30 -0800 (PST)
Message-ID: <52E0D235.2060605@gmail.com>
Date: Thu, 23 Jan 2014 09:26:29 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1390405731-19334-1-git-send-email-david.nystrom@enea.com>
	<CAP9ODKqQ1Y-p_tAyMY=Rmw8t4ct7jXqxV=mBaqLdLXXpW+er1g@mail.gmail.com>
	<52E00ACA.10502@enea.com>
	<CAP9ODKp2yX_rw0GJEmntuhjwr-zzOYVW3Hk3ZS1Yf7Zy3zr1xQ@mail.gmail.com>
	<52E00E23.8090605@gmail.com>
	<CAP9ODKqHtSfJi9BpH1D7KKCy=DT4GGywcw7sqA1BcdZr28UgUA@mail.gmail.com>
In-Reply-To: <CAP9ODKqHtSfJi9BpH1D7KKCy=DT4GGywcw7sqA1BcdZr28UgUA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-core-standalone-sdk-target: Add qemuwrapper-cross to target sysroot
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
X-List-Received-Date: Thu, 23 Jan 2014 08:26:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On ons 22 jan 2014 19:33:22, Otavio Salvador wrote:
> On Wed, Jan 22, 2014 at 4:29 PM, David Nyström
> <david.c.nystrom@gmail.com> wrote:
>> On ons 22 jan 2014 19:24:47, Otavio Salvador wrote:
>>>
>>> On Wed, Jan 22, 2014 at 4:15 PM, David Nyström <david.nystrom@enea.com>
>>> wrote:
>>>>
>>>> On 2014-01-22 19:08, Otavio Salvador wrote:
>>>>>
>>>>>
>>>>> On Wed, Jan 22, 2014 at 1:48 PM, David Nyström
>>>>> <david.c.nystrom@gmail.com> wrote:
>>>>>>
>>>>>>
>>>>>> Some postinstall scripts use the qemuwrapper script, so to be able to
>>>>>> offline install these packages outside of the bitbake environment, this
>>>>>> script
>>>>>> needs to be exposed also in the SDK.
>>>>>>
>>>>>> This to enable rootfs generation from a package repository using only a
>>>>>> package repository and the toolchain tarball.
>>>>>>
>>>>>> See https://github.com/nysan/rootfs-sandbox for examples.
>>>>>>
>>>>>> Signed-off-by: David Nyström <david.nystrom@enea.com>
>>>>>
>>>>>
>>>>>
>>>>> Shouldn't this be a RDEPENDS of the postinst package?
>>>>>
>>>>
>>>> Do you mean a RDEPENDS on the run-postinsts package ?
>>>> In that case no.
>>>>
>>>> When $D is set, postinstalls interpret this as a offline install,
>>>> some postinstalls call postinstall-intercepts, which in turn use the
>>>> qemuwrapper script _only_ if $D is set.
>>>>
>>>> run-postinsts should be installed if there are postinstalls which failed
>>>> to
>>>> run during the offline install.
>>>>
>>>> Just to clarify this, the qemuwrapper-cross will only be installed to the
>>>> target SDK sysroot, never on the target rootfs.
>>>
>>>
>>> No; in postinstall-intercepts RDEPENDS.
>>>
>>
>> Ah, now I get it.
>> If I do that, will it not end up on the target rootfs ?
>
> I don't think so.
>

1. RDEPENDS_${PN} = "qemuwrapper-cross" wont work since TARGET_ARCH 
detected in qemuwrapper-cross recipe will be SDKMACHINE when
compiled as nativesdk-qemuwrapper-cross. (I know, nativesdk-*-cross 
should not be done).
I have not found a way to retrieve the real target architecture during 
a nativesdk build.

Also, we can't add qemuwrapper to the nativesdk sysroot, since we may 
have mutiple target sysroots which have different
qemuwrapper settings.

Br,
David


