Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3116AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 16:19:24 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id u186so52016683ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W7ThPtWhpQ414ERnEciHncSsQct1wle+/8KZM1/ojxs=;
	b=XRhaP6gxmH5wb2GepbQkzubVEoo/LzoYFMjTmb7eVb2KwiLS5BnhkjLaRAPVubFH4d
	sota1bG53kbWQCcM7jak50HxfPvDxRuKIyoPe5t7Tz5YcTMfRGfd0C+uKJxi2OUqkvj+
	gyBJwCXktff7Ooof7POJS8dGh2rh12DrgF6yWLaAZoXnYky/1dMjc213E0VgJItybKCb
	QZMjrnN4biKQg5QpO1778OvO/Cd5sr+jQO6RihDPrqUfGvJR1mj9Y0X1MtRW7oIfTvhN
	o6UiuIfhYRcuA8d4V9YEwC4vx1hcgV1gT4VcSb/SwbCZ9QT2YtRx5sew2ZyohV6Nr3cv
	YmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W7ThPtWhpQ414ERnEciHncSsQct1wle+/8KZM1/ojxs=;
	b=SYbRky3zYIOin6TD3k3yiEy3cURUYoO1R4/vA2Rf/aRSwOU6XAJ/IG5DwbkXnN9WQp
	PG9d7Ot53PBSIqGG8hD9dzIUJ5fEvKOnoTt2Av7f5lhxFIA8v+D/s2gaRkMPpB0Nf6Du
	11uevXL3foyW9pro9nMjl83vTwF/F+J+1WVe1K8kBAsrxO9MqfQLk2wbndxnfm1KwKLf
	TSZy06AF3E4bp8/hynXhmNMIfplzL7120/IUfST7daBdouKe+BC60ktstz8rDG5/0YsK
	CZKNvqblYIkuWFOhNsjvh3bZGCGxv4VMt8kCsAR4SCDjT5AtfxN3RtuA9GxSWMlc5NI7
	Fzyw==
X-Gm-Message-State: ALyK8tL2RT7rF/FjrL4e5BI9s7ya9iLWYWKt9BBLDSuu1ZY+bcZGwbaDewegx7x6oOqSw2ro92FLpRPedJhgrpWt
X-Received: by 10.36.147.198 with SMTP id y189mr15617975itd.83.1468513165190; 
	Thu, 14 Jul 2016 09:19:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 14 Jul 2016 09:19:05 -0700 (PDT)
In-Reply-To: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Jul 2016 17:19:05 +0100
Message-ID: <CAJTo0La-MQN-asb6P=vRknycs437BwHPW8khjteg0+wEBpZALg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] security_flags.inc: enable PIE for a few recipes
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
X-List-Received-Date: Thu, 14 Jul 2016 16:19:29 -0000
Content-Type: multipart/alternative; boundary=94eb2c089e148f3f3305379add76

--94eb2c089e148f3f3305379add76
Content-Type: text/plain; charset=UTF-8

On 11 July 2016 at 15:33, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> -SECURITY_CFLAGS_pn-python = "${SECURITY_NO_PIE_CFLAGS}"
>

This was fun: python with  PIE flags silently fails to build various
modules, including the zlib support.

-SECURITY_CFLAGS_pn-syslinux = "${SECURITY_NO_PIE_CFLAGS}"
>

This failed to link although I can't find the log on the AB right now...

I've ripped these out of the patch for now.

Ross

--94eb2c089e148f3f3305379add76
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 July 2016 at 15:33, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":1tu" class=3D"a3s aXjCH m155da628bf4360b7">-SECURITY_CFLAGS=
_pn-python =3D &quot;${SECURITY_NO_PIE_CFLAGS}&quot;<br></div></blockquote>=
<div><br></div><div>This was fun: python with =C2=A0PIE flags silently fail=
s to build various modules, including the zlib support.<br></div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div id=3D":1tu" class=3D"a3s aXjCH m15=
5da628bf4360b7">-SECURITY_CFLAGS_pn-syslinux =3D &quot;${SECURITY_NO_PIE_CF=
LAGS}&quot;</div></blockquote></div><br>This failed to link although I can&=
#39;t find the log on the AB right now...</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">I&#39;ve ripped these out of the patch =
for now.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--94eb2c089e148f3f3305379add76--
