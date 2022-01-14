X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <e6593f8d-fc05-c3bc-77b0-2eab3898f29f@pr.hu>
Date: Fri, 14 Jan 2022 13:41:14 +0100
MIME-Version: 1.0
Subject: Re: [yocto] [OE-core] Question of Yocto dunfell LTS period
References: <CGME20220114011350epcas2p16efb8acbdc4d9edceee83569e10cc359@epcas2p1.samsung.com>
 <000801d808e3$fcea94e0$f6bfbea0$@samsung.com>
 <CAPphmgbonScBvk-DC1Zvv5ydYSDpiRMFGevZ1Pkr9hAcgWrjgA@mail.gmail.com>
 <25c45fe6-b268-6054-0537-d2af1c0335ea@bootlin.com>
 <CANNYZj_Zc25Ff7Kx6kgO13tvfkdQH_vHQUFezsCyJiBGddPj9Q@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <CANNYZj_Zc25Ff7Kx6kgO13tvfkdQH_vHQUFezsCyJiBGddPj9Q@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Jate Sujjavanich <jatedev@gmail.com>, chanho61.park@samsung.com, OE-core <openembedded-core@lists.openembedded.org>, Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, Yocto-mailing-list <yocto@lists.yoctoproject.org>

Funny you mention PR.

It would also help if recipes staying on the same version
but adding patches for e.g. CVE fixes should increase their
PR value so their rebuilt versions can be put into a package repo.

Throwing away the buildroot (as suggested any time some obscure
build error happens) and restarting a complete image build
resets the autopr value so the repo would contain packages with
the same r0.0 release string and the package manager doesn't know
that the package is newer.

2022. 01. 14. 10:42 keltezéssel, Alexander Kanavin írta:
> Actually, I think this was some kind of missed PR opportunity. Regular distros, such as 
> RHEL, Debian and everyone else, are constantly trotting out their support windows as the 
> reason to hand them the job of making products, so we could counter that better perhaps.
> 
> Alex
> 
> On Fri, 14 Jan 2022 at 06:28, Michael Opdenacker <michael.opdenacker@bootlin.com 
> <mailto:michael.opdenacker@bootlin.com>> wrote:
> 
> 
>     On 1/14/22 2:36 AM, Jate Sujjavanich wrote:
>      > I received the answer to this question in IRC on 10/29/2021.
>      >
>      > 16:06
>      > <https://libera.irclog.whitequark.org/yocto/2021-10-29#31083490
>     <https://libera.irclog.whitequark.org/yocto/2021-10-29#31083490>> <jatedev>
>      > I saw a wiki edit that said dunfell's LTS period is now through April
>      > 2024, but I've seen no announcements. Any truth to this rumor?
>      > 16:20
>      > <https://libera.irclog.whitequark.org/yocto/2021-10-29#31083555
>     <https://libera.irclog.whitequark.org/yocto/2021-10-29#31083555>> <smurray>
>      > jatedev: it was announced on one of the technical calls a few weeks
>      > back, so yes AFAIK
>      > 16:25
>      > <https://libera.irclog.whitequark.org/yocto/2021-10-29#31083577
>     <https://libera.irclog.whitequark.org/yocto/2021-10-29#31083577>> <RP>
>      > jatedev: definitely true. I wish we could sort out the project
>      > advocacy side of things :(
>      >
>      > Let this email serve as a little advocacy.
> 
> 
>     I believe this would also help if the website (releases page) and/or
>     official documentation carried such information.
>     Thanks for raising this concern!
>     Cheers
>     Michael.
> 
>     -- 
>     Michael Opdenacker, Bootlin
>     Embedded Linux and Kernel engineering
>     https://bootlin.com <https://bootlin.com>
> 
> 
> 
> 
> 
> 
> 
> 

