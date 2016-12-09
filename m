Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 08E99719F9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 20:11:04 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id n6so26395838qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2016 12:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LyZv4f7y1ufkdo3U3643Bj5kQaN/6sdQgzpDIE42B1g=;
	b=PrYVzw+awlr6vaJ72mHtyKqMq4VSkhWrsMCack6SHhF5BLjP5mUhbqLqSKm+KIVesS
	/bhMeHTVaOZXhLjCg9qrbGzpQEEgnUkHA8I0LwWDYchNnUtpv/czcSa1S8Zxgjlwyj8a
	1JKem/Y7K0L+O4c+WQl3z22JXMa+dJ9Eh0rGIwq6RT+OIk9UzXof4qZDWMUuND0XD0vO
	Q1HFGvtNnkYTVdR7iLLDu1EMHwLeK3z4AEn7soeVQ64NXHXOk2kwFgdALu2BkXuwT24t
	vgaWsmgSpJyN2ZdgiAOhv0HUQTdjVYvADKdTC0DY1FImRDzVASrHM9SFzzwbU1howdoq
	SBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LyZv4f7y1ufkdo3U3643Bj5kQaN/6sdQgzpDIE42B1g=;
	b=c7G0YdW6cfqelca58eDIzajaWW0UUs4BigH0iAjIPX6iBNNblMj4Sv++9tlm/Txu1U
	jrycThVVhziNUTUquhaOLNEgcJe1+qXGx/y66RTFgi2JCXBXvkbnIp5zcfjO04zflI6F
	Z67reP9OeMVWoU9KpLtgcYYDEHbpUeRjBYXVaNLegUwsUMSmXrYrIM0fxkBei1RmgE4W
	R8B4wnKLxuKAjtQs5YlxKKLXZM0bmwz8UoxNrGLEdgTZp2CgoqsC/LnkVjSZwcJnzImw
	ZLKvbZpjQX0LUbeweRl/NWC7a73EIWYXEQBVnxCx1og/ESU4kC8HP6ftWHfrI0SBO4cQ
	hw4w==
X-Gm-Message-State: AKaTC03uihfw5Z7zxHPmfdkS0Hrlgi9Z+6YOozIJ1OGpHmyWmMgA9dY6sSeXrdGkJMFxTFo0kW9XvHUMHyJisOgE
X-Received: by 10.200.57.54 with SMTP id s51mr69262695qtb.68.1481314266384;
	Fri, 09 Dec 2016 12:11:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 9 Dec 2016 12:10:45 -0800 (PST)
In-Reply-To: <584ADA83.9070709@linux.intel.com>
References: <1480610065-25697-1-git-send-email-anibal.limon@linux.intel.com>
	<CAMKF1srq2VD3En90FNXLB6p4YvLYh=fEz6mzEmC-O4bBHV1Q7A@mail.gmail.com>
	<5840A839.5070704@linux.intel.com>
	<CAMKF1srD4Nzzo=tB8PbRCOTKckqe1T0C_5XCiAK2Wn2kASekhA@mail.gmail.com>
	<584991B7.9050603@linux.intel.com>
	<CAJ86T=We5bfDF6EpGs_sPph16O=Niz+ei5vADWbMTXzsTq-C8g@mail.gmail.com>
	<CAJTo0LYUhvxCxhLAcbwFcnxJSx856DnZBLPjqUHXoW2FAvkQVg@mail.gmail.com>
	<584ADA83.9070709@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Dec 2016 20:10:45 +0000
Message-ID: <CAJTo0LaJ0b5TtNFgTcx5A2byiHb7MjupUk_kX_Sprf-w2TLCGw@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl-native: Remove usage of -fstack-protector=strong
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
X-List-Received-Date: Fri, 09 Dec 2016 20:11:06 -0000
Content-Type: multipart/alternative; boundary=001a113a01e8a621be05433f5ae8

--001a113a01e8a621be05433f5ae8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The patch is "uninative: rebuild uninative for gcc 4.8 and 4.9" but I
forgot it didn't get merged as it broke eSDK.

Ross

On 9 December 2016 at 16:23, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.int=
el.com>
wrote:

>
>
> On 12/08/2016 02:35 PM, Burton, Ross wrote:
> > On 8 December 2016 at 19:16, Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> >> Is it correct that native sstate from a host with gcc < 4.9 should be
> >> reused by a host with gcc >=3D 4.9 ?
> >>
> >> Doesn't the change in NATIVELSBSTRING prevent that from happening?
> >>
> >
> > Yes, we recently landed a change so that uninative is versioned by host
> > GCC.  Presumably that solves this problem in a different way?
>
> If the sstate generated is different from a host distro with gcc>=3D4.9
> and gcc<4.9 will be work.
>
> Could you point me to the patch that makes this change?
>
>         alimon
>
> >
> > Ross
> >
>
>

--001a113a01e8a621be05433f5ae8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The patch is &quot;uninative: rebuild uninative for gcc 4.=
8 and 4.9&quot; but I forgot it didn&#39;t get merged as it broke eSDK.<div=
><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 9 December 2016 at 16:23, An=C3=ADbal Lim=C3=B3n <span =
dir=3D"ltr">&lt;<a href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_=
blank">anibal.limon@linux.intel.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><span class=3D""><br>
<br>
On 12/08/2016 02:35 PM, Burton, Ross wrote:<br>
&gt; On 8 December 2016 at 19:16, Andre McCurdy &lt;<a href=3D"mailto:armcc=
urdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Is it correct that native sstate from a host with gcc &lt; 4.9 sho=
uld be<br>
&gt;&gt; reused by a host with gcc &gt;=3D 4.9 ?<br>
&gt;&gt;<br>
&gt;&gt; Doesn&#39;t the change in NATIVELSBSTRING prevent that from happen=
ing?<br>
&gt;&gt;<br>
&gt;<br>
&gt; Yes, we recently landed a change so that uninative is versioned by hos=
t<br>
&gt; GCC.=C2=A0 Presumably that solves this problem in a different way?<br>
<br>
</span>If the sstate generated is different from a host distro with gcc&gt;=
=3D4.9<br>
and gcc&lt;4.9 will be work.<br>
<br>
Could you point me to the patch that makes this change?<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 alimon<br>
<br>
&gt;<br>
&gt; Ross<br>
&gt;<br>
<br>
</blockquote></div><br></div>

--001a113a01e8a621be05433f5ae8--
