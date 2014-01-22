Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 51BF86E76D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 18:26:17 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id b8so632531lan.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 10:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=4gHybZPzwRuQc1xZNCQS1F9dmUnynNiXnKIHVVAfd2w=;
	b=E+2N/nKbLUMftMy3UTsR7Ps4VVLTi+KR9A/YzI7fyvTkhX5gbYsw6PRE9NbOTIo8Q6
	ZWBjI8aY+47RayZq8vZZoaAJW+xbf5oZZr3uZ+ThqYwIaxGbiGBlzes5Kh6xerW27A6e
	aJg8afoisQiiaDfTSDeY0eptTWX8puoVSD6IxNeL3U97et6lC5/JiXSkZoB/3uZRsiR1
	pRWyt3llmQrnTH3zyy8QfuxoO9Vmj/V6GoYV9WtcFHKHyK+w34qVAEvk0MJlSXarE0UR
	WzIz/qx22XZjW87iR1S6T5bgFL8d20ULozGTL4DjR3szsJGstbp/DSfDTPJCUmqvYbQ+
	yONA==
X-Received: by 10.112.74.39 with SMTP id q7mr391603lbv.64.1390415177101;
	Wed, 22 Jan 2014 10:26:17 -0800 (PST)
Received: from [172.16.141.123] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id g8sm11399657lae.1.2014.01.22.10.26.15
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 10:26:16 -0800 (PST)
Message-ID: <52E00D40.9090905@gmail.com>
Date: Wed, 22 Jan 2014 19:26:08 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1390403335-14487-1-git-send-email-david.nystrom@enea.com>
	<CAP9ODKr4WxcPVkxGMR+ZZ98b6mLbmUyr9Qs=BWe-S5HVJSn=hg@mail.gmail.com>
	<52E007CC.5070405@gmail.com>
	<CAP9ODKpAQDTg-UV-vR4419Q+6zvt=xNL=Wo5dH+feQi4wsWiGQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpAQDTg-UV-vR4419Q+6zvt=xNL=Wo5dH+feQi4wsWiGQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] postinst-intercept: New recipe to include postinstall intercepts in nativesdk
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
X-List-Received-Date: Wed, 22 Jan 2014 18:26:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On ons 22 jan 2014 19:11:21, Otavio Salvador wrote:
> On Wed, Jan 22, 2014 at 4:02 PM, David Nyström
> <david.c.nystrom@gmail.com> wrote:
>> On ons 22 jan 2014 16:47:06, Otavio Salvador wrote:
>>>
>>> On Wed, Jan 22, 2014 at 1:08 PM, David Nyström
>>> <david.c.nystrom@gmail.com> wrote:
>>>>
>>>> Adding ability to use postinstalls intercepts in the nativesdk env, and
>>>> making sure the correlate between repo + SDK.
>>>>
>>>> This to enable rootfs generation from a package repository using only a
>>>> package repository and the toolchain tarball.
>>>>
>>>> See https://github.com/nysan/rootfs-sandbox for examples.
>>>>
>>>> Signed-off-by: David Nyström <david.nystrom@enea.com>
>>>
>>>
>>> Much better. Thanks.
>>>
>>> Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
>>>
>>> Regarding the rootfs-sandbox, how are you intending to proper
>>> integrate it with the toolchain?
>>>
>>
>> Search the oe-core list for the previous discussions with Tom Zanussi.
>> I believe the long term goals is to redo rootfs_*.bbclass in python, and let
>> both bitbake and MIC(WIC) use
>> the same code for image creation.(SDK env + bitbake env.)
>>
>> I'm fine with continued dev/inclusion of rootfs-sandbox, but I think that
>> might not be acceptable as a long term solution since
>> it may be maintenance heavy, since it uses alot of oe-core internal env.
>> vars.
>>
>> Possible routes are:
>> 1. Use common code for rootfs assembly. (WIC)
>> 2. Cleanup env. var. usage in postinstall hooks, and be aggressive in
>> denying new additions. (Continue dev. on rootfs-sandbox)
>>
>> Off-topic:
>> With above patches, I'm down to 1 postinstall failures for
>> packagegroup-core-lsb:
>> 1. missing shlibsign, (nss), cant get the damn thing to compile for
>> nativesdk yet.
>>
>> There are 2 other failures as well, but they fail when bitbake:ing as well.
>> Only works well with ipk sofar.
>
> So I think we ought to work on this in a layer and put things in
> OE-Core when it is ready.
>
> What do you think?
>

Well, the WIC is a slightly different approach.
I obviously prefer this method, since you can work against and expand 
the target rootfs, the nativesdk and target sysroots via the repo,
and do it iteratively.
But there is also parts missing in this approach that would need to be 
replicated.
SD-card creation, partitioning, FS conversion et.c.

However, I have no problems with including it others +1:s this.

Br,
David


