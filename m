Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4C6C76BE0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 22:18:27 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id y36so4339130qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 15:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=h+W3q+Mz/eA69kaBpE0T35xtcOyWi6p5IZYUBO74OkQ=;
	b=BpUZ1K33QE2vSziB2S5LjInSUjf8+XjI7GsR5lEfM4qRS/fQLEK578ZnIqV05pjjA+
	ID/CPMHwz/nXnpp5vFjTzdTBDk71LKg6zxA4dZ3pHCNDvco9k1fBnTDYKtMa4FoTeyBI
	JKtctrS6P48G1gO1UKAEFBgrkzvA77BlKQdzZcu46n5QZCLBVS0GBRQhLOIgxhKOkzyF
	eaG6jd50XW5tJ/dCD3nZNxewJER6hqx3FQ0z+STRoPK50YPQT5h8uDO2CErrLmqmSlRI
	URjNzRaCcQEvGXUOoTZPsPgQ8M/Y+eGnyJsz9uBPQAA75L5ZLkAUMkb4j1PRyJqMfVaX
	CQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=h+W3q+Mz/eA69kaBpE0T35xtcOyWi6p5IZYUBO74OkQ=;
	b=P1Ym9BEjc+87Vny+jAnsVw4OgCA41JftjI3PrqpFHLS9ZTagxhMxJcbFAIFHQxmHb3
	4pKw48h09ZMnxGB9KNHswp13X9f0IqYrNNdqRC1FM+z6cH1tQCTW9f5B9jcbQS7NsHN6
	lr+CUK/km4lLRQeKT2cKjZNK+pM9/0R2RRHVLlXYQv+yzuBWKA956OuRkfQ2YK4GIXZV
	C1jL6niLgXDokH27MS18LgFA0mtCzLT1/nCZfggjeRzG/bG7cjaWbBc0kN8GHSiOD9TR
	pvSxxWH+58Z0qJT7kORzJGalBvJWJ7i5WwWKHYAQq5JDn3tjm5+X7dNpQO0GJ8WlouN+
	N6vA==
X-Gm-Message-State: APjAAAWy18O8VnM1+MvmUcHxclpvHdO93HCameHNJBQq6TKk39LSiTBH
	BUCKiF+wOCvmEzbt9fmvnxyguphJ4nREtNDNr4E=
X-Google-Smtp-Source: APXvYqxfzd8ZohldkPD6z6Y4+qmkw78cbKKd1fugNxC7DxIlNicjwj4EccybSWPKVPxVUs0xir+5JoUsklpF9G79H/M=
X-Received: by 2002:aed:2321:: with SMTP id h30mr10523887qtc.253.1553293107680;
	Fri, 22 Mar 2019 15:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
In-Reply-To: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Mar 2019 15:18:01 -0700
Message-ID: <CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
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
X-List-Received-Date: Fri, 22 Mar 2019 22:18:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2019 at 6:11 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Just prepared meta-networking/networkmanager update and spent hours to
> get musl patches applied. Have no idea if musl will build and
> currently all my machines are building.
>
> For me - not using musl and looking forward to have a beer with Khem

you will have to be sober, because I will show you data that you need
to understand :)

> explaining me why I should want musl [1] - it is just useless effort
> and patches are rejected often due to failures on musl build.
>

If you make a valid case, and seek others to chime in then it could be
considered.
but its desired to keep our musl port to be healthy.

> So on my way home I though about the options I see to handle musl specifi=
cs:
>
> 1. Continue as we do - patch recipe-wise: This is lots of efforts and
> requires resources we don't have. Most patches are created by Khem and
> it would be better for all of us to save his time for other tasks.
> 2. Sending musl related patches upstream: Surely the cleanest approach
> but even more effort because upstream maintainers all have different
> thoughts. Some of them might hear of musl for the first time and are
> possibly not keen on patches they do not see a need for.
> 3. Change our musl slightly: Many patches we currently have are
> trivial. Missing headers or #defines for missing functions... So if we
> add few headers
>   * Empty chunks for e.g <net/ethernet.h>
>   * Add defines as #define strndupa(x,s) strncpy(alloca(strlen(x)+1),x,s)
>   * ...
>

There are certain design aspects of musl which are actually turning
out to be good
e.g. there is no __MUSL__ define, so non-portable code can not be
hidden which is a good
thing, similarly, adding these defines to musl itself would probably
be not serving the purpose
of cleaning up the apps and making them portable. The fact they do
exist as patches is a reminder
to clean the application code or rethink to fix it differently. This
has actually resulted in cleaning up
many packages, several of musl initialed patches regarding portability
has been accepted in upstream
and some are not, and some are not proposed. While the eyes may hurt
to see them, it does serve a
good reminder of whats needed for a given package.

> As you might guess I'd prefer 3 because:
> + Many patches can go and don't need maintenance on upstream refactoring =
anymore
> + Burden for people sending patches would be reduced
> + Recipes not building with musl currently might work without further
> modification
> + Just in case musl stops (we have seen this before with others e.g
> ulibc) the cleanup would be reduced
>

this points to the above as I said. Musl stays or goes cleaning them
up would be good regardless

> Of course there are disadvantages:
> - We turn musl into glibc direction. Posix-purists do not like that.

right. and IMO its valuable for apps to be a bit portable.

> - Configuration scripts already aware of musl and deciding upon the
> existence of headers missing in musl might do the wrong thing
> - ?
>
> Some other ideas?
>

I think we should propose the fixes upstream and see what is acceptable.

> Andreas
>
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2018-March=
/193521.html

