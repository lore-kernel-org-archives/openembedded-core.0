Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 233A17F275
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 08:27:16 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id a97so37392459uaa.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2019 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z4rMGqRqchrkrgYxR++YtcxqO9rhX4vmP2d38pf5d6k=;
	b=Wt6t+aJ/3LlUV+zHL2eX9nH41vVdaGJjtpN7qM4q0PBhrA81j/TXSY+d0KXMqP0CLY
	Kxo14SH7UpeLseQzKjyLlsx8NKIP/KjRKF/7ELH2YCkBVcD+tTvxl4k1iCtRrBPkgag5
	1LJFTjxCA0NX/jMGNUqhEen9iA2p0L9gn8iki5HZUCJmI5kvRz7Bruix+TBve31Ddnfr
	7S1vmIx1+bBFqywXobitXQCGBaIAlRo1jvGnrvmvlRYcdQ7qRHLQ0pJJuhN+4VCFmoLL
	Lo1wJsCm+6P6o23arrwZGLuKwnD5gz/Y0I3Cbc7qvZcuK/f+FqoYtwdlrqmFt9yydNKA
	0kGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z4rMGqRqchrkrgYxR++YtcxqO9rhX4vmP2d38pf5d6k=;
	b=UpkmvqWuC8j9HWpOomVL48L5kHyaivOIFeHijYjBJCscQc2eEESy3Pul2mERyHIscW
	WgH2dRuJiLb1DIVJcpluzGMGb7CWdVTRpJ4hfLPZx3u4RH7LOUNDCUo6JDKghpS7OGzJ
	NrK1NWsWkGEFOODYzkoFJvFRqrasCiiiWkcLNbLoG1ieYzbVvlebyNpJtEbxvkLz5MxD
	mxJayYHHxDpehwlnVagNd8BlhvwCQFl/2xgMrSUfJgKN3HXb6BX80n6hH1BuX8Rgz6FO
	M7rb3kHXe/N6WuQjhvpWmS54hPTRr84KoiBDaroNfts2QKg+OhcLMF+Mgv46sAcbnuKm
	wrLg==
X-Gm-Message-State: APjAAAWB9YciIQwcs2U6FEnzCQCvzCKstSNMnZwjWrBJLh9yofrsVxnx
	ZDm2CjvI1VD8XEareWHc5DfE8CoO4bx70K+cNvFmYay9
X-Google-Smtp-Source: APXvYqypWKsTEdK3/oGsM2JkfINFAghLkTsHm0orAHAClpNpGIo3ECGLoLAUswzQdmKI522AIxCrhW2Td6nnmeWdHAU=
X-Received: by 2002:ab0:e19:: with SMTP id g25mr11319374uak.71.1565339237928; 
	Fri, 09 Aug 2019 01:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <1549591052-12688-1-git-send-email-chandana.kalluri@xilinx.com>
	<3413405.x9v3DxCAyA@localhost.localdomain>
	<BYAPR02MB6005C04842C60A8C3A4DDF26B9710@BYAPR02MB6005.namprd02.prod.outlook.com>
	<BYAPR02MB6005A1297BC34875CB9623C0B9D70@BYAPR02MB6005.namprd02.prod.outlook.com>
	<CANNYZj9BTxaV4_2Tojp16ac5d+suXmaLXWEuCeAGzfFNMe0S2w@mail.gmail.com>
	<da705f5b-0584-f75f-2284-789027dda921@windriver.com>
In-Reply-To: <da705f5b-0584-f75f-2284-789027dda921@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Aug 2019 10:27:06 +0200
Message-ID: <CANNYZj-au_ktbod45UzCuXCg1zXHPx5pmd+82racnFL9yyDgYw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] standard.py: Provide an additional option for devtool reset
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
X-List-Received-Date: Fri, 09 Aug 2019 08:27:17 -0000
Content-Type: multipart/alternative; boundary="0000000000003ad294058faaf17a"

--0000000000003ad294058faaf17a
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Aug 2019 at 00:00, Mark Hatle <mark.hatle@windriver.com> wrote:

> May make sense to follow git as an example..
>
> devtool reset does what it already does..
>
> devtool reset --hard  also does the removal of the existing source.
>
> But I've seen too many people blow away in progress source code without
> meaning
> to.  Adding something like the --hard option would make it clear it's
> going to
> all go away.
>

It might not be a coincidence, but in many years of using git, I do not
remember finding 'git reset' useful even once, and I am still not sure what
it does exactly. But 'git reset --hard' I use all the time.

Alex

--0000000000003ad294058faaf17a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 9 Aug 2019 at 00:00, Mark Hatle &=
lt;<a href=3D"mailto:mark.hatle@windriver.com">mark.hatle@windriver.com</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">May make sense to follow git as an example..<br>
<br>
devtool reset does what it already does..<br>
<br>
devtool reset --hard=C2=A0 also does the removal of the existing source.<br=
>
<br>
But I&#39;ve seen too many people blow away in progress source code without=
 meaning<br>
to.=C2=A0 Adding something like the --hard option would make it clear it&#3=
9;s going to<br>
all go away.<br></blockquote><div><br></div><div>It might not be a coincide=
nce, but in many years of using git, I do not remember finding &#39;git res=
et&#39; useful even once, and I am still not sure what it does exactly. But=
 &#39;git reset --hard&#39; I use all the time.</div><div><br></div><div>Al=
ex<br></div></div></div>

--0000000000003ad294058faaf17a--
