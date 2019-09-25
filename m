Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 16B1E7E830
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 21:30:46 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id t84so220124oih.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 14:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ljWDm6xcYb3w1rRQD3Q7Xq1L9nbuqPmkEtTc4bCw0Nk=;
	b=KI707HUix46lNHZ/oPne4+2ceuqujwGL51gY2sP8K9p8wWHNiuOf9uzhA/v1jb0dE0
	2gn28fEgtry0+l3aYzhI+ulKH7Hc9FL0VanSlTb4tK2/XO+ORi9txTxhWc+dzCjnsBNx
	n9MCBy6J4F8NcfvKl1PvHN1+UBjKXTfhrD7yL+XkJIHmW5t+QSgbnbOWWt1uJe/XPqbQ
	hL5QatqlbC/k/qYGfg4mTuR88+bA6IstVdlGyDx/j3dwTGSmGRmZ3viCt7tdZYE95Yzc
	uJcp45FI1hllOCjyOd1OAaa4vPwUDLF1yc0Egs6bh02glf0vRUjbXsDa3hK5EWqKJI5l
	TezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ljWDm6xcYb3w1rRQD3Q7Xq1L9nbuqPmkEtTc4bCw0Nk=;
	b=HchP7lK7irCQnzfz/YpDsTjULQe+goXZWDMhPQy+fMKv3+Ql/TG/1+T3HPyr3Fixu0
	wSRZwS6Vrqrk3d5idQpR6dxlyVDnotHLKhGBJGT0zpuR671wSy9jJF0+kiqvuqL4EHy9
	q6PmiLfgAM/jl8i9/BO0vv2rJwII0R0heQxnEC4ejD24fkyRw6/AnKhQ2zWtvRt2sVrS
	STfrIEDsECe9CTP+Pb1cgFWmL2DfHVEJze44DQTNFNPUUpEH3lvJCEyj4J9JfPeVjJ6r
	nXE8dKzh7eS1/Q6kTH/9bV7UnbNsBGwmNV1V2l9opbcD0OYN05DHlnkLMjFyJcleAhTz
	8xeg==
X-Gm-Message-State: APjAAAVxXlTIRmSvMvdZFPE0HqXeAWTQgBX7VIGN3PRiPz0oiYGrfzUY
	3Z/l3gsr51xs6LVCauWdI28GhRV/1xn5iNOUgg==
X-Google-Smtp-Source: APXvYqyPgg8N7TkyPHhMAIPLvzAJvg3pi9LsaViwiRjGM33tQEc3Rk5PQhM0/UId4Bl912KW9pt597AjtMR+sE6/IQ0=
X-Received: by 2002:aca:52cd:: with SMTP id g196mr90760oib.163.1569447047877; 
	Wed, 25 Sep 2019 14:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190925115259.26437-1-george.mccollister@gmail.com>
	<20190925115259.26437-2-george.mccollister@gmail.com>
	<39e9c9c3-dc27-03da-2149-fe173e5680f9@kernel.crashing.org>
	<CAFSKS=MfvSSzyhn0HmcwFJgNq2Tj=f+Fr+VWrsQCYnbH3f2tjQ@mail.gmail.com>
	<95bec5ac-7a79-d302-303c-28251f10ec3f@gmail.com>
In-Reply-To: <95bec5ac-7a79-d302-303c-28251f10ec3f@gmail.com>
From: George McCollister <george.mccollister@gmail.com>
Date: Wed, 25 Sep 2019 16:30:36 -0500
Message-ID: <CAFSKS=ONUnQ_1LcQXE52H3B-KXyejM4Zy1e_JayGA5NTspwfwQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 25 Sep 2019 21:30:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 25, 2019 at 1:34 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On 9/25/19 11:13 AM, George McCollister wrote:
> > On Wed, Sep 25, 2019 at 11:08 AM Mark Hatle
> > <mark.hatle@kernel.crashing.org> wrote:
> >>
> >> On 9/25/19 6:52 AM, George McCollister wrote:
> >>> Set OPENSSL_ENGINES to the path where engines are actually installed.
> >>>
> >>> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> >>> ---
> >>>   meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> >>> index 072f727e0b..8819e19ec4 100644
> >>> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> >>> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> >>> @@ -148,7 +148,7 @@ do_install_append_class-native () {
> >>>            OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
> >>>            SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
> >>>            SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
> >>> -         OPENSSL_ENGINES=${libdir}/ssl-1.1/engines
> >>> +         OPENSSL_ENGINES=${libdir}/engines-1.1
> >>
> >> Is this a bug in the openssl recipe (it's placing engines in the wrong place),
> >> or a bug in the recipes providing acceleration engines and THEY are going into
> >> the wrong place?
> >
> > This recipe installs:
> > packages-split/openssl-engines/usr/lib/engines-1.1/afalg.so
> > packages-split/openssl-engines/usr/lib/engines-1.1/padlock.so
> > packages-split/openssl-engines/usr/lib/engines-1.1/capi.so
> >
> > libp11 in meta-oe installs these:
> > packages-split/libp11/usr/lib/engines-1.1
> > packages-split/libp11/usr/lib/engines-1.1/pkcs11.so
> > packages-split/libp11-dev/usr/lib/engines-1.1
> > packages-split/libp11-dev/usr/lib/engines-1.1/libpkcs11.so
> >
> >>
> >> The ssl-1.1/engines makes more sense to me..  as /usr/lib/engines-1.1 obscures
> >> that they are OpenSSL related.
> >
> > I don't have a strong opinion either way but ssl-1.1/engines does make
> > a bit more sense.
> > Debian appears to install them in engines-1.1 though:
> >   https://packages.debian.org/buster/amd64/libssl1.1/filelist
> >
> > I do need this fixed in warrior though and wonder if anyone would
> > gripe about changing where they are installed post release.
> >
> > How shall we proceed? Does anyone else want to chime in?
> >
>
> Using /usr/lib/<package> is known jargon and lets use it. I think doing
> it the way other distros are doing it and how upstream defaults are is
> also helpful. it reduced one more thing to worry about. Release branches
> should not be an issue as long as we have them packages in same output
> package.

It looks like Fedora is also using engines-1.1:
https://apps.fedoraproject.org/packages/openssl-libs/

I've found there is no Configure switch to set the engines directory.
I believe it will require a patch to changes 3 - 4 lines in
Configurations/unix-Makefile.tmpl.
meta-oe/recipes-support/libp11/libp11_0.4.10.bb would also need to be
changed to use the new path.

Is carrying a custom patch to deviate from the upstream package and
major distribution behavior really wise?

If there is somewhat of a consensus to go that way knowing it requires
a custom patch I'll send a patch for openssl and then one to fix
libp11 (which the first patch will break).

>
> >>
> >> --Mark
> >>
> >>>   }
> >>>
> >>>   do_install_append_class-nativesdk () {
> >>>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > -George
> >
>

