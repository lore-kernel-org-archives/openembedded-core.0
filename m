Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id A5E34600E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 17:16:50 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id q130so143535992qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JpDXbZwqIGWosA7cRuUPGM1/Dbzf1VYfT62FiWUsmnc=;
	b=IZniWvMXuYMix6Wlojdyn6r7G8QjBUZouzOLk7EX5/DZRfNzmSbq04TtymaHra/2Vb
	dQ8h6i1yF85NRBgmT53smz4ePwlJsxCV6ycakczuhW8fAZ4/khlrZ0KgLGvGUcSwPwb4
	Sh5K/CkMxaI65FOr4h6B/VjGv6T5e0ZUb1KU8TAqYyR/zpHp0o4v0EM/wZCVXq/V8Lo7
	nECBFnCS1YvN2ssf05Imei/fnRKkIaEEDTjkJC/LQcKiPySzo/j6/kEm0gKdCcqfU0RF
	9Gl67/F+7PmFrh/uRVK2nQFE4b+Bt1r4L2XHX20NbxHksK+a19ZPYEhdOHsKoNav2gfm
	Fgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JpDXbZwqIGWosA7cRuUPGM1/Dbzf1VYfT62FiWUsmnc=;
	b=I8uLXaEcxK4GHbZpDCg3Rgyk2BNxs6via+AZKXISr8VX1co+PMWcoGRUH/LCyc2tUg
	+adpLD8kD78UHBY6twQggKVz9BhuOOW49kAR+B9ywK90TMqw0qXFTcaW0P71xl93EJsM
	XH0dbkPQ5m6A/UVV5Oq/sXg9NDZdRk1iXBkiGmeKs5i5E4eANaR+B8MTFHTHYbyYQ2gy
	n0kyEbLSF8KOu3fc9bfbs8UafMy1kjlYEiqYytSU+iGU85E/P7bAzQGxuzQ6C87NyeOI
	49BVbt1YBc0N+T+LONr+IusMXg2i4A1ppQzyiyuV26lMydI1cGh0EyZjLTpMHwXyR5sK
	NWlA==
X-Gm-Message-State: ABUngvfO2OYWTW72ltbfbADqg0WzJZqMmGOdTHrl3I69anmHHg9CFUbYY8/nUowL4BH1oll989h5EnWYhxZ5Nji6
X-Received: by 10.55.75.17 with SMTP id y17mr23497580qka.26.1479230211601;
	Tue, 15 Nov 2016 09:16:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 15 Nov 2016 09:16:31 -0800 (PST)
In-Reply-To: <1479227073-13133-1-git-send-email-jose.perez.carranza@linux.intel.com>
References: <1479227073-13133-1-git-send-email-jose.perez.carranza@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Nov 2016 17:16:31 +0000
Message-ID: <CAJTo0LYp7-ufcRMiwmXac7vmOZquq6PPm3w8_XDK40prpZBFZw@mail.gmail.com>
To: jose.perez.carranza@linux.intel.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] oe-tests: Migrate tests from /oe/test to /oeqa/selftest/oe-tests
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
X-List-Received-Date: Tue, 15 Nov 2016 17:16:50 -0000
Content-Type: multipart/alternative; boundary=001a114a88c84de33005415a1f90

--001a114a88c84de33005415a1f90
Content-Type: text/plain; charset=UTF-8

On 15 November 2016 at 16:24, <jose.perez.carranza@linux.intel.com> wrote:

> +class TestPackagesFilterOutSystem(oeSelfTest):
>

As the tests don't need anything special that oeSelfTest provides, can they
remain as testcase.TestCase instances?  There's a lot of complication from
oeSelfTest that isn't required.

Ross

--001a114a88c84de33005415a1f90
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 November 2016 at 16:24,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jose=
.perez.carranza@linux.intel.com" target=3D"_blank">jose.perez.carranza@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2sc" class=3D"a3s aXjCH m15868c796a11fd24">+class TestPackagesFilterOu=
tSystem(<wbr>oeSelfTest):<br></div></blockquote></div><br>As the tests don&=
#39;t need anything special that oeSelfTest provides, can they remain as te=
stcase.TestCase instances?=C2=A0 There&#39;s a lot of complication from oeS=
elfTest that isn&#39;t required.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a114a88c84de33005415a1f90--
