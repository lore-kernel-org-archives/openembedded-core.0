Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id F406F71DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 18:49:20 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id w1so140836201qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 11:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gGDJaxFhlK5uuM+aQWAoRZ27iPw1jmMkaHCZ9cr3lqU=;
	b=Ya7h5l5Lqzzcfa7NmOUD7X38ck870VXN/3niXlbS78ookPKWbYelx19Qk6w5JNZif4
	NpXCsokJeg5inuynvz5rukkK8itN+fvYpOwUlO2nv5tJ7V5iIixtqzipC2HMpY+6MqYt
	d8EeZVKNXzKBV6WrSKFzsl5y1croM7qklPR69rGZwqv+ydbG2RU1UKkJNasvh/cCHJti
	BroJcRSKtHo7KrGCzGF+5R/k2FoqO+xZqKnO4WX2r5bWGrUNK/ptVuG+l7GAYrP0yPoc
	WTcRPJHnhLhRPSmZ9OChuYFwsMxvp3PJUK+bEvi7mXqxOdJ6KqT28StkLd+Mi7ZkaF2P
	N/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gGDJaxFhlK5uuM+aQWAoRZ27iPw1jmMkaHCZ9cr3lqU=;
	b=dGd7OAO3RMxRHFZlEmBajp4Rj5uY6EiNk4Jpx0ZwCem5BIbyy/Y/QiIIZBANTE7TAP
	O8vNZ2xzNNz6iA77lgcMqK4c0ol3/TjQ5UFb6p5pmBrbxbU2epnVMTrE56H7MuOlKh2C
	KxGWecyMz5HffSvJBIPFtsukr+jabc9nmy+d7EZTvqeHjgGgeCnsckMJwtzHrf/Sz6rt
	xXhQfbpc4HIBlYKW+RhVXKMXVgm43ZBHO/dWpfE9yxRTfINcw0k51yCAmvO302u4DOgf
	o4DwNTwGId8D/fNUUhA6mVy8aCprXuPQodgSYzJQnXYrQNDG04OFn36w5jfzbyWUyMck
	y8gg==
X-Gm-Message-State: AODbwcBZzHqVXkvz78mV4guzLBYIZtuNoGfOz8Z1mo0fEMtOCgAxf5Y/
	9e/VrvAClAs5cHByNM7As4NLM6+7MmMy
X-Received: by 10.55.42.212 with SMTP id q81mr30913459qkq.228.1496774962100;
	Tue, 06 Jun 2017 11:49:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Tue, 6 Jun 2017 11:49:01 -0700 (PDT)
In-Reply-To: <a1329496-1770-3708-e6d4-53b46d92d540@denx.de>
References: <20170531031904.7439-1-otavio@ossystems.com.br>
	<CAJTo0LavZYib-FAuigB8ChY62ArU9WLrGaByofK=-h02+_NRiA@mail.gmail.com>
	<a1329496-1770-3708-e6d4-53b46d92d540@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Jun 2017 19:49:01 +0100
Message-ID: <CAJTo0LbLhHiT8Em13X5BK_HmYHK6u3secy3z9uo2xHAEhUucUQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] u-boot: Update to 2017.05 release
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
X-List-Received-Date: Tue, 06 Jun 2017 18:49:21 -0000
Content-Type: multipart/alternative; boundary="001a1147a9fcecddce05514f1313"

--001a1147a9fcecddce05514f1313
Content-Type: text/plain; charset="UTF-8"

On 6 June 2017 at 02:09, Marek Vasut <marex@denx.de> wrote:

> I was hoping to see v2017.05 update in master before sending any
> subsequent patches.
>

Fair enough :)

Ross

--001a1147a9fcecddce05514f1313
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 June 2017 at 02:09, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div id=3D":3j0" class=3D"a3s aXjCH m15c7af3a=
57035d1c">I was hoping to see v2017.05 update in master before sending any<=
br>
subsequent patches.<div class=3D"yj6qo ajU"><div id=3D":3b4" class=3D"ajR" =
tabindex=3D"0"></div></div></div></blockquote></div><br>Fair enough :)</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--001a1147a9fcecddce05514f1313--
