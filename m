Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55783.1795447056698419551
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 07:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dbO/SIun;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so35619975e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 07:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795447055; x=1796051855; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hu6ItnStNHWHg3QyFlfWzx8raKoBL+EU8zYZQAgZsLQ=;
        b=dbO/SIunq8LdTk8n8jkTN/NHJMbxI5N2wArFTbarSQeAVSjAVvAeQ93IiRCtS4xlv8
         TkBhvHIpbP8KeL4mVuh/q4Tkw6S69vPrW0/OLsYXCT4hW2HTHzJrLRDqBXY9atcDweP0
         vqDcCbpUwC7Crl9gLjDBAtaK3HaFNnr77S4lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447055; x=1796051855;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hu6ItnStNHWHg3QyFlfWzx8raKoBL+EU8zYZQAgZsLQ=;
        b=KJa9d+JqXNDK6rO+ylMvymT8ns5+13daTTdwVblTdoPXvCRbu2UAj+ThmOtjM3qzF4
         u5iUhmpP2+0OTz4oXmX4Iem9hgNpm4xK8pjgusMQefEISyrNtP54TyeeS+SZD6XH5jGq
         ONEIQxJz94Kdg59c+R5y1IuK/nqtVAfcZiwr3reftLiYxR+XSpPYecXaulxs0x6hl18S
         005rKE1GBSUhC/wle+4cm0udxN5ZRE+xewz4fKBMpSDfePBHx9pRMZAo7DscoQIGHxpW
         UocT885viV8XquE8okUIcjVpu3nV11SXHvEDXavpKo6RGEnSU7/w8iZw/OyqMSdERxNr
         UamA==
X-Forwarded-Encrypted: i=1; AL+hErHj02k0FXCGGhSriSbI9T8HdefhfsGBP79iO62dnZLmYsAbyFEeSZMUhWNbbjLPPEKuElJggY2WibEg8qZW2jiF3A==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9agwurFmMKmDmEYZlV0honD/te23sse37DISfwaLUxjeQ/7SXg
	3+/h+E06VZHaeGKDQGvchu8eDY8jIyHFoiADCyrImBZ3OXerEtY9Mk+28sWgcL13CJI=
X-Gm-Gg: AZFdTZciIhONc+Lx3RGG+wov5BnCI7NinptT/7IiixULJMESLKqYFtlPcgCnSBro51U
	B8DWgnJECxjooqyI4ClRhzLxuwCu1xvTxLHRj00p5rgFKpVTzFxnKeJxL3s0KIgbWaQV5do1J0N
	8oDwfKj+JC2to+gpDSQAthGdOFe6ut6r3iBfT7H31D3d732ShoyPGNvM1We9NN3LPC3Fbo+pPzh
	BNufSIRI7D40EP+4394BNLc11+azi7ldxK73s2uuJQaCYSDz8lUIfILGOUiG23EKg5+OnLngpL5
	OPcO6duMfb5jQGuF8QGmsa33OrVVFcJTutelDA4RJVgIIb/dgllXTIsh6/R+RjOqj3qCfYlV9j0
	D7rOYJ86LfTBdSXz802/V5SZxTBx+grq88OmVu+2Kvjpq19RdIYaYSi2+AFXB72zkeFEpezdZHg
	xfPaHFz/PyOxKA86m9ky6ZC5BrLKdLMPzb2ayg7Y0e/IdERrXFtf8QlcjnTVt2axfuffNyUStEo
	dhtSaLi5BY7E8uigne8JiwOHL4VckZCbm25DibYq39A1nyq6AarZvnZ0Ezj3gJ8EWZVvwpRTxBD
	OyGCBQvKasMtGjPxGbK12c/+dsQKm7/UkZG4T1Z2dK0FcJiRZP+88lyoIcI+pmCCWw3exfxhwJd
	mQSFSFyTMuJoGSWdCRw==
X-Received: by 2002:a05:600c:674b:b0:4bb:6847:791f with SMTP id 5b1f17b1804b1-4bb8880f267mr236574695e9.7.1795447054686;
        Mon, 23 Nov 2026 07:17:34 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:dfb4:14bb:eea0:b8da? ([2001:8b0:aba:5f3c:dfb4:14bb:eea0:b8da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm513439915e9.11.2026.11.23.07.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:17:33 -0800 (PST)
Message-ID: <aff6acd72c8b1091f168c50e258e46492418012f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] staging: allow special handling of
 initial-recipes also for native
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?J=F6rg?= Vehlow <joerg.vehlow@emlix.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2026 15:17:33 +0000
In-Reply-To: <75f4cab0-7f18-4a44-8ea6-3ec4bffbc38f@emlix.com>
References: <20261119055929.3286725-1-joerg.vehlow@emlix.com>
	 <a16193f4de16a23bd5f89ec3ece8ee96de8a8ffa.camel@linuxfoundation.org>
	 <dc59b7a4-34c2-43e8-a22a-21737b3eade4@emlix.com>
	 <31494e4081f6b926ca92176156c33d1ac36f62b0.camel@linuxfoundation.org>
	 <75f4cab0-7f18-4a44-8ea6-3ec4bffbc38f@emlix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 15:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250923

On Mon, 2026-11-23 at 13:08 +0100, J=C3=B6rg Vehlow wrote:
> On 23.11.2026 12:52, Richard Purdie wrote:
> > Can you fix the commit message please and perhaps put more of this
> > detail in there?
> >=20
> > It is a bit of a red flag when the commit message doesn't really match
> > what the code does, it also can cause problems in the future when
> > people look back at why something was done.
> I totally agree with you here, but fail to see where the mismatch is.
> The commit message states that the special handling for initial is also=
=20
> applied to initial-native. (ok maybe the verb allow is not the right one)

Firstly, remove the go and rust mentions as those are in core and don't
need this.

Secondly, mention you have an external ada implementation and that
needs a native initial. Saying what is unique about ada to need this
might also help.

I don't need to have seen it, I just want it clear this is something
external to core and relatively unavoidable.

> > The other question this leads to, is whether this is a complete fix or
> > are there other changes needed to make "initial" support work better?
> This is the only fix that was required to oe-core that was required to=
=20
> make bitbake exclude these initial packages from the esdk.

Ok, you could also mention that in the commit message since it stop me
worrying there were more patches coming once this was accepted.

> > I really want to see the complete picture of how this is working before
> > we commit to supporting it.
>
> I get that, but currently I cannot provide the recipes, they are loosely=
=20
> based in meta-adacore, but instead of using a prebuilt gprbuild they=20
> build gprbuild in a two step process. Maybe that is what we can focus on=
=20
> and I could try to upload a version of meta-adacore with these recipes=
=20
> for you if you'd like to understand the use case.
>=20
> But essentially: gprbuild is built in a two step process, first it is
> build using gnat only (gprbuild-initial-native) and then it is built=20
> again using the first version as the build tool. Since gprbuild is a=20
> build tool (comparable to cmake), it must be a native recipe. The=20
> nativesdk variant and the target variant can then be built from the=20
> "normal" gprbuild-native.
> But gprbuild-initial-native is never needed in the esdk and it uses the=
=20
> same paths as gprbuild-native (just for simplicity) and so it has=20
> collisions, if both are installed at the same time.
> Similar collisions would happen, if libgcc-initial and libgcc were=20
> installed at the same time - I guess that is the reason why the initial=
=20
> recipes were excluded from the esdk.
> Since the mechanism already exists and is simply not applied for=20
> initial-native, I figured this is a "bug" in oe, that could be fixed=20
> without too much background or explaining:
>=20
> Currently target and nativesdk packages, that end in -initial are not
> installed into the esdk, but native packages are, that feels like an=20
> inconsistency, that is fixed by this patch. There is not really a lot
> more to it.

That is fine, by "complete picture", I really just need to know if
there are more changes needed and rough idea of why we've not needed
this anywhere else.

Thanks!

Cheers,

Richard
