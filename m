Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0B47F7BD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:33:00 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id z3so1769487qvn.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 09:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cDrEKB4O4CVglFC+fZxkMxbi0BmGrz4rW/bcp1JO3eQ=;
	b=M7xtJrLmCQBE8QLDNYhn21gRlfPeLrpXE2Hrkpw3LSN0mhzy+p0RU43Kt6ITupyh2t
	spP/+gWwy0x1lEnyMANkUTYWzikFdFYIDMi76gCWeWnjUDdLe1Ar21oV8gRiF+iS2CB9
	n/3RdgOiO8hKaJy424SRBQYd5XO9Dqq+S0DYQFS1OIg21ZfkPrhap6M2mW8g1imkeG/t
	bPFkNneapyNGmmg5FOaqxdC2rt0h9IshEgPeCjET0TSYr+MnCXdJoxEwFXUZR+mCg0LJ
	BE6yKnFjyjXucye/BN3NwDEJ+TCRv/n0Td523/ofccLLqmyVaFN7l9mCZ4YRykZqbz15
	73qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cDrEKB4O4CVglFC+fZxkMxbi0BmGrz4rW/bcp1JO3eQ=;
	b=EK7YPzsd4lN+doEwstBXbvpZbb5TXfLDicUEHJqb8MoDE5jXdDMW7bzNjZhTRuVufI
	8K6h17PLYsxSYx5mUh3y+FeYQLF3sHRk2YmqdY33mg0+Y82eqyvcxUnZoO+bCD0es3E/
	fiQgIeLsub0u6RXrbX6L98FHOW1mJabMpi8DMHQb4Zpby5RNMuN7yaI0Jv5BSohUD49B
	vaF1Ux+Jz7u6LpzPUQxj5myW8cvWFA4ArSEAaawdL8670ccS2V4C/VjErObSXOsUTPUK
	Q0LzFbh9cvRG+dUm2sNC/hMyYIAEddru/HQP7tJbh4iGidFLmb0qYS/IFmJTKnfa3e36
	56hQ==
X-Gm-Message-State: APjAAAWie0srXChqoIr+EajxGfZ/QGpMHZEJOXQqdoa8c/leuNJTgvRS
	WkZdsQb6PyaRuqvfCv1PkqaTSC2a/QXwz5lWul0=
X-Google-Smtp-Source: APXvYqwbiCHwRJxr7mKX/SQO6vUaqHE5DXYcqHDLwJtJbxG0sEVnsbRQT/Xkazcm47Bfcq9nUR+nTmwfJbWT+13x1M4=
X-Received: by 2002:a0c:8605:: with SMTP id p5mr23043096qva.109.1576431180854; 
	Sun, 15 Dec 2019 09:33:00 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-7-alex.kanavin@gmail.com>
	<CAMKF1spXie5SDtsJj6R=6hAUjYo8kBTmyj+SfW4rYU+1cWUtig@mail.gmail.com>
	<CANNYZj_k4NmmSAp+r80Ss+jgsd22hYcxRSySqYn7Yby8PCrDJw@mail.gmail.com>
	<CAMKF1sof2JwFMX=kHVaup_-LA3UjsqrU5iGXZymR5TOzGik1ZA@mail.gmail.com>
	<CANNYZj_ZaJ-prapQf6adS6Adp4CnF2X4TG3HPDonivPj_QAnrA@mail.gmail.com>
In-Reply-To: <CANNYZj_ZaJ-prapQf6adS6Adp4CnF2X4TG3HPDonivPj_QAnrA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Dec 2019 09:32:50 -0800
Message-ID: <CAMKF1sp6a-hOuGazGtBj0mZQj9DpaM3iiC1Sbvw7Ah49vLLx9g@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/30] gstreamer1.0-python: add a patch to fix python 3.8 builds
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
X-List-Received-Date: Sun, 15 Dec 2019 17:33:00 -0000
Content-Type: multipart/alternative; boundary="0000000000008c3aef0599c17cf7"

--0000000000008c3aef0599c17cf7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 9:12 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Sun, 15 Dec 2019 at 18:06, Khem Raj <raj.khem@gmail.com> wrote:
>
>> This is expected; the patch should be merged together with 3.8 upgrade.
>>
>> I don=E2=80=99t think this patch is right though since this patch is cre=
ating
>> py3.8 dependency if you want to upstream something that should work with
>> all py3 I think
>>
>
> It's being discussed in the upstream submission ticket, and will be
> resolved; we can take the 3.8-specific fix meanwhile.
>

For better processing this series should be in three parts

1 Python 3.8 updates
2 gettext updates
3 rest of them

I have filtered it into roughly these and currently staged in yoe/mut just
the third part which i think can be applied with out much problem

For 1 and 2 there are breakages for many packages
And it would be better to identify them and let community know of and seek
help


> Alex
>

--0000000000008c3aef0599c17cf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Dec 15, 2019 at 9:12 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">O=
n Sun, 15 Dec 2019 at 18:06, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div>This is expected; the patch should be merged together with 3=
.8 upgrade.</div></div><div><div class=3D"gmail_quote"><div dir=3D"auto"><b=
r></div><div dir=3D"auto">I don=E2=80=99t think this patch is right though =
since this patch is creating py3.8 dependency if you want to upstream somet=
hing that should work with all py3 I think <br></div></div></div></blockquo=
te><div><br></div><div>It&#39;s being discussed in the upstream submission =
ticket, and will be resolved; we can take the 3.8-specific fix meanwhile.</=
div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">=
For better processing this series should be in three parts=C2=A0</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">1 Python 3.8 updates</div><div dir=
=3D"auto">2 gettext updates</div><div dir=3D"auto">3 rest of them</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">I have filtered it into roughly t=
hese and currently staged in yoe/mut just the third part which i think can =
be applied with out much problem</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">For 1 and 2 there are breakages for many packages</div><div dir=
=3D"auto">And it would be better to identify them and let community know of=
 and seek help</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div><br></div><=
div>Alex<br></div></div></div>
</blockquote></div></div>

--0000000000008c3aef0599c17cf7--
