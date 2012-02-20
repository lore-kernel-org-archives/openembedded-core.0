Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RzWgl-0001HO-As
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Feb 2012 18:06:11 +0100
Received: by lahc1 with SMTP id c1so6618835lah.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2012 08:57:53 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.8.129 as permitted sender) client-ip=10.112.8.129; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.8.129 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.8.129])
	by 10.112.8.129 with SMTP id r1mr7982984lba.38.1329757073357 (num_hops
	= 1); Mon, 20 Feb 2012 08:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ymbnh92FA8AQsRbEmjDhYiibRvVK6aoDZXY1APqnUk8=;
	b=TOV6iYrotjY7RjJekxjBhWmX61LcgPQ2Yyd7v9g0s7HeuS+dPHP5+kqK94x7rf588f
	/ZfnSwRmGCM/UFQiM2EoeHVKeF2ImMqBAleghZuaa8ndmONDuV00cetqEgcMPElrXHWZ
	0FSJ+NRhDd3AN+ABa2abVAhe+wijpycIR2q+I=
Received: by 10.112.8.129 with SMTP id r1mr6692269lba.38.1329757073279; Mon,
	20 Feb 2012 08:57:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Mon, 20 Feb 2012 08:57:23 -0800 (PST)
In-Reply-To: <A86092D2-EFD8-4D6E-93A6-7911E3A9B066@dominion.thruhere.net>
References: <cover.1328510187.git.raj.khem@gmail.com>
	<4F31F617.9020603@linux.intel.com>
	<A86092D2-EFD8-4D6E-93A6-7911E3A9B066@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Feb 2012 08:57:23 -0800
Message-ID: <CAMKF1sowSsmZUQVkTnTiBStkmsVKnHvqwizqEgJLoV3ZvsEw_A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 00/20] uclibc upgrade, initial kmod and thumb tune
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
X-List-Received-Date: Mon, 20 Feb 2012 17:06:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2012 at 4:11 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 8 feb. 2012, om 05:12 heeft Saul Wold het volgende geschreven:
>
>> On 02/05/2012 10:40 PM, Khem Raj wrote:
>>>
>>
>>> =C2=A0 kmod: Add recipes
>>> =C2=A0 module-init-tools: Delete
>>> =C2=A0 image.bbclass,kernel.bbclass: Use kmod-native instead of
>>> =C2=A0 =C2=A0 module-init-tools-cross
>> Withdrawn for now
>
> Khem, Saul, any news on a new patchset for kmod?

The top three patches on
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/misc
is what I have latest there is some work left to do. in packaging area
e.g. stuff going into / instead of /usr is not perfect
since libkmod is going into /usr and rest to / but

>
> regards,
>
> Koen
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


