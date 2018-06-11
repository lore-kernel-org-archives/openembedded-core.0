Return-Path: <daniel.diaz@linaro.org>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 41E1074F35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 17:30:03 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id t134-v6so31783446lff.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=39saJ+0jAJ7p0R5WbpFEEx5igQYtKFHGVgCvoaADQbI=;
	b=fadsk56nPW9KL+6nhDf75J7HfnRqnL/GsiP+rTiLPrb7XoS1lq+aKWcGDmIXhg5P/y
	/IKDKNxwsLxFw6Zbp6sypInloWDSfuPqgIbHiiD3VU4VpsFWrIdL9mVHifsHalxJ87/5
	x4EJ9I5nfIIknGyfpfICiy0zYMh+1JJoY7xSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=39saJ+0jAJ7p0R5WbpFEEx5igQYtKFHGVgCvoaADQbI=;
	b=Zks6B9O3bVYfQ9qbS31u2q4XsNeqBKZb3dwunVWtMoRxUN7WIkFF1SiTFllgqfMIhc
	i1eRcY3ic+ubXz2cLlaRTw1a65pTfiyHleh5LMNHML8PWkPkC13KhwLtxEXdjuSDxxEt
	K959meibH/NedDpU6zCQXG4SEAVtWikGoxaLr6TOI19NOU1zVIgl2qWyoCjZVvqqmO8k
	XxWjenHf1qlEXsGPv0eTC7KR2KR1rLVlbXFXMe2h+4FGxU8Bb6i6Yyg7hknXlzUxooqj
	s+qrDtFmkOsygUcvDRD7uwt0pL5mcInEJGa5V/33XMtLyQ7EaHgdsIzK6OVZYDRSU+la
	SiIg==
X-Gm-Message-State: APt69E26QWTKAhhM7R2LTtK58bXx5BS86e8EvJBshp3pTsc14wzaVQmc
	x+oX1RnzQ7D387/iXKIhzSMOFKyvso5oXwDgly34CW55
X-Google-Smtp-Source: ADUXVKKtLTtUP83UKTCaY7jYBJH/hxvRU53QUYGG2kI9lQhllw0yGA+MCgEpvngMAibmdfW47rZktOoX6TrWzok5U8k=
X-Received: by 2002:a19:6550:: with SMTP id c16-v6mr49104lfj.31.1528738203452; 
	Mon, 11 Jun 2018 10:30:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:ea12:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 10:30:02
	-0700 (PDT)
In-Reply-To: <CAEUSe7-+VYOFA5X5fFR-=fsuzY_RREZ2V_myWTia=dDe7NkPZQ@mail.gmail.com>
References: <CAEUSe78jgx_SYGcPc87F7F80UwDDnnr06sy6hB8K=ha=j8TG9A@mail.gmail.com>
	<3149f073-f524-d9ce-ad7e-e8a7c09e4dc1@gmail.com>
	<CAEUSe7-+VYOFA5X5fFR-=fsuzY_RREZ2V_myWTia=dDe7NkPZQ@mail.gmail.com>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Mon, 11 Jun 2018 12:30:02 -0500
Message-ID: <CAEUSe7_AH1r9=g_HT-SYZXwyA3oWWxiJQ8z5GrYa31Uf21u0_A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH 1/2] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 17:30:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 16 May 2018 at 16:20, Daniel D=C3=ADaz <daniel.diaz@linaro.org> wrote:
> On 6 April 2018 at 15:43, akuster808 <akuster808@gmail.com> wrote:
>> On 04/06/2018 10:08 AM, Daniel D=C3=ADaz Rodr=C3=ADguez wrote:
>>> Ping on this series for Morty.
>> This needs to be ported to Pyro first. I do it this weekend and morty to=
o.
> Ping on this series for Morty.

Ping on this series for Morty.

--=20
ddiaz

