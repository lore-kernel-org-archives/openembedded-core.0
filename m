Received: from mail-vb0-f43.google.com ([209.85.212.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TsHcf-0004uH-C2
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 19:40:33 +0100
Received: by mail-vb0-f43.google.com with SMTP id fs19so20041203vbb.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 10:25:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=10Fc6H3XncE7Fixr1q7rJ4kuZeISOXjNUhpDjVLBKLQ=;
	b=oYW7fECfLaftFFBn5hHUYtsETiokLSrbodwWvt2LPtIXt9+1rWwNlFifdiJrIfuSxn
	yTuenSalCOoQw2Up0aPWXdbGPjlO1H7c6SmzNAEbm4pQl3D4dIxmf+KCTVAsmo8Nrblb
	uuK+7QpNpK4PL4bEKkEZ/yLlugyeX4alA7XhJYQ61HILPlR9rH2rS6ZfrCcPwJBvpF2e
	nLShnANIIJzESL7ZE07N2GdaIhe9wQM3ZfXXMZJAQPdR71CA4vdkl3V+6HPUlVyHyLdg
	C15/hMY4WJEubga/8JLD7tOsUutPK/cMq7JEfsE4fv95lHKFS1bS9Y/8mS89lVUIiIjf
	Ymrg==
Received: by 10.220.107.5 with SMTP id z5mr84214790vco.22.1357583123436; Mon,
	07 Jan 2013 10:25:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.102.132 with HTTP; Mon, 7 Jan 2013 10:25:03 -0800 (PST)
X-Originating-IP: [5.13.212.252]
In-Reply-To: <50EAB9C9.1090903@linaro.org>
References: <50EAB9C9.1090903@linaro.org>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 7 Jan 2013 20:25:03 +0200
Message-ID: <CAK18fxGnWHWCxuH_oRV29bduUJr=LyN52FuBA9mEoUy61W8Vgw@mail.gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Gm-Message-State: ALoCoQnlyVWXBdH4aml9jWQlGi8PZygpDsQfkPL+5gTuh8+bP2LaYwntEweDnVw2uKUraXqJYkU4
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: Default xorg.conf is for x86 devices
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
X-List-Received-Date: Mon, 07 Jan 2013 18:40:34 -0000
Content-Type: multipart/alternative; boundary=f46d043c7bd4d3536504d2b6f3af

--f46d043c7bd4d3536504d2b6f3af
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 7, 2013 at 2:04 PM, Marcin Juszkiewicz <
marcin.juszkiewicz@linaro.org> wrote:

> Hi
>
> Can we replace default xorg.conf with empty one? I finally got X11
> working on AArch64 just to notice that I have to remove xorg.conf file
> to get them started.
>

I'm all for removal. Machine should add their xorg.conf taking into
consideration a specific driver or some other needed configurations.

ag

--f46d043c7bd4d3536504d2b6f3af
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On Mon, Jan 7, 2013 at 2:04 PM, Marcin Juszkiewicz <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:marcin.juszkiewicz@linaro.org" target=3D"_blank">marcin.jus=
zkiewicz@linaro.org</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi<br>
<br>
Can we replace default xorg.conf with empty one? I finally got X11<br>
working on AArch64 just to notice that I have to remove xorg.conf file<br>
to get them started.<br></blockquote><div>=A0</div><div>I&#39;m all for rem=
oval. Machine should add their xorg.conf=A0taking=A0into consideration a=A0=
specific=A0driver or some other needed configurations.</div><div><br>
</div><div>ag</div></div></div></div>

--f46d043c7bd4d3536504d2b6f3af--
