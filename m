Return-Path: <ticotimo@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5E49F72A85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 21:53:03 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so32801643igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 14:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SrcONOoQBMstSxwXof3Qwuy44f42DHz+FrVcj2RbqTs=;
	b=DSEFIlrg9WEahuJ1WgfY4IxQlRBOTDBst6Awwn2Mn86OHelo/CehYppOTF0oGTaNAv
	+IxD4BPy6ae0icPbRO6FqlTWz5pJIy4bfamJ6amCW4FzUYZ1IsjFJn4LDW8nMdM9QAYz
	n3yhxJI4j+fYWMuaKDq/H1Ko+KxNCiu0wFaeo9YR9BZ50ddw5WFPkWGWWUjlteSqQZvP
	9n9ZDNV9kneOmDKCRCzFz/qauGSJiTJ/Q0Xmrkdpebh1/BWRtXZ7etkvOTzUXmAo2q9y
	Wv7BlzscJe4FcM3naq/jHz/+fOyUYi+5LYmUZifUsi2oqdFs9OMfRZW86k1kr35HuSjD
	Bewg==
MIME-Version: 1.0
X-Received: by 10.43.171.70 with SMTP id nt6mr5629icc.73.1430257985028; Tue,
	28 Apr 2015 14:53:05 -0700 (PDT)
Received: by 10.36.106.202 with HTTP; Tue, 28 Apr 2015 14:53:04 -0700 (PDT)
In-Reply-To: <73D9548F-A53A-4223-B028-D116F8EDF929@gmail.com>
References: <CANx9H-COq8yNzRKWhksM88QiuKFbCCfHKPUEtsqsqMjpGMnXVQ@mail.gmail.com>
	<73D9548F-A53A-4223-B028-D116F8EDF929@gmail.com>
Date: Tue, 28 Apr 2015 14:53:04 -0700
Message-ID: <CANx9H-AQSAvAXvo0z_Dw3VzLNvku-vYju-UjaQ=ji=bo7cyaPw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][RFT] cogl/clutter/libinput/wayland/weston updates
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
X-List-Received-Date: Tue, 28 Apr 2015 21:53:04 -0000
Content-Type: multipart/alternative; boundary=001a11c2e33e22a3090514cfe371

--001a11c2e33e22a3090514cfe371
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 28, 2015 at 8:46 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Apr 28, 2015, at 8:25 AM, Tim Orling <ticotimo@gmail.com> wrote:
>
> The following branch includes updates to the latest releases for cogl,
> clutter, wayland, weston and libinput:
>
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=timo/cogl-clutter-wayland-weston-updates
>
> wayland and weston appear to be fine as tested on nuc.
>
>
> I have had wayland/weston updates lying on my tree for some time now
>
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=eb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b
>
> tried git versions too
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=992c13dcd4b79fe64f4f9b8122627f918257ccef
>
> There are problem with emulator with 1.7 and libinput I guess where the
> mouse does not work
> in qemux86 as well as qemux86-64, it works fine with 1.6, I have tested
> all versions 0.8 and newer of lib input
> for no success. That was the reason I did not propose those patches.
>
>
Khem -- I was not aware that 1.6 worked with qemux86 and qemux86-64. I
thought qemu had continued to be a non-starter :)

I was also not aware that you had them in a tree... I was assuming nobody
had looked at the updates.

Jussi --  I will take your suggestion for the udev location into account
for v2 if this goes any further.

--Tim

<snip>

--001a11c2e33e22a3090514cfe371
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Apr 28, 2015 at 8:46 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div style=3D"word-wrap:break-word"><br><div=
><span class=3D""><blockquote type=3D"cite"><div>On Apr 28, 2015, at 8:25 A=
M, Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">t=
icotimo@gmail.com</a>&gt; wrote:</div><br><div><div dir=3D"ltr"><div><div><=
div>The following branch includes updates to the latest releases for cogl, =
clutter, wayland, weston and libinput:<br><br><a href=3D"http://git.openemb=
edded.org/openembedded-core-contrib/log/?h=3Dtimo/cogl-clutter-wayland-west=
on-updates" target=3D"_blank">http://git.openembedded.org/openembedded-core=
-contrib/log/?h=3Dtimo/cogl-clutter-wayland-weston-updates</a><br><br></div=
>wayland and weston appear to be fine as tested on nuc.<br></div></div></di=
v></div></blockquote><div><br></div></span><div>I have had wayland/weston u=
pdates lying on my tree for some time now</div><div><br></div><div></div><d=
iv><a href=3D"http://git.openembedded.org/openembedded-core-contrib/commit/=
?h=3Dkraj/master&amp;id=3Deb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b" target=
=3D"_blank">http://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dkraj/master&amp;id=3Deb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b</a></div><=
div><br></div><div>tried git versions too</div><div><a href=3D"http://git.o=
penembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/master&amp;id=3D=
992c13dcd4b79fe64f4f9b8122627f918257ccef" target=3D"_blank">http://git.open=
embedded.org/openembedded-core-contrib/commit/?h=3Dkraj/master&amp;id=3D992=
c13dcd4b79fe64f4f9b8122627f918257ccef</a></div><div><br></div><div>There ar=
e problem with emulator with 1.7 and libinput I guess where the mouse does =
not work</div><div>in qemux86 as well as qemux86-64, it works fine with 1.6=
, I have tested all versions 0.8 and newer of lib input</div><div>for no su=
ccess. That was the reason I did not propose those patches.</div><br></div>=
</div></blockquote><div><br></div><div>Khem -- I was not aware that 1.6 wor=
ked with qemux86 and qemux86-64. I thought qemu had continued to be a non-s=
tarter :)</div><div><br></div><div>I was also not aware that you had them i=
n a tree... I was assuming nobody had looked at the updates.</div><div><br>=
</div><div>Jussi -- =C2=A0I will take your suggestion for the udev location=
 into account for v2 if this goes any further.</div><div><br></div><div>--T=
im</div><div><br></div><div>&lt;snip&gt;</div></div><br></div></div>

--001a11c2e33e22a3090514cfe371--
