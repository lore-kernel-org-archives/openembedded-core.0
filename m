Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD236FEF6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 16:20:39 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id to18so222151704igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 08:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=uRM2464wNwd1n7sFs2Gu8lwCQQjy5lyG5ucyyp98f5w=;
	b=EX9q0KImpKmCGCn7gWjHpgDTnfF9DDOADliyhuGbmdt9m7RyAoKIsdwJfjIBe+mcSU
	zMaApAd1YLMIoYbHx9ttuTvOsAaDWxcIeZbHdcBuT//8wL9H4zSDmEoJYISlPcCqjfp+
	69Gyp3XFEYmKhOPtQsWK3fTGuiyZyVYgslX7fqDlovJj0xlHe1JHKNEnuqsdCQgFe+rS
	YP3wa3Y4zMH5STNHAghhqzBbl+k4wW22AQM1jUuVvUwB62She2CcVPaRsLDc+MkqWZ+8
	bEE+uvRgNRl2GTlYxsVJiBc66StLpyFz3FBtp8vX690WeKdTiNZGINEhYeGXu+pg64mo
	LieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uRM2464wNwd1n7sFs2Gu8lwCQQjy5lyG5ucyyp98f5w=;
	b=hMvVnNQKr4ex9Ck6hDqSzBMgscIL9HoK8kfBG7iakG6xa8Vd60mxNEpQNWCS9szMsK
	ohjN0+SONRHo9tsqwQvsnrrWfQ8SAuG5zvtP7UvctUGWHysXG1Ygbd59jBrO2PQuuCVQ
	3bZ+kSdO040+jSF9jaWz8d69ggSAkyloa/Y/NKUJMBMFEwKlr0yXT+qe+OI+VzIcDyo2
	tpNEhvxWWPczDT/F3Au+xKeI9oZpEDBaIQp94XaTReS73ypFoTPHzogfytJIF9Ug5Nl7
	Lz7QrOrIn9njO6BbJiDPzrwxMCYWyqtp1FOtDUuV1riv6GJhb5lL/6ZVWVQsyAgdzeGP
	UAsQ==
X-Gm-Message-State: ALoCoQnNvFWvFMz/F+yovsMz1ljy5DwYFSsckzSoHqfbX7djR4b4MYX9AlC0uL5OffEJOS3i6wBpcEP6KRk2WEbN/Dz3wxT3vGOdfZBI1y4UNilJs4alNGA=
X-Received: by 10.50.13.100 with SMTP id g4mr76122041igc.64.1451924440076;
	Mon, 04 Jan 2016 08:20:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 4 Jan 2016 08:20:20 -0800 (PST)
In-Reply-To: <5685A731.1070109@gmail.com>
References: <1448720991-29707-1-git-send-email-twoerner@gmail.com>
	<5685A731.1070109@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jan 2016 16:20:20 +0000
Message-ID: <CAJTo0LbzApjnimOTb1XiiJjt7UgOk5WGodf1ghDPK7tWR-KkfQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mkefidisk.sh: add boot log on console
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
X-List-Received-Date: Mon, 04 Jan 2016 16:20:41 -0000
Content-Type: multipart/alternative; boundary=089e013c66147def3f052884805d

--089e013c66147def3f052884805d
Content-Type: text/plain; charset=UTF-8

On 31 December 2015 at 22:07, Trevor Woerner <twoerner@gmail.com> wrote:

> ping?
>

Sorry, slipped through.  These are staged in ross/mut as of now.

Ross

--089e013c66147def3f052884805d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 December 2015 at 22:07, Trevor Woerner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2c2" class=3D"=
a3s" style=3D"overflow:hidden">ping?<div class=3D"yj6qo ajU"><div id=3D":2a=
3" class=3D"ajR" tabindex=3D"0"></div></div></div></blockquote></div><br>So=
rry, slipped through.=C2=A0 These are staged in ross/mut as of now.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--089e013c66147def3f052884805d--
