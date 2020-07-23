Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.6580.1595484576816476027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 23:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IXpcm87w;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id g67so2528556pgc.8
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 23:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:organization:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=Iy3OFmS8txYww2OWrc68TbIEbu9dw/WMSK8h8fYrLqo=;
        b=IXpcm87wwQlB8xpvhpKdh4SjyCH2v2S8H+/rzdRzMLyrS6UeTTD8HLY0tNTWO41yBK
         /u7Yy/mGnnukBbCLRSA9moZmKSzF2nR854d+GPHBBUhxoZnFP5+apVdbP9EEmjRdiq+O
         fQMFj0GpoPcUmw4Bg6e9yO2PycnYrwsWqgmATsFLekDz10Lp9AorOyQSU1GFrDBzjH27
         sj/od9kqD4IwDphcE+N0ka8koles9cgq/Jb0mLApVSRBgyMFB6Mbd9XUIh9BbU8dzO/A
         m6sqyD8e76AFp884jujcs00qTcpiw18IVtOgoV3AKcIJzkjcopko659yhdpnQMT6tmqJ
         0rJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=Iy3OFmS8txYww2OWrc68TbIEbu9dw/WMSK8h8fYrLqo=;
        b=i9g/sBhwKRZjY7J+PUYgCgjhP0jdIwsUveENoEPnQgxESM27m8YIgC1aLk7CvF5efW
         HSVp1tL7Dk5EDI6exjLqDaqDEnKv/Vlob3m125o+YyMnWq1NDgE33AB8wCzh35MinRtn
         Y4Y5nnNYmwJ29oY1I+eBabLOdE0K24ZnquxtRTzKbX2VNjhJZW9qtN5xLdIiKVvF730l
         bSpnjJNzz470XLjbsCgLMXSx7eV5c25SylKrv4MAmEzdmKAuqlcN/x78BXjJy3FUDQzO
         vrMMgNqPi7c1BxHnulSsmVx2CVVN0WPwUMKVIf+P9karJBUuF9QLrTa5v34r4o7svwUQ
         k4kw==
X-Gm-Message-State: AOAM530g34le7dX7h6sHoIhuq6c0B1SO6qE5i27qvg+I68AIlXY21C5k
	DYcEo6tEli8eEuTlMNg/AqcT6gvZ67I=
X-Google-Smtp-Source: ABdhPJxQZ4O4ycgTNFOYTp0QSWDLEt/5yjtw5iGRXxtXBHwYXBSs6jYQRs6fuvxMxxS4b9NxRQEK8w==
X-Received: by 2002:a63:4a4c:: with SMTP id j12mr2967310pgl.115.1595484575969;
        Wed, 22 Jul 2020 23:09:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::fba5? ([2601:646:9200:4e0::fba5])
        by smtp.gmail.com with ESMTPSA id r6sm1556433pfl.142.2020.07.22.23.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 23:09:35 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] stress-ng: create a symlink for /usr/bin/stress
To: Dan Callaghan <dan.callaghan@opengear.com>,
 openembedded-core@lists.openembedded.org
References: <20200723043127.2821063-1-dan.callaghan@opengear.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Message-ID: <ab49af9a-8aa4-9767-e6b9-daa18682b34f@gmail.com>
Date: Wed, 22 Jul 2020 23:09:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723043127.2821063-1-dan.callaghan@opengear.com>
X-Groupsio-MsgNum: 140888
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="QbAAlT6kpGpb3WwBeAjs4k3baxqVBpmZx"

--QbAAlT6kpGpb3WwBeAjs4k3baxqVBpmZx
Content-Type: multipart/mixed; boundary="XnlSOaJShPYLgtMxN1E0nsuyftE3H9535";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Dan Callaghan <dan.callaghan@opengear.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <ab49af9a-8aa4-9767-e6b9-daa18682b34f@gmail.com>
Subject: Re: [OE-core] [PATCH] stress-ng: create a symlink for /usr/bin/stress
References: <20200723043127.2821063-1-dan.callaghan@opengear.com>
In-Reply-To: <20200723043127.2821063-1-dan.callaghan@opengear.com>

--XnlSOaJShPYLgtMxN1E0nsuyftE3H9535
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Dan

On 7/22/20 9:31 PM, Dan Callaghan wrote:
> In commit 72641004, stress-ng was made to provide the stress package,
> because it's backwards compatible with the old stress command. But it
> doesn't actually provide /usr/bin/stress which is what other recipes
> depending on stress will expect.
>=20
> Symlink /usr/bin/stress to stress-ng so that it actually becomes
> a drop-in replacement for stress.
>=20
> Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> ---
>  meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb b/meta=
/recipes-extended/stress-ng/stress-ng_0.11.15.bb
> index 8ea0476db5..dcded1120d 100644
> --- a/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb
> @@ -22,5 +22,6 @@ inherit bash-completion
>  
>  do_install() {
>      oe_runmake DESTDIR=3D${D} install
> +    ln -s stress-ng ${D}/usr/bin/stress

there is stress recipe in some layers which could provide stress utility
as well, therefore it should be using update-alternatives mechanism so
it fills in when stress is not provided by say stress recipe.

secondly please use ${D}${bindir}/stress instead of hardcoding the path

>  }
>  
>=20
>=20
>=20
>=20


--XnlSOaJShPYLgtMxN1E0nsuyftE3H9535--

--QbAAlT6kpGpb3WwBeAjs4k3baxqVBpmZx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXxkpmAAKCRC7BTNVkZ0z
FKGOAJ9XhDROTfAfZPrVvOTv2dhmQgaSrQCfZ9uqqUdGPQrJrPwzzJzP2upXeKA=
=NWKV
-----END PGP SIGNATURE-----

--QbAAlT6kpGpb3WwBeAjs4k3baxqVBpmZx--
