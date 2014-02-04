Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id A931E6E8FC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 11:46:19 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fa1so8374363pad.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2014 03:46:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=c349hj5aa14IJaalDRi/8niJOGeBAYfWBg681LjtvLk=;
	b=EFR2LFSUYktJ1SA7ay381vRF8zJ6iJqaj15URJuzK9OO/IsnIttKuXM4Qbkt1RZtzH
	hrrqZvupXPZ28CRCDY0jmiMCzLYTNF52Mf/O5uBCncUsfprxjx9A4rtEKpF+4Z6+m+vM
	dgiJlFvpW2BynjhybioNwt0XhOLRmICUc5w9gxS75sVrWyTqMVmJuVswKNkbfoH/FI3N
	60Hcm8LRKbaPTYhpookcSoBU62SnhXwmM/zgGxfcwWQZwkBOGocUL/627Hn4lo+b7HbB
	Qmm/P/3hXtyGvNZ/DqksEfo/CF2LKh6/4ouekz4hi35FV3LYuLAuN3yqCS/0CZZDItVf
	5Jhg==
X-Gm-Message-State: ALoCoQmmM+MlcNLnPIvoPpw3ai5+YFs28ZvbRpm+jNlOjMnaq/2Ch/tsjVc439n9A305iea6Hoco
MIME-Version: 1.0
X-Received: by 10.69.31.97 with SMTP id kl1mr18779340pbd.62.1391514379984;
	Tue, 04 Feb 2014 03:46:19 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.21.228 with HTTP; Tue, 4 Feb 2014 03:46:19 -0800 (PST)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16CFC973@IRSMSX105.ger.corp.intel.com>
References: <CAOMwXhPNi357C8BvFjvVYtQUDepu5VK-c1phR=5UseZg79uJ6Q@mail.gmail.com>
	<CAOMwXhOH0m9PNL10c6gBNhCK+iMoiVtujX1_N3i2KaBAYBgFeQ@mail.gmail.com>
	<1391245344.28575.19.camel@ted>
	<CAOMwXhPwZyCbb3KR-_YZdqRfTaTcnwCazMYAqi1Vch7CeNqWuw@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CFC973@IRSMSX105.ger.corp.intel.com>
Date: Tue, 4 Feb 2014 11:46:19 +0000
X-Google-Sender-Auth: 3U1PViUznzN9mbhWPPxyMCOCZoI
Message-ID: <CAOMwXhMAAO43KMOqSkC9tObcsodFmeyYcSrfNKym4j3U2qo1Uw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Putting fltk into oe-core (recipes-graphics)
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
X-List-Received-Date: Tue, 04 Feb 2014 11:46:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Cristian,

yes, you are right in my opinion; thank you for your follow up!

The demo is very impressive, and as you say, "native theme and look"
does not matter much on real embedded device, i.e. not generic
computing mobile platforms - that are more powerful than some of the
old, but still existing desktop machines - with its own UX design
guide... Basically, the theme is what you define is, so I do not see
issues in there. :-)

In my experience, you would try hard to avoid X or even wayland on
such devices in favor of framebuffer, etc. The problem, I see, I would
need to grab a somewhat large "oe" layer to make a minimal UI on a
real embedded device. That is not going to happen any soon. I would
rather maintain my own fltk recipe in our layer instead.

As for the touchscreen, yes, I would be actually interested in using
fltk for touch screen devices. In fact, I already have some code, so I
am just looking into the option to get the necessary libraries
deployed by the Yocto project and openembedded-core.

If you ask me, and I can throw my two cents in, qt and gtk are lotta
more heavy and should not have made their way into oe-core IMHO, but
perhaps it is only there for compatibility now.

I mean, I would be fine with any good lightweight libraries on oe-core
for creating minimal touch guis and that kind on minimal embedded
devices, but I currently see no other option than writing your own ui
kit with raw opengl, perhaps using glew from oe-core, etc. Suggestions
would be welcome. I think oe-core could have this responsibility, but
I will leave that with the maintainer...

Cheers, L.

On Tue, Feb 4, 2014 at 7:47 AM, Iorga, Cristian
<cristian.iorga@intel.com> wrote:
> Hi Laszlo,
>
> Maybe adding more information will make the case for it.
> For example, the fact that is used in a lot of OSS.
>
> A very good demo of the possibilities of FLTK is Giada, "A Hardcore Loop Machine"
> http://www.giadamusic.com/
>
> In my opinion, it is one of the best looking apps written using FLTK for the graphical interface.
> Also, judging from the screenshots, I think it should be interesting to use it with a touch interface.
> However, I don't have any info regarding how well FLTK behaves in this aspect.
> Example screenshot: http://www.giadamusic.com/screenshot-09
>
> Also, while Giada looks complex and with a lot of functionality built-in, the source code seems neat and tidy, which might be an argument regarding the fitness of FLTK in the embedded space.
> Giada's authors takes pride of the facts that the source code contains around 100 files and has around 30KLoC.
>
> Now, in my opinion, what is a little bit "strange" regarding FLTK is that it doesn't "fit in", because it doesn't have a native look'n'feel on any of the supported platforms.
> But that's not really an issue in an embedded device, where FLTK might power up the only GUI needed for that particular device.
>
> Regards,
> Cristian Iorga
> YP
> Intel
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Laszlo Papp
> Sent: Monday, February 3, 2014 6:04 PM
> To: Richard Purdie
> Cc: openembedded-core
> Subject: Re: [OE-core] Putting fltk into oe-core (recipes-graphics)
>
> On Sat, Feb 1, 2014 at 9:02 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>> On Thu, 2014-01-30 at 18:46 +0000, Laszlo Papp wrote:
>>> Ping?
>>>
>>> I asked this a bit more than five months ago. Shall I take it as "No"?
>>
>> The lack of responses does indicate that its not something there is
>> strong support for so I don't think fltk will be moving, correct.
>
> Currently, I do not see any minimal gui library in openembedded core for building some simple GUI on real embedded devices, but OK.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

