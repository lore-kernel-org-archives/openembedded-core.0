Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 58F6F78754
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 12:50:13 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id w63so6109759ita.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 04:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7lCbiU9QFDd23P0sI9LeSboGPmU5LoTY62DFFp1zdyQ=;
	b=KT15aek9HhjXZgA8n7dzyhJ6+7mp4ZNvjXinQIa9b0NLPMouRX/ZW/EVeGxzp3/iVq
	KtJjcQkQff1ksgpI7kkJEAMmsuOV3jEaTNDCjLr6TxNPxr5j0752shu857Yr1abd7xDD
	dOfPwHkmjf13pepNKtd8SNVqYB9C1WeGv0oraxFum6renK0EW90xYyPJLNzR++2Csepq
	hw+fg2iRdAmnxx3TQXdUK5Yt0JsNCshdJOdZOtm2UxSNwmLoerhFYHPYHh14E7gYKX2e
	ZtZI3LLiMybe6T7m7E1qPCf6AZNGM+jLSdE6cwIZ9apCBOME2IHnmeimR7+KaeDGt49O
	t5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7lCbiU9QFDd23P0sI9LeSboGPmU5LoTY62DFFp1zdyQ=;
	b=mZl6xj7BMrf3RUOqy/pPEJCULBQ1SQ9XbSHO9rKs+Y5VdF6R7JXZcGW79Kb36nEdme
	oqCfdJp/uevwIVUhr91tBZvS5L/a6ZrCN4Mdn3fI4/wHYqr9RtwSiZn5tLzo/5diLKPO
	oE1JjOp71qXlm57IV9mTXYxjrDJsYpKfjK7SCCiu+2g54kdAykeoKXREksHLhbI5Y0yz
	alRIS2FzldfUxBdn8D9VvINDXvrfRpIiDuwF5Kqgovq4dAqfavZ3Es2NG91sNP3/BpGo
	G68omweloz6u3g5opkKiqtBU1vgtJf4OITGL/QUwGIRP+DolGca03JXiNcAcU4u4HPaY
	GsZw==
X-Gm-Message-State: APf1xPAZxCYBCNa0RfNLgK6zEgRe8egYjuGx0MfLKye2bg5aOFaV0fHO
	9fLCITYI2Q31Lz+fNzxmqRfJdNDb+OwbwNUwiJ83ww==
X-Google-Smtp-Source: AH8x224sw7e7mvuovNDScXaAaWe540uWmqbF2/83a5s+sn/Fmx+4M9TiVSCQZsaTE8RaiSRoLijIiWXnUXOe1lpsMPw=
X-Received: by 10.36.185.24 with SMTP id w24mr7582738ite.127.1519303815293;
	Thu, 22 Feb 2018 04:50:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 22 Feb 2018 04:49:54 -0800 (PST)
In-Reply-To: <20180212110521.16974-7-alexander.kanavin@linux.intel.com>
References: <20180212110521.16974-1-alexander.kanavin@linux.intel.com>
	<20180212110521.16974-7-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Feb 2018 12:49:54 +0000
Message-ID: <CAJTo0LZkE8eKySDQm6nesTHOzq5g3kDJWH36YCBQMY1NQMSnGw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/10] man-db: replace the outdated man implementation
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
X-List-Received-Date: Thu, 22 Feb 2018 12:50:14 -0000
Content-Type: multipart/alternative; boundary="f403045d9a50378be70565cc7c89"

--f403045d9a50378be70565cc7c89
Content-Type: text/plain; charset="UTF-8"

On 12 February 2018 at 11:05, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> +    if "compress_doc" in (d.getVar("INHERIT") or "").split():
>

This breaks the sstate selftests as the hash code doesn't know what you're
looking for in INHERIT so the entire value of INHERIT has to go into the
hash.  By changing this to use bb.utils.contains() the hash can simply
reflect whether the value you're after is present or not.

Yes, this is what the old recipe did, but it also overwrote RDEPENDS later
so this function was never called. :)

(squashed into my branch)

Ross

--f403045d9a50378be70565cc7c89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 12 February 2018 at 11:05, Alexander Kanavin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D=
"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">+=C2=A0 =C2=A0 if &quot;compress_doc&quot; in (d.getVar(&quot;INHERIT&qu=
ot;) or &quot;&quot;).split():<br></blockquote><div><br></div><div>This bre=
aks the sstate selftests as the hash code doesn&#39;t know what you&#39;re =
looking for in INHERIT so the entire value of INHERIT has to go into the ha=
sh.=C2=A0 By changing this to use bb.utils.contains() the hash can simply r=
eflect whether the value you&#39;re after is present or not.</div><div><br>=
</div><div>Yes, this is what the old recipe did, but it also overwrote RDEP=
ENDS later so this function was never called. :)</div><div><br></div><div>(=
squashed into my branch)</div><div><br></div><div>Ross</div></div></div></d=
iv>

--f403045d9a50378be70565cc7c89--
