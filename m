Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id CDF616080F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 21:11:27 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id n204so151670421qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 13:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fidaZmlaorbLwKz8NQ9jvx8Iy8ylew3e4vNhRRJijBU=;
	b=LA2qiVZtykctQtJ8H05QI9Pp2vpJGq1aEs2xTU5TGJ74g9F07xwV/S2A6mXB99p9Xs
	EVauAuAb0GfY30b8yAfBXudMP31qLitE1XK/g/Q3pXd1X4T6yLPemc6Lshk1kLT3q9fy
	0amWY0Hkq3nA0f/pY8dRks7ZHZ5FxNkpwpufLjbr4QW0dNIzuCyvqK+TMT6z3cUnYzIp
	FG3E1S4RtzVm8JbaESXlCrE0FmdcERB1iKjtcb/KMxsJlW+PfRlz8rkdTJdikaFfPpoB
	FeFmuC82m6sa1YAP6JKMT6FE9b4BTInT4LRAyD1aj2Wfx1oUxBsBygCkTkvjSimt8YVA
	93Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fidaZmlaorbLwKz8NQ9jvx8Iy8ylew3e4vNhRRJijBU=;
	b=SRQyAWuaMy5cD9uNt4vRhzyuqz6SfeFDRF5pFCWAw3pk23Bt9ry5yICEYbkFlNOziW
	JuJZkHSNFGXD58u2P82ugGeaO20SQga/BpDMkl0GPKk84eHmqd4FI4etT/Bq0R8kZJZ5
	V3t7A88doLW4eUCane/5KSUzrI711Y9oGn6+I3E8KDamKlNymVHXb1PJrkm8zhpTXky1
	NnXO4TCC57d4YEUVrv/1AUoOm/dXeMk5iZRDmCZkbql2gWouht7BARpc34yJpmRJcMNn
	vwcOnpWKm9dYTqjQ2SNvfGrUGPzGSGXTh/O5FxXY2r02IjFHTe3N3HDf1y6VEMA9kcJ3
	8CuA==
X-Gm-Message-State: ABUngvdpMeqqs8PNkXZvI7higERJ2OlzM1QNkqtTXwRh9gDWZ/pukXtZ3MvsVLFfe3aL8K77ZG338WG5HOOT5Ing
X-Received: by 10.55.75.17 with SMTP id y17mr24653213qka.26.1479244289078;
	Tue, 15 Nov 2016 13:11:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 15 Nov 2016 13:11:08 -0800 (PST)
In-Reply-To: <005d01d23f73$e17e85c0$a47b9140$@linux.intel.com>
References: <1479227073-13133-1-git-send-email-jose.perez.carranza@linux.intel.com>
	<CAJTo0LYp7-ufcRMiwmXac7vmOZquq6PPm3w8_XDK40prpZBFZw@mail.gmail.com>
	<1369e521-e304-1b80-4229-2449718736a0@linux.intel.com>
	<005d01d23f73$e17e85c0$a47b9140$@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Nov 2016 21:11:08 +0000
Message-ID: <CAJTo0LYwVrdCUAXSz0VYKNt0TsETL2aZheVN+qv-HYi8jei6Aw@mail.gmail.com>
To: "Esquivel, Benjamin" <benjamin.esquivel@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: FW: [PATCH v2] oe-tests: Migrate tests from /oe/test to /oeqa/selftest/oe-tests
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
X-List-Received-Date: Tue, 15 Nov 2016 21:11:29 -0000
Content-Type: multipart/alternative; boundary=001a114a88c86339ac05415d668d

--001a114a88c86339ac05415d668d
Content-Type: text/plain; charset=UTF-8

On 15 November 2016 at 19:10, Benjamin Esquivel <
benjamin.esquivel@linux.intel.com> wrote:

> The reason for the migration of the tests is for them to be included in
> the selftest execution. And for that execution, it needs to base off of the
> oeSelfTest class.
>
>
Sounds like a problem with the discovery if it mandates oeselftest.  Is
there a reason why it can't also execute bare unittests?

Ross

--001a114a88c86339ac05415d668d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 November 2016 at 19:10, Benjamin Esquivel <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:benjamin.esquivel@linux.intel.com" target=3D"_blank">benjamin.=
esquivel@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,sans-serif;color:#1f497d">The reason for the migration of=
 the tests is for them to be included in the selftest execution. And for th=
at execution, it needs to base off of the oeSelfTest class.<u></u><u></u></=
span></p><p class=3D"MsoNormal"></p></blockquote></div><br>Sounds like a pr=
oblem with the discovery if it mandates oeselftest.=C2=A0 Is there a reason=
 why it can&#39;t also execute bare unittests?</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a88c86339ac05415d668d--
