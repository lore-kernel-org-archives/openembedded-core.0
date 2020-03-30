Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web11.662.1585597962715100108
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 12:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O17YQyvt;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id w185so11898833vsw.10
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2020 12:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cCW9orwSL9NiKtX9yN7Ufy7M0oNnGhVreMb+j/fKXTw=;
        b=O17YQyvtLhhR0CT+GTSTEhgZVfybdV32F2wyeg84NTkrGUQ+1RFOZHe4JSpLo0Z7XA
         N4I0YHLM0BUj1rrOIo4g46IQ+2Y6wSqiNSDSPinVhFXPkly5ViyzPi3OEr7f0i6FggiH
         N02fNgr1lP+5LCoXrT90e1LRJe6ACNSP0Cl7u3+vgLuVmYTfe/3JXkQgRCI6qv4qFM0z
         Of5rcTFVNfbKqcqM3Fyzewu3sJ6x7uFBkNQPE5VQpVQWvUoNONKiGOSN5o3iY2CGsupC
         EYNxwJlsVpJoLcOPd4zfBRTMagCY40W/56q9UYQUwpGhq1INf60pbp8PDZBC6gwWaEcR
         ypDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cCW9orwSL9NiKtX9yN7Ufy7M0oNnGhVreMb+j/fKXTw=;
        b=eNM2FlzPDiqVCheGljlENmMfJjqiNEYsapWG98Mf85sjeN9nJ3TW7P9O7jbFJRgWC5
         b9sPE4E/Ff6mZB2xreFBtzLt4AqfcUm7qakRRP/JWjN8zYUKa32lErl4RTueC/kYGIrI
         aNTiYAnaBPuso3AlaBFpgRU0tG22QnMa+eJl/19MVINdXefmLkrHXRp6syZ3TeoKR/Uh
         7rsXOu2pGpo5OQBNQSqKI4XDZi/2jj/PL4wBcedSZN0u/WICRzoWagabKkFUzXGP4Oz0
         tc20UaLSqKYwSywL463tqUPe9KqL33haOaiJpErin1lMxn9VHC6iNql8qKJtgum8THtf
         RONQ==
X-Gm-Message-State: AGi0PuZkvMwvWRyi37PPs+/ueOxfcknxoSYYrnkK5vav4Fyv4Y0INbUx
	duEQQPTY3hFnV+uo/MdwMYV9x0oWiaQXCPE1ld7doA==
X-Google-Smtp-Source: APiQypL/n4ocaV2EaVvVBRTFuNa+PXXRCR0rds8s18GMgCkZRwsOLZHOURJZLC8OUi+jFKTaTEoT18nG4GZ0xVsNckE=
X-Received: by 2002:a67:80d6:: with SMTP id b205mr9089895vsd.137.1585597961768;
 Mon, 30 Mar 2020 12:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200330194302.30032-1-timothy.t.orling@linux.intel.com> <20200330194302.30032-3-timothy.t.orling@linux.intel.com>
In-Reply-To: <20200330194302.30032-3-timothy.t.orling@linux.intel.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 30 Mar 2020 12:52:31 -0700
Message-ID: <CAJ86T=WkdB4W7rC7Nc254oUT+kRQk09Z4iCJ4jL38iLqHhD6BQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] sanity.bbclass: recommend using install-buildtools
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2020 at 12:43 PM Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
>
> For old tar versions (1.24 and 1.28), recommned using

Typo.

> scripts/install-buildtools
>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  meta/classes/sanity.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index cca5cdad17..0cf955a341 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -533,9 +533,9 @@ def check_tar_version(sanity_data):
>          return "Unable to execute tar --version, exit code %d\n%s\n" % =
(e.returncode, e.output)
>      version =3D result.split()[3]
>      if LooseVersion(version) < LooseVersion("1.24"):
> -        return "Your version of tar is older than 1.24 and has bugs whi=
ch will break builds. Please install a newer version of tar (1.28+).\n"
> +        return "Your version of tar is older than 1.24 and has bugs whi=
ch will break builds. Please install a newer version of tar (1.28+). You co=
uld use the project's buildtools-tarball from our last release or use scrip=
ts/install-buildtools\n"
>      if LooseVersion(version) < LooseVersion("1.28"):
> -        return "Your version of tar is older than 1.28 and does not hav=
e the support needed to enable reproducible builds. Please install a newer =
version of tar (you could use the projects buildtools-tarball from our last=
 release).\n"
> +        return "Your version of tar is older than 1.28 and does not hav=
e the support needed to enable reproducible builds. Please install a newer =
version of tar (you could use the projects buildtools-tarball from our last=
 release or use scripts/install-buildtools).\n"
>      return None

Is it useful to keep two levels of version check?

>  # We use git parameters and functionality only found in 1.7.8 or later
> --
> 2.24.0
>
>=20
