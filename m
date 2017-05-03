Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id A45C671A62
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 12:00:52 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id m36so134799583qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 May 2017 05:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QqM71pvzI8fH+gYcldMzxtUwJF0O9yr4ultI/jqHB+Q=;
	b=WR6CHcTlf9ntXJoybH4NIkWo7TlvssVXg4HGGoPKnK1UEG3povA6PRXJFK4fb4VAcg
	Xf13zxFETB673wmXhQQA8TO9EDamNLpEpHsARGYxh6m/yO7Cz5+VvJhwwNnFS7EvRu+6
	9oMlXSTc5V59yBC00VbCIRZWGV4XgNPmGmJv/QJJdpNsxHxknIRAvejMl8SDKWu3Ldvm
	NHDRICBfwV7EjT+Be/WiwVen+qdjUdssvu1DD/A8v/ifnDQLVicWza6+U7ms30TVykOU
	JfVgOhcTCGMPFXBqxypboFcSm0wJYoNfL1uEUIy5bQ4QvlnbBJ0zl4X3ZeQ3eOeOUo+n
	fE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QqM71pvzI8fH+gYcldMzxtUwJF0O9yr4ultI/jqHB+Q=;
	b=Xf9VXMVIst/UVgwzsxZlS0V5K2CE9sT26jDU3oxjCuAo3ZBT1eiXzDr+8fv1LSy6AO
	GG6NfYAZka6VQXsgcxzPmMY1+QAvrbjcS/YyPLmX0bb8sFYchcToTl5WL9DG3oz/fOw0
	Bugs3Fc83fNDUEZLAXuJgcgkQWiFwFkoqCq3bahgOoI2APZlucsS2f46BFeFkCidPhk+
	wr1Rd+3R0LMEJ321mwr/xqub7AhhGHFARSQPx2E9K0v0Jhpbi5GuNMm24iWZeJca5CO1
	aNnkG7yh8WDpCOxuw3uWoJQfU1K8rgv2nkEMBCknZ+8XdkD75ZPhyfgx96+NPBBkIXLP
	Jd2A==
X-Gm-Message-State: AN3rC/7jGksFroqns9Sf+gPjAPweNUJ1jcAGNsRYPP/mIaVM36ykFV5b
	sQDKFe0RvLtaTNaaPeUZkF9py/JkD8Vt
X-Received: by 10.200.42.238 with SMTP id c43mr31995500qta.144.1493812853964; 
	Wed, 03 May 2017 05:00:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Wed, 3 May 2017 05:00:33 -0700 (PDT)
In-Reply-To: <1493812409.4241.247.camel@intel.com>
References: <aec82a5d8c1b622749a12bea2c478a8ff7f363b1.1493808889.git-series.patrick.ohly@intel.com>
	<1493810039.23535.57.camel@linuxfoundation.org>
	<1493812409.4241.247.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 May 2017 13:00:33 +0100
Message-ID: <CAJTo0LaHhRHzxmUaaF8MCHgKTvJPqKa0Q+rOjAd1vx4Ps0RE2Q@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] QemuRunner: avoid tainting os.environ
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
X-List-Received-Date: Wed, 03 May 2017 12:00:54 -0000
Content-Type: multipart/alternative; boundary=001a113f40e486a9be054e9d68f8

--001a113f40e486a9be054e9d68f8
Content-Type: text/plain; charset=UTF-8

On 3 May 2017 at 12:53, Patrick Ohly <patrick.ohly@intel.com> wrote:

> Then it wouldn't get logged. Not a particularly strong argument, though.
> If that's preferred, I can change the implementation.
>

I prefer the clarity of copying os.environ and adding to it over running
env, especially as you have whitespace/quoting to deal with.  The variables
added to the environment could easily be logged separately, surely?

Ross

--001a113f40e486a9be054e9d68f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 May 2017 at 12:53, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":kz" class=3D"a3=
s aXjCH m15bce296cff19087">Then it wouldn&#39;t get logged. Not a particula=
rly strong argument, though.<br>
If that&#39;s preferred, I can change the implementation.<br></div></blockq=
uote><div><br></div><div>I prefer the clarity of copying os.environ and add=
ing to it over running env, especially as you have whitespace/quoting to de=
al with.=C2=A0 The variables added to the environment could easily be logge=
d separately, surely?</div><div><br></div><div>Ross</div></div></div></div>

--001a113f40e486a9be054e9d68f8--
