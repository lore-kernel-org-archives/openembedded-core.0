Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCD3C3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 13:30:50 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.7315.1722951047910210053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 06:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pk4fjNb1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.180, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so6435331fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 06:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722951046; x=1723555846; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X/okwiEDnDss36c+uT5BmQoXE5zswmegNrZjSrcF4F0=;
        b=Pk4fjNb1e9oFZPmVL+Avpv7lqm5Jt3FwSZWqgAc11zK7CO7VTQ1U6OZIJBaHfUrDeR
         DvyGKoCOYisThnf8IwjPc+7IC2Wy6iTOz+75KOFJPDtLL9pIeWWD8x/HI3U0DbTaykVX
         06DsEvVSsWJeQ0YXm7Th+q8CF5fBUwTOUxBL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722951046; x=1723555846;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/okwiEDnDss36c+uT5BmQoXE5zswmegNrZjSrcF4F0=;
        b=aIAjLtKWRQ/VopgshiVfBhvzED0q9C9//WR7QEvzKoCpz1o/9xYSqe3rWMpx1UQ8CN
         5usgQyE6jEHBHnbIfL2c6gXJPLNgrT7n0I8xGeO8FKN4LiQzlPClXL8zeX4allyGG/9/
         FNi2DCSmAIpooUXvrIY9LVEJ9bF+huirrRfAHo3CroL8Vj1pKbxVFTjS6ly4b7b64oFx
         Vxo0F7yLJOYhMKcA2rckjW6Dkn3hp25E4QiHOKYmn27g/bzx2DzX/hm3VSh8jtV/S7B5
         Z42ulbtyer/8qbQ3fXH5m7yF2QMkIo80hR4R8LH8E9CzoB0BbP1l+WuQScMUkHhy2xHA
         7pmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCkX2V+ottvdZxYJVoI7SklQOYY78n8/bWHPo4ro0bYBhUsDlHg+WrFJrnLzx/tbK3nx+sk8oQpG0FUbcNekHDWA64Y7F1M4r4aOom/f6PvqNEFWsHAplR
X-Gm-Message-State: AOJu0YxpCmaT7bkpTACoW3BxyC3W2uZnQbvPdv1ZYsADa+7sxtvinOni
	kBrcXTRKvIOCMyZvKaCoDIHRDekzfnFhyjF3Gxp+Bfws/Nt7heyn9IgcrF/YVSc=
X-Google-Smtp-Source: AGHT+IHgcMvvelYQ+SLsAloVmWaT7B5/axtx7Gm3rhTEc4cJ15OurGjWNUOJOAzPkCA/5NPPRzHjGQ==
X-Received: by 2002:a2e:9794:0:b0:2ef:284e:1d07 with SMTP id 38308e7fff4ca-2f15aa97d16mr112313151fa.13.1722951045704;
        Tue, 06 Aug 2024 06:30:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeae:cd04:92c6:bd93? ([2001:8b0:aba:5f3c:aeae:cd04:92c6:bd93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e7cbd2sm183449335e9.38.2024.08.06.06.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 06:30:45 -0700 (PDT)
Message-ID: <05b3ebd0d57b1919cb162ea5f42310adfd94076d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3 5/5] cve-extra-exclusions.inc: add
 deprecation notice
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Marta Rybczynska
	 <marta.rybczynska@syslinbit.com>
Date: Tue, 06 Aug 2024 14:30:44 +0100
In-Reply-To: <CAApg2=Rxy8G1BL6vLTshD7CPARkvoC4+C_sK2Q1QjtssH0e0cA@mail.gmail.com>
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
	 <20240724152530.25856-5-marta.rybczynska@syslinbit.com>
	 <44B6F27C-F828-46B0-8DCB-FCE37FB8DC9D@arm.com>
	 <CAApg2=S_2uiyd=g2Zn6RQBvBxDc-iRKFSZmpWBZWJx1M0RjYgQ@mail.gmail.com>
	 <606d5852aec8e7bb29350cfb27aa3df8f706dc72.camel@linuxfoundation.org>
	 <CAApg2=QPTmm6Y-r-oWS2PfP-DZ-t1NRfm7rKqcBnuFmkXRdC2w@mail.gmail.com>
	 <9d33f694d08c91ef31c49c0c549f17d272358476.camel@linuxfoundation.org>
	 <CAApg2=Rxy8G1BL6vLTshD7CPARkvoC4+C_sK2Q1QjtssH0e0cA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 13:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203025

On Tue, 2024-08-06 at 15:16 +0200, Marta Rybczynska wrote:
> On Thu, Aug 1, 2024 at 4:08=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2024-08-01 at 15:58 +0200, Marta Rybczynska wrote:
> > > > Difficult, yes, impossible, no.
> > > >=20
> > > > Surely we know which recipes a given CVE apply to?
> > >=20
> > > Without having the CVE data at the same time, no.
> >=20
> > I thought we had the CVE data?
>=20
> When we do vex only, we have the CVE data only in the external tool.
> The file that comes out from the build contains additional entries.
> We can filter them out, but only in the tool.

Since we're using CVE entries with CVE numbering, I think it is ok if
even in the vex path, we perform some evaluation to see if a given
CVE_STATUS applies to a given recipe, particularly if we're exporting
data specific to that recipe.

The code change in question doesn't just change VEX but the general CVE
output too.


> However, if we filter out in the tool (with a rule like: if this CVE
> does not apply to the package, remove it), we remove the feature of
> the VEX of being able to specify that your package is not affected by
> a widely known vulnerability. For example, you can say "I'm not
> affected by log4shell because I do not include log4j". This is a
> feature that has its use, it avoids responding to multiple
> procurement questions, where they all want the same information.
> You just say it once, in the VEX.

By that argument, you could export every CVE possible against every
recipe :/.

>=20
> I think we need to distinguish between two cases:
> - the data is wrong and we fix it (and we're sure of the fix) -
> typically a CPE fix
> - the resolution depends on a configuration, typically "not-
> applicable-config" - if someone adds a bbappend to the recipe, they
> MUST review impact on all related vulnerabilities
> - we make an assumption. All of "upstream-wontfix" are of this
> category. The YP user MUST make their own assessment here.

The user needs to make an assessment, sure, but are we then going to
force the user to bbappend every recipe with their assessment?

> > > If we keep the .inc file, I think the most correct way would be
> > > to add a field marking
> > > =C2=A0which recipe it should be applied to.=20
> > >=20
> > > What do you think?
> >=20
> > How do we mark up a CVE as applying to gcc-cross-*/gcc-cross-
> > canadian-
> > */gcc-runtime/libgcc and so on?
>=20
> We do not have any gcc entries in cve-extra-exclusions.

No, but we, or a downstream user might need to do this.

> > How do we convert "bash" to "nativesdk-bash" and "bash-native"?
>=20
> We do not have anything related to bash either.

Today, no. Tomorrow, or in some other product with a different
configuration.

> What is in there in cve-extra-exclusions are mostly very old CVEs,
> the biggest part belonging to bdb.
> Kernel ones can go to kernel includes etc.
>=20
> With the directions the CVE programme is going, I do not *expect* a
> need for new entries.

However, this mechanism is also the mechanism someone building a
product and performing their own assessments may want to use.

What your patches do is force all of that into the end tooling and out
of the metadata and make the metadata completely impractical to do it
with. That simply isn't acceptable.

> > There are ways we could do such markup but I don't think it is
> > going to
> > work well.=C2=A0
> >=20
> > I guess the key question is what we're trying to achieve and where
> > we're expecting the data to be processed?
> >=20
> > Could we write a common exclusion file out once as part of the CVE
> > fetch recipe and avoid putting it into the individual recipe
> > output?
> >=20
>=20
>=20
> Yes, we can do that and additionally allow each vendor to have their
> own file, with their own assessment. "upstream-wontfix" can be mapped
> to "code-not-reached" or similar, when confirmed this is not
> explotable.

You mean like an .inc file?

> Autobuilder can have its own removing entries we don't want to see on
> CVE list (if we really think it is a good idea).

This is exactly what the file you want to deprecate does. I agreed to
put it in the public metadata where people could see what we were doing
and why, so they could them make their own assessment of what we've
done.

I'm afraid I am adamant we cannot drop support for this.

(I am also find with reducing the entries in that file, I just think we
can't entirely remove support for the capability)

Cheers,

Richard

