Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0A54A71CB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 19:17:35 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id g60so2264802qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 12:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/50ZkSAtrlfKqGG4yJJBg8g0/NHT3PrXeXqdMuu3b6U=;
	b=WSd0yRt+HZtKyDgkwFkUbcnPGueU4U6QKRdcKVtIVSc5WElhsfcGmEyXq9iX/87o+V
	sGuJNz3FWzVWi/QWdFDurivYxEDegAUvHLl6Kme0Z8IEQLaDgbaf8tanH3mLwlladhhW
	qV1qIGGFm076SBqnRVNxuQOcYuZox2RfmAeIwCRLro/CDu4hYF9EbmvP3RnBweTPvagS
	B5uh5U22oaIeCGvRVxXYiOu5Jp8FDOrowOytP3dyZVJMmBqgv6yWg7izQdJvC4UDwYM8
	v7KFC5xyv5PGCzRntjvOgC7ZZfVzxZpOrv/jT6piu9ps0KtmG1GQlJWRIRI86ul4UXhj
	rIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/50ZkSAtrlfKqGG4yJJBg8g0/NHT3PrXeXqdMuu3b6U=;
	b=Gp+kmEN8aoZUdfG+7tqcjFWGuqI7FeqjpPJ4BhTC4mWn3OidjkCNmcnF2fPkFeFWMQ
	fl/K1THOrUFah2MxApEcnyldLUSQAjJwTirgZ8OusRTIdJjCC2QtDs4ofiuNlN7F8+zZ
	T+cOLQbIBylcUNjLAwjzmLgl5YOMqwEQ/JbNOdsGzBHBlsBszVthkPvNF/c2smQdAc3i
	uBsv8PBCMRIdiJNjQoJdgopM0Cmvc9BQYRXeYV+5FMdvroqnRAy/pP1QaUbbgIJSUzBZ
	4x9jrLikMWzQVI0H0HqOjd3nZU8O7X4HsuIG5qxEJunWH34GeIoFmR2l5vKf6fO9JB59
	iidw==
X-Gm-Message-State: AN3rC/5cD3EQXjFGKaxC2cF/af4HzxnVAUGuSoceNo7urRoy58Tw73N3
	EjIWDe7Nn7zIYT7btmrGLhWGyMuwMsWg
X-Received: by 10.200.46.26 with SMTP id r26mr16856480qta.197.1492543056688;
	Tue, 18 Apr 2017 12:17:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 18 Apr 2017 12:17:16 -0700 (PDT)
In-Reply-To: <CAMKF1soMAfgVG78+dywZ5nAnmAfi0-6hnUjC+MohWHm7JsBuUw@mail.gmail.com>
References: <1492527724-26361-1-git-send-email-bkylerussell@gmail.com>
	<CAMKF1soMAfgVG78+dywZ5nAnmAfi0-6hnUjC+MohWHm7JsBuUw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Apr 2017 20:17:16 +0100
Message-ID: <CAJTo0LYr9XCsG0yFAYeLmQtnc0n99w0dULWdz01J+kLWSp90uQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: Set CMAKE_CROSSCOMPILING correctly
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
X-List-Received-Date: Tue, 18 Apr 2017 19:17:36 -0000
Content-Type: multipart/alternative; boundary=001a114708ccb4d165054d75c270

--001a114708ccb4d165054d75c270
Content-Type: text/plain; charset=UTF-8

On 18 April 2017 at 19:53, Khem Raj <raj.khem@gmail.com> wrote:

> dont use == here that will make it bash specific.
>

Well spotted Khem.  I've merged this into my staging branch with the test
changed to = for POSIXness.

Thanks,
Ross

--001a114708ccb4d165054d75c270
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 April 2017 at 19:53, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":1rr" class=3D"a3s aXjCH =
m15b826a1c6fa7980">dont use =3D=3D here that will make it bash specific.<di=
v class=3D"yj6qo ajU"><div id=3D":1q8" class=3D"ajR" tabindex=3D"0"></div><=
/div></div></blockquote></div><br>Well spotted Khem.=C2=A0 I&#39;ve merged =
this into my staging branch with the test changed to =3D for POSIXness.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Thanks,</=
div><div class=3D"gmail_extra">Ross</div></div>

--001a114708ccb4d165054d75c270--
