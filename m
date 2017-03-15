Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3D67A72F38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 02:14:03 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id t189so12358381wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 19:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dmQAVPQ53+U75AemQJA6/7rPFAz5ViUCXZ3La3cMn54=;
	b=VqETZ5icnNs/eHCYPEsQ2aNhc3Q9VyEfSYNQTpwN7RPC+vY583ylCB3F5CSTqPi0/E
	Ys1UANGPezmkFjwMycfLThsQS4bm3O6SuV0v4a3GZ8vrcTJwqzg20Ofb5lVFADpZJKYm
	K1FlfQZVViIiV51QZ7YPwOIxw5M8ElOf/7WyR/YnOi/XM5f7sDwCwb4oo3rVkal+P/V6
	hp0x3f5IbQYPgkW/wBDZNGoa1CR7U36wKUTJywl5pHltKn/IPP3F6rvQxwwu5Bb2YCP/
	/nTY0AmP4BkpNFllxKnmP+xNwXdXd5Ty3g0ceKLg0cQuP4YFPaGvGRP7N8WnGKOysnmY
	gs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dmQAVPQ53+U75AemQJA6/7rPFAz5ViUCXZ3La3cMn54=;
	b=mnfdyWEsEKMT3RU5+DfuOyJpmx+IIMsd8cZs+1ZCYMpSHNTc37gbehg9eNonQo1JjL
	mC9JsL3p7XDPIsTfoVb0trrm/BXUpV4YnTBt+UfAvS4ixr5tk5ZKwPYnxm8mxNAIpl0R
	LHjnmoRwMUqitqAynKj/UP9sVI+Sg4dC9dqLpXLVqPfIbiv0uhXo12GyPX60XygoHmGN
	+AG8BJsN26INjP+rVkiPl1L1PfZ4IK5uIsqUHoh89473CEd7V+LqbYer5iM1m+oXspdp
	dVerQReFPJHJezzwhsuXNqVn4Lfg5tr9XCfQWGW+HBvlrNdkb43uPrQT2uIbI+6570o6
	IvfQ==
X-Gm-Message-State: AFeK/H1Lve801Vpz4Mxq02Z60Gzv06diD60XJG34ZNn62WQhmTmrgVH3GH+NtyHGO/8+mE0agWw8NRDxNnpfmg==
X-Received: by 10.28.215.18 with SMTP id o18mr17953393wmg.98.1489544044473;
	Tue, 14 Mar 2017 19:14:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Tue, 14 Mar 2017 19:14:04 -0700 (PDT)
In-Reply-To: <1487700290-3110-1-git-send-email-armccurdy@gmail.com>
References: <1487700290-3110-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 14 Mar 2017 19:14:04 -0700
Message-ID: <CAJ86T=Vji6+uo25xxB0rir_HcCo2UzEcrmsa_q-3kdUJJUF5rg@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2][morty] Backport image dependency chain fixes
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
X-List-Received-Date: Wed, 15 Mar 2017 02:14:05 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 21, 2017 at 10:04 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Andre McCurdy (1):
>   image_types.bbclass: fix image dependency chain collection
>
> Randy Witt (1):
>   image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for conversion types

Ping (and CC'ing Armin this time...)

>  meta/classes/image_types.bbclass | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> --
> 1.9.1
>

