Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SwfNh-0005MJ-W0
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 22:18:58 +0200
Received: by yhjj56 with SMTP id j56so7041725yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 13:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Ci78UITd+cOBmlYhbY2KP/eDnJNdItRZTBcbsXo6g1c=;
	b=R6ANZLWubmMGmOz8CxtHbOvJcyHyqJObIw5NaHpbLj3wimYCyh+Oldz8Y1dFrMLBZK
	jX0ghEIZfresJl5EK08XzKkDMJ1J8HdLnRxPr7WVk+HS/UJ0XCqryBEBD/2/lGJRq6Yh
	ilkSRcBRucQpS5AxqbAYIJYpIYc6Jeump8jLSHdAVInBHovY/8fCG+6RiMSZIg+2iryl
	OdEz2kHvnrqO1ZGwXt1Zj3UX6mSvmqTsSU5fR+4phFWoWg6XUICmhdZ618Ffe59iyIK4
	IZHrPW5RCog8yNDIoCCFKZhFcbKqez3Q3nZSDoYi1E1PPLwG8A8cMRF2riVeF6eJGzF+
	kFYQ==
Received: by 10.50.87.227 with SMTP id bb3mr6394856igb.57.1343851638725; Wed,
	01 Aug 2012 13:07:18 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.50.34.200 with HTTP; Wed, 1 Aug 2012 13:06:58 -0700 (PDT)
In-Reply-To: <50198091.6050001@windriver.com>
References: <CALbNGRTYa-2M-pi0d+oBvT+z81kTi8j9VM4gK=iiUDfBSQ7N9A@mail.gmail.com>
	<CABcZANk2SzKKcXTdU0MLUeXwOWSxq4HqJceMPO6tOLP3M_GejA@mail.gmail.com>
	<50198091.6050001@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 1 Aug 2012 13:06:58 -0700
X-Google-Sender-Auth: Xus8GbviXW348wK5fCFrFz2vLqo
Message-ID: <CABcZANm3J06scGP2Tkde0amm8QXfJGamGydUTDmXC1t3BGxKgg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: number of tasks increased since last update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 20:18:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 1, 2012 at 12:16 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 8/1/12 2:08 PM, Chris Larson wrote:
>>
>> On Wed, Aug 1, 2012 at 8:29 AM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>>
>>> today I updated and found the the number of tasks has increased about
>>> 400. Another strange behaviour: in my build dir there are two new
>>> folders:
>>>
>>> x86_64-nativesdk-angstromsdk-linux
>>> x86_64-angstromsdk-linux
>>>
>>> but up to now I was not interested in sdk stuff. Is that another bug
>>> or a feature?
>>
>>
>> I just went to build core-image-base and saw it building crosssdk
>> stuff -- not sure if it's related, but thought I'd throw that
>> datapoint out there.
>>
>
> do you have the updated bitbake?  Prior to RP's changes about a month ago=
,
> the task / dependency resolver was unable to resolve things on a per-task
> basis.  So any task within a recipe triggered the resolver to build
> dependencies.
>
> The SDK stuff adds dependencies only do the sdk task.
>
> With the current head of tree bitbake, I have not seen a revert of
> behavior... the SDK items only build when triggered.

Bitbake commit e49a656a499355a5c6e7eb00bf5b8f1795e8dddb, which is
current master.
--=20
Christopher Larson


