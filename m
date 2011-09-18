Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1R5AQS-0006oF-3v
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Sep 2011 08:00:24 +0200
Received: by fxi1 with SMTP id 1so3391436fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2011 22:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=dGGD71imVxPYvG/aQ6HRWqulM0WuJTuHzt+fc1j54e0=;
	b=OjjLg+rjK9P8mmKWXXFJgX768HRt/U7SF0yPjgbdOm3EBkpF9LPGJgKYeMlA7bvhw/
	F7LIRVYfkL5llgfAB4vDrt8rDrM+qznv2TtkjHuqLfIx9F95rdiAlpnH07LljjcRM+3b
	SdBmay6kKtt4TMTEOijORJQj9GT54rCFqk/aU=
MIME-Version: 1.0
Received: by 10.223.9.133 with SMTP id l5mr1116982fal.13.1316325309708; Sat,
	17 Sep 2011 22:55:09 -0700 (PDT)
Received: by 10.223.83.206 with HTTP; Sat, 17 Sep 2011 22:55:09 -0700 (PDT)
In-Reply-To: <6F590F6E-9EAB-4F37-A923-D7736BC43BB1@dominion.thruhere.net>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
	<1314318504-9524-4-git-send-email-joelagnel@ti.com>
	<abf615e596934df48ad620207828b227@DFLE70.ent.ti.com>
	<CAD=GYpZ3sMnyrWj0EztVN-MK0tpRYaLF4R1UHPz12bO7b=dOQA@mail.gmail.com>
	<6F590F6E-9EAB-4F37-A923-D7736BC43BB1@dominion.thruhere.net>
Date: Sun, 18 Sep 2011 00:55:09 -0500
Message-ID: <CAD=GYpYHzNSxT0PWDWT8uVhZWZZWb0F4y_+ZGWUOQP_BWUUDiA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH meta-oe 3/9] libmad: Imported from OE-classic
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
X-List-Received-Date: Sun, 18 Sep 2011 06:00:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 27, 2011 at 2:08 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 27 aug. 2011, om 06:12 heeft Joel A Fernandes het volgende geschreven:
>
>> On Fri, Aug 26, 2011 at 2:59 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>
>>> Op 26 aug. 2011, om 02:28 heeft Joel A Fernandes het volgende geschreven:
>>>>
>>>> diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
>>>> new file mode 100644
>>>> index 0000000..537d685
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
>>>> @@ -0,0 +1,34 @@
>>>> +DESCRIPTION = "MPEG Audio Decoder Library"
>>>> +SECTION = "libs"
>>>> +PRIORITY = "optional"
>>>
>>> That field isn't used anymore
>>>
>>>> +DEPENDS = "libid3tag"
>>>> +LICENSE = "GPL"
>>>
>>> Which version?
>>
>> Hi Koen,
>>
>> Isn't it implied that its GPL v1? I've seen several recipes in OE-core
>> that did that.
>
> If it's GPLv1 it should say GPLv1. But you should know, since you inspected the license files before checksumming them, no?

Fixed in v2 series,
http://permalink.gmane.org/gmane.comp.handhelds.openembedded.core/7301

Thanks,
Joel


