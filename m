Return-Path: <liu.ming50@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6F94277F85
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 14:10:50 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id k123so11312194qke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x8tWYhCaE8oWZCp4pIGwujurIX68f17jyccPDiM9krg=;
	b=fsV4lgKA54RkO2UKUG9b+eNS7qP6jq87fciVtTyGFydWPnHA7fUy6USNVc/IPmFbN2
	gadCYG+cZFTTscxtxbjc2gWaHfQ62K6GnOIcNALlm6h2Jc4qGCqfQQ1V1PJeIAvBiN6o
	P2rCsPEUaWqETXtP27Ff1dzA8za7sVp7NC22+lU3s/PjS84lv4rhl681WL/jDr2IWlsq
	8onsaXvYe9Hov5aK1BcvyoRA91n5eUR9mvoQ3Js90xIDliWxF1dkpbo41ly1XeB4BCpl
	hz29kp/sozVaapNnQjVHeFkXqn1UR9WIdGzuZss2DmbYSmEe5J+eih1ORg9nRL1aHw/Z
	MahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x8tWYhCaE8oWZCp4pIGwujurIX68f17jyccPDiM9krg=;
	b=ZyproAXo89uuPSzn/vIezEIe1Twk66ZEYJMkdD/cjGZkJRmchvEYxH5EypqyGPp2Y6
	fqKZoclVSHdoPOS3iy0TyZbb3TEudAvpR1iIW5+3scOBvVOtjysKGgPSveNkPFUSDhes
	RZ3vMs3qscy4OadCUXchbG5lLjhc7fbQgAMLm2hBt7jYHjEeHpFHg5/DNurbTXLvdKFv
	5VxXm0ld9CDOcBmOv2q1EAmWdSBflXPvbJa1KkPSveuhAejrUvTxtg3u22zfzLSqVo3L
	gHfL5rsojIUQzZJ1wIAYwYh8x/TLtKjJPShIbRX4NlE5BZ6vLZ7TQ3dBxABnug92fuX8
	B4oQ==
X-Gm-Message-State: AMCzsaV8HYs4r2XXrps1UC3i2+WIwSJTPVfHeLMYpYNLizJ5bFJi0EiG
	k5nu17bdD6XLnFcaHrFuEclI4eg8tuVCiX996jk=
X-Google-Smtp-Source: AOwi7QB/CVqvBbOfSB7hx9/f1pVyiKieQfdtz98I+RuU1v/3qPn8h2wULsInnltfEmnxoz1YV2KDD9093QukVB9ROtc=
X-Received: by 10.55.82.214 with SMTP id g205mr30568651qkb.191.1507212651470; 
	Thu, 05 Oct 2017 07:10:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.55.72 with HTTP; Thu, 5 Oct 2017 07:10:50 -0700 (PDT)
In-Reply-To: <CAJTo0LZ0oanPjJSh4a4qoUEDHoK7xb1MsFmcjvZ_aY-D5dGTHw@mail.gmail.com>
References: <1507175286-8225-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LZ0oanPjJSh4a4qoUEDHoK7xb1MsFmcjvZ_aY-D5dGTHw@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 5 Oct 2017 16:10:50 +0200
Message-ID: <CALatG=6KcyWh_BLwgMtHXNwu+OOneEJoOodz6MYjAsQw093TRw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] argp-standalone: set ALLOW_EMPTY to PN
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
X-List-Received-Date: Thu, 05 Oct 2017 14:10:50 -0000
Content-Type: multipart/alternative; boundary="001a114a6996b12e9f055acd4a82"

--001a114a6996b12e9f055acd4a82
Content-Type: text/plain; charset="UTF-8"

Hi, Ross:

Agreed, will send a V2 soon.

//Ming Liu

2017-10-05 12:22 GMT+02:00 Burton, Ross <ross.burton@intel.com>:

> On 5 October 2017 at 04:48, <liu.ming50@gmail.com> wrote:
>
>> From: Ming Liu <liu.ming50@gmail.com>
>>
>> This ensures argp-standalone-staticdev package could be installed
>> correctly(depending on argp-standalone) if it's being required during
>> SDK population.
>>
>
> I'd prefer to remove the dependency on PN in PN-staticdev, as a
> argp-standalone library package with nothing in it is more confusing.
>
> Ross
>

--001a114a6996b12e9f055acd4a82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Ross:<div><br></div><div>Agreed, will send a V2 soon.<=
/div><div><br></div><div>//Ming Liu</div></div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">2017-10-05 12:22 GMT+02:00 Burton, Ross <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank"=
>ross.burton@intel.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv dir=3D"ltr"><span class=3D"">On 5 October 2017 at 04:48,  <span dir=3D"l=
tr">&lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming5=
0@gmail.com</a>&gt;</span> wrote:<br></span><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote"><span class=3D""><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From=
: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">li=
u.ming50@gmail.com</a>&gt;<br>
<br>
This ensures argp-standalone-staticdev package could be installed<br>
correctly(depending on argp-standalone) if it&#39;s being required during<b=
r>
SDK population.<br></blockquote><div><br></div></span><div>I&#39;d prefer t=
o remove the dependency on PN in PN-staticdev, as a argp-standalone library=
 package with nothing in it is more confusing.</div><span class=3D"HOEnZb">=
<font color=3D"#888888"><div><br></div><div>Ross=C2=A0</div></font></span><=
/div></div></div>
</blockquote></div><br></div>

--001a114a6996b12e9f055acd4a82--
