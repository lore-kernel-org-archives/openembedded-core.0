Return-Path: <wallinux@gmail.com>
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
	[209.85.166.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC896073A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 12:39:00 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id i7so23580750ilr.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 04:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ut2rxG0Fxz81UjVRIeNU9kmGBnHawPdcCyHXoRd1410=;
	b=m+rXIhgMTlCkLfK1LG4RK9wtwvhWsQgpDXNGlAUD8tJE5eDAD6hF1G0sctSlzVwyok
	dxI4ZcYcv/8zPhVLQZ1oltow/t+4zcNwMZxMaqmT1Y1oNBZkBOWqZnNTinOSSW2iEAPx
	0+AG6UmEpeH3gukzLmtzc7j8vGUwxEFqMPnUBJhAJpyhtjmbiOhpIVLVvtWbGMOyXXv0
	cSCOVNG0kUFX2uxUotivyvMapLaR6Oju+rjtq7RLpZ7z1Bau9RN7TGACe3aJwrzj6xTx
	nYrU5lJA4hbYYXXwhTY7tKoHYtb1fc36lWNzukFLQEqUjdL+U7TbjgEPJAA9RE6mxmu9
	4gCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ut2rxG0Fxz81UjVRIeNU9kmGBnHawPdcCyHXoRd1410=;
	b=Dw1Du2CjI7Ki2abQNlQz9COqeIgIyUBhdzat6IV3mEFstUVB+JF1PaZN5BnfEQi3zh
	9kPA5XB1P2e/jQ7uJM0w2gTz+vAKpabTXtnfZQAkZ8a02A4q2luTNSTN+Ygf0dtyPGGW
	Q74+ylXuBDpmVBYPIcuphnko/IDhCNh9cT/cGKrpl6UOtHcHqU/alekCwhmOmuQc2tm4
	tJ+/LppfBYxJbdx5Pdl+LkWo4ux0E8tEsUBJddgEtm+Ork9RqfTRSDb2sf9pNh4qVlwi
	ecPID43sgRxJd6g6ifTF/yfcwdTHD3hqeFbQ3xOYuQBRVhW+oqvnkJRA2u539JqvjjeS
	GKfw==
X-Gm-Message-State: APjAAAXkk0Q0DRQsYSgDF9S/3fRKXiNYfPKesNOwXnnsNkDmpT+2NOdV
	Su9IU3iTeYUHcQ3kNMBTzMlth8Qk5C5JzqajDnU=
X-Google-Smtp-Source: APXvYqwCLfc96djh2NXHYrkVsqR7J0sBeycnsAlEWP6EboZxWZlS2lBZ0gWJT0HjW6Nvsliu6NhfjrOxX85GL5Rt40w=
X-Received: by 2002:a92:5a86:: with SMTP id b6mr30461293ilg.108.1582202341211; 
	Thu, 20 Feb 2020 04:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20200218132054.20341-1-wallinux@gmail.com>
	<CANNYZj9nm0eqo0NtHhEJiw7nLbnYQ8r1aazXk6mGn83VXc9VNA@mail.gmail.com>
	<CAF2baFdCF-NVmUa=meNhAN5BDBqLcS4k7F+EBWtUA1ekY6OVBg@mail.gmail.com>
	<20200219152720.GM17818@joraj-alpa>
	<143f590b688ed8166a702873275c16f3c7217d52.camel@linuxfoundation.org>
	<20200219155626.GN17818@joraj-alpa>
	<CANNYZj9t2+ugT15XbYrqkgA23MHEQxy_9t=PnutoCQr2f0AA-A@mail.gmail.com>
In-Reply-To: <CANNYZj9t2+ugT15XbYrqkgA23MHEQxy_9t=PnutoCQr2f0AA-A@mail.gmail.com>
From: Anders Wallin <wallinux@gmail.com>
Date: Thu, 20 Feb 2020 13:38:50 +0100
Message-ID: <CAF2baFcN_2du6k_p2s_5RsExmkAuVvvJQOaak9GehMBQ=y4m6g@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace2: added 2.0.1
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
X-List-Received-Date: Thu, 20 Feb 2020 12:39:00 -0000
Content-Type: multipart/alternative; boundary="00000000000082c1eb059f013061"

--00000000000082c1eb059f013061
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

should I update the patch to include changes to maintainer file,
packagegroup etc in the same way as for babeltrace or
is it something you will do?

Anders Wallin


On Wed, Feb 19, 2020 at 5:02 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Wed, 19 Feb 2020 at 16:56, Jonathan Rajotte-Julien <
> jonathan.rajotte-julien@efficios.com> wrote:
>
>> > There are some things where the namespaces are quite specific (python
>> > vs python3, gtk(+) 2/3/4, qt) but they're fairly few and far between.
>> >
>> > If babeltrace2 will replace babeltrace and become babeltrace, we
>> > probably want to keep PN as babeltrace. If it will be known as
>> > babeltrace2 always, we probably change PN.
>>
>> Babeltrace 2 executable will be forever named babeltrace2.
>>
>> Hope this clear up this part a bit.
>>
>
> Right, then I'm fine with naming the recipe babeltrace2.
>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000082c1eb059f013061
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alex,<div><br></div><div>should I update the patch to i=
nclude changes to maintainer file, packagegroup etc in the same way as for =
babeltrace or=C2=A0</div><div>is it something you will do?=C2=A0</div><div>=
<br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature">Anders Wallin</div></div><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 19, 2=
020 at 5:02 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Wed, 19 Feb =
2020 at 16:56, Jonathan Rajotte-Julien &lt;<a href=3D"mailto:jonathan.rajot=
te-julien@efficios.com" target=3D"_blank">jonathan.rajotte-julien@efficios.=
com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">&gt; There are some things where the namespac=
es are quite specific (python<br>
&gt; vs python3, gtk(+) 2/3/4, qt) but they&#39;re fairly few and far betwe=
en.<br>
&gt; <br>
&gt; If babeltrace2 will replace babeltrace and become babeltrace, we<br>
&gt; probably want to keep PN as babeltrace. If it will be known as<br>
&gt; babeltrace2 always, we probably change PN.<br>
<br>
Babeltrace 2 executable will be forever named babeltrace2.<br>
<br>
Hope this clear up this part a bit.<br></blockquote><div><br></div><div>Rig=
ht, then I&#39;m fine with naming the recipe babeltrace2.</div><div><br></d=
iv><div>Alex=C2=A0</div></div></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000082c1eb059f013061--
