Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2BAF56FEF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 20:43:01 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id m184so237871520iof.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 13:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I0inISfdUHjsn+z3sfLdeH0R8AfgMOsUv+lIgyVszX8=;
	b=a6KK7C3ZDhJqaxzfUBTG6/mRs+LwXYXkRKQQdx/GYamvLgCTjTYdiGbkyglmT6N31v
	T1KvkGI/hlTnMI4vOmqf96vk2TS1eUZ9z+IzSwbSiKtd0HTOwuc2WJDr1bnZQTRe0tKI
	2p+JMDyd3VNEcTLwI5x2271Byi7+3sO3FMP1Ew41MGat6v9fsiH5ClpsHLygzQBXo0bl
	OpjYy8WBStaP9ksCGLK+CZBqX4iagyw9SUdbzl+hI+s6Ev2UFy5wK79SJ765nHk1VyRa
	hVHvrFiSP1umfnbWOHl80vPKF9QHT0P7zOCy26+LjmTpVnUFe0NikbUZWI1d8w/DsKAm
	mVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I0inISfdUHjsn+z3sfLdeH0R8AfgMOsUv+lIgyVszX8=;
	b=lYz6uKOK31fCf4hqbUd9ij4jG10GaxTTVEkhVGv908ZjRSkBMw58ub/2xXO2kqJJaL
	BOL628A0Iy2IXkV4czyecNNeW3P4pjBYQAkAWCMoFWSYBoM3OTGVUJYa7uDWQ8ztETW+
	wT8pfpbuZTZ6SeUWn0bAFhJJKU30+S1KipAM2yzjtSMMP/+vdLm0ZfWqhLfDlgDgKCSL
	KQB0Mm5Xc6td7OZm2ZFCLO+gen0nS7+J2AXbtv/Myb5wgWC1fDMpJGtdKW4kyye3IHH3
	mV+U09jSnEuaLyvO9KwqaRlBLgadexH4C8Ww+JDeXJIMZebBUH3pLuA54P4OJLccT5cw
	UNgA==
X-Gm-Message-State: AD7BkJI2IAgYXT0q0sZSA48GNTfVNqogOTpTnXWRRl/z8phhgMGMbfXe9EcMBY+2zKgjVMddRb12/GqKBsXfNkrg
X-Received: by 10.107.6.32 with SMTP id 32mr24499905iog.99.1457988182600; Mon,
	14 Mar 2016 13:43:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 14 Mar 2016 13:42:43 -0700 (PDT)
In-Reply-To: <CAP9ODKrV517jdeiow4pAvz_ewNvbEe7mz7qbEvufoG4mRu-j0A@mail.gmail.com>
References: <1457987735-23523-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKrV517jdeiow4pAvz_ewNvbEe7mz7qbEvufoG4mRu-j0A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Mar 2016 20:42:43 +0000
Message-ID: <CAJTo0La6DTEzZ2zr-GoKjimy3Yonw_btCO8zB_b_2tvQ=c=xwQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro] xorg-lib: allow native building without x11 DISTRO_FEATURES
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
X-List-Received-Date: Mon, 14 Mar 2016 20:43:04 -0000
Content-Type: multipart/alternative; boundary=001a113fbf5cb61716052e08534e

--001a113fbf5cb61716052e08534e
Content-Type: text/plain; charset=UTF-8

On 14 March 2016 at 20:40, Otavio Salvador <otavio.salvador@ossystems.com.br
> wrote:

> To be honest, even though this syncs the Jethro and master on this
> regard (and thus is a good change) I think this needs to be considered
> that doing this way libsdl-native will differ. Native and Native SDK
> binaries will provide different set of features, which is bad in my
> point of view.
>

(just replied on the other thread)

Ross

--001a113fbf5cb61716052e08534e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2016 at 20:40, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D=
"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador=
@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":1kk" class=3D"a3s" style=3D"overflow:hidden">To be honest, even =
though this syncs the Jethro and master on this<br>
regard (and thus is a good change) I think this needs to be considered<br>
that doing this way libsdl-native will differ. Native and Native SDK<br>
binaries will provide different set of features, which is bad in my<br>
point of view.</div></blockquote></div><br>(just replied on the other threa=
d)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a113fbf5cb61716052e08534e--
