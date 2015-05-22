Return-Path: <vomegaz@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id E213970A7C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 13:02:41 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so39840208wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 06:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5E0WigEjwa8gv63qSZFfbwPsgVXn5/Ow7i5sviDc2CI=;
	b=WNYKhG4mzhwXnZMq4xLdLk69H7zgzsNFc1qcvpBGNJ73AXzezVDXbDMH5laVBlYLf9
	qIrP2h1UgixE8p6jgVIEqNMms9oHeVVtC7Z7u8YKRPvOlXjQX59uVIkIwzOGOLvlkdNU
	F4N9KbzN4jNoWPA2Fvbag70B2honM1giJN9PK7TeZZ4XeNksDypeyrSORz7/k1eBfYIO
	1gLISiPvi6k4jAzYakhBnT/4p0pL/UWEEHLOSiarTIXtJQlysuM3QOjWWuks+jKB2XCM
	Su9iUfBJ+2VznODSrizLkSyY8/7sIN6jo/ujtsAjYeE2RTC7Kf6uB/NX6MY1vw1eAYDK
	WtaQ==
X-Received: by 10.180.88.72 with SMTP id be8mr7438532wib.45.1432299762726;
	Fri, 22 May 2015 06:02:42 -0700 (PDT)
MIME-Version: 1.0
Sender: vomegaz@gmail.com
Received: by 10.28.9.73 with HTTP; Fri, 22 May 2015 06:02:02 -0700 (PDT)
In-Reply-To: <CAP9ODKprXP3_O41a7HAenLXPuJAGTOz0_1bF0xyud+vRvxJcRA@mail.gmail.com>
References: <1432289348-5624-1-git-send-email-thomas.perrot@tupi.fr>
	<CAP9ODKprXP3_O41a7HAenLXPuJAGTOz0_1bF0xyud+vRvxJcRA@mail.gmail.com>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Fri, 22 May 2015 15:02:02 +0200
X-Google-Sender-Auth: VjPl6rPpc-Gz5jCnst3muM2hCt8
Message-ID: <CAGXeWgkEspQ4aK4rXfabQvHCXa+B-KvgWzkL96d86PRisc+sdg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-serialgetty: Remove SERIAL_CONSOLE definition, because it depends of machine definition. Set it, here, can be make the value is not good.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: thomas.perrot@tupi.fr
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 May 2015 13:02:43 -0000
Content-Type: text/plain; charset=UTF-8

Hi Otavio,

If the machine layer definition is applied after meta-systemd also
with a default setting operator instead an affectation, this var will
be bad initialized. It's the case with meta-raspberrypi layer.


On Fri, May 22, 2015 at 1:11 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, May 22, 2015 at 7:09 AM, Thomas Perrot <thomas.perrot@tupi.fr> wrote:
>> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
>
> Nack! The setting here is the default if machine does not define it. I
> see no benefit in dropping this.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

