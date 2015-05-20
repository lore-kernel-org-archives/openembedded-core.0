Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC88601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 14:08:57 +0000 (UTC)
Received: by pdea3 with SMTP id a3so70227752pde.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=+ObiCtRNL9GWtb/t2L5Fw9ZW5pEO7E53TU35pd8ZC0w=;
	b=MeCSrSrjl0bzOmidBv7tIkgZ+JdVOjrJN2d7grMOXqP6CDSMurO3zbn+TFMVfWHjUJ
	+TqFZ6vadKKSY+5WHGYCqnF6vS6TlqSZQUWOiKyfLelWrQ6BZNH6qKl9xeCMU9hbXLRP
	1/Ts+KH3lF4Vjejxdpa/rOpexEh65EEFj5+s6ubJPHjMGsI761t3gETKuYvZ7ztBorHo
	iza9ZlQdcC0REZU0ouE/+9sOWAKB8kcPn0936TRHKDC5XsVOhhfuHKB84c6F67CbudeH
	T9WEWxujXCFE3tBzW6gL3NMsLry7O6DrIcKCUTa0bBtTvAiN9HTQDD+M/E4JsWzNxFwE
	B76A==
MIME-Version: 1.0
X-Received: by 10.68.233.71 with SMTP id tu7mr25310217pbc.14.1432130938374;
	Wed, 20 May 2015 07:08:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Wed, 20 May 2015 07:08:58 -0700 (PDT)
In-Reply-To: <5EE3C094-2BFE-414F-ACF3-F3ABD8D0BD41@gmail.com>
References: <CALbNGRRq94M86hm=0y8ZR7+5RXDMCJkXPxGREzAOjNQLerNkPw@mail.gmail.com>
	<20150518080138.GD9407@jama>
	<CALbNGRReeZHBXDo2C4tRTHfdCwSfS5QxpKdGWpsZJbgAGGCYdw@mail.gmail.com>
	<CAP9ODKqpnGVrBNh9PekyZJJBzRnjs9mfELM3afHTmT=0UDEegw@mail.gmail.com>
	<CALbNGRSnxG0ZmFH2sAFL0B3uEy3mi97t30fSnn2JCSyFLr9Pdg@mail.gmail.com>
	<CAP9ODKp1-e6oiv6oKUJ5aTPjYMBJL9YtF+16Gt=cooC+4LEdYw@mail.gmail.com>
	<CALbNGRQPU2ToHpwcD6GA+TOz4zS2sJV8dXgbZsufn=9Pg-Pn3Q@mail.gmail.com>
	<CAP9ODKo3MhRR_2OW4Xgg6GMkdV-ykD3AvrRRQU9n0pF1xqh4rQ@mail.gmail.com>
	<59DAE1C4-3DB3-44B8-A036-927EBD67C212@gmail.com>
	<CALbNGRTA-rPDinuWqDzdRK=jmY6wYJ_Li_NGCkoO52G-t+U1+A@mail.gmail.com>
	<CALbNGRSeZ7CZtbJd2U6iGu+ARgT3hi9CdC5xO7iwwipk89D=4A@mail.gmail.com>
	<CAP9ODKr9ntS+W8DZuSXrN_V_sg-=CVAHCESULeUdUNki2jSMGg@mail.gmail.com>
	<5EE3C094-2BFE-414F-ACF3-F3ABD8D0BD41@gmail.com>
Date: Wed, 20 May 2015 11:08:58 -0300
X-Google-Sender-Auth: d11-iXLXcRUnOZsJoayHbAtiTo8
Message-ID: <CAP9ODKpwztPizk0tdx1gtcAo_OhMLx8q=+igk3JnvoFcEjDPKA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: trouble related to oe-core update
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
X-List-Received-Date: Wed, 20 May 2015 14:08:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2015 at 10:58 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On May 20, 2015, at 6:46 AM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
>>
>> OE-Core does not seem to enable thumb2 by default so I don't think we
>> ought to change the default here. However I do agree in extend the
>> comment and provide an example so it is easier for people to do this
>> when needed.
>
> No. That setting is effectively telling
> this chip does not have thumb capabilities which is wrong for that class =
of processors, that assumption
> is wrong and should be fixed.
>
> even if you have thumb tunes expressed, it won=E2=80=99t change default I=
SA which is what you are
> implying with your first sentence there. Default ISA for a component or g=
lobally can be changed
> via different knobs and distros can choose that policy.

Is it possible for you to cook a formal patch with a descriptive
commit log for review than? I am not against this change but this
needs to be well documented.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

