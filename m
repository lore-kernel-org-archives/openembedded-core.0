Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6050E75F44
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 10:28:24 +0000 (UTC)
Received: by qkdl129 with SMTP id l129so24693735qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 03:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+Mjg2JRgfcx8nwzE7OFOQlhgieJpvDBzco9XK32aWik=;
	b=SqXsWl86oNReZ5Lt9N3Y24yo/LKfF9YyDjyvwn0n+5ZdY8TeX/ZNaeyJCQSfw7d3kj
	ngQkTv5ba5rpoyG4eb/hdmC7+kWy1TWZOCwuheiBUl8GqzRwBwy/qAw4d8WYrkXz2hq0
	fiYKoaVjjvjAqFvXQcNKtWeXBTTnO2zN0Rco6Hr+ysFSq3i3CgiUy5P97yDW/q2o2tdF
	KA5wTd1lW0urUUvO/exME71CVEzr9DyjJgTZukjH5Ko10wnFDNWusyTprhSdHjZ7pfa/
	NY/Dgnam4ZCgYjkBEleSTD6HRzOgTV4sCbmoFo/2b+0uV+wr4+nbIH+IsHf9TjkwNPon
	WD3g==
X-Gm-Message-State: ALoCoQkDMGNgpeKERWos8HDk7sGaukmnUVtQSJg6Av60rpiv5g6Vb1YKCgo1Jge2LuYyNYxA/LLo
X-Received: by 10.55.15.129 with SMTP id 1mr6953186qkp.29.1436956104910; Wed,
	15 Jul 2015 03:28:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 15 Jul 2015 03:28:05 -0700 (PDT)
In-Reply-To: <55A60F08.3080701@windriver.com>
References: <1436368635-6078-1-git-send-email-daniel.alexandrux.istrate@intel.com>
	<55A60F08.3080701@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Jul 2015 11:28:05 +0100
Message-ID: <CAJTo0LadMQeFURGWsQjvV-oMsCFTpFSc+GVhCYs6SsCHfta7cg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/runtime: Added 4 new runtime test cases
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
X-List-Received-Date: Wed, 15 Jul 2015 10:28:28 -0000
Content-Type: multipart/alternative; boundary=001a1146f10030fa4a051ae76a94

--001a1146f10030fa4a051ae76a94
Content-Type: text/plain; charset=UTF-8

On 15 July 2015 at 08:43, ChenQi <Qi.Chen@windriver.com> wrote:

>
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds/50/steps/Running%20Sanity%20Tests/logs/stdio
>
> Please look at the above failure.
>

Literally no idea why I ended up merging this into mut, because I knew it
would fail.

I've just removed it.  Daniel, can you please re-submit without the connman
test (and get that connman test removed from the test cases).

Ross

--001a1146f10030fa4a051ae76a94
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 July 2015 at 08:43, ChenQi <span dir=3D"ltr">&lt;<a href=3D"mailto:Qi=
.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><a href=3D"https://autobuilder.yo=
ctoproject.org/main/builders/nightly-arm64/builds/50/steps/Running%20Sanity=
%20Tests/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://autobuild=
er.yoctoproject.org/main/builders/nightly-arm64/builds/50/steps/Running%20S=
anity%20Tests/logs/stdio</a><br>
<br>
Please look at the above failure.<br></blockquote></div><br>Literally no id=
ea why I ended up merging this into mut, because I knew it would fail.</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I&#39;ve j=
ust removed it.=C2=A0 Daniel, can you please re-submit without the connman =
test (and get that connman test removed from the test cases).</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1146f10030fa4a051ae76a94--
