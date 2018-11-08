Return-Path: <nathan@nathanrossi.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2669D79F18
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 08:43:02 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id r71so25124960qkr.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 00:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dKGxKNGZHCRDvQF7xIfpgsStprYlCa+PO5vV1Yt/Ihw=;
	b=jl51aDu+aVaLlaeDGXoL3DoJsBoAcNh4xzfjZKv4IW3mi3IWXzF6z/HpE+yMjMbZvE
	mUCNfMKVsb5uUKqV9nSDAanM7rd0XMuolHj5gPPK/NudiklQSyJWs1ZdpBF6Z4gOH7hR
	d7fJVgwRr5H/+C+6/5K0/HKEW4FEC/rbEMR07QsgWmlTFPvq5WVQZBwVcRzRa6KXD2Po
	TDNwRwNh9ojCtDsSdkHNmOxd2llGf6lDTKoxKOmf88k/oOwp0X5FQWLZiJVQasDpDC39
	6jDbB3OA9oBD/bA8R5LpbA/nfk4fudPwOICX4I2QEUGuV/csFAZabFDY+w0bKxiZr7S+
	Llcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dKGxKNGZHCRDvQF7xIfpgsStprYlCa+PO5vV1Yt/Ihw=;
	b=f5MiSnbQaD3i7KepdWccVxSS4XQ8Tf3M01iBSo0LXMkEnsFv0cjKgJJYMqnrZarhU9
	QJiah9mGKqB8p7n1h0ZRaZlT1ZuMreJbj2y4jbiLQekyqejULVaKnZdFguP7RTi4+FvN
	D+FTfOZg9LuYelAFHtF5LvAwshwN8sqWXuYKgUuGHl5aVxsCNYw6niaLeMCx97kf3v9G
	Uu0i23ZsM/8DWGbDAuimGqSerqKCBVTbyR0yMhZkJ5fpK441judX9xcQfsLnpThFLqKD
	2Q+QrPHAVF3jYdpbm/TIjAlAwbJovxaEM617TvBZpSsuTXgdK1g7hErgNM9r6PAv7cch
	AZ2A==
X-Gm-Message-State: AGRZ1gJuZv98itY8dVArPKZWq0ef8r+j6f0YvDE0fZvyP96mok83xgUC
	knvpGKJ/Q5g24PcyoChfSTxq8OIjya9Te3ym/x6/mQ==
X-Google-Smtp-Source: AJdET5ewRoMY1wicfttec2N6qe72Ep3RXpOep7tdAcrfQ7i7ZLZ94ma1p3FFCZ3YED3PkJzBRLBipYasXeDOYMB52u8=
X-Received: by 2002:a0c:d268:: with SMTP id o37mr3560796qvh.136.1541666583816; 
	Thu, 08 Nov 2018 00:43:03 -0800 (PST)
MIME-Version: 1.0
References: <20181107084701.5939-1-nathan@nathanrossi.com>
	<0f67d75a-7a06-8cc3-3f46-886ca11582a0@windriver.com>
In-Reply-To: <0f67d75a-7a06-8cc3-3f46-886ca11582a0@windriver.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Thu, 8 Nov 2018 18:42:52 +1000
Message-ID: <CA+aJhH2b34jwUTOkXg5Coe3=epRgna1zkL5OCGrarO45OXdKxg@mail.gmail.com>
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ghostscript: Define COMPATIBLE_HOST with supported platforms
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
X-List-Received-Date: Thu, 08 Nov 2018 08:43:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Nov 2018 at 11:57, ChenQi <Qi.Chen@windriver.com> wrote:
>
> This patch causes the following failure on autobuilder.
> https://autobuilder.yoctoproject.org/typhoon/#/builders/32/builds/183/steps/7/logs/step1c
>

Sorry my bad, I sent out the wrong version. v2 incoming, which fixes
it up to use host_sys patterns instead of overrides (for x86_64 and
mips).

Regards,
Nathan

> Best Regards,
> Chen Qi
>
> On 11/07/2018 04:47 PM, Nathan Rossi wrote:
> > Setup the COMPATIBLE_HOST variable with all supported hosts based on the
> > provided objarch.h files. This inverts the existing pattern where
> > unsupported hosts (e.g. 'arc.*') are explicitly set.
> >
> > This suppresses the warning message generated on hosts that are not
> > supported but were not listed explicitly.
> >
> >    WARNING: .../ghostscript_9.25.bb: Unable to get checksum for
> >    ghostscript SRC_URI entry objarch.h: file could not be found
> >
> > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > ---
> >   meta/recipes-extended/ghostscript/ghostscript_9.25.bb | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> > index 35eaaeb2fa..8b69170458 100644
> > --- a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> > +++ b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> > @@ -121,5 +121,4 @@ do_install_class-native () {
> >
> >   BBCLASSEXTEND = "native"
> >
> > -# ghostscript does not supports "arc"
> > -COMPATIBLE_HOST = "^(?!arc).*"
> > +COMPATIBLE_HOST = "(aarch64|arm|i586|i686|microblaze|mipsarch|nios2|powerpc|x86-64).*"
> > ---
> > 2.19.1
>
>

