Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 066C877DDE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 11:56:00 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id r142so64493914qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 04:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nyc0g7KhpOL7c65kuF0stsU8gRyPInPCp+H9ZaXanWg=;
	b=ijw4qPr8UpgiRYVWuWfy2dhpV/CSRAXwcfJfy1pttYnXYTGqXsctiBmhrEJAWYiG5k
	6GEKLooNZdZLFM+/QjaelqVmAf+erxSlbvTzzR906qwXdU1cCJ6okXltmGGCPIyad8MD
	zapWVbwGBRQ9+f9e7oAExn1v7VeLKpw5XeaiyCjGGwVMiNm6zYkP4B2akOVLjZ8Og5UP
	re6+2+BLzUt0fMQCcUDpqrZ0Uv/0M1u8HlFB5c4U8+qsS6MOqooFo0BCqyQY+tF6nLwH
	r+CLRvm7kk8ePhDyL3DY36WP5jbazsDsKdoumS5E6APKZnXCSfBTLJ1jpb5m7wfJ34BO
	1c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nyc0g7KhpOL7c65kuF0stsU8gRyPInPCp+H9ZaXanWg=;
	b=F4TAcr3Dqu9Uz9dzmRqljt/aTK9kGtQiiHXlv3s6/tHWmA9GblVL0y3PJg29j2qVFK
	jaUDMhpFKgwP/28EbrS2pVEJzznHoAO3PsYoWNG00dcb2PV91V2rRWVpvafDmMqEcr6f
	noJ0drNVk1Nb9oDHfpaPMpy7RqF4q4Y0BOESWLo3fxUMv7hnayZswzTMwq/oLVdGDUi+
	l2imRWecVSNR52KKFvaCMUCvykTYVvzA0CvEbAi4wxK9V4pa+IAXsGYy8ioAbEKMNrFi
	bOBCw+9S3LfPUvYTEWDFHWOOnegDCj4EoOaYZl9MuVBFMBe8M1icMUPXQgTnWpH36tch
	PDsA==
X-Gm-Message-State: AFeK/H3kkGpqfjQOWaodqwxIACXUc4gR67MMZ+yWEZSEiBOgNELKqLWBvADSygI0SCQI/SHBi0dIWrA9vV759DxE
X-Received: by 10.55.20.100 with SMTP id e97mr2446079qkh.3.1490961361311; Fri,
	31 Mar 2017 04:56:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 31 Mar 2017 04:55:40 -0700 (PDT)
In-Reply-To: <20170330180636.GV15664@denix.org>
References: <20170327142231.21807-1-marex@denx.de>
	<1490624701.13980.267.camel@linuxfoundation.org>
	<5c037512-7bf1-8a3c-cb76-fda7230781a0@denx.de>
	<20170329215658.GP15664@denix.org>
	<a5b043f0-b0ee-a74b-fd55-4f8d20669cba@denx.de>
	<20170330132447.GU15664@denix.org>
	<a8de81ca-4056-ad2c-4e38-1bd1b4c62315@denx.de>
	<20170330180636.GV15664@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Mar 2017 12:55:40 +0100
Message-ID: <CAJTo0LYtO5P7cUvtcKfiQ1KbsaYFSfzoE1oryCPOx_LMnE6vkw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Marek Vasut <marex@denx.de>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Fri, 31 Mar 2017 11:56:02 -0000
Content-Type: multipart/alternative; boundary=001a1140110450db9c054c057ed7

--001a1140110450db9c054c057ed7
Content-Type: text/plain; charset=UTF-8

On 30 March 2017 at 19:06, Denys Dmytriyenko <denis@denix.org> wrote:

> "Known devil is better than unknown angel"? :)
>

Agreed, fwiw.  It's late and u-boot is quite important: cherry-pick the
patch for Pyro and master can upgrade once it has branched.

Ross

--001a1140110450db9c054c057ed7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 March 2017 at 19:06, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":1jc" class=3D"a3s aX=
jCH m15b20660f2699d2c">&quot;Known devil is better than unknown angel&quot;=
? :)<br></div></blockquote><div><br></div><div>Agreed, fwiw.=C2=A0 It&#39;s=
 late and u-boot is quite important: cherry-pick the patch for Pyro and mas=
ter can upgrade once it has branched.</div><div><br></div><div>Ross=C2=A0</=
div></div><br></div></div>

--001a1140110450db9c054c057ed7--
