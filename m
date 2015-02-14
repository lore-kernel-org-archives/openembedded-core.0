Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6455971634
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Feb 2015 13:09:18 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id w8so15986680qac.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Feb 2015 05:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mTP15OGQaSWXyMIVQkKvD+M0S6ql/b8F4pin5Xx/eaY=;
	b=M5j4eeIPjPuJZ2RKMVQn5bFmLOtRwBBm6kNARlfbHK8lMQgW8r0/xIQWBHvmg7/Ecj
	slVn0qZHm7soNch8UNNAbJ3vXnkcOZcvNrMN9kktq3fjZ5N9R7mBjMghaZeFUffUFcfl
	U0RSqI7yk0Mle+AShGwBvMbNdLnsh8a2FM6Gic8DQEaev4vfbdxmHKwkiiQfF2VdNWUi
	ALEnO61APoY7xwxtIhiRWz+YqB0mlIKShE0BvVceNBfdOjN+z2nUxE9qjBue6VirBW7x
	d+ifNRiKLEnmhIE6czeoN69gSv1ABHP9J7A1SYKP5lzzwEA5EKlz0ZJbesfb/wZ3Hvn3
	C9rg==
X-Gm-Message-State: ALoCoQmV7CRG7HylLGfiM2XsDtvmeWP7yF5QvyPk9S8GuUYXkFqHhXqqoA/1f0q1c9tTlw8wqjGo
X-Received: by 10.140.133.69 with SMTP id 66mr6674483qhf.17.1423919359590;
	Sat, 14 Feb 2015 05:09:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Sat, 14 Feb 2015 05:08:59 -0800 (PST)
In-Reply-To: <1423908404.20217.100.camel@linuxfoundation.org>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
	<CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
	<80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
	<CAJTo0LbqTrQzk0KeHDxYnmtZrrFdZD12DWrjA=Y4RtbQzwM0ow@mail.gmail.com>
	<CAMKF1sr7bYpKqzTmvX5rCuYc-Rb2se7Vsrr4aYA43E_b1Z=vWA@mail.gmail.com>
	<CACS+7ZRNm2Y0SJn76imF6DNoEsL2+ppC1zG45iGspOmL0EN0BQ@mail.gmail.com>
	<CAMKF1sqjQm+n5xKfS0utm9B9h_S+RYWrgnGUCboRNCk5XSUmzg@mail.gmail.com>
	<1423908404.20217.100.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 14 Feb 2015 13:08:59 +0000
Message-ID: <CAJTo0La6i2hDqPcZFjvrcPsRReNhirfsbOxD-_udJJDQ7YrKhw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Sat, 14 Feb 2015 13:09:19 -0000
Content-Type: multipart/alternative; boundary=001a1136fdee9e206d050f0c0f12

--001a1136fdee9e206d050f0c0f12
Content-Type: text/plain; charset=UTF-8

Hi,

On 14 February 2015 at 10:06, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Right now, poky-tiny failed due to warning are errors and unused
> symbols. Minnow failed due to SSE instruction issues. Full build logs
> are also available on the autobuilder:
>

Now those SSE errors I thought were fixed - is this more of the same or did
I manage to drop a patch when merging?

Ross

--001a1136fdee9e206d050f0c0f12
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi,</div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 14 February 2015 at 10:06, Richard P=
urdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":q68" class=3D"a3s" sty=
le=3D"overflow:hidden">Right now, poky-tiny failed due to warning are error=
s and unused<br>
symbols. Minnow failed due to SSE instruction issues. Full build logs<br>
are also available on the autobuilder:</div></blockquote></div><br>Now thos=
e SSE errors I thought were fixed - is this more of the same or did I manag=
e to drop a patch when merging?</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--001a1136fdee9e206d050f0c0f12--
