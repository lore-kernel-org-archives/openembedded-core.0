X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <b5a9511d-8092-7029-f34c-8628932d8a95@pr.hu>
Date: Thu, 24 Feb 2022 13:59:02 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] gtk-icon-cache: Allow using gtk4
References: <20220224072343.1262534-1-zboszor@pr.hu>
 <CAAnfSTvbo-e73Ea6i3dZ0c4tH9LYk2VjJ7znhuo_SJvMkLQ4Lw@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <CAAnfSTvbo-e73Ea6i3dZ0c4tH9LYk2VjJ7znhuo_SJvMkLQ4Lw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org, =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>

2022. 02. 24. 13:48 keltezéssel, Ross Burton írta:
> On Thu, 24 Feb 2022 at 07:23, Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org> wrote:
>> +            ${@['${GTKPN}', '']['${BPN}' == '${GTKPN}']} \
> 
> I know this was the syntax originally here, but please change this to
> use the "a if b else c" syntax used elsewhere.

I will send a new version, thanks.

> 
> Ross
> 
> 
> 
> 
> 

