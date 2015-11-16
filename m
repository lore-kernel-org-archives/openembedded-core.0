Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 087B16E268;
	Mon, 16 Nov 2015 17:10:49 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so180641588pac.3;
	Mon, 16 Nov 2015 09:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=c50xn1eUp7l6FTa90b+Nik5eQoq9syA/l61ekLhv8AU=;
	b=BcmF020nuKZR4BHXvScE42FIKq7S80ox3zueO4VSUjySj0fd9kyIKjcTld4hRB/OIh
	4q+9TexPCOV4HwKP0MKd/qioHvW+SiJOiuhE1yVSLosgiLj9imriRtGFltVoNiPHDyKn
	psSfP3nLYFEo8x2oVn+P+rWPsqLItwzSn7dAlWdI2t7x2kACP61CR/rjTr0YP483M8nx
	rgXinTB9TPhVwJ9tZkVQAucB6o4b4R76OBmASBionMoAX5dw9ZQQ4bAl/yH4iddABAR+
	Bt6fCEiZ7+zgP1l1IDv81c1ACOMRGjSVkqasjJumVg2v86CPdIxRjqCOt/wAmlCZUdYB
	y3Hw==
X-Received: by 10.68.68.233 with SMTP id z9mr50796351pbt.76.1447693849721;
	Mon, 16 Nov 2015 09:10:49 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:c869:7079:278f:61c?
	([2601:202:4000:1239:c869:7079:278f:61c])
	by smtp.googlemail.com with ESMTPSA id
	kj3sm37641186pbc.59.2015.11.16.09.10.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Nov 2015 09:10:48 -0800 (PST)
To: openembedded-devel@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
	<CALbNGRTcwpywgtSJvm-q6aZHK5vaF5BFcxmKseHYjcy6aWnmBg@mail.gmail.com>
	<4335862.fNWyiaI9Bu@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKqk4B_i+59asEqoVNjkynBWTACD0cM4f0JdxMCopprTkA@mail.gmail.com>
	<20151113114617.GB2567@jama> <5649A542.8000307@linux.intel.com>
	<CAP9ODKpU_6sVy6iidiCem8Sb+EWAgNCVrvOPmOhr4_uMt174Hw@mail.gmail.com>
	<5649BCB9.4090708@linux.intel.com>
	<CAP9ODKqCbYMqfhHY2p8yPsu7Pp4Pb+U-DrG7SbjN2Xh4e=FA7Q@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <564A0E0C.4090208@gmail.com>
Date: Mon, 16 Nov 2015 09:10:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqCbYMqfhHY2p8yPsu7Pp4Pb+U-DrG7SbjN2Xh4e=FA7Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Mon, 16 Nov 2015 17:10:50 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 11/16/2015 03:24 AM, Otavio Salvador wrote:
> On Mon, Nov 16, 2015 at 9:23 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> On 11/16/2015 01:20 PM, Otavio Salvador wrote:
>>
>>>> Making a separate repository with this layer is even more disruptive, and
>>>> complicates administration and maintenance. I'm not going to handle
>>>> those.
>>>> So I'll make a meta-qt4 layer under meta-oe, and it's fine if there is no
>>>> official maintainer or ongoing build testing for it at least until
>>>> someone
>>>> volunteers to pick it up.
>>>
>>>
>>> I will nack the patch to include it onto meta-oe; I also guess that
>>> Martin will also nack it.
>>>
>>> Make it another layer as suggested, please.
>>
>>
>> A separate layer under meta-openembedded or a separate repository with the
>> layer? Please be clear.
> 
> Another repository.

Agree with a separate repo. It clarifies our intention and implies nothing.


> 

