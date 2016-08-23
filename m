Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6919F6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 15:11:25 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id e63so153230982ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 08:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1lp3ptcDho/A1ldaEGxwqAFYg8uu8U8m/tbAKxvkK0U=;
	b=gCgnSP1OL2GY5WirfIi1q4ymRv6/Ay5hYki5sEOwzUcO3pG4XSvHnfoPOS3LIi3AxP
	VbDHRqzprtEr4B/izIbbf0KwTGe24J+z0ANe/cPxPKsc/UX/wIZ5uomSB8HbRo80YBz8
	jK6pf6Q9pYBjhqUidL75YO/EHElBsznFvvw2Cy/wi+U1nocQYoLLJbB+d+X6H2WtBVGF
	3r6QzSGMtzC8g7ZfC+x6TXJwBQYbuD9a178tRWbL9SWllYswCFAxXQCKUl4SWmJQRcl4
	F+qTHUySDfVuX85vCugUafpV04awcg0Xsu/a9gQ0pVaSTefMMKklM85OnwJIUTmlNEQY
	Lzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1lp3ptcDho/A1ldaEGxwqAFYg8uu8U8m/tbAKxvkK0U=;
	b=K1djRc5sryVPlT/RRbxRwy4lh01tg58DEdfFJvbYyEbqlaV87k4dx94agEhE+Ukt8b
	bVKGKX+fC3Qa+ZwXWtwXB6tvHr9tt3bgCBV/2zwWTbWpeaK1VJTKsYY+phAfs7k+uBiH
	kRrPGeH0E9e8GBjA9jYG/UaLI6T9j1zkW78eS1q3RPKitPJVOUuhT1uFROj2wkVgNkoU
	F0ywS7SZ6Oov0pMOJ1828Rpogz8OPj/pzdC3WYXyj0M0Qwbs23sL/duIFKn6XL1B4NDc
	1UebSkeQUGHhA2b//smPCJt/Wp5rfc3bMp4M9trTmSBU0j0NvM/mtV5fNF28hJ0vygAZ
	T7yQ==
X-Gm-Message-State: AEkoouuB4hh9Efw7dQNYl4DMYWqj2ZZyMomQ9UcgZUX1spVlbeZRrTrvTtcn2qWincb4gsJDj9YtHSVrkaxEtOg2
X-Received: by 10.36.121.206 with SMTP id z197mr28139294itc.22.1471965084846; 
	Tue, 23 Aug 2016 08:11:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 23 Aug 2016 08:11:04 -0700 (PDT)
In-Reply-To: <CAJTo0LZfB-Lu75cvN9CBN3Xx9uqpLMEWdPMJZL5MFGSy0+bciw@mail.gmail.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<9492b5e7b4b350b21762201a11f189e35c0cfb04.1471936926.git-series.jeremy.rosen@smile.fr>
	<CAJTo0LZfB-Lu75cvN9CBN3Xx9uqpLMEWdPMJZL5MFGSy0+bciw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Aug 2016 16:11:04 +0100
Message-ID: <CAJTo0LabeTgBw5Vqtt5LRLSvRG8y+bRWhbF2di7AyiFXoDPc=Q@mail.gmail.com>
To: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] [sanity] fix hardcoded references to gcc
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
X-List-Received-Date: Tue, 23 Aug 2016 15:11:25 -0000
Content-Type: multipart/alternative; boundary=001a114aa82001236b053abe9404

--001a114aa82001236b053abe9404
Content-Type: text/plain; charset=UTF-8

On 23 August 2016 at 15:53, Burton, Ross <ross.burton@intel.com> wrote:

> I think this is because BUILD_CC by default contains whitespace, and
> bb.utils.which looks for "gcc ".  I added a strip() to check_app_exists and
> it passed, so can you please verify that your series doesn't regress when
> BUILD_CC isn't overridden?
>

Patch sent to fix check_app_exists().  It currently just strips whitespace
and doesn't handle someone passing "foo --bar" to check_app_exists but this
is still a step in the right direction.

Ross

--001a114aa82001236b053abe9404
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 August 2016 at 15:53, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra=
">I think this is because BUILD_CC by default contains whitespace, and bb.u=
tils.which looks for &quot;gcc &quot;.=C2=A0 I added a strip() to check_app=
_exists and it passed, so can you please verify that your series doesn&#39;=
t regress when BUILD_CC isn&#39;t overridden?</div></blockquote><div><br></=
div><div>Patch sent to fix check_app_exists().=C2=A0 It currently just stri=
ps whitespace and doesn&#39;t handle someone passing &quot;foo --bar&quot; =
to check_app_exists but this is still a step in the right direction.</div><=
div><br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a114aa82001236b053abe9404--
