Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id B5F947BEDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 13:32:35 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 20so2051890pgr.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 06:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=oLX5vekuFv/GYAbYwFoLRY6+8l9uq+Vv9WSeKcbmHVw=;
	b=TVsAsNM/MpRZEskikP4bYYr0v6VMlRLD1sVgRX1o7HB57Rypub1P1zjKJN0DVYxp1U
	u9+h0Pca0agLjsY6JWIvKDezbaQL374LJP75J+kM4nat71EFGybO0K9xZFv/+XKKBCi/
	dO7bGEWT5nIsmpHv+ULc7RozmumpXfQf6wAPWSRqsK8BDa6zubEaxM/ODuZI3Wt1V/W8
	AXXB63oqIpC5ARJTKEqOa6KfP0BwSrlO4c57m9s+k/NFhVITUw7L8TZZhWLu/4ZtmV7d
	AqzewK/THOBeWirxNjq5DJ0PPJ6SwuwIDJ7n4CSxMjtAn5sh4Gc58lhDz8u72DozH2aI
	ZrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=oLX5vekuFv/GYAbYwFoLRY6+8l9uq+Vv9WSeKcbmHVw=;
	b=cejt5B8eqjxYc/8XzbemtFwKjcQ3096MD3U0cg+ztaF1AoBRToi1DjaNOuzTLRCAOw
	fLYpPPoTLZjTzsUB1ZXvaZip6iGLettJmffOMtVKcU5FRlnItUknqEQPH6LvPV6yXZhv
	S0evusavU5SfnqRCH12R3EEnvmn488HZml5OyZbWdX8izto5SzGYDJxOk0kGEY2ZhoAB
	xr7nCELDGtIKmkNgvBek768vthAQtBpLh6V6j03L+3wr31fJTWu3pTQ8TsuL91leLCLp
	Ta4HuXrKX2ciKcmnvqtM8YdW/gfTaY++IzDjnxjn2TvacKzXC/LqNClVA5XLIhh9Rii+
	kIpw==
X-Gm-Message-State: APjAAAUQRwKC7mTKnmglt3s+54p3mM4s3eQcLsE4QLzVdpQ/4N0TjvmP
	IL+YYX7HkpeuyuUhkYzHL+2fw13J
X-Google-Smtp-Source: APXvYqxISAEdHXeXt1CEkF8WcIij7fgvyfyqPqse2l96/CNCo7LFt44iQyKP/7kSbpioMTZWDVgsbQ==
X-Received: by 2002:a62:ac0a:: with SMTP id v10mr3672921pfe.57.1559223156529; 
	Thu, 30 May 2019 06:32:36 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:4865:9151:ec2:e220?
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id g8sm2626505pjs.23.2019.05.30.06.32.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 06:32:35 -0700 (PDT)
To: richard.purdie@linuxfoundation.org, Adrian Bunk <bunk@stusta.de>,
	Tom Rini <trini@konsulko.com>
References: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
	<20190529184328.28470-2-richard.purdie@linuxfoundation.org>
	<4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
	<8798dc0e5d91991953720388b601c9c5b3174c42.camel@linuxfoundation.org>
	<321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
	<20190529212556.GO20781@bill-the-cat>
	<4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
	<20190529221726.GA16075@localhost>
	<20190529222920.GP20781@bill-the-cat>
	<20190529230203.GB16075@localhost>
	<aba82f4358b0479419ccc3412b83c052dce57bf4.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <ed68ff2b-e29e-54eb-f477-5026e45795dc@gmail.com>
Date: Thu, 30 May 2019 06:32:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <aba82f4358b0479419ccc3412b83c052dce57bf4.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Thu, 30 May 2019 13:32:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/30/19 1:13 AM, richard.purdie@linuxfoundation.org wrote:
> On Thu, 2019-05-30 at 02:02 +0300, Adrian Bunk wrote:
>> On Wed, May 29, 2019 at 06:29:20PM -0400, Tom Rini wrote:
>>> On Thu, May 30, 2019 at 01:17:26AM +0300, Adrian Bunk wrote:
>>>> On Wed, May 29, 2019 at 10:29:31PM +0100, 
>>>> richard.purdie@linuxfoundation.org wrote:
>>>>> On Wed, 2019-05-29 at 17:25 -0400, Tom Rini wrote:
>>>>>> On Wed, May 29, 2019 at 09:50:22PM +0100, 
>>>>>> richard.purdie@linuxfoundation.org wrote:
>>>>>>> On Wed, 2019-05-29 at 13:39 -0700, akuster808 wrote:
>>>>>>>> On 5/29/19 12:26 PM, richard.purdie@linuxfoundation.org
>>>>>>>> wrote:
>>>>>>>>> On Wed, 2019-05-29 at 12:21 -0700, akuster808 wrote:
>>>>>>>>>> On 5/29/19 11:43 AM, Richard Purdie wrote:
>>>>>>>>>>> (From OE-Core rev:
>>>>>>>>>>> 29fc9210b973be68de474e75068e4c72371afe5a)
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Richard Purdie <
>>>>>>>>>>> richard.purdie@linuxfoundation.org>
>>>>>>>>>> With back port to warrior and Thud too?
>>>>>>>>> Yes, we'll need to do that if we bring fedora 30
>>>>>>>>> workers online
>>>>>>>>> on
>>>>>>>>> the
>>>>>>>>> autobuilder.
>>>>>>>> I know the uninative update is required for FC30 but
>>>>>>>> changing the
>>>>>>>> compression does not.
>>>>>>>>
>>>>>>>> This question is about the compression extension
>>>>>>>> question.
>>>>>>>>
>>>>>>>> Does this mean YP will no longer be providing bz2
>>>>>>>> uninatives?
>>>>>>> Correct, the patch should be straight forward to include
>>>>>>> with the
>>>>>>> upgrade.
>>>>>> Does that in turn mean we must have host xz-utils?
>>>>> It will mean you need a tar which supports the -J option. The
>>>>> tests
>>>>> I've see so far suggest all our oldest supported distros do...
>>>> For thud tar >= 1.27 is required, -J was added in 1.22.
>>>>
>>>> But Tom is asking about something different:
>>>> tar calls "xz -d" for decompression, which needs xz-utils
>>>> installed.
>>>>
>>>> https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#required-packages-for-the-build-host 
>>>> documents that xz has to be installed, but looking at 
>>>> meta/conf/bitbake.conf it might be missing in HOSTTOOLS.
> uninative runs in a weird early non-worker context and doesn't actually
> use HOSTTOOLS so luckily we're covered from that angle.
>
>>> I think it's also missing in for example the crops containers.  So
>>> if
>>> we're going to backport it, I think maybe we should keep it
>>> bz2?  The
>>> size difference can't be that much.
>> The size difference is surprisingly high - a factor of 5 (sic).
>> But in practice the difference between 5 MB and 26 MB
>> shouldn't really matter.
> I'm torn, partly as if we stick with bz2, we effectively do that
> perpetually and given the size difference, we should switch.
>
> Tim mentions we could fix the crops container and I'm tempted to switch
> given we're so close with the current patchset...
>
> We can add xz to HOSTTOOLS in master and that makes sense for a number
> of other reasons but gets tricky as we can't add it to ASSUME_PROVIDED
> as easily due to the libs it provides. I think we only need to worry
> about this on master though.
So.. Can we have a bz and xz version built until thud is in community
supported and update Warrior to use xz ?

- Armin
> Cheers,
>
> Richard
>
>
>


