Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F07C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 09:39:09 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.124198.1683020339145643671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 02:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=ZyW0o52W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-2f55ffdbaedso2069240f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 02:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683020337; x=1685612337;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jjF7oD0krh224qnxxJZyWIE5OuZzGNrmlgl8nKkuhY=;
        b=ZyW0o52WGtucjKFoXIN0B+sj5dNNAwTHSIXAtxq4wgdpHk3+seVrJ4t69N3c0Zlyqk
         GJgaFRpeLn426+hMWQuqxc/IffoqjDgwWEc/AzNKojXBa6Q5hAfhzCI+KauaqG97VC6/
         gCUr7QQ8lng3Yqs+cUT3yHpKGH1HebSd3xLBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683020337; x=1685612337;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9jjF7oD0krh224qnxxJZyWIE5OuZzGNrmlgl8nKkuhY=;
        b=Qz0TyQQigqBe7UVM7q+sOUdq/l2zEl3zw0eu11mB4sX1/eA3U8QrWPzuHqmhXwRJx5
         2bEmcUOIHZTvPT0zKwYF93n13kUkEjJdYOcVL2P1yCL53mI15YnlbfwEpHVAL845Rxjf
         QUhwBPXOy4+sDHOUhLrd3fVulTbR6YFf/FxctjnXrzwCq++fZqBtwFW/StjvCjVQ+BIO
         0HR8XXTBqZ5n3OiQWmImNo8/q0bEVBZW2Hatb7ep77jXbHjOTUXJW25TvZBFXE0CjrRo
         x2z75+uq8O8ICx4kRTOlP3N+KEFZwFMYjXDpatQm11Yu9WNH/R7bSO1lwqZK44yxC6Ps
         o2MA==
X-Gm-Message-State: AC+VfDwp5U7hEMmscz4jp342nxvBWJP9nmgk4aaJLZhyuZfLNtprbMY3
	uJ+LN74xGwQgKVnAbcbGjpt1DQ==
X-Google-Smtp-Source: ACHHUZ7l5WTQYGW79wyAzeXGNsOR4vDNv281gB75N099tJu+zm0DrdxEZ3bWJj2bEZMEeyW6CzbuOQ==
X-Received: by 2002:adf:f70c:0:b0:304:a7ca:1052 with SMTP id r12-20020adff70c000000b00304a7ca1052mr11413776wrp.35.1683020337552;
        Tue, 02 May 2023 02:38:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cffc:b608:40fd:850d? ([2001:8b0:aba:5f3c:cffc:b608:40fd:850d])
        by smtp.gmail.com with ESMTPSA id z10-20020a5d654a000000b002f22c44e974sm30443831wrv.102.2023.05.02.02.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 02:38:57 -0700 (PDT)
Message-ID: <196a87eb15d96cd230dc737cdd724f1c592768bd.camel@linuxfoundation.org>
Subject: Re: [OE-core] update-alternatives.bbclass - is this a leftover from
 old override syntax?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Bergin <peter@berginkonsult.se>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 02 May 2023 10:38:56 +0100
In-Reply-To: <32f72c25-86e8-498f-c652-d7d4cebda807@berginkonsult.se>
References: <32f72c25-86e8-498f-c652-d7d4cebda807@berginkonsult.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 09:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180719

On Tue, 2023-05-02 at 11:14 +0200, Peter Bergin wrote:
> Hi,
>=20
> I stumbled on some code in update-alternatives.bbclass that I suspect is=
=20
> missed when we changed to new override syntax but I'm a bit unsure and=
=20
> would like some more eyes and comments on this. Doing debugging with=20
> logging I see that the class is fetching variables like=20
> 'ALTERNATIVE_${PN}' in the code at:
>=20
> https://git.yoctoproject.org/poky/tree/meta/classes-recipe/update-alterna=
tives.bbclass#n89
>=20
> I think a patch to correct things could be:
>=20
> diff --git a/meta/classes-recipe/update-alternatives.bbclass=20
> b/meta/classes-recipe/update-alternatives.bbclass
> index 36a7497fec..b153e1b297 100644
> --- a/meta/classes-recipe/update-alternatives.bbclass
> +++ b/meta/classes-recipe/update-alternatives.bbclass
> @@ -86,10 +86,10 @@ def gen_updatealternativesvardeps(d):
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0 for p in pkgs:
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for v in vars:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for f=
lag in sorted((d.getVarFlags("%s_%s" % (v,p)) or=20
> {}).keys()):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for f=
lag in sorted((d.getVarFlags("%s:%s" % (v,p)) or=20
> {}).keys()):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if flag =3D=3D "doc" or flag =3D=3D "vardeps" or f=
lag =3D=3D=20
> "vardepsexp":
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag,=
=20
> d.getVarFlag('%s_%s' % (v,p), flag, False)))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag,=
=20
> d.getVarFlag('%s:%s' % (v,p), flag, False)))
>=20
>  =C2=A0def ua_extend_depends(d):
>  =C2=A0=C2=A0=C2=A0=C2=A0 if not 'virtual/update-alternatives' in d.getVa=
r('PROVIDES'):
>=20
>=20
> This is just found by review and I can not find any failure or fault=20
> that is caused by this. That's why I'm trying to get some more eyes on=
=20
> this and see if someone can fully understand how this is connected. With=
=20
> the patch variable flags for ALTERNATIVES:${PN} is fetched instead which=
=20
> should be more up to date with what we have in recipe meta data.
>=20
> Is this something to send a patch for to fix old override syntax?
>=20
> If yes on the first question; as we haven't found any issues with the=20
> old code is it still needed?

It does look like a bug to me. The code is setting up variable
dependencies so it means the task hashes might not be accurately
capturing all information, meaning things might not rebuild when they
should. It will be a bug, just not one anyone has spotted :/.

We should fix it, can you send a patch please?

Cheers,

Richard


