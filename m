Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id B2FA765D56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 11:50:56 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so98776wgg.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 04:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=ygsqCIlgVHwyHJfOmYkcUd/Su2Sooeac5lMzoKqOjLM=;
	b=FBpw7aDS1SJnJTtE8sDLWtuhRW59SuLBvUaHInZmf+lzIwbwUEd2ZlK/D9inGnQmxa
	NKjhkUv42TQpQ5h+4cIPg/lLJ5NYRk6/X61ySVlWkNV84NDs3KPk04sklAgRK2Z59eof
	IQ4SODStKvZJssi/XiZjhr9AxJ93tcwHfF4h1shNsF8UyO5B1511LXwCwTmoCYcgO5zT
	r1EtTBtXkZNBHEtEhXpmMCCOyevZSR6Dww4Q/n907oCmU77hmGvHn6UM0BYP9d8pcr+S
	SHwQOYRHKUcP4/1whwyIImd9MNqB5AjiuvNhb8euv52xQiNpPXToOdTZEPk45vkmLk3c
	+h0A==
X-Gm-Message-State: ALoCoQmxCH3Ar90u5pNIDvOxBRfMfNDljFeSouDe75r7cfkiy65jzThaepltnrNfMlwB8ol+ujw4
X-Received: by 10.194.184.101 with SMTP id et5mr36977696wjc.14.1409140257022; 
	Wed, 27 Aug 2014 04:50:57 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id fo19sm2238673wic.1.2014.08.27.04.50.55
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Aug 2014 04:50:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <483e2f9eb1085db0958bb1ef9184814766bbd214.1409007366.git.chris_larson@mentor.com>
Date: Wed, 27 Aug 2014 13:50:52 +0200
Message-Id: <3544B17F-252E-44D3-B070-863D3613B14A@dominion.thruhere.net>
References: <cover.1409007366.git.chris_larson@mentor.com>
	<483e2f9eb1085db0958bb1ef9184814766bbd214.1409007366.git.chris_larson@mentor.com>
To: Christopher Larson <kergoth@gmail.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 1/3] sanity: handle both \n and \\n in mirror vars
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
X-List-Received-Date: Wed, 27 Aug 2014 11:50:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 aug. 2014, om 00:57 heeft Christopher Larson <kergoth@gmail.com> =
het volgende geschreven:

> From: Christopher Larson <chris_larson@mentor.com>
>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>

Tested-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> meta/classes/sanity.bbclass | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index dbcc26b..7cfc4be 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -759,7 +759,7 @@ def check_sanity_everybuild(status, d):
>         'git://', 'gitsm://', 'hg://', 'osc://', 'p4://', 'svk://', =
'svn://', \
>         'bzr://', 'cvs://']
>     for mir_type in mir_types:
> -        mirros =3D (d.getVar(mir_type, True) or '').split('\\n')
> +        mirros =3D (d.getVar(mir_type, True) or '').replace('\\n', =
'\n').split('\n')
>         for mir in mirros:
>             mir_list =3D mir.split()
>             # Should be two members.
> --=20
> 1.8.3.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


