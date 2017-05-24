Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1E5BA780DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 13:16:01 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id k74so153406861qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 06:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pYhgSO5JzcYpvTlfDnf9UTPgsp4Bk21zKD+ZvqBAwps=;
	b=SDpBGqjwthsVV2yZEAjTD/ttkFMZWBAgtrmJTQYaepgdTkDl3cRCtsOfPH/RSF46Tc
	xIoIL+RezFkvFObs97fxNM3KTTrB9c5r0xu5i6gJlYB67mtCB1LPxZRJIb7yxl0jrSOL
	xOH03Ek05V/pRNwPJQf3BiZq6bLgmwwX4PJljkKIQ0rU3q680fGp/1M1uxLAZY5DfIId
	XZl5JuW+UsaeOqChle3VNULxlaqvaniphDmOBMTwhfMSBqOuWuHR6H+jKU06DFDdJOLR
	Ne8l1rX1M0TbAjZuQb096usrFsRrOB4EaXod43hs2hhoq0oDE+OjpyANqDWU2cn2oNVl
	SwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pYhgSO5JzcYpvTlfDnf9UTPgsp4Bk21zKD+ZvqBAwps=;
	b=cl/6zb5RC8a5Z59jwUze0vS1MbjBaYhM8L86uapokrFdfss2RhM8vd9eUDBlIsNjEi
	u8QxDjALNieLqf/DAoLVC0c/2ADvSL5/Z2dQ66uE455ct+m19L4FBA7NyESpXpXnKiMU
	SySx6jPMeBndkuScRCDAxijHG+yiu8JzHwEr2Ypjcfp+6VYS8gSnQBe2mAyxDr74ShOJ
	W4fMtSohQFudqWaUlpT/B2gQwVyVs5GQAKtqK2ZdweK1VMzBKnZxMLORsto/lM2NAw2K
	geS0mTWgbDcFRtdgYKd/hZhzDfceAspkEDrvSZ39oqw5uS6xKblFaRQFORf2eICMV4if
	bUPQ==
X-Gm-Message-State: AODbwcDhC65q2hI7NMtKy15nxwrxOZA5OFr9zZ/5WuF4yEQHuHqraW1d
	hypSHlWz5iRtxhARDDu5M0Ejv/8qInoJ
X-Received: by 10.55.140.65 with SMTP id o62mr30422416qkd.127.1495631763082;
	Wed, 24 May 2017 06:16:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Wed, 24 May 2017 06:15:42 -0700 (PDT)
In-Reply-To: <CAP71WjyNaSFd3Aw5WD9=aKkopAWaofR5b6TUbthzBSusLx45JQ@mail.gmail.com>
References: <16ea8913-19d8-a67a-601a-98cad6657d58@topic.nl>
	<CAP71WjyNaSFd3Aw5WD9=aKkopAWaofR5b6TUbthzBSusLx45JQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 May 2017 14:15:42 +0100
Message-ID: <CAJTo0Lba2bm4gsrcxYTgJefLW8tEm5TM2UmCDRqFjjsXCF=APg@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: What's the "proper" way to start WiFi networking?
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
X-List-Received-Date: Wed, 24 May 2017 13:16:02 -0000
Content-Type: multipart/alternative; boundary="94eb2c05430ef43fb9055044e7e8"

--94eb2c05430ef43fb9055044e7e8
Content-Type: text/plain; charset="UTF-8"

On 24 May 2017 at 14:12, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> after going back and forth for some time, I am now always using
> network-manager.. it has very handy command line utilities (nmcli and
> nmtui) and is well integrated with systemd. that happens to work well
> for me.
>
> i want to believe that connman can do the same thing, but i have never
> tried it much..
>

Yes, connman can do exactly the same thing.  The only gotcha is that
connman doesn't enable radios by default so you need to add a configuration
file to turn it on, but if you're going to be making it either autoconnect
out of the box or  be an AP then you'll be doing this anyway.

Ross

--94eb2c05430ef43fb9055044e7e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 May 2017 at 14:12, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=3D"=
mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@lina=
ro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
1gx" class=3D"a3s aXjCH m15c3a9721b1b3b74">after going back and forth for s=
ome time, I am now always using<br>
network-manager.. it has very handy command line utilities (nmcli and<br>
nmtui) and is well integrated with systemd. that happens to work well<br>
for me.<br>
<br>
i want to believe that connman can do the same thing, but i have never<br>
tried it much..<br></div></blockquote><div><br></div><div>Yes, connman can =
do exactly the same thing.=C2=A0 The only gotcha is that connman doesn&#39;=
t enable radios by default so you need to add a configuration file to turn =
it on, but if you&#39;re going to be making it either autoconnect out of th=
e box or =C2=A0be an AP then you&#39;ll be doing this anyway.</div><div><br=
></div><div>Ross=C2=A0</div></div><br></div></div>

--94eb2c05430ef43fb9055044e7e8--
