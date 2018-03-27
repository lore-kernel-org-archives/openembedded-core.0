Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id C6BE478433
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:27:49 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id 9-v6so14177026ple.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 07:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=nZBaixLPbfPLnXmccbj6YHQmPrH1rVUqGPSdN7HUAj4=;
	b=YObcKfs4YpWRFoxkLU/os+1CAie2Z/JzNnOms8yvnK7PlVW0IDaZwo+oIHw80qBXMg
	CZb/eLakJY/vTse2l466kvaCRudFfpCV3dsD7cBGq2mF5NJ2ZHVly4pWFXNLfRP8vPs+
	PpLqT4s3XM1Ws6o4iiOdiWqoj3eUT5YzfZfkrGBJgqzZ8LKQvKUjL5+LpZrrTCoUM/LX
	T98JSTID9Ctd0bhuWPYskNyK/ZaQljKCiv9PzwOW8RMk5w724tS1TtfWQ+X7mbaeZu3D
	9473IPRjFRHZSysHlzxpUIajd1WjxCc0TWvj7QZZuRaqSZRHy3GYhJoC65PcVwxtwN3N
	uOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=nZBaixLPbfPLnXmccbj6YHQmPrH1rVUqGPSdN7HUAj4=;
	b=GnRa5gSfFuEJ8zBg+Z51XmxH60U83rCXlnlMyztJ1fAEknUE8KwJQWwxPTYVeFCHzZ
	V3OE7vGl5vyRK316F0eHdPEuSouyxcKlK/HbGl3AP2yjscWCUwEEiycX7kr0azG9dmbO
	128ltqU7MwCmxiA/vV8M+ThcWCfGS3ifdvTsDjzXEoYH0Qiul3vROQbYuGX3Ra+VlMMk
	euyMxOALAqwyha3xklcVub2jAFy2njjb/m5U7K5WnlCjWvmZVDNEAXk0NekNxiuVtCiJ
	a/xcMuk/NqbK9HJwEJtGGpES/FAQxNP0iexU+nCR6z7h8rNB8PJxBtXjJNr5gqIFJ/6T
	ZWuQ==
X-Gm-Message-State: AElRT7E3XrfCB5SJlaM/aYUDd8abBXMLzHg1mRmCViP8Io825Qu7aD60
	k3qRg/EaRMPIhngIfHf15vc=
X-Google-Smtp-Source: AG47ELtoTHsL6VVHOXpoDPsFBq/qBqSIYExvYo95dgJf/hF9wozndvKb+Ixu/fPNAJsn0L3iHAWMQQ==
X-Received: by 2002:a17:902:a24:: with SMTP id
	33-v6mr44879515plo.72.1522160871127; 
	Tue, 27 Mar 2018 07:27:51 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:9901:2a59:c9ba:abba?
	([2601:202:4000:1184:9901:2a59:c9ba:abba])
	by smtp.gmail.com with ESMTPSA id 195sm3052999pgd.3.2018.03.27.07.27.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Mar 2018 07:27:50 -0700 (PDT)
To: Enrico Joerns <ejo@pengutronix.de>,
	openembedded-core@lists.openembedded.org
References: <20180120234441.18217-1-ejo@pengutronix.de>
	<1196cf78-ae82-c3d2-cdb0-1d6f6dc46de1@pengutronix.de>
	<e3b72747-dcf3-98fb-e553-854c4fdee9cb@pengutronix.de>
From: akuster808 <akuster808@gmail.com>
Message-ID: <b18f67d3-85aa-acfe-11a5-37709c0d4e2e@gmail.com>
Date: Tue, 27 Mar 2018 07:27:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <e3b72747-dcf3-98fb-e553-854c4fdee9cb@pengutronix.de>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [pyro][rocko][PATCH] base.bbclass: fix do_unpack[cleandirs] varflag handling
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
X-List-Received-Date: Tue, 27 Mar 2018 14:27:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 03/27/2018 03:40 AM, Enrico Joerns wrote:
> Ping!
>
> If there should be severe changes in the recent base / kernel class
> code that might make this useless, this is at least a candidate for
> backporting!

This has to be in master first before  I can back port. Since you have
the setup that shows the problem, maybe you could double check on master
to see if it is also affected.

regards,
Armin
>
> /Enrico
>
> On 01/31/2018 10:49 AM, Enrico Joerns wrote:
>> Hey,
>>
>> any comments on that? Not using this patch currently disturbs our
>> companies Yocto kernel workflow. Thus I wonder if no one else have
>> had issues when building kernels from fully custom 'defconfig' files,
>> too.
>>
>> Regards, Enrico
>>
>> On 01/21/2018 12:44 AM, Enrico Jorns wrote:
>>> As introduced by a56fb90dc3805494eeaf04c60538425e8d52efc5
>>> ('base.bbclass
>>> wipe ${S} before unpacking source') the base.bbclass uses a python
>>> anonymous function to set the 'do_unpack' varflag 'cleandirs' to either
>>> '${S}' or '${S}/patches' depending on equality of '${S}' and
>>> '${WORKDIR}'.
>>>
>>> Not that this only differs from the way almost all other recipes set or
>>> modify a tasks 'cleandirs' flag, it also has a significant impact on
>>> the
>>> kernel.bbclass (and possibly further ones) and causes incorrect
>>> behavior for rebuilds triggered by source modification, e.g. by a
>>> change
>>> of the defconfig file for a kernel build.
>>>
>>> The kernel.bbclass tries to extend do_unpack[cleandirs]:
>>>
>>> | do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B}
>>> ${STAGING_KERNEL_BUILDDIR}"
>>>
>>> As python anonymous functions are evaluated at the very end of recipe
>>> parsing, the d.setVarFlag('do_unpack', 'cleandirs', '${S}')
>>> statement in
>>> base.bbclass will overwrite every modification to cleandirs that is
>>> done
>>> as shown for the kernel class above.
>>>
>>> As a result of this, a change to a kernels 'defconfig' will lead to an
>>> updated defconfig file in ${WORKDIR}, but as ${B} never gets cleaned
>>> and
>>> ${B}/.config still exists, it will not be copied to ${B}/.config and
>>> thus not find its way in the build kernel.
>>>
>>> This is a severe issue for the kernel development and build process!
>>>
>>> This patch changes setting of the cleandirs varflag in base.bbclass to
>>> a simple variable assignment as almost all other recipes do it. This
>>> now
>>> again allows overwriting or appending the varflag with common methods
>>> such as done in kernel.bbclass.
>>>
>>> This issue affects morty, pyro, rocko and master.
>>>
>>> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
>>> ---
>>>   meta/classes/base.bbclass | 8 ++------
>>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>>> index 912e81e002..2949b074d8 100644
>>> --- a/meta/classes/base.bbclass
>>> +++ b/meta/classes/base.bbclass
>>> @@ -152,12 +152,8 @@ python base_do_fetch() {
>>>   addtask unpack after do_fetch
>>>   do_unpack[dirs] = "${WORKDIR}"
>>> -python () {
>>> -    if d.getVar('S') != d.getVar('WORKDIR'):
>>> -        d.setVarFlag('do_unpack', 'cleandirs', '${S}')
>>> -    else:
>>> -        d.setVarFlag('do_unpack', 'cleandirs', os.path.join('${S}',
>>> 'patches'))
>>> -}
>>> +do_unpack[cleandirs] = "${@d.getVar('S') if d.getVar('S') !=
>>> d.getVar('WORKDIR') else os.path.join('${S}', 'patches')}"
>>> +
>>>   python base_do_unpack() {
>>>       src_uri = (d.getVar('SRC_URI') or "").split()
>>>       if len(src_uri) == 0:
>>>
>>
>


