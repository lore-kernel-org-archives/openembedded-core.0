Return-Path: <djszapi@archlinux.us>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5D86A4AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 07:22:36 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so4933727pde.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 00:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=9+h6St7BtFzOhDT2SJ/48nvcYQgKbOc8PWj7gKtR/+g=;
	b=Vq8ZO2IL8HFqv79Itt5960wkouHv0HTZFVy2LNb8vqiDvFeOnLIQu+uLLAHoKDMIjX
	ugs81qMuZy8dUQ4QD7VSXT5cejouJOsccYtV5tFT1K3xNxBwNqV9IxnS2VXB2zP5snOq
	eUJKVmIny0RGbD9e4LvSKdeSZocIn2rhmtV8OLO3V3kK1mJFU+0aYF/Py0m9qFW+lyaG
	1Thzid9jbRbaeB9MsVJlxnzKSgRgWpayPvP+b8VHbi4YU4OykUL6aRWx7LTnUkoIlfMd
	qvKxfPmjNF8fcDyB+rAav4uGod5r0DLhujnSj7U6VMXnUOhl7FNlX24zkbdceo8dRlh0
	NrfA==
MIME-Version: 1.0
X-Received: by 10.66.119.35 with SMTP id kr3mr67793786pab.149.1375082556685;
	Mon, 29 Jul 2013 00:22:36 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Mon, 29 Jul 2013 00:22:36 -0700 (PDT)
In-Reply-To: <CANyK_8eaZJPT+gGCrn4Nfh3qRQehNE442X8pepTr+EcHiWw2HQ@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<CANyK_8eaZJPT+gGCrn4Nfh3qRQehNE442X8pepTr+EcHiWw2HQ@mail.gmail.com>
Date: Mon, 29 Jul 2013 08:22:36 +0100
X-Google-Sender-Auth: mlYIB3XPkZMBgM5K1Wxqikj5loM
Message-ID: <CAOMwXhPgH_v6Q0ok=WOiHYzhUCTvO8zPf72MEYiO5SOS7y6v6A@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Paul Barker <paul@paulbarker.me.uk>
X-Gm-Message-State: ALoCoQkQKkYGEiSOBcTouaV/I9xClwy5SM0lXXGZrGKhmK3BAjoj036e4XUdpuCPjYMENMfRcNeX
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 07:22:36 -0000
Content-Type: multipart/alternative; boundary=047d7b0721ca54155304e2a15b68

--047d7b0721ca54155304e2a15b68
Content-Type: text/plain; charset=ISO-8859-1

Let us fix the build issue first, and then you can improve the situation as
you wish.


On Mon, Jul 29, 2013 at 8:20 AM, Paul Barker <paul@paulbarker.me.uk> wrote:

> On 29 July 2013 08:16, Laszlo Papp <lpapp@kde.org> wrote:
> > -       busybox_cfg('wifi', distro_features, 'CONFIG_RFKILL', cnf, rem)
> > -       busybox_cfg('bluetooth', distro_features, 'CONFIG_RFKILL', cnf,
> rem)
>
> It would be good to have some way to re-enable this if it is needed.
> Maybe an 'rfkill' PACKAGECONFIG option?
>
> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk
>

--047d7b0721ca54155304e2a15b68
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Let us fix the build issue first, and then you can improve=
 the situation as you wish.</div><div class=3D"gmail_extra"><br><br><div cl=
ass=3D"gmail_quote">On Mon, Jul 29, 2013 at 8:20 AM, Paul Barker <span dir=
=3D"ltr">&lt;<a href=3D"mailto:paul@paulbarker.me.uk" target=3D"_blank">pau=
l@paulbarker.me.uk</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 29 July 2013 08:16, Las=
zlo Papp &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@kde.org</a>&gt; wrote:<=
br>
&gt; - =A0 =A0 =A0 busybox_cfg(&#39;wifi&#39;, distro_features, &#39;CONFIG=
_RFKILL&#39;, cnf, rem)<br>
&gt; - =A0 =A0 =A0 busybox_cfg(&#39;bluetooth&#39;, distro_features, &#39;C=
ONFIG_RFKILL&#39;, cnf, rem)<br>
<br>
</div>It would be good to have some way to re-enable this if it is needed.<=
br>
Maybe an &#39;rfkill&#39; PACKAGECONFIG option?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Paul Barker<br>
<br>
Email: <a href=3D"mailto:paul@paulbarker.me.uk">paul@paulbarker.me.uk</a><b=
r>
<a href=3D"http://www.paulbarker.me.uk" target=3D"_blank">http://www.paulba=
rker.me.uk</a><br>
</font></span></blockquote></div><br></div>

--047d7b0721ca54155304e2a15b68--
