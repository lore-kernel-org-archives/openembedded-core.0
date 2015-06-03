Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id A5E6260962
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 18:57:02 +0000 (UTC)
Received: by qkhq76 with SMTP id q76so11105755qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 11:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=puJcfrFELoEYik/Vwyf17AySEOr2RREqYh01wU4P0dU=;
	b=izzGi1aq+PS4SyiXOJVXJXZSD9tDWF3o/FKS0UQw0KDEPs1ZT5ARujOfcmD8VLH6S1
	9+0DQBhS+duiS2SwU178+5+wCn4T0DcrpSiNU8lDQ2dhZcGSeXBtmGipAiAEBWYUoHWU
	Bi/Yps1dnPRlxSfV2iEcM3n9Gvm8NcI5KX7hvRkNoGVdAIUl2D9SRRqZ4b6TqNY9P6yb
	GiNfN6MiwGQV359APgNrCCI8B1vXuzvXlQtaGb7V0JX3kqoiLU2moW8P8V9ogMvtExJ+
	PMFmUzA4Opdpb/uSAtSZPz+fiqA8/KHnr0AEPLtAIs00DLvXtq5hXp0EMxEEXOk5Segm
	vjwA==
X-Gm-Message-State: ALoCoQkHXQfevkjT/iIEKmn6oN6/CdwZIh51K0gsOKs/AmvZnBj5nmiVnvYuGjQu4U5J/6sJtzbk
X-Received: by 10.140.235.195 with SMTP id g186mr2914235qhc.64.1433357823242; 
	Wed, 03 Jun 2015 11:57:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 3 Jun 2015 11:56:42 -0700 (PDT)
In-Reply-To: <CAMKF1spaRQoh1_uEFOOFN9fOwAwEdRXC8pqusSvzfVpPs9hU_A@mail.gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
	<CAJTo0LanFDJR+AteOHRQ5hNd0T9bMNAa+Z4b9xfZe2kdP+28aA@mail.gmail.com>
	<CAMKF1spaRQoh1_uEFOOFN9fOwAwEdRXC8pqusSvzfVpPs9hU_A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Jun 2015 19:56:42 +0100
Message-ID: <CAJTo0LafGz=hMpwRh7G6+NkRO8b=kB7vMjhVfXAC2OMS0EE==A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] wayland/weston/libinput: Upgrade to 1.6.0 -> 1.8.0
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
X-List-Received-Date: Wed, 03 Jun 2015 18:57:04 -0000
Content-Type: multipart/alternative; boundary=001a11354c8ae427b90517a19f17

--001a11354c8ae427b90517a19f17
Content-Type: text/plain; charset=UTF-8

On 3 June 2015 at 19:07, Khem Raj <raj.khem@gmail.com> wrote:

> They are interdependent thats why they are together. Splitting wont
> get us anything moreover it will break git bisect
>

Upgrading the Wayland protocol is independent from upgrading Weston.
 libinput can be upgraded independently of Weston.  They have an implied
ordering (wayland before weston, libinput before weston) but they're not
single unit.

Ross

--001a11354c8ae427b90517a19f17
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 June 2015 at 19:07, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":s8" class=3D"a3s" style=3D=
"overflow:hidden">They are interdependent thats why they are together. Spli=
tting wont<br>
get us anything moreover it will break git bisect</div></blockquote><div><b=
r></div><div>Upgrading the Wayland protocol is independent from upgrading W=
eston. =C2=A0libinput can be upgraded independently of Weston.=C2=A0 They h=
ave an implied ordering (wayland before weston, libinput before weston) but=
 they&#39;re not single unit.</div><div><br></div><div>Ross=C2=A0</div></di=
v></div></div>

--001a11354c8ae427b90517a19f17--
