Received: from mail-la0-f53.google.com ([209.85.215.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.gall@linaro.org>) id 1Uamr9-0005Pv-Bn
	for Openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 14:55:27 +0200
Received: by mail-la0-f53.google.com with SMTP id eo20so3891753lab.40
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 05:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=jKKiz2MSh03yofFdWsPuM1hx75+KdxLDwfG9itC1WXs=;
	b=lJJKneodOpE8b7QT4SooVw/6qkyFW7IiLdAorV0BwyITo6VW8UT/Sgv47IBuJc+Gko
	+qDPNF0HPt7Q/hmdXYCAiSmd2yQLgO6A1UGEB2Q0exzHr54aPjNuYvzgj5gRmCjOK9Xt
	lCLe6EVSn5qpb4yX2KSbLvaeaCDkuD0KSvqOZWrIfP/kFd7kiEFRAuy64SdhmkvcoWz1
	qj9ZVTpKgkHXyu93Ti3WS1jaxrYsRi3/TBqLZGFAOZDCuVL1toxhmR4Tb2HTJJ6bZ5TL
	eJzWbzK860huEMauiBUaZs2oa3fLX1W5yHBiA0IUCqi6hmiEmoWBZaYCADufL7DE9WB3
	DkBA==
MIME-Version: 1.0
X-Received: by 10.152.22.4 with SMTP id z4mr7490677lae.37.1368189441769; Fri,
	10 May 2013 05:37:21 -0700 (PDT)
Received: by 10.112.76.167 with HTTP; Fri, 10 May 2013 05:37:21 -0700 (PDT)
In-Reply-To: <CAGNsrLBckfhAKwGVsyCm3KArBU=-CMiMd55s-iL+XatU0x9gQg@mail.gmail.com>
References: <518BD58B.1030307@linaro.org>
	<CAGNsrLBckfhAKwGVsyCm3KArBU=-CMiMd55s-iL+XatU0x9gQg@mail.gmail.com>
Date: Fri, 10 May 2013 07:37:21 -0500
Message-ID: <CAOfXc9F+yGH_H4tuWPCZnAc-Tx-kqU0AwOSW8g5+1O0=PQrbrQ@mail.gmail.com>
From: Tom Gall <tom.gall@linaro.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
X-Gm-Message-State: ALoCoQnNQC4V3N8ZTBRqGqPwCjz+UdoYbmLgTCJmvYabsJr/4BJj4RRM2W5pdVRKACWaSVVR6DRk
Cc: Lists Linaro-dev <linaro-dev@lists.linaro.org>,
	Openembedded-core@lists.openembedded.org
Subject: Re: Changes in Linaro layers for OpenEmbedded
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 12:55:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'll also add that we (the Graphics Working Group) are using it as
we're bringing up the graphics stack on ARMv8.

Patches soon.

On Fri, May 10, 2013 at 12:23 AM, Fathi Boudra <fathi.boudra@linaro.org> wr=
ote:
> Hi,
>
> On 9 May 2013 19:57, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> w=
rote:
>> Who will maintain those layers after my leave? This was not decided yet.
>> There are few guys at Linaro who know how to use OpenEmbedded but most
>> of them is outside of Builds and Baselines team.
>>
>> If you have any questions then better ask now.
>
> Let me clarify a bit this part since it's Marcin's personal opinion.
>
> OpenEmbedded baseline is part of the official Linaro releases.
> It's maintained, we produce daily builds and test them.
> As of today, it's mainly used for ARMv8 bring up and is expanded to
> ARMv7 for covering Toolchain CI.
> Later on, it's planned to be even more extended for LNG use cases.
>
> The team in charge of these builds is Builds and Baselines Team.
> There's capable people inside the team to take over OE maintenance and
> that's the plan.
>
> In short, I don't expect any disruption for OpenEmbedded baseline builds.
>
> Cheers,
> --
> Fathi Boudra
> Builds and Baselines Manager | Release Manager
> Linaro.org | Open source software for ARM SoCs
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev@lists.linaro.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev



--=20
Regards,
Tom

"Where's the kaboom!? There was supposed to be an earth-shattering
kaboom!" Marvin Martian
Tech Lead, Graphics Working Group | Linaro.org =E2=94=82 Open source softwa=
re
for ARM SoCs
w) tom.gall att linaro.org
h) tom_gall att mac.com


