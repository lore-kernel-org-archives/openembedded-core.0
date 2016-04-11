Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9686B6012C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 19:40:29 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id 2so223185696ioy.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TnsJ7Gop9yrjsui65d0D8YkAbeYXbrhFou1/eFs4DIw=;
	b=hfpC9IYMlq6aRSoL/0ftsR8J7f/MLVe6NWjYy9U4WoRK4f19mcL7MlXfF3ZAR7sw8d
	B4QUcVLvn3GoU06RAxdVA4pl47jJ3sIVB1kLDxSVqcuHAhTn4JHLiboaCCxq9YvC6cQ3
	lp3JHjv1ZhNt/TizbvcUVsiXIh5AmEToqePfj72EZpACNUsN9P4MNgH/VF7+XmcXYckb
	uFsmUZ4O/sAr3mCp+KZ0w5b6L/avbL+1Xc8rjT/xVS99JITFCG6EpM6zSelAB9ynB3kk
	I1QNnjt46vK2INwX6/v7Ahk9rOO00bcidOm72liANB3eh0D5TmvaJsEXnnJAhNi+hNHj
	aDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TnsJ7Gop9yrjsui65d0D8YkAbeYXbrhFou1/eFs4DIw=;
	b=UjxnUcwTwNCeLnjTvrLKy5EhNmPpVTftFT7vJm4aApWdifpnZU7ipq/SmKqAPv50k5
	ve9e6EEpqq34wiuIcqxrgFKLoZg/0JuneQVuecYZyktvCO6mT2N2xrZFXXQ1zRbA+05c
	NVeidRSC4Y+xQtWYZPMzYrxcmUAvriwLRBhzLnQAo6UcWGj3cfUe/lV57s12lhEvvomC
	1iJZiXddZ4cllVJjAvdcEQlvhfcYbLb0mq6e2KykB0b6wxxCy40z9y5DCy1otdpejyJ4
	mmut43aDjznoYmNXC8z93eaDSxx18fEwjdDt8PRZPdSHW/dUG/p6qPGxyfcOWSS/1OP8
	IIhw==
X-Gm-Message-State: AD7BkJI90KfHobSEf5bJy3lxvfQhlxLoU6v40UQUN5EfKj7pP21pu6fyvPTN2hK7OLqmc8dcVm9YBJRnFCue56T1
X-Received: by 10.107.16.104 with SMTP id y101mr23400041ioi.148.1460403629880; 
	Mon, 11 Apr 2016 12:40:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Mon, 11 Apr 2016 12:40:10 -0700 (PDT)
In-Reply-To: <20160411191022.GS16135@denix.org>
References: <cover.1428410929.git.liezhi.yang@windriver.com>
	<20160410225130.GK16135@denix.org> <570AFBA4.40201@windriver.com>
	<20160411014945.GL16135@denix.org>
	<1460363748.9308.30.camel@linuxfoundation.org>
	<20160411134240.GO16135@denix.org> <570BB0B6.4070907@mlbassoc.com>
	<20160411191022.GS16135@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Apr 2016 20:40:10 +0100
Message-ID: <CAJTo0LaerKQtF-z-nmAHvzQR0HGbnUc8+HB40=iN8bYZgtANKg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Gary Thomas <gary@mlbassoc.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/2] unique -dev package
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
X-List-Received-Date: Mon, 11 Apr 2016 19:40:30 -0000
Content-Type: multipart/alternative; boundary=001a113ff020968eea05303ab7ff

--001a113ff020968eea05303ab7ff
Content-Type: text/plain; charset=UTF-8

On 11 April 2016 at 20:10, Denys Dmytriyenko <denis@denix.org> wrote:

> So, why -dbg cannot follow the example of -dev and -staticdev packages?
> I.e.
> in your ffmpeg example it would mean creating all the necessary libblah-dbg
> packages. Why isn't it the option?
>

To save time and effort the debug packaging happens automatically in modern
OE, so it's actually effort to split the debug files into multiple
packages.  If you split the packaging from PN-dbg to libfoo-dbg libbar-dbg,
where does the debug source go?  There's even more packages to follow the
dependencies for now too.

As much as I'd like to see 9104 disappear (being the assignee for it), I do
think that supporting a single -dbg package is the right thing to do.

Ross

--001a113ff020968eea05303ab7ff
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 April 2016 at 20:10, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":uer" class=3D"a3s" s=
tyle=3D"overflow:hidden">So, why -dbg cannot follow the example of -dev and=
 -staticdev packages? I.e.<br>
in your ffmpeg example it would mean creating all the necessary libblah-dbg=
<br>
packages. Why isn&#39;t it the option?</div></blockquote></div><br>To save =
time and effort the debug packaging happens automatically in modern OE, so =
it&#39;s actually effort to split the debug files into multiple packages.=
=C2=A0 If you split the packaging from PN-dbg to libfoo-dbg libbar-dbg, whe=
re does the debug source go?=C2=A0 There&#39;s even more packages to follow=
 the dependencies for now too.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">As much as I&#39;d like to see 9104 disappear (bei=
ng the assignee for it), I do think that supporting a single -dbg package i=
s the right thing to do.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a113ff020968eea05303ab7ff--
