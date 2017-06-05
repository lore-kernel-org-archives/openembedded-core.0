Return-Path: <ross.burton@intel.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id A6CF277EE4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 13:02:11 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id l75so14931100ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 06:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gG0AruxCq7bJyhqDEWH9eAGHsq06AgkeBQ0FpNtYvvw=;
	b=kZIYfWP/K/eQovXgqRxv4/u3u2DKJuLIafxjUryWjLgHakUMJ2LfBzYm8WSb1PFR0q
	7NTHyx410DpOBSr85xF3bTsXUvTms7ubgKZAiaoZR3maXfRVFpYQ9bra5WV74BRtNFcu
	9zCpjTvm+S+xUszovTHEOvESWO/tcfvtZvw9cFdy16h/hdh+O/3neb33F3ggcN4YJ8Di
	1xAB1aGZPLbhfCiiyc4OhVHk1terGLXjiDYJfVinyfAT14l2rc9zzUjTwC6uPTF70aD7
	LRdWV1qtvTa+foTXsFXF/AmMUeaVWasqRRNnT2Qz5X9gPzyLrY8Id76lxBNTvx9NyCLw
	EQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gG0AruxCq7bJyhqDEWH9eAGHsq06AgkeBQ0FpNtYvvw=;
	b=crHh7XIMGz8T3MlQ4+Hw5SBWK2quWcDZzf2Hk165TBzUXt01dsZslNNrGEGpZ1hcTu
	fXnPNX2abW+/eZOWAdyGhFS7TdTcbX311BJH96LoyFIT2sc00bwpqZStlZMNPFzs0ATn
	3uZ3nJ/EEhqUo2EoTkguIuDbCAhLg8ZeJcWJJZVRvVVNOVpyJG30CMt4CIIhLQwgzdb4
	EZsyMy5K7R1MBq6gZ5xrv8IEkyvbbMcaY0x1wiaWr56AqH+mzmCF6iZokpQeNOGnAMo0
	WAvdLd733kQkuoVtC8OmZiEUjVWnpEuF0h2n9kaZ+T3hPq8AM0PLz9exZ4xtYl/wvoYa
	F3UQ==
X-Gm-Message-State: AKS2vOzosxjpod5MhdUzih+OhfvjCdwIC0nlEocK541p3SR/sQkJ5JQu
	ygF4Ru+bmCsnTbNwLQmlfFTq8+1GwnMa
X-Received: by 10.55.42.30 with SMTP id q30mr3629478qkh.109.1496667730637;
	Mon, 05 Jun 2017 06:02:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Mon, 5 Jun 2017 06:01:50 -0700 (PDT)
In-Reply-To: <4f9f2466-1409-e5d8-917c-58b4864f8863@linux.intel.com>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<1496585728.6630.165.camel@linuxfoundation.org>
	<4f9f2466-1409-e5d8-917c-58b4864f8863@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Jun 2017 14:01:50 +0100
Message-ID: <CAJTo0LZkZ3Z4vKxjBrbiS8y8NYQ4qYLTGDPmJq5BUZrg8y_sLA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Multi-threaded RPM support
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
X-List-Received-Date: Mon, 05 Jun 2017 13:02:12 -0000
Content-Type: multipart/alternative; boundary="001a11493f026e8b8d0551361c1a"

--001a11493f026e8b8d0551361c1a
Content-Type: text/plain; charset="UTF-8"

On 5 June 2017 at 13:14, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> The patches as they are now require that the C compiler on the host is
> recent; specifically that it defaults to C11 mode. I'm not sure when GCC
> made the switch, but it works that way with GCC 6.3.0.
>

Isn't that just a compiler flag away from being fixed?

Ross

--001a11493f026e8b8d0551361c1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 June 2017 at 13:14, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kana=
vin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":310" class=3D"a3s aXjCH m15c78303f2450c28">The patches as they=
 are now require that the C compiler on the host is recent; specifically th=
at it defaults to C11 mode. I&#39;m not sure when GCC made the switch, but =
it works that way with GCC 6.3.0.<br></div></blockquote><div>=C2=A0</div></=
div>Isn&#39;t that just a compiler flag away from being fixed?</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11493f026e8b8d0551361c1a--
