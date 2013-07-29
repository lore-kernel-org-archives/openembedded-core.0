Return-Path: <djszapi@archlinux.us>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 81D816B40A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 12:20:04 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id 5so87560pdd.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 05:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=nH1ywupGUC8zS/AzmJImcblfWm0H5Cb8asLR6VBw70s=;
	b=Z294sfjXZnfOHbI0VRZ3q96kL5E6wu5K4fCWpKWbF/HoFbOyGdfwGWWYd2RDubUDf8
	6MRl6Rau2hgq+jvfDBreUhHUJoOzI4xM0o8XwqW+qMNWdJCcacmZnfARo3BPtl7hMwZb
	3zinrD0amv2QNyrUrAe6hwAi6aW3qO8YfI74/LNwgd8+rZ9h9X6TyZkqCmpemOa66cRk
	cTG4sX5mNocRQ3Obs+xBZGBvc0O49D3PygZOUjEAKCWJ1oFqG2XqVpscYeqak+JOxoFg
	2D3Pr7a8i97pho8Ji9lja6C8ltNvj1QWxHT0Mu+BxYwg8QkyBzq2coP4zQ7TLJCFei2P
	KMaw==
MIME-Version: 1.0
X-Received: by 10.68.163.131 with SMTP id yi3mr68059857pbb.55.1375100405395;
	Mon, 29 Jul 2013 05:20:05 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Mon, 29 Jul 2013 05:20:05 -0700 (PDT)
In-Reply-To: <CAOMwXhMZ1w5j=aP_yPXb=k0=UOuinMS5ENAsXAdzcb42WxC0Og@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<1375094111.13247.9.camel@phil-desktop.brightsign>
	<CAOMwXhMZ1w5j=aP_yPXb=k0=UOuinMS5ENAsXAdzcb42WxC0Og@mail.gmail.com>
Date: Mon, 29 Jul 2013 13:20:05 +0100
X-Google-Sender-Auth: KxP6R05Rwbtel7DjEiGS5_ND8gY
Message-ID: <CAOMwXhO2A75jPxM4FdU=XBgVRjsxW24hDVLOf8eub2Wp4CmGDA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQnLApwwpSW2vKgWTAqgz122A3dVzXqIkZpyjg71UmcdPKKrQQnsPfmNKCivr/9eZFUo44Dr
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
X-List-Received-Date: Mon, 29 Jul 2013 12:20:04 -0000
Content-Type: multipart/alternative; boundary=047d7bacb46e31cac004e2a5838a

--047d7bacb46e31cac004e2a5838a
Content-Type: text/plain; charset=ISO-8859-1

Oh, it is actually also in danny. I was looking into the "files" directory,
but it is in the other.

It is definitely not in denzil though.


On Mon, Jul 29, 2013 at 1:18 PM, Laszlo Papp <lpapp@kde.org> wrote:

> Only _one_, not two.
>
>
> On Mon, Jul 29, 2013 at 11:35 AM, Phil Blundell <pb@pbcl.net> wrote:
>
>> On Mon, 2013-07-29 at 11:22 +0100, Laszlo Papp wrote:
>> > I disagree. This change should not have gone in the first place
>> > causing the regression for the users. Please be consistent with the
>> > history.
>>
>> If this was a recent change then I would have some (limited) amount of
>> sympathy for your position.  But the commit you are complaining about
>> has been in the tree for over a year, and it was presumably included in
>> at least one if not two of the most recent stable releases.
>>
>> p.
>>
>>
>>
>>
>

--047d7bacb46e31cac004e2a5838a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oh, it is actually also in danny. I was looking into the &=
quot;files&quot; directory, but it is in the other.<div><br></div><div>It i=
s definitely not in denzil though.</div></div><div class=3D"gmail_extra"><b=
r>
<br><div class=3D"gmail_quote">On Mon, Jul 29, 2013 at 1:18 PM, Laszlo Papp=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:lpapp@kde.org" target=3D"_blank">l=
papp@kde.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div dir=3D"ltr">Only _one_, not two.</div><div class=3D"HOEnZb"><div class=
=3D"h5"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mo=
n, Jul 29, 2013 at 11:35 AM, Phil Blundell <span dir=3D"ltr">&lt;<a href=3D=
"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:<br=
>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On Mon, 2013-07-29 at 11:22 +0100, Lasz=
lo Papp wrote:<br>
&gt; I disagree. This change should not have gone in the first place<br>
&gt; causing the regression for the users. Please be consistent with the<br=
>
&gt; history.<br>
<br>
</div>If this was a recent change then I would have some (limited) amount o=
f<br>
sympathy for your position. =A0But the commit you are complaining about<br>
has been in the tree for over a year, and it was presumably included in<br>
at least one if not two of the most recent stable releases.<br>
<span><font color=3D"#888888"><br>
p.<br>
<br>
<br>
<br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--047d7bacb46e31cac004e2a5838a--
