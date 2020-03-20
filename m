Return-Path: <jpuhlman@mvista.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6B94360CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 00:06:29 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id hg10so1716022pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 17:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=j0+yy35cnhedaDVZiExT8an8Olg0/nf8jjZhwWVjwqU=;
	b=RpGMDBamk1CY8eajQ03Xje2bSBQC1Ho6gWX+vSwBuICsaqUalc98mf6s6h03ACC4N3
	lCGqNA/BBUZgUJNJgmFB7YOC3sN4hTR95gZ+K0oAFBMibbPNaUwCwpbhQzuFhblnNAfg
	OW6JPtGOTG6Vz5o7eysMjzRbwYHSni5cmGAzFzRbUwSlmBlEanwOumuZ/t2VCHhlxt9v
	uP5pke/B6gj9K90OAqL+CsdCeFc59lLHdUWm+HBqqcu6OqFinrKUpTF4s2sFYEUH+y/w
	TFTY813c4XKyL154rNKZaoUic/b7hoKR4GwSwm4vHatg4uhfdf31vhncYD6Aa56p1agS
	y8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=j0+yy35cnhedaDVZiExT8an8Olg0/nf8jjZhwWVjwqU=;
	b=do8wj22Aa7SMPHv4G6mxgJ9genNa4OgrE6qPDa2X0tDJy2kM24Kpalcv4RfgY6bOfo
	pI4Edej1mvrh1v4+vD8KxrJVF9NK1hze/skdfapa8Wb4A0KH9oGFXXr2Bo+75jtdd9Po
	VBVvYdkArNSBc472x2JnmXk3JS4PACWucpntJRx1jgcF9o8gQno0qFcezTjgpD6s4Irq
	Fnz9YcWZ7ovJjHle3x06uS/FJoG5ChjHqXYPbrnAmAzzErP1vMpYhthJcNPQMbZQFhJP
	Nh2HNRxpC7cTvgFgox2WoXR5yK4kAhl27bFYHdvzPMKG4XHdRiaPlOiTK3dYlw75arJx
	c7VQ==
X-Gm-Message-State: ANhLgQ3r+eSTZZMyr0uOkFnavequuEr61+BtxHljFHe7bpEq49giou6V
	3851Bs+iRPEeyFyHJCAgYk3IZzKEVKY=
X-Google-Smtp-Source: ADFU+vslLCmbLMKv1vp2JAqpe24fU0bXkZ6uwAQ13EmMAHcXBsVRtqLIfqsdQHAUj8s9GCP3AiWAqw==
X-Received: by 2002:a17:902:32b:: with SMTP id 40mr5829418pld.22.1584662789352;
	Thu, 19 Mar 2020 17:06:29 -0700 (PDT)
Received: from [192.168.1.93] (99-14-97-149.lightspeed.frokca.sbcglobal.net.
	[99.14.97.149]) by smtp.googlemail.com with ESMTPSA id
	y14sm3511368pfp.127.2020.03.19.17.06.28
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 19 Mar 2020 17:06:28 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200319224450.4798-1-jpuhlman@mvista.com>
	<4cf821be03065accd90e14237708eaf7f343b572.camel@linuxfoundation.org>
From: Jeremy Puhlman <jpuhlman@mvista.com>
Message-ID: <f309fe09-e87e-3857-b4a3-c9a8a3438a8b@mvista.com>
Date: Thu, 19 Mar 2020 17:06:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4cf821be03065accd90e14237708eaf7f343b572.camel@linuxfoundation.org>
Subject: Re: [PATCH] qemu-system-native: disable options not included in extended tarball
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
X-List-Received-Date: Fri, 20 Mar 2020 00:06:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/19/2020 5:02 PM, Richard Purdie wrote:
> On Thu, 2020-03-19 at 15:44 -0700, Jeremy A. Puhlman wrote:
>> From: Jeremy Puhlman <jpuhlman@mvista.com>
>>
>> * Add PACKAGECONFIG option for xkbcommon
>> qemu-keymap.c:16:10: fatal error: xkbcommon/xkbcommon.h: No such file or directory
>>
>> * Add PACKAGECONFIG option and patch for libudev
>> commands-posix.c:53:10: fatal error: libudev.h: No such file or directory
>>
>> * Add PACKAGECONFIG option for libxml2
>> util/osdep.c:136: undefined reference to `fcntl64'
>>
>> - Without specifying libxml2, configure searches the system and pulls in the system
>>    libxml2 if it is present. In the process it adds -L/usr/lib64 which causes the
>>    system libc to be linked instead of the one from the extended tarball.
>>
>> * Specifically remove xkbcommon and libudev from qemu-system-native PACKAGECONFIG
>>
>> None of the above libraries appear to be included in the depends for any of the qemu
>> builds, so if they are getting linked in, its probably not intentionally.
>>
>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>> ---
>>   .../qemu/qemu-system-native_4.2.0.bb               |  3 +++
>>   meta/recipes-devtools/qemu/qemu.inc                |  4 +++
>>   .../qemu/qemu/0001-Add-enable-disable-udev.patch   | 29 ++++++++++++++++++++++
>>   3 files changed, 36 insertions(+)
>>   create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
>> index d83ee59375..f3ceaa1003 100644
>> --- a/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
>> +++ b/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
>> @@ -10,6 +10,9 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native"
>>   EXTRA_OECONF_append = " --target-list=${@get_qemu_system_target_list(d)}"
>>   
>>   PACKAGECONFIG ??= "fdt alsa kvm"
>> +# Do not exist in buildtools-extended-tarball"
>> +PACKAGECONFIG_remove = "xkbcommon"
>> +PACKAGECONFIG_remove = "libudev"
> I don't like this piece of the patch. Remove is generally a bad idea as
> its very hard to counteract. If you did add this to PACKAGECONFIG, it
> would add the appropriate -native pieces to DEPENDS so I'm not sure
> what we're trying to achieve here anyway, it should work without this
> remove code either way?

Fair enough, I was just trying to ensure it would build if the options 
got set elsewhere. We don't have a eudev-native or
xkbcommon-native so if it got enabled it should die from lack of 
dependencies. I was trying to be cautious.

>
> At the very least the comment is very misleading and will be hard to
> understand in a few months time without looking back at this commit.
Okay I can remove it,

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


