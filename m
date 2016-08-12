Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7CE77232
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 05:53:58 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h186so951149pfg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 22:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=KJHo6zTDOJJeoA6T5yEyIbzL7HJVJDYC5pGbpEnkG8w=;
	b=GSsvgkr8UJYIqdRskN0bdtTc02/DKeL16dcUHrkNjXXF+4OYzfDej0olT5wTScdjuh
	oAYLLH0JkUqPMRu3hwBNVUaAjyS/X9faS+54wQWn+zKjMIjMM5IBjg91xECizfowyi7k
	eYsyBs4IOqMh9x4ggcZO3N5teNl4J+me5sun+Jqyomt5aut3LQ1078Nnl9yP0qJgxgv9
	XYxic08N9OY6ZRT+GWLskWRgMTyScP/uVtaYbyA5QNjuz4vzRgP2UdSOaYksZZBe9LCS
	cD1cOBtixFpSFPnXaNEMTOn9h+tFuyl+NHl9K1FvixdUp7DUfQbqDH5IP0Fwi9fDCqYd
	D7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=KJHo6zTDOJJeoA6T5yEyIbzL7HJVJDYC5pGbpEnkG8w=;
	b=F74Y6l9MgjdliRhNQtwdbEln3eJ7I40nKyiSeUUzujhQiNcfcLLfc/lM1la6+ltM0K
	ZyFK4xUtEbJU0vgI8NRQNiMeF6Nh2a691C1WZTixQPBJWpHe568ZkBly4GHrbe6ok2Wq
	EGd+7iA4y13zrTRO7HHsIz3Y3cqD6NhMy3KduBEv28Y8lpG+NWfGG+rwPnzxFugarg5/
	oUNXpNELp+kuYxa93IuoPN/NTm/A6BGGmEMp407DyO0DMPQcNNuCjP/8oQCrj1HLaDlV
	4VrE2Mst8GYdwzPSmCa9s2wkJR5639a6JWrSan1SRb/RjAUyyujCNKJY47m1pe48of+t
	M97Q==
X-Gm-Message-State: AEkoouu6gVOqO0dKpcZtaqVbpH4hZn/lesiNdE9t3sjcc8HeiAGEtLDfpNBu06I6tU/MwQ==
X-Received: by 10.98.111.133 with SMTP id k127mr24016799pfc.90.1470981239519; 
	Thu, 11 Aug 2016 22:53:59 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:5ca7:11cd:bb8a:7702?
	([2601:646:8882:b8c:5ca7:11cd:bb8a:7702])
	by smtp.gmail.com with ESMTPSA id ao6sm9465742pac.8.2016.08.11.22.53.58
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Aug 2016 22:53:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1470904734-7709-1-git-send-email-armccurdy@gmail.com>
Date: Thu, 11 Aug 2016 22:54:45 -0700
Message-Id: <F8F74EC9-EBE9-4773-B256-B81ABB393E91@gmail.com>
References: <1470904734-7709-1-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ccache.bbclass: don't remove CCACHE_DIR as part of do_clean
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
X-List-Received-Date: Fri, 12 Aug 2016 05:54:01 -0000
X-Groupsio-MsgNum: 85694
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A6C2337E-9B31-4DA0-9918-A535F6E0D3FC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A6C2337E-9B31-4DA0-9918-A535F6E0D3FC
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Aug 11, 2016, at 1:38 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> 
> Removing the ccache directory as part of do_clean is unnecessarily
> conservative and defeats many of the benefits of ccache.
> 
> The original justification for this behaviour was to avoid confusion
> in the corner case that the ccache directory becomes corrupted.
> However the standard approach for dealing with such highly unlikely
> corner cases (ie manually removing tmp) would also recover from
> corruption of the ccache directories, without the negative impact of
> defeating ccache during normal development.

perhaps a good know-how on this if someone runs into this case would
justify this patch. Since this can still break the case where someone
is doing -cclean* operations and other tasks are run individually for
such broken case.

> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/classes/ccache.bbclass | 2 --
> 1 file changed, 2 deletions(-)
> 
> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
> index 2cdce46..2e9837c 100644
> --- a/meta/classes/ccache.bbclass
> +++ b/meta/classes/ccache.bbclass
> @@ -4,5 +4,3 @@ CCACHE_DISABLE[unexport] = "1"
> 
> do_configure[dirs] =+ "${CCACHE_DIR}"
> do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
> -
> -do_clean[cleandirs] += "${CCACHE_DIR}"
> --
> 1.9.1
> 
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_A6C2337E-9B31-4DA0-9918-A535F6E0D3FC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAletZKoACgkQuwUzVZGdMxSDDACgiBbR6cMBGzXkc7JL9q2epk2i
iXAAniAS/5NeeQkHa2oaD27ejtPsamHT
=Ni/u
-----END PGP SIGNATURE-----

--Apple-Mail=_A6C2337E-9B31-4DA0-9918-A535F6E0D3FC--
