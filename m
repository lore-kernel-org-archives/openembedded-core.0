Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC5478672
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 14:12:54 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id f34so2274179ioi.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 06:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hqbNVhgZj4ggEnxPtiq7l/zS+lWfJYwPcRim9W5F5rY=;
	b=sHKLfC37VvZ0J8OWxOGS7qfHfqBIYXVZ+639t/50oF32tM2FzERW+cIg4SMYB3d/vm
	GQ3zMErxD3WHjCE1g0SNRFGF3lnJnyTJ7hxB7+C809ynAUBF3CsZ9B3KihHX14uOPZgg
	VUOUqeg9qjcrLI+iFKC9TEFfIviZkCn1EajFv5B5T9IN0KZo/qJ7UoOKQrp+P0nD7V1e
	4cDF4OHpDGUlj28Ef5vE3v/rU4n9ojG6HjQCte2Iw84mZfs6S7KZXdN0Lk/fOhkBEAyu
	V617cI4ClJgRQOXTzNiIYWZq4Rd6oJWPaIvzMPXzJiLIxS0xvYs9bCi7ae9hMgFP6Hqn
	luQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hqbNVhgZj4ggEnxPtiq7l/zS+lWfJYwPcRim9W5F5rY=;
	b=l6IvOqbuYfAT6vt2OGLORc0xo3YvRlpx83TzoheXdoueiQBxS97Ey//hieuqs5BjeM
	u2aLziYlLfambFhs/iV6grBvEkm8px8PbFtheywXL2b/bxIz8rOWuhRrQk/dccijWZH1
	RNxTFFwz5FsrlRdLOadFbXeRF2NXp2VhSQjTwy7gjAznJn8e36wjtECHbNcA9kRoiZS9
	iJWY4Feg4ohDacZB81EugdDOtolm8V4w5me4AwcmwtQMfhrwua77Z7dFruH9os16aLln
	ef0DIh6ldNkG49Iguy4z4wXLhGM7Sr5ELlvJxrZhV6rXXEVHzdA368lLh3bF5xxGmyZM
	KTIg==
X-Gm-Message-State: AKwxytfqjYC9atHA6bxyDX7p2KX+Bd5lTocosZfB9ec+mAed58seIIKK
	Ozgx9K7kG9cP9uByyf5FZrCaHNGCH6+bBx//r2xR5Q==
X-Google-Smtp-Source: ACJfBotQ5hR9+94rP1emLnu4Q8lhBGE9FlFJJXbh/Wc4C7jp6JjqqZjYZywML4bZ4ZuWibbJTIaYqciUmDsUOH5qxTE=
X-Received: by 10.107.175.8 with SMTP id y8mr22423010ioe.37.1516371175619;
	Fri, 19 Jan 2018 06:12:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 19 Jan 2018 06:12:35 -0800 (PST)
In-Reply-To: <CA+chaQczyj5GwNbcPrWsUAeyGv6Lo3MCaanRNpc5dj0BD96+nA@mail.gmail.com>
References: <151627986059.9023.14010623458474127186@git.openembedded.org>
	<20180118125101.2F92F235ED3@git.openembedded.org>
	<CA+chaQeG05c0KXRoFMrb_=rh3C+MMJuMFWvQjtuyedFXg-PdMQ@mail.gmail.com>
	<CAJTo0LYJrDXkSG3zhEowg2UbFyYvoAPKKDUKoGd8qQ_yfBwCCA@mail.gmail.com>
	<CA+chaQczyj5GwNbcPrWsUAeyGv6Lo3MCaanRNpc5dj0BD96+nA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Jan 2018 14:12:35 +0000
Message-ID: <CAJTo0LZu4JbmVsPFyXM-SjnFOtfU8Mcab=mzHy3aVsft6_=7mw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 08/08: json-glib: update to 1.4.2
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
X-List-Received-Date: Fri, 19 Jan 2018 14:12:54 -0000
Content-Type: multipart/alternative; boundary="001a1144a268454bca056321ad0d"

--001a1144a268454bca056321ad0d
Content-Type: text/plain; charset="UTF-8"

On 19 January 2018 at 14:06, Martin Jansa <martin.jansa@gmail.com> wrote:

> qemuarm, qemux86, raspberrypi3 and few more arm MACHINEs.
>

Can you replicate with nodistro?

Ross

--001a1144a268454bca056321ad0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 January 2018 at 14:06, Martin Jansa <span dir=3D"ltr=
">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.ja=
nsa@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">qemuarm, =
qemux86, raspberrypi3 and few more arm MACHINEs.</div></blockquote><div><br=
></div><div>Can you replicate with nodistro?</div><div><br></div><div>Ross=
=C2=A0</div></div></div></div>

--001a1144a268454bca056321ad0d--
