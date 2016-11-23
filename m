Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id DD51760807
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 11:22:10 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id n204so11167393qke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 03:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AtLK9zsZD5Py0ImEupTOMbbcKmYmVmkk/57eNg15GHY=;
	b=NVdVb/IW5bIjxolEnZh69Q5UOUQPk3J7oqpTCHLRJ2ADP4Q/M2GNGKuLRGIGiuAPAc
	yIOtzWsrmVtPQmhtgJV/ehq06z5QsDzNtxE/P5rxOEPxBhr3Gm6qXgUmovr43BdbnbX/
	CftVgrd0krUT2ERqAH0XhiJNhVoG+FlP3YGTgkWjQT3J4KpM9UIDevuYoPgwVXXZ9vcr
	6ZimPehMKMbwC9wLs5CpWvEdbbeqnZDgHphhY7cnWsTBOU72NW/zhbQZzMZKeCBP/TqB
	G0AsWIliSPurA8Cb5WCi2Jkuxl013eaKMpMlVur9Qjz11S5XNxeuSkTOSznvyt1Yogqq
	pepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AtLK9zsZD5Py0ImEupTOMbbcKmYmVmkk/57eNg15GHY=;
	b=Cb8O8xqP8OPMw1JFW3R9Cw7PexR0Qa8ndaJI/biZo1tbf1abBWoNSRAE2a6sx4Tj+e
	VeRAA/21GzYpaibuNcmm/2MSsEIs/IjuVDImR5QXWoXBtrWT7TpWse6TWeYz408d+Dpb
	uKdoT55zh38gvUIAv0dEDGix5KeKySPIoQ3tPM73GACoe6ejpQSYo+DZSWCCuAqkKvQe
	VgTmjmYT3WK9PHWpYUfOAqFfHT+9va0x6kBPdmFFgUFpzlLfGRg7R5phDZz8RZ9c7hhd
	3sgxuMHdttPBlxW55Qxq+x1y9jZ8mA/vpIkHi8P7H9tB6OUFD/u/cfKloz1SQzEE8V/w
	fifw==
X-Gm-Message-State: AKaTC02c8y1qALnMCHFQZFtOyqmha46ixs16cDmepYiUaAHJRXxzNgVxwVQex+W+BE+ECstuDnJ7QnXNOemHksIw
X-Received: by 10.55.31.157 with SMTP id n29mr1880830qkh.221.1479900131791;
	Wed, 23 Nov 2016 03:22:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Wed, 23 Nov 2016 03:21:51 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1611230540200.7856@ca624034.mitel.com>
References: <alpine.LFD.2.20.1611230540200.7856@ca624034.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Nov 2016 11:21:51 +0000
Message-ID: <CAJTo0LZvk-Ssv3Bc5rSYSuYCm2rQma4Vwv2jvh5zdE7cCPE0Vg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: migrating simple tarballs over to OE recipes?
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
X-List-Received-Date: Wed, 23 Nov 2016 11:22:12 -0000
Content-Type: multipart/alternative; boundary=001a1147f228a8b1690541f61918

--001a1147f228a8b1690541f61918
Content-Type: text/plain; charset=UTF-8

On 23 November 2016 at 10:42, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   colleague has a pile of tarballs that were used to customize an x86
> centos system, wants to move all that to OE with as little fuss as
> possible, i guess the simplest way is to just create recipes that have
> the same tarball in the files/ directory, and write a trivial
> do_install() task that untars it into the root fs, yes?
>

Pretty much, yeah.

If you've a large pile and they're all effectively the same then a little
class can automate it even more.

Ross

--001a1147f228a8b1690541f61918
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 November 2016 at 10:42, Robert P. J. Day <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":13k" cl=
ass=3D"a3s aXjCH m15890ded001bbcd4">=C2=A0 colleague has a pile of tarballs=
 that were used to customize an x86<br>
centos system, wants to move all that to OE with as little fuss as<br>
possible, i guess the simplest way is to just create recipes that have<br>
the same tarball in the files/ directory, and write a trivial<br>
do_install() task that untars it into the root fs, yes?<br></div></blockquo=
te></div><br>Pretty much, yeah.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">If you&#39;ve a large pile and they&#39;re all ef=
fectively the same then a little class can automate it even more.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a1147f228a8b1690541f61918--
