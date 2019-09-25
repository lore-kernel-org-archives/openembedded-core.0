Return-Path: <george.mccollister@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id E748B7E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 18:13:16 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 21so5672797otj.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 11:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:cc; 
	bh=73FnzsFtL6oFQ+d9XaRDEv4UGo9exVozrszyg4Wm2ZQ=;
	b=flVASsIm78MibSGIwE3tFEn2Mb8863APSHoUsRSk60cdVKwDzPP/n2mB2iD+fXBA9A
	3BTBmeFNoAB0WhPEIx7LHi8e8gB17tHf2nGX2Rq5Z8L/3qghvB2zftH4N6XBQU9C5+U9
	D8RTlOjiRRkcBHmq+zGl1ioJ2QkFu/U2BVIIHQyB0CGAoYIGM3ksTBNiS4mvzl7mJcYO
	7YkPIpOKHfMV2X7erz7/cgzykH/acxUZBq0P4Si+T0qFK0LEdUsdgqgxtET2yM8YTPfc
	9FYh2FM3Ols76K9gjcj5I3HU5ZCk+eRzysUDtgddyVcbUfNVZudzuDKSlkeHfFLxSTe4
	JorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:cc;
	bh=73FnzsFtL6oFQ+d9XaRDEv4UGo9exVozrszyg4Wm2ZQ=;
	b=ClGQI5U4fsTbz/N1ro0tza0H4W2U+I7Gf4EA8IWuEsTJWe0Bvm1pJa+3T4AiU9k3ec
	IXtijabgF8rBsUT0w6rrg426bx0DCca3CGE2pX4B/LdBN7smq890p1G3qVYA9oqm6pk3
	clVhSxgmS3fe1VJ9mShi2vNyqNQ/2fFcmnRtYBldmU2/PLGiRmIbwcOKxjVVgCSzFo90
	CNRAh+Re4KWL3x3ZMKOg81hH9WwT8dXonjCVuREX5Uj8rq3KbqUo4ozz7+Ino9ZzxCD6
	0DWVr4NeZLQRz/DFCgsKvr7U5O4Oqu9tAYiCKebcLs2x853h9NyqrVSEY/RQx9ttN66u
	DiIw==
X-Gm-Message-State: APjAAAUwTSWRe524UUBpbgwbTQu+eJQEdJ4F5ASxQADQVed3Mx1pv8E7
	7A33rDa+PKMlPI2yrFSyVdKaWvZ+2PWxMZHHk0xolRo=
X-Google-Smtp-Source: APXvYqysupMaH+VdLfx8LuubaiOeB/ruEmVmBJBEYnAG7rJKpMh/Uo/wKKlLxHs7Ao+rSvbTN+Ck7c1oQmwbdaBZeZ4=
X-Received: by 2002:a9d:21a6:: with SMTP id s35mr7520969otb.77.1569435197492; 
	Wed, 25 Sep 2019 11:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190925115259.26437-1-george.mccollister@gmail.com>
	<20190925115259.26437-2-george.mccollister@gmail.com>
	<39e9c9c3-dc27-03da-2149-fe173e5680f9@kernel.crashing.org>
In-Reply-To: <39e9c9c3-dc27-03da-2149-fe173e5680f9@kernel.crashing.org>
From: George McCollister <george.mccollister@gmail.com>
Date: Wed, 25 Sep 2019 13:13:06 -0500
Message-ID: <CAFSKS=MfvSSzyhn0HmcwFJgNq2Tj=f+Fr+VWrsQCYnbH3f2tjQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] openssl: make OPENSSL_ENGINES match install path
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
X-List-Received-Date: Wed, 25 Sep 2019 18:13:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 25, 2019 at 11:08 AM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> On 9/25/19 6:52 AM, George McCollister wrote:
> > Set OPENSSL_ENGINES to the path where engines are actually installed.
> >
> > Signed-off-by: George McCollister <george.mccollister@gmail.com>
> > ---
> >  meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> > index 072f727e0b..8819e19ec4 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> > @@ -148,7 +148,7 @@ do_install_append_class-native () {
> >           OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
> >           SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
> >           SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
> > -         OPENSSL_ENGINES=${libdir}/ssl-1.1/engines
> > +         OPENSSL_ENGINES=${libdir}/engines-1.1
>
> Is this a bug in the openssl recipe (it's placing engines in the wrong place),
> or a bug in the recipes providing acceleration engines and THEY are going into
> the wrong place?

This recipe installs:
packages-split/openssl-engines/usr/lib/engines-1.1/afalg.so
packages-split/openssl-engines/usr/lib/engines-1.1/padlock.so
packages-split/openssl-engines/usr/lib/engines-1.1/capi.so

libp11 in meta-oe installs these:
packages-split/libp11/usr/lib/engines-1.1
packages-split/libp11/usr/lib/engines-1.1/pkcs11.so
packages-split/libp11-dev/usr/lib/engines-1.1
packages-split/libp11-dev/usr/lib/engines-1.1/libpkcs11.so

>
> The ssl-1.1/engines makes more sense to me..  as /usr/lib/engines-1.1 obscures
> that they are OpenSSL related.

I don't have a strong opinion either way but ssl-1.1/engines does make
a bit more sense.
Debian appears to install them in engines-1.1 though:
 https://packages.debian.org/buster/amd64/libssl1.1/filelist

I do need this fixed in warrior though and wonder if anyone would
gripe about changing where they are installed post release.

How shall we proceed? Does anyone else want to chime in?

>
> --Mark
>
> >  }
> >
> >  do_install_append_class-nativesdk () {
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-George

