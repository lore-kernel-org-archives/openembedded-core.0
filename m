Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
	[209.85.167.175])
	by mail.openembedded.org (Postfix) with ESMTP id BED5E6BBE6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 09:52:58 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id w139so3698821oie.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 02:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=csJqBJV0fa+d87Txqzb4XS2JPqgxqrrHyozpXLo+CQE=;
	b=KzpaM3/S/B/BWQSpJ0/LPOzokC2ZOEREKZHloioDkZwyIz/EcSkFjAAYgrz/jesMwf
	zKDUmIJWj+uGJEUrMxJi+GgkgmTAgzbHlcDEbJd/sx1Z8nxpfx5GxwNT+IWcOK3PCvhG
	5vl6Sf5UC+qyfa2hyHf/NaIcK2OYh/7TEKLMrENpZL3mwjnzf3Yd0ZHHzsfsmgimM9QM
	We7fPO7HA/yOFeXmRFxM/li0fXSLhtw1ZfECzbDjjLQFNXgZQPLz9LJnrlv/kMAYqUF6
	3hdplsXW8upU0AqNlKrYvP7VSLIGgI7Sy11YDz/U0GBv7V6/eRNiddgPoomeYJZtlnD8
	NVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=csJqBJV0fa+d87Txqzb4XS2JPqgxqrrHyozpXLo+CQE=;
	b=DpMJg7mU5Rvi9Rc2lSA3WYj0qhe7U6abWnD575BQNZxwmDDqdht4pSyXhFnsiv11Kd
	+K8riyEyYW4VY852+Y30oJsbn4WqXgE68U4/edfjt7QVE1DKE6uiwnt6b4A3N97kmapc
	l0qICiaHyaInEvfhPoIaAJsuQSSLthh0sgOwt4Hn/QqctSvSbn+/GLAuovbLwXZ4suuM
	R2xevIGH9i2cKPQdYeGCTLppGOIj8W747EVef5UMbqZ+bS5XlBywKDtCbsjwWaGi0QjR
	vygatr7cZWTk3adKhSip2RjoR7SnZ3j1BN98SB5yHAmggu05VUP5wZCbsaZ+m1N10USp
	ZVaA==
X-Gm-Message-State: APjAAAUB3wMDka/cRrU0yGm8zqloPmxriL4SAXXBACuH6cSOBsFDyPFw
	+R4ypF5/W3paGfeaawooba5eJMe5ciNLmSSEYEQ=
X-Google-Smtp-Source: APXvYqwwHtOXk0Kn8TXMkm5l33uXjzcRRL4OTN9yaNfLJ+31/UvtvUHI+d2cgHCCbJLZz7ihUST3cky5ErBwpKLxO8Q=
X-Received: by 2002:aca:ac94:: with SMTP id v142mr9547788oie.135.1552902779716;
	Mon, 18 Mar 2019 02:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <ec5b47cb57324ee89e4f18785264d97e@XBOX04.axis.com>
	<CANNYZj8he2xQbDLksx-qqPJSie9mW3=ttvxAxpD_9ANLJtBO8A@mail.gmail.com>
In-Reply-To: <CANNYZj8he2xQbDLksx-qqPJSie9mW3=ttvxAxpD_9ANLJtBO8A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Mar 2019 10:52:48 +0100
Message-ID: <CANNYZj-=F+Gu8ndkPyZc_Xm0u5NbtQKPpFQFhknxo16tB2=ppA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>, 
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>, 
	"Paul Eggleton (paul.eggleton@linux.intel.com)"
	<paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Where are the mails from patchwork (was: RE: [PATCH] [PATCH] openssl:upgrade to 1.1.1b)
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
X-List-Received-Date: Mon, 18 Mar 2019 09:52:59 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry, Leonardo is the correct person, and if not him, then Paul.

Alex


On Mon, 18 Mar 2019 at 10:45, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Mon, 18 Mar 2019 at 10:37, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
>
> > Whatever happened to the mails from patchwork that used to
> > automatically complain about things like this with:
> >
> > * Issue             LIC_FILES_CHKSUM changed on target openssl but there is no "License-Update" tag in commit message [test_lic_files_chksum_modified_not_mentioned]
> >   Suggested fix    Include "License-Update: <description>" into the commit message with a brief description
> >   Current checksum file://LICENCE;md5=d57d511030c9d66ef5f5966bee5a7eff
> >   New checksum     file://LICENCE;md5=d343e62fc9c833710bbbed25f27364c8
>
> Anibal, can you check this please?
>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

