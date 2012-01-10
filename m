Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RkePH-0003kX-ON
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 17:18:40 +0100
Received: by qabj40 with SMTP id j40so174298qab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 08:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=ytUbZ1GevO7EFkkBpWD7R6vJ0FblWUc0P3fsac1fb5U=;
	b=c81GBl6r7FQm7lgSUfr0ipZ9qAC6nAtgo8ca/vK0h/zf8mVfLALyOVsP0jR6F4wIJi
	7r+5A57frBBVo/wlONo1vqeSzzh+Z/0+IZ0kjIfwKm9xRE2x1QnZibBnz9bnrqkc0R3c
	oTZM/hk0WAe7VgYY4iRY4IlU1yiQgQhiyYp8Y=
Received: by 10.224.175.2 with SMTP id v2mr25543872qaz.69.1326211870298; Tue,
	10 Jan 2012 08:11:10 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.187.141 with HTTP; Tue, 10 Jan 2012 08:10:49 -0800 (PST)
In-Reply-To: <4F0C623B.7050209@gherzan.ro>
References: <1326208678-17244-1-git-send-email-andrei@gherzan.ro>
	<CABcZANnzU_5LTeRV=UjPiUWn6rqnZS6RR_yhsUKE_C_ap-PZ9g@mail.gmail.com>
	<4F0C623B.7050209@gherzan.ro>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 10 Jan 2012 09:10:49 -0700
X-Google-Sender-Auth: nc-IVPA-CY8cRDD0rJp3pFdsdP8
Message-ID: <CABcZANmcdGtOa+K9=6Ei_vAF=BVQwa6BYAYTjpeEuCDcqPcPnQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] license.bbclass base.bbclass: support for 'or' operand in LICENSE and for SPDX license names
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
X-List-Received-Date: Tue, 10 Jan 2012 16:18:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2012 at 9:07 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> On 01/10/2012 05:34 PM, Chris Larson wrote:
>>
>> On Tue, Jan 10, 2012 at 8:17 AM, Andrei Gherzan<andrei@gherzan.ro> =C2=
=A0wrote:
>>>
>>> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>>>
>>> A new function was defined in license.bbclass in order to correctly
>>> exclude packages where OE-Style licence naming
>>> is used. In this way licenses as GPL-3, GPLv3, GPLv3.0 etc will be
>>> excluded from a non-GPLv3 build. This function
>>> takes into consideration if 'or' operand is used.
>>> The function defined in license.bbclass is called in base.bbclass where
>>> packages are excluded based on
>>> INCOMPATIBLE_LICENSE variable.
>>>
>>> [YOCTO #1884]
>>> [YOCTO #1844]
>>>
>>> Signed-off-by: Andrei Gherzan<andrei at gherzan.ro>
>>
>>
>> Out of curiosity, why are we using regex for this when we already have
>> license parsing in the oe.license module which can handle the OR case?
>
>
> I'm using regex only for excluding '+' characters from LICENSE. The rest =
of
> the work is done in oe.license.
> If X is defined as INCOMPATIBLE_LICENSE, X+ should be exluded as well.

Ah, right, apparently I'm blind :) We should really think about a
generic mechanism for handling + somehow. Hmm.
--=20
Christopher Larson


