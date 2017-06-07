Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 573C7719B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 19:09:57 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id u19so17350474qta.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 12:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lbWS/1MJNyz/CqykCOkw4I7qMkfg1iLfvvoB6PUi5Yc=;
	b=V7P6azmBYmp40GGo4eP60ZyXbiENQ1qdsWjTV6hEK03KcRJ+V3jUqVoDdTI5htbrqh
	eFjyCVvz7R1Z0OQxBbp5idAtECI8g5SdWuyvUyDs3e0VWNkBd3ni55USKPOJpcVd/vu7
	2SSww21orZIexo7Nl6y9Jw1SmqsevA3GUxHwT0qS89rpw5gMCQe3zciUx7F+uyH6VeYB
	yLMUsWO14OmcmWFe3kMHiW2Xo7wNfKqP1qe4zbgfI6dxKw+V7WzcKPRgo84RHfeFKyC/
	K2JScpFH5PMKyBNrcU8I8dIcKHJPUVYA+b9A6RegQoXtorUHplA9ImwGJaG6ZTfnTJdD
	wFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lbWS/1MJNyz/CqykCOkw4I7qMkfg1iLfvvoB6PUi5Yc=;
	b=ZnZRkcHt707cmXinv9NYoofGEfX65nvYAlx4ryNj9INiTI9LGkDvyZkYiC4suV7til
	hoLKJdYo5zQrqw33H13fyfE5kawxBh5pristZGONkV0zjpBJDy1LfccAiMISRFuzWxda
	YTAHStQXXO2PAW/WOahvkzb9xiFbV9lwGmfkhiv1Y6eUg/aphffNXBXPDYdEhP2jkQPt
	E8g/Mtd44pTwrK5c4ByMju1Ta8f2MQftb7q0S9CVIhcDghv1FcS623LAUxO3iwBEH2pC
	ypOkpPPlFbPApv4i2s7sBsGXjSmRaLfK9bn9AyBHcBv+YFs3IU2WNS7Be18FTCpQOF5x
	69Zg==
X-Gm-Message-State: AKS2vOyEbqAJKMNtjFJ+aS95kvMyGaR3/WEntU8Tl0tjSUdPvEa3kJeP
	2+ZQhGGJVv55HMllcCs1xntDjBzzz5xp
X-Received: by 10.55.102.214 with SMTP id a205mr33322093qkc.154.1496862599124; 
	Wed, 07 Jun 2017 12:09:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Wed, 7 Jun 2017 12:09:38 -0700 (PDT)
In-Reply-To: <f64173c1-2746-06cc-d283-6d42c670cb69@xevo.com>
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
	<2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
	<4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
	<b51b0f8b-e21b-087b-5225-38fb8040479f@siemens.com>
	<8098d7e7-b887-4c4f-6dba-db9065c97571@xevo.com>
	<CAJTo0LbrkS8oG1s05KcMu6mREZwd-+h2aGwo7cLXjJc08XrMeA@mail.gmail.com>
	<f64173c1-2746-06cc-d283-6d42c670cb69@xevo.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Jun 2017 20:09:38 +0100
Message-ID: <CAJTo0LbpaXG07FouMMN5qa7zVUqkgxAG5OciFXQmhCzoSxrrEQ@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Wed, 07 Jun 2017 19:09:58 -0000
Content-Type: multipart/alternative; boundary="94eb2c0580a87fb5510551637b21"

--94eb2c0580a87fb5510551637b21
Content-Type: text/plain; charset="UTF-8"

On 7 June 2017 at 17:33, Martin Kelly <mkelly@xevo.com> wrote:

> Which patch are you referring to? I used git send-email for the systemd
> patch, and it applies just fine for me on OE-core master (using patch -p1).
>

Sorry, forgot to trim recipients.  Yes, it was Jan's patch.

Ross

--94eb2c0580a87fb5510551637b21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 June 2017 at 17:33, Martin Kelly <span dir=3D"ltr">&lt;<a href=3D"mail=
to:mkelly@xevo.com" target=3D"_blank">mkelly@xevo.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div id=3D":4wo" class=3D"a3s aXjCH m15c=
8367d8d8f48a6">Which patch are you referring to? I used git send-email for =
the systemd patch, and it applies just fine for me on OE-core master (using=
 patch -p1).</div></blockquote><div><br></div><div>Sorry, forgot to trim re=
cipients.=C2=A0 Yes, it was Jan&#39;s patch.</div><div><br></div><div>Ross=
=C2=A0</div></div></div></div>

--94eb2c0580a87fb5510551637b21--
