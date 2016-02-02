Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1B04776FF2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 11:23:41 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id 9so13543771iom.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 03:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=B5fhoFjRTmQb1Ht2u3Fs62dzJiK9gEmx9iRI2NDixPQ=;
	b=vNmi1DNPlDxnno6dzUFsRkyZ45vtsUHPWJdJiQoSWgtFMZW75LpD1D/LXVr3miqgBN
	0fF/7CD41zyubKZY9ETdFvSLfIkENFOj6xpsbF/QDRYGXWzP+RPlXHt19XJMPURbVv32
	FGIBvHkJdb04qqJBOqOiXpf6DTBB/pe7ATVwQtB7pyFLHGDTv8TUthThNTX6+7Dtgs/i
	1DRIkKJVXW20aU96ACOmByGE5XjXnb2BBbLiUr+Is9yQU0wMUbl60IajIWPaErpuzsF5
	CfPOsVR62Q0xWU7bTUl0yN2OuaKchi87P/DIeoyHH6MagOhhoNPJYwReNPsJMjDNzQr8
	SI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=B5fhoFjRTmQb1Ht2u3Fs62dzJiK9gEmx9iRI2NDixPQ=;
	b=apWKrWYS1TOOpbbBaKSLf+/ig3GsN5hp1Cn3qTVIsG0gvDfzGHy/NOQiMpEBBLsTmp
	iEQXWejZlaRetZEN9LJ3+tvg/SA/aOGXRRC4TUZdXd6P9so84NY8CW6gzotbKHKFDCHX
	ETaFYVgyx4sFK/pyvbRN9oxyZieAh+HaqBkM24N1poUXTozVwFd8/2Wl4yB8CrYPrNR/
	z8ntmDWi7xhympcUYTUXZ7z5q8IfwLCyjKINbKeWRZfnh7IkBuYXC2cI30p4Za+mgMII
	+BWKWyloUgqbRKG4PhuWtXzwZovwZu9uStdT12xTiFn4fCbmpGwt6/QTi94efy77/aOZ
	NXGA==
X-Gm-Message-State: AG10YOQ46fm96U0zLPfWD1wB9ha+eFD2SpCKutSW8zST9SukTnzLf7LyBkKZgPthPNzC4hcTR7WTJpliCZ+f+2+5
X-Received: by 10.107.164.15 with SMTP id n15mr11233596ioe.148.1454412222560; 
	Tue, 02 Feb 2016 03:23:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 2 Feb 2016 03:23:23 -0800 (PST)
In-Reply-To: <CAJ86T=XibuPtxUY2c+TQ35_KdBO47wRoCuSehgTbGfaR+tb8_A@mail.gmail.com>
References: <1454363382-13387-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LbfKq2CtEj3Y8zBmgQiXPNJF4587R2httpbmsNHgG+mhA@mail.gmail.com>
	<CAJ86T=XibuPtxUY2c+TQ35_KdBO47wRoCuSehgTbGfaR+tb8_A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Feb 2016 11:23:23 +0000
Message-ID: <CAJTo0LZ5BC4MWpaHL2Zk=ts5iJ-7-U9UQAVetBLwqUzEBLs0Qg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH] curl: disable curl-config binconfig file
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
X-List-Received-Date: Tue, 02 Feb 2016 11:23:44 -0000
Content-Type: multipart/alternative; boundary=001a11377682e21282052ac7bbc5

--001a11377682e21282052ac7bbc5
Content-Type: text/plain; charset=UTF-8

On 2 February 2016 at 04:18, Andre McCurdy <armccurdy@gmail.com> wrote:

> Thanks. Unfortunately I don't see a clean solution for this. The
> setup.py script uses curl-config to determine which ssl implementation
> curl has been built against and that information isn't available from
> pkg-config.
>
> It's probably fixable with some surgery, but I'm not sure it's worth
> the maintenance effort just so we can disable curl binconfig...
>
> Please drop my "curl: disable curl-config binconfig file" patch.
>

The feature tests?  That's exposed in pkg-config as the supported_features
variable.  I wouldn't be surprised if more recipes in meta-oe were using
curl-config though, so I do agree with you here: moving away from
curl-config would be good but scoping out the damage in a world build
including meta-oe needs to be done first.

Ross

--001a11377682e21282052ac7bbc5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 February 2016 at 04:18, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div id=3D":3fr" class=3D"" style=3D"over=
flow:hidden">Thanks. Unfortunately I don&#39;t see a clean solution for thi=
s. The<br>
setup.py script uses curl-config to determine which ssl implementation<br>
curl has been built against and that information isn&#39;t available from<b=
r>
pkg-config.<br>
<br>
It&#39;s probably fixable with some surgery, but I&#39;m not sure it&#39;s =
worth<br>
the maintenance effort just so we can disable curl binconfig...<br>
<br>
Please drop my &quot;curl: disable curl-config binconfig file&quot; patch.<=
/div></blockquote></div><br>The feature tests?=C2=A0 That&#39;s exposed in =
pkg-config as the=C2=A0supported_features variable.=C2=A0 I wouldn&#39;t be=
 surprised if more recipes in meta-oe were using curl-config though, so I d=
o agree with you here: moving away from curl-config would be good but scopi=
ng out the damage in a world build including meta-oe needs to be done first=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a11377682e21282052ac7bbc5--
