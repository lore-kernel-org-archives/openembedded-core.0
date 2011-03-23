Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2Pso-0002hy-0i
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 16:22:02 +0100
Received: by fxm19 with SMTP id 19so7623703fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 08:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=H4qodTMuo3xYFWb5Y8SHqkbFcXEuSWiPiqCjtjR/2BY=;
	b=Ce/KU0d5lPuvaOG3NUL6fFdSctb5IUFGJP1KSW5JF3w7ZpywbSk61GrQfoAqeLL6SG
	xtZqDmBMG9NoMHuAAlZQITjpqAuN6YxEcd3BQskfldHytu+ICu4EolH/eoOPyMjE6nQG
	djhNbnnHRUov7v6SHT/hvx8FhX5Qes5cGJDtE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=iO60fgzOIIRPu3BwstsFx/80b0STiZfw6H663xgQCYm1kPZ6IMfGNH+NrNYULOwtIF
	p3IgSFVLqQR4Hhlp7y4dNG1LuzmabpEodsef/lG7K2w8dikEnBtbfLV8f6L608elQho9
	r0MLP5EVgJzOPpkjcoh9FBJx6niSK/jrneL6M=
Received: by 10.223.78.138 with SMTP id l10mr5272816fak.106.1300893601253;
	Wed, 23 Mar 2011 08:20:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Wed, 23 Mar 2011 08:19:31 -0700 (PDT)
In-Reply-To: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Mar 2011 08:19:31 -0700
Message-ID: <AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC] recipes-efl inside meta-oe or meta-efl next to meta-oe?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Mar 2011 15:22:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2011 at 4:49 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Hi,
>
> I'd like to import the EFL recipes Martin did from meta-shr into the meta=
-openembedded repo. Before I go bothering Martin about it, what would be th=
e best place to put them?
>
> Inside meta-oe:
>
> meta-openembedded/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-oe/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipes-efl

Can efl we layered directly on top of oe-core  ? i.e. without needing meta-=
oe
in that case its better to be an independent layer. otherwise I would say p=
ut
them under recipes-efl

>
> or next to it?
>
> meta-openembedded/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-oe/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-efl/
>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


