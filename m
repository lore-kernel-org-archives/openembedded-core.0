Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id B29AC771D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 09:15:25 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id u186so7469283ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 02:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=0vT9xb59RaBatowU29pRxyEMLiLJbpXtMQ1Qaj6OB5U=;
	b=pKtdKwNAmsJGtktrtajAmQwKXRqnwK9k35tbVRxVYXC9qluw0k4cZBT4oGpbGewipn
	xM7R2ddy+sihIbnPc7hT0b4FO4aec869uY7xek8Of6FQIAU6KjSKlrxPnktHEF0c1AkT
	KZDquahfMNKPkcQG2EshjtqcQoCzp4VOKf1a4aqLiqA2nFpT6WN0PT0tghg6WPGbFPDz
	xCgKMyl+e1BmwTYJ67djf/eauabpgFKLx2FqDAEjWNHy5xs0alYCVuYyMUQTQ4/KfEYY
	WrTXu/YDUarOdSjcFyWX7h7y8tUkASeiq3VSpcZRzqPspIJEYEI9gRrpOQAOuOGXgBXv
	r8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=0vT9xb59RaBatowU29pRxyEMLiLJbpXtMQ1Qaj6OB5U=;
	b=iFIzFZxLCkgvhgv8/Pex5G9OT6rP8j0+tGxZqklqONWF5C+Jx73EfugSJcwfhmGZE9
	GZ0B7BmjHaHgn25ijW08ibXf4fzXeSkB8dkcfZXw+Qry7gwqnt3gDNlorM0EjtShxc2B
	Gol7t3EgqNgtdIsoMLgj/qlpMGUv8WoGCfnwZR0kvAVTbYdd5kSHwfaHizD61g4UdcuQ
	9xuPm4baoEVQ5REkOFvHg+uyGUDqK9atpiS0pLK7ywc04ebnIyw2sJvpvMCMlA8aijuj
	85D9+zYnmahpBr1iJHWyi/HXvh7w71yZSwXgwMnCB/33vrv60CviPkT4oukbVlNWFcCT
	JeCg==
X-Gm-Message-State: AEkoous02AO/TAU1JfI0eR1856MZwMxwM9i8zmRXIsKMqvSzzeGZ93AZ/dAX3GGrRRbNXiwpOmGSNRZA8rrwYwOA
X-Received: by 10.36.87.140 with SMTP id u134mr8735667ita.38.1470906925640;
	Thu, 11 Aug 2016 02:15:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 11 Aug 2016 02:15:05 -0700 (PDT)
In-Reply-To: <20160811065752.vchy5fxukujie5pz@ad.chargestorm.se>
References: <1470856303-24490-1-git-send-email-michael.davis@essvote.com>
	<bbf4ea57-5a32-7696-3e70-3c11dc069ef1@windriver.com>
	<20160811065752.vchy5fxukujie5pz@ad.chargestorm.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Aug 2016 10:15:05 +0100
Message-ID: <CAJTo0LbJ=EZftXe3xQ1cHexwDk6jPCCPf+X_oW+g00OLOrHD4w@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Thu, 11 Aug 2016 09:15:27 -0000
Content-Type: multipart/alternative; boundary=001a1135018ccd02e00539c834cd

--001a1135018ccd02e00539c834cd
Content-Type: text/plain; charset=UTF-8

On 11 August 2016 at 07:57, Anders Darander <anders@chargestorm.se> wrote:

> Shouldn't the ${PN}-dev package have the combined license?
>

Depends on whether the -dev package contains anything from the spy
application, this really is case-by-case.

Ross

--001a1135018ccd02e00539c834cd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2016 at 07:57, Anders Darander <span dir=3D"ltr">&lt;<a href=
=3D"mailto:anders@chargestorm.se" target=3D"_blank">anders@chargestorm.se</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ox" cla=
ss=3D"a3s aXjCH m15678652a3a3d90a">Shouldn&#39;t the ${PN}-dev package have=
 the combined license?<br></div></blockquote></div><br>Depends on whether t=
he -dev package contains anything from the spy application, this really is =
case-by-case.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a1135018ccd02e00539c834cd--
