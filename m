Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id CF03365DB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 15:56:37 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kx10so13259432pab.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 08:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=c+yaujwnKcIEtJt2cUWYDZc4EXMTlzBY1pYd/6TOKUI=;
	b=HyLBm7s9e+hx5LkVN5RZemonxsjw/rVL1HNtM82Sx2UQEc3B1obQ9q/Xw036p20nRu
	fLeMdeFA0u8qXMw/v4V7T4nSN+R4sEUS37tyqn187+D9oQzQRoYMtlCVo8NjIfBK1OmU
	u4k+hQ08yAUYOtu9xPHXQNNKaCBZK/BEu2D4UP4F7XZm+1Lgw8kUv9PDr3iQP9iHxBiT
	bAu4QnKd0DLgUwBskxPh6dojfJkjYbSG2XmS73TZ/gUzi1vmOJ1gMhjBJdcTyALLnEar
	1M2qpXbPd7R/5A9zI6NLTo5xJxicDe3mY4wTQPjJZxz91W2a/5xbZLLmTkIsS1Jep9Dh
	vSfg==
X-Gm-Message-State: ALoCoQnoHiDvUu2np5R/FmKHRM75plkuvHjoAFDJdHAz7UbMmbH9uB75LmmoXBAl1SJqycKxeuAq
MIME-Version: 1.0
X-Received: by 10.69.26.33 with SMTP id iv1mr5089448pbd.62.1407858999294; Tue,
	12 Aug 2014 08:56:39 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.136 with HTTP; Tue, 12 Aug 2014 08:56:39 -0700 (PDT)
In-Reply-To: <CAOMwXhPGNhr4RK+yz+BnsLskq0SRHYtsi9BMH_40wNgfkwurCg@mail.gmail.com>
References: <CAOMwXhMSMY6Bxzn7Qwmz-kUnFez_LkhSU7FArsoo0rdz6ZVifw@mail.gmail.com>
	<CAJTo0LYEYgWqTW7mmeonf=JVbH8hXrKhtBTsy_LfSRpuVZQ_tA@mail.gmail.com>
	<CAOMwXhOxf8x7ty2M4fnBN6yEbmVPbpwWZCeR-1BsEsH=Z9dX+w@mail.gmail.com>
	<CAJTo0Lazj1tj11_56hnuryzuKCszJqiSkK5TUXYof=YNdnG4Bg@mail.gmail.com>
	<CAOMwXhOYAEePg+RGmqOW1u-UsaD9cxQdW8+pdbUKf8GiYt9pWA@mail.gmail.com>
	<CAOMwXhPGNhr4RK+yz+BnsLskq0SRHYtsi9BMH_40wNgfkwurCg@mail.gmail.com>
Date: Tue, 12 Aug 2014 16:56:39 +0100
X-Google-Sender-Auth: IrfcINEOXshAHPq1PKu_0N3jtYg
Message-ID: <CAOMwXhPCm08GwCTCM_mQuS7P1menb=ORLfWcOEm+pwXQpeWvkg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding cgdb to meta
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
X-List-Received-Date: Tue, 12 Aug 2014 15:56:39 -0000
Content-Type: multipart/alternative; boundary=001a1134b6bc8c03cd050070b7d6

--001a1134b6bc8c03cd050070b7d6
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 12, 2014 at 4:55 PM, Laszlo Papp <lpapp@kde.org> wrote:

> On Tue, Aug 12, 2014 at 4:51 PM, Laszlo Papp <lpapp@kde.org> wrote:
>
>> On Tue, Aug 12, 2014 at 4:48 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>
>>> On 12 August 2014 16:46, Laszlo Papp <lpapp@kde.org> wrote:
>>> > That layer is too big. It is nearly everything that is rejected from
>>> meta;
>>> > ok there are some dedicated layers, like meta-networking, but it feels
>>> like
>>> > the last resort shelter where everything can just be thrown at.
>>> >
>>> > I do not think it is just us who do not wanna pull it into their
>>> project.
>>> > Never mind, it remains to be a feature in our layer, which is closed
>>> source,
>>> > then. It is a pity, but I will move along.
>>>
>>> People who think its too big are welcome to copy recipes out of it and
>>> sync them manually - that's still better than not sharing the recipe.
>>>
>>
>> I am unfortunately not interested in participating to something that I
>> have no intent to even test myself before submitting. meta-oe became a
>> monster can which I personally would not like to deal with. That is said
>> with due-respect. If its goal were reconsidered and split into several
>> small layers, then mayhaps... But it is not there, and I am not sure if it
>> was any soon...
>>
>> Unfortunately, this feature remains proprietary at the point of writing
>> this. As long as it works for me, I will not be too much bothered, although
>> I feel sorry for those who will need to reinvent the recipe, modulo
>> stabilization.
>>
>
> But that is alright as long as everyone else finds the IMHO cumbersome
> workflow with gdb OK for debugging. I think pleasant debugging is very
> important for developers, and cgdb is still a command line based tool,
> basically a thing wrapper on top of gdb with ncurses. It is not like "ddd"
> and other heavy tools. That is why I thought with minor addition, meta
> could be increase the software development experience; gdb is just way too
> raw to be effective. But again, no one else might share this opinion, so
> let us move on.
>
> Here is a reminder screenshot for those who do not know it, just in case:
> http://cgdb.github.io/images/screenshot_debugging.png
>

Alternatively, feel free to advise any sufficient debugging experience with
oe-core. I will happily switch to any opportunities that reach this level.

--001a1134b6bc8c03cd050070b7d6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Aug 12, 2014 at 4:55 PM, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
><div class=3D"h5">On Tue, Aug 12, 2014 at 4:51 PM, Laszlo Papp <span dir=
=3D"ltr">&lt;<a href=3D"mailto:lpapp@kde.org" target=3D"_blank">lpapp@kde.o=
rg</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
><div>On Tue, Aug 12, 2014 at 4:48 PM, Burton, Ross <span dir=3D"ltr">&lt;<=
a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel=
.com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div>On 12 August 2014 16:46, Laszlo Papp &lt;<a href=3D"m=
ailto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt; wrote:<br>


&gt; That layer is too big. It is nearly everything that is rejected from m=
eta;<br>
&gt; ok there are some dedicated layers, like meta-networking, but it feels=
 like<br>
&gt; the last resort shelter where everything can just be thrown at.<br>
&gt;<br>
&gt; I do not think it is just us who do not wanna pull it into their proje=
ct.<br>
&gt; Never mind, it remains to be a feature in our layer, which is closed s=
ource,<br>
&gt; then. It is a pity, but I will move along.<br>
<br>
</div>People who think its too big are welcome to copy recipes out of it an=
d<br>
sync them manually - that&#39;s still better than not sharing the recipe.<b=
r></blockquote><div><br></div></div></div><div>I am unfortunately not inter=
ested in participating to something that I have no intent to even test myse=
lf before submitting. meta-oe became a monster can which I personally would=
 not like to deal with. That is said with due-respect. If its goal were rec=
onsidered and split into several small layers, then mayhaps... But it is no=
t there, and I am not sure if it was any soon...</div>


<div><br></div><div>Unfortunately, this feature remains proprietary at the =
point of writing this. As long as it works for me, I will not be too much b=
othered, although I feel sorry for those who will need to reinvent the reci=
pe, modulo stabilization.</div>

</div></div></div></blockquote><div><br></div></div></div><div>But that is =
alright as long as everyone else finds the IMHO cumbersome workflow with gd=
b OK for debugging. I think pleasant debugging is very important for develo=
pers, and cgdb is still a command line based tool, basically a thing wrappe=
r on top of gdb with ncurses. It is not like &quot;ddd&quot; and other heav=
y tools. That is why I thought with minor addition, meta could be increase =
the software development experience; gdb is just way too raw to be effectiv=
e. But again, no one else might share this opinion, so let us move on.</div=
>

<div><br></div><div>Here is a reminder screenshot for those who do not know=
 it, just in case:=C2=A0<a href=3D"http://cgdb.github.io/images/screenshot_=
debugging.png" target=3D"_blank">http://cgdb.github.io/images/screenshot_de=
bugging.png</a></div>
</div></div></div></blockquote><div><br></div><div>Alternatively, feel free=
 to advise any sufficient debugging experience with oe-core. I will happily=
 switch to any opportunities that reach this level.=C2=A0</div></div><br></=
div>
</div>

--001a1134b6bc8c03cd050070b7d6--
