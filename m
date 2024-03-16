Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A6EC54E58
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 00:19:00 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.8221.1710548333451583367
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 17:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BfJzu3yU;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: chuckwolber@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-366ac8bdd2cso755135ab.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710548332; x=1711153132; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nitYhCb38eKamq/N8pF6tpfPbcJJlhnWaV4YiwO5JTk=;
        b=BfJzu3yURj5muqJSqzNFsA98F/brzWifWQrGHP1HW392Zydph1OTZH+1A9syIT71sA
         QenXb70ekToGKmf3/kSwLZskiFFsPpK1MBlwPOOj74oQfai633Xf3nLxAjnmZqwW6S9C
         +Unb+p2fdksm+VjJc81YVLsLgOzCwe5cxKPnC4XImbA5mMiBPLg+KEoDUd0WhpjO8Vvw
         YYzVSPb/rvt0H7L62QPCsdMuEiBLqfJ5XRx5OOVoeXEO0wihnQk30CrwcA3LanG6ErCO
         8UHo2tfBt0g4eGWaWtioqUB8GTbQIekUnDMQ1YAEqZKYR9zQ8eV3GZ4q9BePfGEKMlvH
         HXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710548332; x=1711153132;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nitYhCb38eKamq/N8pF6tpfPbcJJlhnWaV4YiwO5JTk=;
        b=RgrORFggA3LQsa+vx8JMbvUmzxCxFAJh32rO2mV8y8zHsVk2audQ0J/U/sZvDcxPB0
         qZUP8Pa9Q4cJCqzm7qzdtBGgA664zO/kwCfDDAIin4TzRAdLlgQBLe/ti4vj9CIwTEj2
         hC81gLsn8MilRVYmHrPf8ORzDKqA6wB21j3NEhLFiI95CbJjl6vcmFY4JyiCEpaFgOyK
         Qd3FcQFWQEbdVhFYi3KZMslKcCP4Nef8FirfgIvmE+fSzaO32ga1Os7sbzEn0X8bYU9j
         H0gx0UncYhynRZeV+Na/27y53MiQ8rmt2imu0rjts+sxTUUtKIthcgF8MJ0htqYnOeZz
         PQrQ==
X-Gm-Message-State: AOJu0Yxaphp1oZsHf4G5wukkezrEv2Jdo+ZQ30uKxF3JPbLN1N93G4lY
	OGnlcK/lbCdzKcWUNswc5acFPgT9La3Y7oCuIrw9+8L+COu1tRvtl9fM9U7zf+CuvIlzkLTeq0J
	wogU58jW/Js/A57yCSv+DsdhpXgx0VI2G
X-Google-Smtp-Source: AGHT+IGFjzrcO706BqP5ENrCwfrpfKQ+DxprIp0WpZOM0i7327h0yeq9/G91eNg5b26B4caELg8Bx939/eT6Bek2TpU=
X-Received: by 2002:a92:d485:0:b0:365:e274:5e55 with SMTP id
 p5-20020a92d485000000b00365e2745e55mr5611630ilg.7.1710548332268; Fri, 15 Mar
 2024 17:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240228223949.1651046-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240228223949.1651046-1-richard.purdie@linuxfoundation.org>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Fri, 15 Mar 2024 17:18:41 -0700
Message-ID: <CAB=6tBQ8q_bPY29RsQBBk5LwttXqn0CE+HyaJ00whwBRRs+E_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mirrors: Switch llvm to use shallow cloning
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b756f80613bc1153"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Mar 2024 00:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197251

--000000000000b756f80613bc1153
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 2:39=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The llvm github repo appears to see a lot of churn on branches we're not
> interested in and is in general huge and unreliable to clone.
>
> Switch to shallow clones to improve the user experience.
>

This reminded me of something I recently observed in a kirkstone build.

I set the following in my local.conf:

BB_GENERATE_MIRROR_TARBALLS =3D "1"
BB_GENERATE_SHALLOW_TARBALLS =3D "1"
BB_GIT_SHALLOW =3D "1"

For the most part this worked as expected, but the llvm recipe ended up
with both a shallow
(157 MB) *AND* a full (6.4GB) git clone .tar.gz file in the downloads
directory.

It is always possible that I mixed something up, but I tried it twice,
being careful to start from a
completely empty build. Each time I was able to unpack the gitshallow and
git2 LLVM bundles
and convince myself that I was looking at the same thing when the
"release/13.x" branch was
checked out.

..Ch:W..

--=20
*"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire*

--000000000000b756f80613bc1153
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr">On Wed, Feb 28, 2024 at 2:39=E2=80=
=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; wrote:</div><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The llvm githu=
b repo appears to see a lot of churn on branches we&#39;re not<br>
interested in and is in general huge and unreliable to clone.<br>
<br>
Switch to shallow clones to improve the user experience.<br>
</blockquote></div><br></div><div>This reminded me of something I recently =
observed in a kirkstone build.<br><br></div><div>I set the following in my =
local.conf:</div><div><br></div><div>BB_GENERATE_MIRROR_TARBALLS =3D &quot;=
1&quot;<br></div><div>BB_GENERATE_SHALLOW_TARBALLS =3D &quot;1&quot;</div><=
div>BB_GIT_SHALLOW =3D &quot;1&quot;<br></div><div><br></div><div>For the m=
ost part this worked as expected, but the llvm recipe ended up with both a =
shallow</div><div>(157 MB) *AND* a full (6.4GB) git clone .tar.gz file in t=
he downloads directory.</div><div><br></div><div>It is always possible that=
 I mixed something up, but I tried it twice, being careful to start from a<=
/div><div>completely empty build. Each time I was able to unpack the gitsha=
llow and git2 LLVM bundles</div><div>and convince myself that I was looking=
 at the same thing when the &quot;release/13.x&quot; branch was</div><div>c=
hecked out.<br></div><div><br></div><div>..Ch:W..<br></div><div><br><span c=
lass=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div><b><span style=3D"font-family:monospace=
">&quot;Perfection must be reached by degrees; she requires the slow hand o=
f time.&quot; - Voltaire</span></b></div></div></div></div></div>

--000000000000b756f80613bc1153--

