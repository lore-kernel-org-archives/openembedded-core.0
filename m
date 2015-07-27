Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 183B673D26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 17:15:24 +0000 (UTC)
Received: by qgii95 with SMTP id i95so56526970qgi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 10:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0lJuJ27bZ1XAC9YBKxfP+XquN9eUqSPhHPZG/rEdHwM=;
	b=PyYejYw3S/ryz8JnNBpoXvdWj7n9vm1LD7Zv6LfZlqMq592A/csa0KxNuRIoYOr6P8
	stqbDpy84lHrUm7W2KruoOLMMhrEUisoW81SCnstugZV1fwWyXePbCUxWu5OEq7t3UcN
	QkI2up5vGhH+t46swU8JBGJb+8C7WORnLr86NTj1E2xf3/ggSHRbfXu+5XfM7y5iapJo
	w+Gy5EjljFy0elUhFEHyDh8YM9hW5P4lp3ZNPzpTI/wAK1INKaa1jakRYhe1YiNRs8V6
	ha38ZsOPbw5Z1PXG/Gn4eKiuw6yZD+UUUOMQdu+U+kPJgsGhETjJ6dn3RRQ0rK4i6utJ
	e4Ng==
X-Gm-Message-State: ALoCoQnpL6XUWvmxMk82mAued5zSwr/c1Joxy/cWtpo1QVnn35VubJM1LDYFQwcLw2s59tJ1Oi8G
X-Received: by 10.140.235.19 with SMTP id g19mr44501302qhc.52.1438017325061;
	Mon, 27 Jul 2015 10:15:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Mon, 27 Jul 2015 10:15:05 -0700 (PDT)
In-Reply-To: <CAP9ODKo_nFMSQsCDDVeHjyHwvBOH4X4P36ED2uo9R8juMs5ZWw@mail.gmail.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
	<1437996407-29463-2-git-send-email-b54851@freescale.com>
	<CAP9ODKpMEdbLXiv=kHRpnX0CJ0v7ee_FRF0ZVMWYMW7a18mWdQ@mail.gmail.com>
	<CAJTo0LbOeMQXd+tRS4=ETVCcDwcaSkKAie_7aR+2zUXT2_pWrg@mail.gmail.com>
	<CAP9ODKo_nFMSQsCDDVeHjyHwvBOH4X4P36ED2uo9R8juMs5ZWw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Jul 2015 18:15:05 +0100
Message-ID: <CAJTo0LbqYSOY2VE++KYPbQ79yxxFHqvSN=pCojjRjDtPOmgLFw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v2 1/6] gstreamer1.0-plugins-base: Bug fix for id3demux issue
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
X-List-Received-Date: Mon, 27 Jul 2015 17:15:25 -0000
Content-Type: multipart/alternative; boundary=001a11376dacd76403051bde7f7e

--001a11376dacd76403051bde7f7e
Content-Type: text/plain; charset=UTF-8

On 27 July 2015 at 18:13, Otavio Salvador <otavio.salvador@ossystems.com.br>
wrote:

> On Mon, Jul 27, 2015 at 2:05 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > How many of these patches are applied in the 1.5 releases of GStreamer?
> We
> > can upgrade instead and a colleague is going to be looking at the
> upgrades
> > tomorrow, so if several can be dropped then that will save time and
> effort.
>
> Many but 1.5 is a development release and we should stay in 1.4 until
> 1.6 is out.
>

Why did I think that GStreamer wasn't following odd/even releases?  Sorry,
ignore me.

Ross

--001a11376dacd76403051bde7f7e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 July 2015 at 18:13, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"=
mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@=
ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><s=
pan class=3D"">On Mon, Jul 27, 2015 at 2:05 PM, Burton, Ross &lt;<a href=3D=
"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; How many of these patches are applied in the 1.5 releases of GStreamer=
?=C2=A0 We<br>
&gt; can upgrade instead and a colleague is going to be looking at the upgr=
ades<br>
&gt; tomorrow, so if several can be dropped then that will save time and ef=
fort.<br>
<br>
</span>Many but 1.5 is a development release and we should stay in 1.4 unti=
l<br>
1.6 is out.<br></blockquote></div><br>Why did I think that GStreamer wasn&#=
39;t following odd/even releases?=C2=A0 Sorry, ignore me.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11376dacd76403051bde7f7e--
