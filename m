Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id BD7DA71DDA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 12:37:23 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id l74so22109589ywe.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 05:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cfROMHVP2N4yXpkSFFWhSfRF3UR25NZcmyCri2X71MI=;
	b=F6LVHXxUv1HX4BzZrvthmYfIB0a/ozXFweRps+Lg+yQagDF22HIiKiU33kCoKCALQs
	IB9UMEIFERil1ZjrkBnvn9xQffpCQ700y0pPA5dKSnNzoATbkZsD5PEumCEaBiNjwUvK
	nQC274uoSy3oKgrAP7idNpot8dPTj8wyE/SP4LegASXmONbFnq+99wliONu9nDEJmu92
	+bpV9CDxjmAJRmPD3vPInSV39JiH9l4jkM4b3T6Da1iPIdaFVGtLEytWIQn0yKBszx+C
	pgtKufHdfmG/gRjXYBPhlDQFoW7M9lJyT6adxG7bmFUhSziGZm0VlS72TKNnMKoSvgTd
	UQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cfROMHVP2N4yXpkSFFWhSfRF3UR25NZcmyCri2X71MI=;
	b=OVqr4dPPG98992lJX5T2oVMAaNZQvuVIcYs74CNMV/JKGougo9rU0iVzJvxUcsWXGK
	sh9YgLtNgh+SdgwGEtnkvXNtRon51xkhYeOqE6XphQJEjArDXoFxQppqddstA8RPSuRi
	qxW9pkhc3T/8jbe/TpEpjGA+IjtsS7WHzRPusN47vuTDHTEbWMSWNzIb53KNtJuwcnHO
	kLl/j29MxwfnO2RQmgMWqvYKNxkGNJD/fw2GSeCyrMuAi44qHzE2nxLLvvvvFTXr8Nh0
	WEZeBkBtTFr8KNJbKlmazL2zBG56SqG5ujbwbXon1isfnbDNBQfnudHd/qoEuoTmS79j
	kGMA==
X-Gm-Message-State: AODbwcAjkeElTPhNXDhSiyxjtw42LChPpoGC38MTLp2ZJZM2Dpf722Ff
	ULz24yImTnLCXE1AAHXqUXPg505vWmVq
X-Received: by 10.129.53.143 with SMTP id c137mr5110560ywa.14.1494851844621;
	Mon, 15 May 2017 05:37:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.194.134 with HTTP; Mon, 15 May 2017 05:36:54 -0700 (PDT)
In-Reply-To: <63467164-76aa-2aa7-efab-ec82251b7aaf@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
	<19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LZ2vUt4y4YByOEJwW-6ctS_HTKJJbNTGx_yisiwsGTUDQ@mail.gmail.com>
	<63467164-76aa-2aa7-efab-ec82251b7aaf@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 15 May 2017 15:36:54 +0300
Message-ID: <CAHiDW_Hzk8mXfRtJFf6gdeQcSCtXp6G-n0ngbB-Dj4XdDPGNyQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Mon, 15 May 2017 12:37:24 -0000
Content-Type: multipart/alternative; boundary="001a1142263a31091b054f8f51d9"

--001a1142263a31091b054f8f51d9
Content-Type: text/plain; charset="UTF-8"

On 11 May 2017 at 10:53, Alexander Kanavin <alexander.kanavin@linux.
intel.com> wrote:

> On 05/09/2017 12:24 PM, Burton, Ross wrote:
>
>> The development of Wayland does make the long-term prospect of Sato
>> interesting: do we port Sato to Wayland too, or keep the Wayland images
>> using the standard Weston demo shell?
>>
>
> There is a third option: find a functional, pretty, lightweight wayland
> shell, and provide that. I think the prime candidate for that at the moment
> is Maynard, but it has its own issues, mainly that upstream isn't really
> developing it anymore. Jussi is OOO this week, maybe he can add his 2c a
> bit later.
>
> https://github.com/raspberrypi/maynard/wiki


You pretty much said my 2c: Maynard wouldn't need that much development and
maintenance to be useful as a minimal DE that scales to different devices.
Unfortunately it's not getting the love and care it needs. Writing wayland
compositors/desktops seems to be common pastime so I'm a little sad someone
hasn't picked up Maynard as their hobby project.

Even if Maynard was maintained it would fill a similar niche as Sato now
does for X: not something we'd especially expect people to ship on products.

Jussi

--001a1142263a31091b054f8f51d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
1 May 2017 at 10:53, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanavin@=
linux.<wbr>intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><span>On 05/09/2017 12:24 PM, Burton, Ross wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The development of Wayland does make the long-term prospect of Sato<br>
interesting: do we port Sato to Wayland too, or keep the Wayland images<br>
using the standard Weston demo shell?<br>
</blockquote>
<br></span>
There is a third option: find a functional, pretty, lightweight wayland she=
ll, and provide that. I think the prime candidate for that at the moment is=
 Maynard, but it has its own issues, mainly that upstream isn&#39;t really =
developing it anymore. Jussi is OOO this week, maybe he can add his 2c a bi=
t later.<br>
<br>
<a href=3D"https://github.com/raspberrypi/maynard/wiki" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/raspberrypi<wbr>/maynard/wiki</a></blo=
ckquote><div><br></div><div>You pretty much said my 2c: Maynard wouldn&#39;=
t need that much development and maintenance to be useful as a minimal DE t=
hat scales to different devices. Unfortunately it&#39;s not getting the lov=
e and care it needs. Writing wayland compositors/desktops seems to be commo=
n pastime so I&#39;m a little sad someone hasn&#39;t picked up Maynard as t=
heir hobby project.</div><div><br></div><div>Even if Maynard was maintained=
 it would fill a similar niche as Sato now does for X: not something we&#39=
;d especially expect people to ship on products.</div><div><br></div><div>J=
ussi</div></div></div></div>

--001a1142263a31091b054f8f51d9--
