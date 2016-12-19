Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4F277331
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 16:43:07 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x186so13524958vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 08:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L+G6tSbHHivFfZXjYbOE5Q7D5vznRruVIpbYm6oRjmA=;
	b=jz15+c6wi1iF1Mq0UfmN+ZBwS6mPu4Ye3U20FyRYEE7c4g35Nyu+tFiXGlHCDQhgzY
	RuDgXN0I4jzsCiIm3DhThEPjKy/UMszvVCuPBCPx62M1VM6W3U1DkbMxyBeU43Kj7/P7
	DLQnJngy1NfZywmw2PnM02127flegm/J/ZIzjHmn/woM6uz2GuNP58oDYqnVkFhaVaBp
	XqoiYW5EYohVjlZ91NtP+fbbqwXCorrI0dZXo3m6zmWr8tbRxUKts8L63jlXQTwFdzYJ
	CCsaKfSpS6spEClDOHF5x1TI18GXepkhKKkdjwYUtsuYosMS2SQKTB41nANSMJI8YoiP
	fdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L+G6tSbHHivFfZXjYbOE5Q7D5vznRruVIpbYm6oRjmA=;
	b=FacMCrjIUcm3tExO8eU+PVpTP0nVzZInBUGvJ5h6Fkn2tXTXZk25yu+0vzARt1VtF8
	ROoTGqr/5DbQ1oLJL956HGgEk4vBcgo+JuKuzoErWSqj7Gp95H73oDYOaXEN9JTx/hB2
	m7NXm1WmlURB1Iz/ugaKGwIjK5GkOSlzMUqyBoUJbepT74/n0NNiEhMz9UEg+tOHJPhu
	lgJP2sEWOBPC443dGPErUesxgyWFKRooSib2QvlR6qsJTAlwSzukfB+Bf+faJo21VrcK
	2nmalLTHKwJ5N1kXU0A7/VKpxiyITo7M0hw+G2Jgf2w96EF1pl87ZMXKMXiPPo02RhYA
	IYpg==
X-Gm-Message-State: AIkVDXLWIg8dcx1dAEgYaf5SuMZLdxB0CvYOvVNLyHuUqtXX3Dc3dN3tge1JFey7EyUc3I2cHIG8H//J0hyrHA==
X-Received: by 10.31.234.199 with SMTP id i190mr6454124vkh.31.1482165788997;
	Mon, 19 Dec 2016 08:43:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Mon, 19 Dec 2016 08:42:38 -0800 (PST)
In-Reply-To: <CAJTo0LY1m20z=4SmyHJg0v1DVS=PukdGvYkkHT=V7ii9rTgzYA@mail.gmail.com>
References: <20161219063957.18716-1-raj.khem@gmail.com>
	<20161219063957.18716-2-raj.khem@gmail.com>
	<CAJTo0LY1m20z=4SmyHJg0v1DVS=PukdGvYkkHT=V7ii9rTgzYA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2016 08:42:38 -0800
Message-ID: <CAMKF1sohfFT=+-ZTuSmOjL96+ktQZ+oeqiivJDg84XvUq-8HGQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [V2 02/10] gdb: Upgrade to 7.12
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
X-List-Received-Date: Mon, 19 Dec 2016 16:43:08 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2016 at 3:14 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 19 December 2016 at 06:39, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> --- a/meta/conf/distro/include/tcmode-default.inc
>> +++ b/meta/conf/distro/include/tcmode-default.inc
>> @@ -25,7 +25,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>>  GCCVERSION ?= "6.2%"
>>  SDKGCCVERSION ?= "${GCCVERSION}"
>>  BINUVERSION ?= "2.27%"
>> -GDBVERSION ?= "7.11%"
>> +GDBVERSION ?= "7.12%"
>>  GLIBCVERSION ?= "2.25"
>
>
> Can you rebase stuff to master before submitting it, as this patch doesn't
> apply.

it is rebased on master but I am carrying a glibc 2.25 upgrade patch
which I am not yet proposing thats why you see conflict

>
> Ross

