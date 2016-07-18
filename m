Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 89A4C60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 19:20:07 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id 38so168819947iol.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 12:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TNfLOKDKRwkS8bqc8DPr+5PAagkYlgQVH+XBaX0YqI4=;
	b=qHG/ChprXLJ9MLPqEP1sU6Gz11LO9iQIlpVk3OkhWMDZf4LMQBPinEAfcFNyfbbk5v
	1J5VDNZrj4sLbxo7tUYk42/tvqLhiVVNAo7jnS0QkrUl6ijwrQUysC/CXVgoygP84zAZ
	Ex0YNY7tTV10cCi4oBiX93rCBktFLYHOhJStzeSNB+SX1cS/yghkHZDylDBt0f+0cYj/
	P+Kl0EV3TDM5qACc2rBdcfgTcGrkaRnpGo1TaQ9oZ4dEPG/29odH55QirXr/ILOtxAJX
	Jsyn0YGz9K74Sy346agpkiaAl97UI+dok6/jub7E12v5l0nwBkdWNPVrCDfn7h0MTHdg
	X6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TNfLOKDKRwkS8bqc8DPr+5PAagkYlgQVH+XBaX0YqI4=;
	b=YshCTPZuEXmpiaQg/0VOvH6kx+afkD8E4+ZU+Vxp1r5ELIzddEjyNQfNrOgbsYd/KQ
	IUgw42btBoH8WViY+dNBViPUJgz3Rm6E+tGYHjyue3P3WaI2Hn7sWvkLgOFp2vTJBRdr
	/EXVqWdwsmPoCUQIQNp4HaiVSpje1sNXeCbU0zFukAM939RTTor5zyYYYzlfviu8IQQN
	/1MKHh6Ycssy2ds0KtLorUU194dw6vsb1gGAu0/SYDJtu14GesB3d1/sLpqKDgkvebav
	AgIZQ8hA4TOdYSc+wzVOi7xoweKikY3Jj+8f8dL05QFpYbMnTNox2LDSq7oiYVTTNV77
	UBlg==
X-Gm-Message-State: ALyK8tLuiCltE2maHjztUp5yKv1Sten/k+aSCP8q7B4Lm991tQ77+DyE/X/wcq/tWt7cU5d+v/HA9KWkvgVknfSR
X-Received: by 10.107.138.212 with SMTP id c81mr34038895ioj.148.1468869608241; 
	Mon, 18 Jul 2016 12:20:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 18 Jul 2016 12:19:48 -0700 (PDT)
In-Reply-To: <45fc4cae-ac83-1a29-9e8f-14f463a18f64@felipetonello.com>
References: <20160715163633.6854-1-eu@felipetonello.com>
	<20160715163633.6854-3-eu@felipetonello.com>
	<CAJTo0LaHHZ98dgw9Sj8gAQ2Sz86gDWhxW799X2Y-k7q71UrNLQ@mail.gmail.com>
	<a98f595f-5f51-0623-8796-9c5d35ee4aea@felipetonello.com>
	<CAJTo0Lb=LRth6QKky7U5gzT+Av5iRKLGGFNeSSMr_SZrLRGuyg@mail.gmail.com>
	<45fc4cae-ac83-1a29-9e8f-14f463a18f64@felipetonello.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jul 2016 20:19:48 +0100
Message-ID: <CAJTo0LZh8QrUUZb4rr1JRkwtouXxyi0s821VyuWeNvbSL6CjVw@mail.gmail.com>
To: Felipe Ferreri Tonello <eu@felipetonello.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] juce: Added support for JUCE framework
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
X-List-Received-Date: Mon, 18 Jul 2016 19:20:10 -0000
Content-Type: multipart/alternative; boundary=001a113ed932392a8a0537eddb2e

--001a113ed932392a8a0537eddb2e
Content-Type: text/plain; charset=UTF-8

On 18 July 2016 at 19:04, Felipe Ferreri Tonello <eu@felipetonello.com>
wrote:

> Ok. Nevertheless the first patch is valid for oe-core.
>

Agreed, already queued it for testing. :)

Ross

--001a113ed932392a8a0537eddb2e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 July 2016 at 19:04, Felipe Ferreri Tonello <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:eu@felipetonello.com" target=3D"_blank">eu@felipetonello.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1qp" cl=
ass=3D"a3s aXjCH m155ff2f329d8f2e6">Ok. Nevertheless the first patch is val=
id for oe-core.<br></div></blockquote></div><br>Agreed, already queued it f=
or testing. :)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--001a113ed932392a8a0537eddb2e--
