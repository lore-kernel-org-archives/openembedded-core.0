Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 087426C4DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 21:44:36 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id d13so9175591qth.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 14:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=W2yBr+R+LE2uYalFWyF8/l1StvMS6xGCr+WWh4a1fsQ=;
	b=eWrxT0Ok7COWSLh4b7XdqdP8MB+TUSTxZKtvE7r7up23TfVslOMPzJqrgInLcHMM0Z
	2eQlIhbViw1pV3vKGV+UvJFFZ/oe6nN+vbxi6t6btfDeP2xjLSIyDIXvOMxaxhb5ds7g
	MJ87VyZYgNcRHzLJkc7KtWUyxhqgznnMyO2QRUvMlQMDMOAPXVfoURAKFiZEjM5pJLAQ
	awIYWjwd7Jg3oyaJmeH93hsX++F2kZGShc0SF/kOHwMzmiezZtt1yO1NFX5WAY2HO16r
	pQs02G1jXIx7XGIFjR77aIC7dqyfx73fwY+nQWWwhw7x+Q8yY+zaHY1Sg5EttgzJxloD
	Mqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=W2yBr+R+LE2uYalFWyF8/l1StvMS6xGCr+WWh4a1fsQ=;
	b=iZ0qpDYybUCaaKw70bRQ7GjUNH74RKC0tjEWoPsDfOnvNV5M4Qck4V0BKeu6sogpv+
	/n5bykCKBW0FuYkxr/nrlUEPiD0c8lfXwFM3nPaPoHnAzrjf9T0MfWY1dRXBM/CfbxhQ
	bdfaP8M4HoMy6A2htP4oy++L2+Oebmh+5vnzBoyq6+Brpbl1+AnZ9D1dI+23LF05CjjJ
	Qcs5h7hBazfmy9i9N44crSMe4s0ewQPNLKoEGom/QaoTB9+74AIGaAAVtb/NSdxDHLsn
	7NrFk/igeUyxJ+YN1zN281rJG2idvCeRSElM35CMCiP3N6VMgHtLCb69HCDzkkTh/L4a
	vSYw==
X-Gm-Message-State: APjAAAUMNRhGEaPfCujuOwXkLAI8GO6IeWOQ8UCnJrt4ty8Fc5DSr7Z0
	CdSwXdS9ozn0ouf+4+AHayXIiXBcLOVxsUpMMs4=
X-Google-Smtp-Source: APXvYqxaqzuGR63so2nqZjwObmoTj25Ge0lfM9TTCLnUPUqDE27pRu+MGvElcGi4qfFEm58S0iZ4pi67wPOkP0oMDDU=
X-Received: by 2002:ac8:262c:: with SMTP id u41mr13699214qtu.198.1554500677805;
	Fri, 05 Apr 2019 14:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
	<20190405063736.29750-2-schnitzeltony@gmail.com>
In-Reply-To: <20190405063736.29750-2-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Apr 2019 14:44:11 -0700
Message-ID: <CAMKF1sqbm8wRO3gABaizZQ_1oY=ahpqCPvqPdJfj9fk5X7zgmw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] insane.bbclass: Trigger unrecognzed configure option for meson
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
X-List-Received-Date: Fri, 05 Apr 2019 21:44:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2019 at 11:38 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Tested with 'unknown-configure-option' in ERROR_QA:
>
> For meson (glib-2.0-native):
> 1. add 'EXTRA_OEMESON_append =3D "-Dschnitzel=3Dtrue -Dwurst=3Dtrue"'
>    | ERROR: glib-2.0-native-1_2.58.3-r0 do_configure: QA Issue: glib-2.0-=
native: configure was passed unrecognised options: schnitzel wurst [unknown=
-configure-option]
> 2. add 'UNKNOWN_CONFIGURE_WHITELIST_append=3D" schnitzel"'
>    | ERROR: glib-2.0-native-1_2.58.3-r0 do_configure: QA Issue: glib-2.0-=
native: configure was passed unrecognised options: wurst [unknown-configure=
-option]
> 3. change to 'UNKNOWN_CONFIGURE_WHITELIST_append=3D" schnitzel wurst"'
>    =3D> builds without issues
>
> For autotools (readline-native):
> 1. add 'EXTRA_OECONF =3D "--with-schnitzel --with-wurst"'
>    | ERROR: readline-native-8.0-r0 do_configure: QA Issue: readline-nativ=
e: configure was passed unrecognised options: --with-wurst --with-schnitzel=
 [unknown-configure-option]
> 2. add 'UNKNOWN_CONFIGURE_WHITELIST_append=3D" --with-schnitzel"'
>    | ERROR: readline-native-8.0-r0 do_configure: QA Issue: readline-nativ=
e: configure was passed unrecognised options: --with-wurst [unknown-configu=
re-option]
> 3. add 'UNKNOWN_CONFIGURE_WHITELIST_append=3D" --with-schnitzel --with-wu=
rst"'
>    =3D> builds without issues
>

thinking of Weisswurst with Bayerischer S=C3=BC=C3=9Fer Senf
this patchset looks good :)


> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>
> This is a resend
>
>  meta/classes/insane.bbclass | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 37b8bb0032..c8d18c07f5 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1093,12 +1093,16 @@ Rerun configure task after fixing this."""
>      ####################################################################=
#######
>      # Check unrecognised configure options (with a white list)
>      ####################################################################=
#######
> -    if bb.data.inherits_class("autotools", d):
> +    if bb.data.inherits_class("autotools", d) or bb.data.inherits_class(=
"meson", d):
>          bb.note("Checking configure output for unrecognised options")
>          try:
> -            flag =3D "WARNING: unrecognized options:"
> -            log =3D os.path.join(d.getVar('B'), 'config.log')
> -            output =3D subprocess.check_output(['grep', '-F', flag, log]=
).decode("utf-8").replace(', ', ' ')
> +            if bb.data.inherits_class("autotools", d):
> +                flag =3D "WARNING: unrecognized options:"
> +                log =3D os.path.join(d.getVar('B'), 'config.log')
> +            if bb.data.inherits_class("meson", d):
> +                flag =3D "WARNING: Unknown options:"
> +                log =3D os.path.join(d.getVar('T'), 'log.do_configure')
> +            output =3D subprocess.check_output(['grep', '-F', flag, log]=
).decode("utf-8").replace(', ', ' ').replace('"', '')
>              options =3D set()
>              for line in output.splitlines():
>                  options |=3D set(line.partition(flag)[2].split())
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

