Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 688C0784D2;
	Sun, 28 Jan 2018 20:30:52 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id m19so1988205ywh.12;
	Sun, 28 Jan 2018 12:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Bl2xYsgIURyJwLWaDre245C4Gh+1+vMG4sADivkHNG0=;
	b=LKe9ePWZmR1V8imnqDBULMH0do2x2jm3l9k6YGqCbdPsJm4umVqHRjfOKP8VrhOFSQ
	G0wFBMQo+5HpzDftY6wo29LY4rkHymwoTaSi0vLR8DnpR+8wRTIDgnlmKQuwKWtvCjhw
	idksz64z0iw+Qh0DboAuNL5Q3QlphWixbhqFMy1RhMrmKvVeKK9jkAmdKbJfGlQDSWSU
	uDrQdDchdI1NSrLopt5D8fByzZqc1DteeD+O5n3kNQwOEihu0sj9QgMW8wJtQ3VnHAAm
	tHbyvWMnRws+XSSClnBLu70L68WLNH2ugxNfxB2aFI8a072/bR1WT17nwmzyBbxXjffb
	XOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bl2xYsgIURyJwLWaDre245C4Gh+1+vMG4sADivkHNG0=;
	b=GdC0JBIIZMCfWGWukUFB1qyKNBu0AhrO0m4C8ZV0syifs+mN6pO8AZOMuM8vEGxehk
	jADVajZKrV3nx55nseGZyEwdzr7hIBX1KPwT/cW+PaT6TNQSKOF+gX3F3NS3E89+m4pG
	K1nKqZY3fbNmsd4RGNRdC7SA4Wf2tCv1j3ehB48l+n3ZF+TPw6YvZonQbPDW2pbNxBQj
	AKzf7MZT59159jQRSu2TCTue7MPWbFlxNp6xd0u0l28Cs+YoOQ/PUGevTmGUZLtZ1NCh
	TGCtb74e9l+/BvrVil+aj3s2xMlARQoDCr/DbkAcdy4UxGFwkiXUgMu+1CnGDdh25tCF
	5dLg==
X-Gm-Message-State: AKwxytdKh34ugqKymCMJxkpyq+2lX66tTiL+OI2JGMQofX+Nqi0BW9se
	Eg5YE6vKcwI0bxOWGfMwQH6k0KW4nKr5X6n23a7wyA==
X-Google-Smtp-Source: AH8x225vPjnx/31xC91RWQh117qkjnAHGqJZqCe+L0K9PEUHNyk4vj8u2z/6o8QJN/w6+cXHN2fkl47y6WCOdXKnfSA=
X-Received: by 10.13.255.133 with SMTP id p127mr15230668ywf.360.1517171454032; 
	Sun, 28 Jan 2018 12:30:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.199.133 with HTTP; Sun, 28 Jan 2018 12:30:53 -0800 (PST)
In-Reply-To: <CAPyrkgwxYUBGb4wLa83Bcm5dRDFh0m7X3o0tZx9sCYy2PEZV=A@mail.gmail.com>
References: <CAPyrkgwxYUBGb4wLa83Bcm5dRDFh0m7X3o0tZx9sCYy2PEZV=A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 28 Jan 2018 21:30:53 +0100
Message-ID: <CALbNGRQDOpbFhkpTpXYjc0PnpaWsCchT-Oe3n_2kmOxpEhkSPA@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OpenEmbedded stand at FOSDEM 2018
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
X-List-Received-Date: Sun, 28 Jan 2018 20:30:53 -0000
Content-Type: multipart/alternative; boundary="94eb2c08844a94c0a30563dc014b"

--94eb2c08844a94c0a30563dc014b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2017 at 9:55 AM, Paul Barker <pbarker@toganlabs.com> wrote:

> Hi all,
>
> We've got confirmation for an OpenEmbedded stand at FOSDEM 2018! We're
> in the AW building as usual, you can see the full list of stands and
> location details here: https://fosdem.org/2018/stands/
>
> What we need:
>
> * People to help out on the stand and chat about the project. If
> you're going to FOSDEM and don't know many people in the OE project
> this is a great way to get to know some. Even if you can only help out
> for an hour or two this would be much appreciated!
>
> * Device/product demos which show off the features of OE. We only have
> one table this year so please let us know if you're bringing hardware,
> that way we can make sure everything fits. Preference will go to
> hobbyist projects as this is FOSDEM but we're happy with commercial
> projects as long as they're not an explicit sales pitch.
>
> * Build system demo. I really want us to show off toaster again as
> that got a lot of interest last time we demo'd it at FOSDEM.
> Unfortunately I'm on holiday before FOSDEM and I'm not travelling
> directly from home so I'll be unable to bring something to run this
> demo on. So if someone could bring a laptop or mini-PC/monitor/etc to
> run a build system demo on that would be excellent. If not I'll see if
> I can get something shipped to Brussels.
>
> I've created a wiki page here:
> https://www.openembedded.org/wiki/FOSDEM_2018. Please add to this if
> you're planning to bring anything or just attend.
>
> Look forward to seeing many of you in Feb :)
>
> --
> Paul Barker
> Tog=C3=A1n Labs Ltd
>

My machine is finally done - it turned larger and heavier than expected
originally. Pictures at [1] taken with my very old mobile. Would like to
bring this with me with smaller keyboard - hope there is some place for
it...

[1]
https://drive.google.com/drive/folders/1VUMqcRO8WxWpwMKYy06WZPZcSgrokq0h?us=
p=3Dsharing

Andreas

--94eb2c08844a94c0a30563dc014b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div class=3D"gmail_extra"><div class=3D"gmail_quote"=
>On Mon, Dec 11, 2017 at 9:55 AM, Paul Barker <span dir=3D"ltr">&lt;<a href=
=3D"mailto:pbarker@toganlabs.com" target=3D"_blank">pbarker@toganlabs.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i all,<br>
<br>
We&#39;ve got confirmation for an OpenEmbedded stand at FOSDEM 2018! We&#39=
;re<br>
in the AW building as usual, you can see the full list of stands and<br>
location details here: <a href=3D"https://fosdem.org/2018/stands/" rel=3D"n=
oreferrer" target=3D"_blank">https://fosdem.org/2018/<wbr>stands/</a><br>
<br>
What we need:<br>
<br>
* People to help out on the stand and chat about the project. If<br>
you&#39;re going to FOSDEM and don&#39;t know many people in the OE project=
<br>
this is a great way to get to know some. Even if you can only help out<br>
for an hour or two this would be much appreciated!<br>
<br>
* Device/product demos which show off the features of OE. We only have<br>
one table this year so please let us know if you&#39;re bringing hardware,<=
br>
that way we can make sure everything fits. Preference will go to<br>
hobbyist projects as this is FOSDEM but we&#39;re happy with commercial<br>
projects as long as they&#39;re not an explicit sales pitch.<br>
<br>
* Build system demo. I really want us to show off toaster again as<br>
that got a lot of interest last time we demo&#39;d it at FOSDEM.<br>
Unfortunately I&#39;m on holiday before FOSDEM and I&#39;m not travelling<b=
r>
directly from home so I&#39;ll be unable to bring something to run this<br>
demo on. So if someone could bring a laptop or mini-PC/monitor/etc to<br>
run a build system demo on that would be excellent. If not I&#39;ll see if<=
br>
I can get something shipped to Brussels.<br>
<br>
I&#39;ve created a wiki page here:<br>
<a href=3D"https://www.openembedded.org/wiki/FOSDEM_2018" rel=3D"noreferrer=
" target=3D"_blank">https://www.openembedded.org/<wbr>wiki/FOSDEM_2018</a>.=
 Please add to this if<br>
you&#39;re planning to bring anything or just attend.<br>
<br>
Look forward to seeing many of you in Feb :)<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
--<br>
Paul Barker<br>
Tog=C3=A1n Labs Ltd</font></span><br></blockquote></div></div><div class=3D=
"gmail_extra"><br></div>My machine is finally done - it turned larger and h=
eavier than expected originally. Pictures at [1] taken with my very old mob=
ile. Would like to bring this with me with smaller keyboard - hope there is=
 some place for it...<br><br>[1] <a href=3D"https://drive.google.com/drive/=
folders/1VUMqcRO8WxWpwMKYy06WZPZcSgrokq0h?usp=3Dsharing">https://drive.goog=
le.com/drive/folders/1VUMqcRO8WxWpwMKYy06WZPZcSgrokq0h?usp=3Dsharing</a><br=
><br></div>Andreas<br></div>

--94eb2c08844a94c0a30563dc014b--
