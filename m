Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4D4731C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 19:29:38 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id f89so103923727ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vTGgMYSOu9DpWYrxm6HZLLGf81Yr1aHjHoK0DUKDdVQ=;
	b=UV8lxD4EXccf57v/m+wOhP4n98j13x79QxRfuaNUNPZV4MvaWDqvts/JSCSG/crTwF
	GGCiYfhF5zaIiDHwSSE1OyMvT371mYbmSi8oOuZ3crLiprqclDODDGvC9fD2vzdfohAR
	IMjeYqSMKPT7McQJ3WWfu4Pf+GBI40qPAY3C9Oy4KrYp7rANI18RTzCxNvFW6IwfVES5
	MIX4phBmGukpvqwrzptfSQ0mqx7BDsYZRKNyzQHM6cXoLBP7w3O7OMMYzXQvhy/ZtlA2
	Prhy3ag2hUYz6yjpO3RJpVGFEMlo6iCIjh2Gu+nuPisxNwTBeqzq0WTEJdzrDz7xVv5+
	/cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vTGgMYSOu9DpWYrxm6HZLLGf81Yr1aHjHoK0DUKDdVQ=;
	b=AHmYeutOLpgjuGY9xh1jb5hRWIaiM2rEu+G1/TOQDrAKIJtXOMI9KKfDY1vavcAcFv
	wvv59w4++ESO85VgrsNmkjscSQnEKqlKw08M+z5iujyzuewdiz+OrxhgEBPt52GKn8+n
	XpG+Nc4gNWOyE1SebIfvgORAMUWcXdzMPTXKiPaipvxKepU2ynGquioY6xNKSd7GkQUC
	vPiNAg1tOukZAA5sfG9X61yhdOJvOoU36NJFTsicqdWHyaHNW5hisOq6xq5hUX5TSAPJ
	1pma7h7sZmNSPM1rEFHLMMo21uCgXjf1inICFUPnBuPotLDwcXF5KEc2kcJI4DzJw/Vo
	/VAw==
X-Gm-Message-State: AOPr4FVoCxu70oqyd/jzof5xXJHubicKsRjGipxrx+Y8+kxIKjndYDN7t8nKyQlwot0MrX36YF6sfyGQUclWICG9
X-Received: by 10.107.51.213 with SMTP id z204mr1829400ioz.148.1461353379164; 
	Fri, 22 Apr 2016 12:29:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Fri, 22 Apr 2016 12:29:19 -0700 (PDT)
In-Reply-To: <20160422170410.GB23308@linux-yxv0>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E570F86EE@fmsmsx111.amr.corp.intel.com>
	<20160422170410.GB23308@linux-yxv0>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Apr 2016 20:29:19 +0100
Message-ID: <CAJTo0LYnK-sd+d1bkJN39AhkAN0t+42Nonm38Qyy3BXm1nLYdw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW17
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
X-List-Received-Date: Fri, 22 Apr 2016 19:29:40 -0000
Content-Type: multipart/alternative; boundary=001a11440cd00e8bc8053117d943

--001a11440cd00e8bc8053117d943
Content-Type: text/plain; charset=UTF-8

On 22 April 2016 at 18:04, Trevor Woerner <twoerner@gmail.com> wrote:
>
> Have the eSDK and CROPS projects been announced publicly? Are they
available
> for us to "play with"?


eSDK is the "extensible SDK', or what appears when you do bitbake image -c
populate_sdk_ext.  This should be in the manual already, the tl;dr is that
its an SDK you can manipulate after installation.

CROPS is docker magic to do builds on Windows/Mac.  Todor did a
presentation at ELC: http:
//events.linuxfoundation.org/sites/events/files/slides/Todor_Minchev_CROPS_ELC_2016.pdf
<http://events.linuxfoundation.org/sites/events/files/slides/Todor_Minchev_CROPS_ELC_2016.pdf>

Ross

--001a11440cd00e8bc8053117d943
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>On 22 April 2016 at 18:04, Trevor Woerner &lt;<a href=
=3D"mailto:twoerner@gmail.com">twoerner@gmail.com</a>&gt; wrote:<br>&gt;<br=
>&gt; Have the eSDK and CROPS projects been announced publicly? Are they av=
ailable<br>&gt; for us to &quot;play with&quot;?<br><br><br>eSDK is the &qu=
ot;extensible SDK&#39;, or what appears when you do bitbake image -c popula=
te_sdk_ext.=C2=A0 This should be in the manual already, the tl;dr is that i=
ts an SDK you can manipulate after installation.<br><br>CROPS is docker mag=
ic to do builds on Windows/Mac.=C2=A0 Todor did a presentation at ELC: http=
:<a href=3D"http://events.linuxfoundation.org/sites/events/files/slides/Tod=
or_Minchev_CROPS_ELC_2016.pdf">//events.linuxfoundation.org/sites/events/fi=
les/slides/Todor_Minchev_CROPS_ELC_2016.pdf</a><div><br></div><div>Ross</di=
v></div>

--001a11440cd00e8bc8053117d943--
