Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 355D96612C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 16:23:14 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id u186so302271188ita.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2016 09:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VxeeOVpuDQS8fSGVzvM8EMh8DP7jL0PMYLJBd+V3wAM=;
	b=KbSwu15Souq2vBvibFvh8u0FABrqhjS3jhghkyRfOJiPLt/LGb550xuK5uZUPiF/jF
	nnuAGzLPJ+fIn2Ls/G3dt/MbqR+LaGw/KTo9GjeodE0ziy8dWOA5ApYHF4OQAxEOuMBN
	TjlUEl4mNE9Pb6vDFvCoKBjDxttHP2CLfh8Wnf4jjIb+Xbh0uE9kgdWMG7gD/1ZqsW4B
	O3YyO615FDxZGvxBS3uEnE+AP6OOMVYjgu6OWxTYRYA2O+WnWRAnsya4nikrAjhxNz5z
	ytZrdgZkFR8ZBMXqRixttF7Fbe4cvnlrB7ZlbbsYkPjo/1yZIh5YEt26BJVHgq/ucj1/
	p7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VxeeOVpuDQS8fSGVzvM8EMh8DP7jL0PMYLJBd+V3wAM=;
	b=hZz/nh/Eq/o8TsdY0SZBW1/Sd8olWtNhSk/KeiSRCa+8Y8I/ppVI7el6MnPx6q+7PQ
	qKkERqlGPXEATRsPvMU6XKsWnE22eznePdLVolkc9t2sgEzYNXotrclprj4lcOQ1HF7R
	/4nGAJdMcOrvtP4aNTCMwDRTp6fVfpmxG67sToKUd12HYSQ9drhk4BcrpIVIQqg5X7rN
	ld9rHG6mX2bpfRcjVHbXTi8Ugs6zDwJ7H+7b1OBHpBOWkZIW6mGj5XATNNUsqqdNZ94M
	CGuBMYysc8tyIhufHvdZOk/ixhmWpdEOMLlN+SXR/6Np2dhnmxaZQUPPm9i/jx/iIM/L
	Wvqw==
X-Gm-Message-State: AEkoouvVAErzOaGHqFoREFZQPI4m6RWbXEkqxZS+LI7pZwHL4T3pqZuRUbvddVZnW/oSmnjSC1u6Vi3BpIeg3cXK
X-Received: by 10.36.129.213 with SMTP id q204mr3698548itd.38.1470241395090;
	Wed, 03 Aug 2016 09:23:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 3 Aug 2016 09:22:54 -0700 (PDT)
In-Reply-To: <1470204251-6173-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1470204251-6173-1-git-send-email-fan.xin@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Aug 2016 17:22:54 +0100
Message-ID: <CAJTo0LZUT+9Wgf+kvtUJwJj7_W2afRciuW5PA2OfRrXYBRO-qw@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: upgrade to 20160510
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
X-List-Received-Date: Wed, 03 Aug 2016 16:23:16 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b1fc16f71805392d40a4

--94eb2c08b1fc16f71805392d40a4
Content-Type: text/plain; charset=UTF-8

On 3 August 2016 at 07:04, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb
> b/meta/recipes-extended/ltp/ltp_20160510.bb
> similarity index 100%
> rename from meta/recipes-extended/ltp/ltp_20160126.bb
> rename to meta/recipes-extended/ltp/ltp_20160510.bb
>

As this recipe fetches from git if you don't change SRCREV then it's not an
upgrade.

Ross

--94eb2c08b1fc16f71805392d40a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 August 2016 at 07:04, Fan Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:=
fan.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3kv" class=3D"a3s=
 aXjCH m1564f019b65e6bf9">diff --git a/meta/recipes-extended/ltp/<a href=3D=
"http://ltp_20160126.bb" rel=3D"noreferrer" target=3D"_blank">ltp_20160126.=
bb</a> b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20160510.bb" rel=
=3D"noreferrer" target=3D"_blank">ltp_20160510.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-extended/ltp/<a href=3D"http://ltp_20160126.bb" re=
l=3D"noreferrer" target=3D"_blank">ltp_20160126.bb</a><br>
rename to meta/recipes-extended/ltp/<a href=3D"http://ltp_20160510.bb" rel=
=3D"noreferrer" target=3D"_blank">ltp_20160510.bb</a></div></blockquote></d=
iv><br>As this recipe fetches from git if you don&#39;t change SRCREV then =
it&#39;s not an upgrade.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--94eb2c08b1fc16f71805392d40a4--
