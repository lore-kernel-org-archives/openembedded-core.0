Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 200087716E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 11:56:43 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id x130so12015950ite.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 04:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7H+Pge5wn4IKx9iu6CJJkb2zX3d4IfjatIZf6b6k1KQ=;
	b=CsRDK+NjkpIemDgvHxHVgyOAKgiH8ByxHAjplclMqbaQ4ivUdlwzkmIOJ6YoXTlwGp
	up0lSE4nR2M36ygs4CC8IFgyyjiZamQ9oleE6Bq+q0k0Itg17jDyO3J0FgtJPhgBwwSg
	5m+bvm/JA7y+dckFlDRS3OVqftwphmUkwQCX2EYc6+4wadPymXcmsTUdoKMDTREf0D2l
	gEljv+ZN6q+C6d69eWyWbOd3QBNKjFyVBUKkeNhbYTRwIEqaHZ+cfgVsbzXvrsn3s6mD
	lqnqZ8fhTqaQ/1rTN1w1JOfBf9RYJhPqlizCNq0DusvvE+1LxAu7re+IBc3FNZ3QFxnZ
	UFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7H+Pge5wn4IKx9iu6CJJkb2zX3d4IfjatIZf6b6k1KQ=;
	b=dvpqpaujExvxe+55uZh1uSEyYTiVZs6cM5kTtVteEXtkFbnPCut2TLBlXHqPFfp2Ev
	/xh6i3Y7T/j//ciGO3/8YKPwymsJz8TPODE87cCRqXnG3ByYbdISg5RIYMrZ6urX64Ha
	ccdOGO9sZqD/fxy0Hr3mn/97kkEH6UxiBamz3LQNrpM1+OfrWoZsSoT+AOJBM8busG8V
	r8QN1VVGw0CLPh+QTBw/Urc/AuPVUUfHW6TB5QAAC8IOYHVHEabCVaKUQIvsO2vDu1Kj
	C22a8sZRBpimrAEUFLMVXwu2oc3Btygam2+JfWElA8f8wYM2XYEmjGzF4SFcc+PI5S1p
	EbLw==
X-Gm-Message-State: AEkoousFyctMGnecYETrRv+QgacIYmyWKokKvkZVkyW+O8iqlXmtVldLfmjr8KEDeCBQXzDzwDtmuTFTzd5auUak
X-Received: by 10.36.20.75 with SMTP id 72mr16874307itg.83.1470657404570; Mon,
	08 Aug 2016 04:56:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 04:56:24 -0700 (PDT)
In-Reply-To: <d635e401929354af1c2f14155597d94a16e1af76.1470637742.git.dengke.du@windriver.com>
References: <cover.1470637742.git.dengke.du@windriver.com>
	<d635e401929354af1c2f14155597d94a16e1af76.1470637742.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Aug 2016 12:56:24 +0100
Message-ID: <CAJTo0LbJMP=RwtDUdZRNgDqCg0vVmfu0covvd_=Xs6oUBcPFdQ@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bash: fix run-intl ptest failed
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
X-List-Received-Date: Mon, 08 Aug 2016 11:56:44 -0000
Content-Type: multipart/alternative; boundary=001a114469422fc03105398e1c1c

--001a114469422fc03105398e1c1c
Content-Type: text/plain; charset=UTF-8

On 8 August 2016 at 07:43, Dengke Du <dengke.du@windriver.com> wrote:

> +Upstream-Status: Pending
>

I've a fear of modifying upstream test suites to 'fix" them so that they
pass for us, and think that we should be talking with upstream to verify
that these are in fact broken test suites and not something else (such as
the test using busybox printf instead of bash or something like that).

Ross

--001a114469422fc03105398e1c1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 August 2016 at 07:43, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:dengke.du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2v1" class=3D=
"a3s aXjCH m15668e545278ceb9">+Upstream-Status: Pending<br></div></blockquo=
te></div><br>I&#39;ve a fear of modifying upstream test suites to &#39;fix&=
quot; them so that they pass for us, and think that we should be talking wi=
th upstream to verify that these are in fact broken test suites and not som=
ething else (such as the test using busybox printf instead of bash or somet=
hing like that).</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a114469422fc03105398e1c1c--
