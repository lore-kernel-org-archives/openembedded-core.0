Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
	[209.85.167.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5682B7C035
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 17:28:09 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id m6so6917611oig.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 09:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3LqwJe4feBD62AxjsJZbH3Xp9vH9XixgxY6vIsjCWHE=;
	b=hOUhksl3wPloGeLrQf3Zkb+weM11hMW+GjZrAEepbQBF/RTB+oCFq9Ilct03bgqTZy
	9rTKlXrFmELhgsBDX6bB4hlFGxKJipLMorC6eAtcr3LbuXx8OumUUm8CK9QuBYm0UpJ+
	aI6yGEatAJLRGNVz308t66uSStdUOsvlElCKSkKVXrIiZQVchsJMXDUW/aUq0jYb7MWX
	EnHk7MnscfqV0+tBsr+6NbAg9PdtaqTE30TAgbrBVGDZS7ttOdN0pf+uB0dmpuBOrzRz
	Zx2UjFWTYebf4aS0gTaa/Xk1E6NlZ5CYArorOQgWYTThyx7C9/kifEzmCBUK+4QSQWsC
	nVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3LqwJe4feBD62AxjsJZbH3Xp9vH9XixgxY6vIsjCWHE=;
	b=tnb5g5ED++Ow8czju9l72tQWf1gtVVFGatgAqY3ncsZ1Yq4OIPC+/bYAnwkwOQEeWA
	/y9n4p5u1QOcR0EHd0VT1Gbx9/BDjyLJDD/Yk/g4p7skJ3KXqzJYUcGILqk8ng2tcQZm
	Ub5VfCaCYre0IV07RgHGTL+ZbSuDZ2Ma6FMtFVazL/psnW874hS5MvwbGZ2g56qj7OjA
	fTZpJjoKUob+aVEvNI9SE3FRu3hsrlIH8EpgZuyRKtiYKv/t91myY5NQP9CHkuFuspRL
	bfcml2R5Dl2fknkWZonMbUg+OJby7BSfMY7u7ALKC+x1c6muSHkpMaWkqQzDtTL0TwMq
	QxcA==
X-Gm-Message-State: AJcUukdbJu7OWRst4BVZZRI4KvHBpvUoSrCdx8mflzGplxY8AA0TpL6z
	MAO/MoFXW8eq4TCzl56QVYHQ2OOsUdgvDMTscVU=
X-Google-Smtp-Source: ALg8bN7X3G11me+bD6t1nHY84kqk5prBuQb/UoQ5enr8ntm5ohHp3dtlFQXE0TTXRIJ0JM7pd4si75yEOA/MVEXbkNQ=
X-Received: by 2002:aca:b7c2:: with SMTP id h185mr4613411oif.298.1547054890269;
	Wed, 09 Jan 2019 09:28:10 -0800 (PST)
MIME-Version: 1.0
References: <1547054675-32745-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1547054675-32745-1-git-send-email-liu.ming50@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Jan 2019 18:27:59 +0100
Message-ID: <CANNYZj_GCJUa+ZxMfVicbH0xu_K_kQ_s4GD3ASiiDM7LbV=C9w@mail.gmail.com>
To: liu.ming50@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] npm.bbclass: introduce NPM_PXORY
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
X-List-Received-Date: Wed, 09 Jan 2019 17:28:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Jan 2019 at 18:24, <liu.ming50@gmail.com> wrote:

> +       if [ -n "${NPM_PROXY}" ]; then
> +               npm config set proxy ${NPM_PROXY}
> +               npm config set https-proxy ${NPM_PROXY}
> +       else
> +               npm config set proxy null
> +               npm config set https-proxy null
> +       fi

Isn't it better to set those from http[s]_proxy environment variables
which are standard?

Alex

