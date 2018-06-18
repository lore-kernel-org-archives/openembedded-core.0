Return-Path: <daniel.diaz@linaro.org>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 222877523B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 19:20:49 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id v84-v6so3219118lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 12:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SQYu+DD1h10I2UEet4ee5+A5KeXUSnsWimFS0t8Ym6c=;
	b=AQ9mZRtyggbQXrPiJHC3FPbdPvh/jMSMDIQGMzqA+SEL8xazRbgL+VTB236mJEwqF+
	Fz1KLb4Gqzifg/3jq6gaeG4b//aJXi8VoCnfjficmnE4c3cnSgrn/2sAp6j8mdTxNzQw
	zkSq+LLm74g7iy9TQRT6GuaFx+IEDN8Cm78zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SQYu+DD1h10I2UEet4ee5+A5KeXUSnsWimFS0t8Ym6c=;
	b=PUP+7rL3TfcJn5Hl5ZXsPYrSUFwjNho+SL+BcRkEmW18vZoGT3oBbNsoEJao2ui4Yw
	4+of135n0YWEneQoOGw+e6G5qUy/XOl8v99X3KzQ8NWdxYr+PiqTIIMpJQglAb1phpyI
	t4FkUE1t3Cf1rKtNvwhq5JoYgHG0+Ijz+aksNEI49d8O1UUeFBbrQjcoZbpW849zEunF
	V8frZ7b+TVtaDZcDbHkGOzyV8aXctReOwXN9+NfmgSa9P+lXCvZ9p9xujN4RuaOOcx3Q
	+Do9I/9g7a2rHU80fwiUN8vm7Ju/Nycxji2XOK0IfV4oLbTk9dFp/yTYWSErs/VH9mEU
	2eUQ==
X-Gm-Message-State: APt69E0CmjUuhGgJKR7SihabhdRLjnR/K56IinFj62jxuAiwpNMKGget
	dzDyy5KOt1A0KPUUsdGjODOu80ce02ER4Hrst4RIIQ==
X-Google-Smtp-Source: ADUXVKLKqE6Tg/3dWg92UmykCdxrnejDLPPiHrMMhdLrmnZWWsnopas4p4HrdLtPPFkuByNoO//Nm5drsPtlJMeHk80=
X-Received: by 2002:a2e:6e19:: with SMTP id
	j25-v6mr9371633ljc.61.1529349650560; 
	Mon, 18 Jun 2018 12:20:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:ea12:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 12:20:49
	-0700 (PDT)
In-Reply-To: <CAJ86T=WsQL-sH_Q75nhV_7U_68RENKeePTLQwPTqDZ7zwvHq6Q@mail.gmail.com>
References: <CAEUSe78jgx_SYGcPc87F7F80UwDDnnr06sy6hB8K=ha=j8TG9A@mail.gmail.com>
	<3149f073-f524-d9ce-ad7e-e8a7c09e4dc1@gmail.com>
	<CAEUSe7-+VYOFA5X5fFR-=fsuzY_RREZ2V_myWTia=dDe7NkPZQ@mail.gmail.com>
	<CAEUSe7_AH1r9=g_HT-SYZXwyA3oWWxiJQ8z5GrYa31Uf21u0_A@mail.gmail.com>
	<11604122-a4df-e93c-6f34-baa7fe733723@gmail.com>
	<CAJ86T=WsQL-sH_Q75nhV_7U_68RENKeePTLQwPTqDZ7zwvHq6Q@mail.gmail.com>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Mon, 18 Jun 2018 14:20:49 -0500
Message-ID: <CAEUSe7-NkJJR=ppBd5AoahaRygd4CrcbwgeLTo5VLcWXEiiX2w@mail.gmail.com>
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
X-List-Received-Date: Mon, 18 Jun 2018 19:20:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!


On 11 June 2018 at 16:46, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Jun 11, 2018 at 2:38 PM, akuster808 <akuster808@gmail.com> wrote:
>> On 06/11/2018 10:30 AM, Daniel D=C3=ADaz wrote:
>>> Ping on this series for Morty.
>>
>> this is in the stable/morty-next branch which is on hold for the current
>> morty QA.
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dstabl=
e/pyro-next&id=3D76ffc6b7e5ff6f2bab6e53bb07f52a25fcb81ac9
>
> That's a link for stable/pyro-next.
> The change doesn't seem to be in stable/morty-next though:
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dstable/morty=
-next

Is there anything from my side that needs to be done for this patch?

Thanks and greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org

