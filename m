Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5095B78C85
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 21:46:49 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id o17-v6so13194812vka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 14:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pj0Bt+uc+Ui4VdiDaOa5AEOMIIL6vRLEbWIHG8OAUVA=;
	b=Pka1FY9/y/QodEIKUF/N3+70rQA9kxUzC8sAffE/WPnPjBirTiXcV3XOr+qZ9SEVEC
	pQ1/359QuB69yUyq228TsVZIBhs7AS3X/TpUsOKu0gwKtN8gEobLgGgymKzLghDoGuTx
	lK3ffYf1mWT7SpMsdsMjDBNOsj9ZCrVmfwmu9I1z4rjhTl89m4t3Hfc8hVthwMqoGj/Q
	ZoCjLHO7AVwkHuKcptL111+73hMNIKoyOzagfnddkW2DB3AkcZ1w3Rzyx8W89AdjucHY
	gS+Ay+H7JU1p5bgsXODD2kiQjgHWXS8Rz+MhbjCc9DP0xuJu2Mu38w2a/1QDKOtN/wEI
	D4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pj0Bt+uc+Ui4VdiDaOa5AEOMIIL6vRLEbWIHG8OAUVA=;
	b=HdsphDXSpGmGEqFx/RSkaX3ZZmXwlllARKCwgT7MFEr4PvKk5sfaO8jbCIfElOUBgQ
	HDcACaSKxiip16ChzbGKluRS+6Yh0HjuPlFHu2X/CuMTFATaH/bk3m9M/QqbqMRCEMqy
	MGyY1XmLMtBd138ExemsaK9ufhLrWyBzuZSbSHMkeb8QnFYYVkN2KmCcdryQ2G/Kr0le
	GNI/42mb1ga/GbqmNYnwIt2vbG6ZmiA3QPLwzNyGApoINm1AzK9NcIkcLdjrgJ0o8yQD
	X9DypxMTkLYXbFdfZqkGwLDIji5G8YTkyt+AMB9zbErZzdJ/fnGsKL8WTn5EddZ1uCGq
	G4Jg==
X-Gm-Message-State: APt69E040XEMl3Ac+qZPqHlrS9E0iIN9wcvZZOTl9XvNoZXut8vRp7fw
	DsTZ5jIdVf5b6gmTwwTWLfMPaKK2cOIcgq/VwFI=
X-Google-Smtp-Source: ADUXVKI5vrbdhyzE5KE25gcXf7mDEA07Y0Gz5zyeO+kDFCYgIZpFhtWha7eaoJKG5o07Ce9KK9ikmw2s0AalyxkpNlg=
X-Received: by 2002:a1f:9615:: with SMTP id
	y21-v6mr586926vkd.154.1528753610235; 
	Mon, 11 Jun 2018 14:46:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Mon, 11 Jun 2018 14:46:49 -0700 (PDT)
In-Reply-To: <11604122-a4df-e93c-6f34-baa7fe733723@gmail.com>
References: <CAEUSe78jgx_SYGcPc87F7F80UwDDnnr06sy6hB8K=ha=j8TG9A@mail.gmail.com>
	<3149f073-f524-d9ce-ad7e-e8a7c09e4dc1@gmail.com>
	<CAEUSe7-+VYOFA5X5fFR-=fsuzY_RREZ2V_myWTia=dDe7NkPZQ@mail.gmail.com>
	<CAEUSe7_AH1r9=g_HT-SYZXwyA3oWWxiJQ8z5GrYa31Uf21u0_A@mail.gmail.com>
	<11604122-a4df-e93c-6f34-baa7fe733723@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 11 Jun 2018 14:46:49 -0700
Message-ID: <CAJ86T=WsQL-sH_Q75nhV_7U_68RENKeePTLQwPTqDZ7zwvHq6Q@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 11 Jun 2018 21:46:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 11, 2018 at 2:38 PM, akuster808 <akuster808@gmail.com> wrote:
> On 06/11/2018 10:30 AM, Daniel D=C3=ADaz wrote:
>> On 16 May 2018 at 16:20, Daniel D=C3=ADaz <daniel.diaz@linaro.org> wrote=
:
>>> On 6 April 2018 at 15:43, akuster808 <akuster808@gmail.com> wrote:
>>>> On 04/06/2018 10:08 AM, Daniel D=C3=ADaz Rodr=C3=ADguez wrote:
>>>>> Ping on this series for Morty.
>>>> This needs to be ported to Pyro first. I do it this weekend and morty =
too.
>>> Ping on this series for Morty.
>> Ping on this series for Morty.
>
> this is in the stable/morty-next branch which is on hold for the current
> morty QA.
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dstable=
/pyro-next&id=3D76ffc6b7e5ff6f2bab6e53bb07f52a25fcb81ac9

That's a link for stable/pyro-next.

The change doesn't seem to be in stable/morty-next though:

  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dstable/morty-n=
ext

