Received: from mail-ew0-f45.google.com ([209.85.215.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1R67Vz-0001qA-Sy
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 23:06:03 +0200
Received: by ewy28 with SMTP id 28so887421ewy.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 14:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=XjbLQapTqotNhpiv9bSwU42DWydeI0RnMGH91vfWl+w=;
	b=Jg+UxEcnxZ9TLffCWEKSs67slPq0R8hzLhmeh4gM+yJWxSu5Gnp8b9YCL137L9azC4
	bhRpxecmS1FdejRj8Y+tyuZTnSfIJ4eUGV4RlGPBvEGKkHgxzxIfBH5DWK6d6/7g95jC
	lUEq/EVDLW+SFNabY+6aPDh70hZe1wlk9wz3U=
Received: by 10.216.137.94 with SMTP id x72mr1614882wei.9.1316552446190; Tue,
	20 Sep 2011 14:00:46 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.184.7 with HTTP; Tue, 20 Sep 2011 14:00:26 -0700 (PDT)
In-Reply-To: <E7A9054A5ACABE48B0E540E46E862B0F011F65@NAEMMAIL01.na.leapfrog.com>
References: <E7A9054A5ACABE48B0E540E46E862B0F011F65@NAEMMAIL01.na.leapfrog.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 20 Sep 2011 14:00:26 -0700
X-Google-Sender-Auth: DnatMU6bGgOCtmvOL4BPWhVEp-0
Message-ID: <CABcZANmbortoni+VkAKC947vHLerU2yEo5O__uQoZEPw=1ZR+Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Correct way of having the PN package depend on
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
X-List-Received-Date: Tue, 20 Sep 2011 21:06:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2011 at 1:24 PM, Daniel Lazzari <dlazzari@leapfrog.com> wro=
te:
>> On 9/20/11 2:03 PM, Daniel Lazzari wrote:
>> > I noticed a problem with the alsa-utils package where the alsa-utils p=
ackage does not depend on all of the little extra packages it's supposed to=
 pull in. I'm not sure what the best way to fix this is though. Can anyone =
give me a little guidance or point me at a recipe that does this correctly =
already?
>>
>> If you are using the RPM backend, I'm currently working on something tha=
t may
> resolve this issue for you. =C2=A0Hopefully ready today.
>>
>> Otherwise, switch to ipk or deb and see if you get the same behavior.
>
> I'm using ipk already.
>
>> I don't see why this is a problem, personally. If someone wants a recipe=
's main package to depend on the other packages it emits, they're free to m=
ake the recipe do so. But the ${PN} package is not defined to include every=
thing from the recipe, it never has been.
>
> I understand that. With the alsa-utils package, the recipe specifically m=
entions
> # This are all packages that we need to make. Also, the now empty alsa-ut=
ils
> # ipk depends on them.
>
> Right above adding packages such as "alsa-utils-alsamixer" to the PACKAGE=
S variable. I need all of those more specific packages and if I understand =
correctly, I should be able to get them by just adding the "alsa-utils" pac=
kage to my custom image.

Sounds like it's just a recipe bug then, if it claims to do something
which it doesn't do.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


