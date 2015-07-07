Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id ABD9475C49
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 08:29:29 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so134866562qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 01:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VwtKRa+DUrKNvhj38qJRv5VPs1dfnnWMjegcLEIYJ8M=;
	b=U6OTCdvMrsptzY+prkqedR+7qlqiZuM2CkhfiSSXt4zH0XdLP2fcNWMLq4PNMb6lxb
	hegFUG2Gq3iEPul7y85/emYokWmW2nrunbiZXaAXReMvRUBsbcSWtbeEHufzdotKP6ay
	q+jPMG9kDzVtz8Zfb3Nw+5kzJe/PnHlqjuvcANPYUq499l9Y7TGM+F3cwFVioEYlxDXI
	fhATIrq2jozRv75mprw7EaBQwMrHV0ruQxB4eTAXoGqyDF0ahsRaHLYJuqYDBzrH8XfP
	sCC7g7OdOC8lWPkVsYqt4e1p3qMYAxk7+GyrM5eISSQRA3vf3xbgdDj67pyz4yWcFzxi
	2CeA==
X-Gm-Message-State: ALoCoQkYMMbZjh2+zHsu7I/Z5b/D95Bqi6Rzgm7aX7HaQE7Jn97mt7pwtyrB6Kksjuum6Un5wsrl
X-Received: by 10.55.53.193 with SMTP id c184mr4766986qka.62.1436257769545;
	Tue, 07 Jul 2015 01:29:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 7 Jul 2015 01:29:10 -0700 (PDT)
In-Reply-To: <87vbdwy88m.fsf@weregild.amer.corp.natinst.com>
References: <alpine.LFD.2.11.1502190508290.29947@localhost>
	<CAF3SDA6sUY=4cg-pihtftzTNDREm5cKMS7MqQp4DJ9M81ez5UQ@mail.gmail.com>
	<87vbdwy88m.fsf@weregild.amer.corp.natinst.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Jul 2015 09:29:10 +0100
Message-ID: <CAJTo0Lb1Nth4VGocNqTDWFnrzO4_FGFbeg6Akk7ZmSvFLPP6Ew@mail.gmail.com>
To: Richard Tollerton <rich.tollerton@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	"Daniel." <danielhilst@gmail.com>,
	Yocto discussion list <yocto@yoctoproject.org>
Subject: Re: [PATCH] cross-localedef-native_2.20.bb: fix for gcc5
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
X-List-Received-Date: Tue, 07 Jul 2015 08:29:29 -0000
Content-Type: multipart/alternative; boundary=001a11476f1428fdbc051a44d28c

--001a11476f1428fdbc051a44d28c
Content-Type: text/plain; charset=UTF-8

On 7 July 2015 at 03:54, Richard Tollerton <rich.tollerton@ni.com> wrote:

> The build of cross-localedef-native is observed to fail under gcc5 hosts
> with multiple definition errors, e.g.:
>

Is this patch intended for fido?  Master doesn't have 2.20 anymore (2.21)
and I believe that works with gcc5 hosts.

Ross

--001a11476f1428fdbc051a44d28c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 July 2015 at 03:54, Richard Tollerton <span dir=3D"ltr">&lt;<a href=3D=
"mailto:rich.tollerton@ni.com" target=3D"_blank">rich.tollerton@ni.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2es" class=
=3D"a3s" style=3D"overflow:hidden">The build of cross-localedef-native is o=
bserved to fail under gcc5 hosts<br>
with multiple definition errors, e.g.:<br></div></blockquote></div><br>Is t=
his patch intended for fido?=C2=A0 Master doesn&#39;t have 2.20 anymore (2.=
21) and I believe that works with gcc5 hosts.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11476f1428fdbc051a44d28c--
