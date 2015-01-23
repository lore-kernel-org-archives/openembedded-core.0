Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 24C966AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 16:29:33 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id 29so3766910yhl.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 08:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=KdcYzRpWpymCO68oDGPST6vhWptA7NQo3L3NZP5sYyU=;
	b=BogFYdXkn2JuJ7Tz+bIZNbyFl5oN9JQ2Dac8CuuibTmvZt+aVGg41CYk2qtFr7VHZY
	IC7KXkBpwiDJY9vM4ug5fLPaeBWP7Vysq4Q+Erz0tXfhuJA1G+kjIru9biVLDWN5vldo
	nrxRoB0W+EUwosbfqstFNtdVXjVdxMQeb5ogOGfGBFd7bnhySB20ceBCjhxIjJe3AfJT
	IjkJHtrOat0qNQgX6wU/V63zu3zOCHFTl20dRF6xRswAqAdFs8nC3v/w53aJQL9TrDx/
	6AhmIwbhUgJne4yaSuJXxjF14T3ngShF6xshTTorlpHTcD37urs0P3v0EzKz+9Huq74O
	l+/Q==
MIME-Version: 1.0
X-Received: by 10.236.28.129 with SMTP id g1mr3736440yha.90.1422030574132;
	Fri, 23 Jan 2015 08:29:34 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Fri, 23 Jan 2015 08:29:34 -0800 (PST)
In-Reply-To: <CABcZAN=pfOo74AmmtTkwPy4_Z5nVfA4JhBaU807KFEP=F7e5_g@mail.gmail.com>
References: <54C1AE00.6010402@windriver.com>
	<CAP9ODKrqNOqQ1_d7iJRAcpNQgEbeNg=Ve1SLob1m2k2xZX4DkA@mail.gmail.com>
	<CABcZAN=pfOo74AmmtTkwPy4_Z5nVfA4JhBaU807KFEP=F7e5_g@mail.gmail.com>
Date: Fri, 23 Jan 2015 14:29:34 -0200
X-Google-Sender-Auth: 5f_3Sy8BP9TMc15h4Nxqdb6yggE
Message-ID: <CAP9ODKqxa5Te3UD=vr5M-RknNp-Ewvmy7SOpPk-bA5CHpyQQHg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] About GPLv2's native recipe
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
X-List-Received-Date: Fri, 23 Jan 2015 16:29:41 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 23, 2015 at 2:24 PM, Christopher Larson <clarson@kergoth.com> wrote:
>
> On Fri, Jan 23, 2015 at 5:47 AM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> On Fri, Jan 23, 2015 at 12:12 AM, Robert Yang <liezhi.yang@windriver.com>
>> wrote:
>> > We have several GPLv2 recipes such as m4-native_1.4.9.bb, while we also
>> > have GPLv3's m4-native_1.4.17.bb, I think that we can remove
>> > m4-native_1.4.9.bb if the target m4_1.4.9.bb builds well ?
>> >
>> > I'd like to remove it because we don't build the lower native version by
>> > default, and we don't know whether it works or when it would fail.
>>
>> I second this; not tested recipes are always good to remove.
>
>
> The one case I'd be concerned with is where a native tool is used to
> crosscompile something for the target, specifically in the case of scripting
> tools which often have implicit dependency on the exact same version, so it
> can parse what it needs to parse to build. Python for example, I doubt you'd
> want to try to use 2.4 as part of the 2.7 crosscompilation process. m4 being
> a scripting language, that might be the case here. Of course, if the
> language is compatible between the two versions, maybe that's a non-issue.

In this specific case, being m4 changed only minor versions it should
be backward compatible.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

