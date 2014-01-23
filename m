Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB8C6B389
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 08:39:26 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id l4so1186901lbv.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 00:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=RFhu/bMSPjcIfTNJKJqo8BI3IrBawvVZ5FSs4/TBqPE=;
	b=AVLQS3jNhPM/FL7tGT7+ZgzlY1zlDx8JZZz9PjR7as74gExQrvq44cUYlh6hLD7F49
	o/g0ZwcuybVfuIK4+EbsKztt96XImPmkPt5W+yJMS6x+J6EHxDL7/gGEweYaN77faap2
	m+9VKVUTTL3gZHehvkY/T4TG3SWBX7O8aito7qJxr9NG5iv9rB93g4uILDXCgeX1HnVO
	ojR11RzT0hJgyX/UQwijf36veD/auoIF14LOvnisXypplFJgF+QlxOhDOB/cfNqZG59i
	UYtry9A0hT9R9acy9Ylm0TzCk+wcxYxbx++eDgc/3ls6Y8yqEP4wqiwo0ZPh5AOl6mYk
	gqDQ==
X-Received: by 10.112.205.5 with SMTP id lc5mr1110752lbc.40.1390466366631;
	Thu, 23 Jan 2014 00:39:26 -0800 (PST)
Received: from [79.102.97.51] (c-4f666133-74736162.cust.telenor.se.
	[79.102.97.51])
	by mx.google.com with ESMTPSA id m5sm14528310laj.4.2014.01.23.00.39.24
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 Jan 2014 00:39:25 -0800 (PST)
Message-ID: <52E0D539.9090402@gmail.com>
Date: Thu, 23 Jan 2014 09:39:21 +0100
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
X-List-Received-Date: Thu, 23 Jan 2014 08:39:29 -0000
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

Sorry, read your mail again, I think I misunderstood.
For rootfs-sandbox I agree, this is WIP.

I suspect that others already have these features, and regardless of 
WIC or rootfs-sandbox or other.
they will need the same functionality exposed in the SDK.
We are working on the same thing here, and as such, I think the small 
pieces needed to do this should be centralized in oe-core so
we can cooperate around them, and define interfaces between the SDK and 
bitbake env in an open environment.

Br,
David

