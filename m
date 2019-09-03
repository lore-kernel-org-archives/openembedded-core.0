Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
	[209.85.217.53])
	by mail.openembedded.org (Postfix) with ESMTP id 22BD76010B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 15:46:11 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id m22so3058926vsl.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 08:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=jwkIT8KjjXsK0xPihPUNjdGb+vnsl2nBV2wbeMl3/nA=;
	b=hq4/ZypI7HiEMSBqjS2NvBiTmXzbbaV6ToeqK8oPK3OoENUtN70OwvTfSH4foOKjGE
	/TVaBa6vskiddPieFTx3Ke/uCdq2o6uA8eF7Io+VOE+otE+ZE+a0HPDFvcGzoBu95sNs
	Er//vLrsiVJ0/YS4JdQq3ozrdwwp3sR+2PJ9FEQMhmywe3TBkrQKANa6j6iEdYAe8Ii1
	Ml0fswRSZN8ItM9ezq2IoIKt/ezCgG+Fh3qSwapoykxkHC7udw6gK+F717TadKwJv6BS
	KN5HDaiYhhzMGHIa9ksxJBHu16FNqmFWksuef5s75qrQTOyu0yJkIY264X80ESFhjP1w
	+Wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=jwkIT8KjjXsK0xPihPUNjdGb+vnsl2nBV2wbeMl3/nA=;
	b=CLfNfND1Twfk2NS1o3d5tsqmuw0qmSI5atXrNxa2ACXUyBS0ilI2mcnDjh6in+TzdS
	/8VyJoQZEI4p5cRPSWgOv7S17v28B/JtcnsG68oEaDgQEODsOpPH0b0eorm+1BMgrU+n
	XqfB3A1BsnlEjSpvOmJGDQd3qRJCOb0/b0foqXGYmfqWnrrWNoNdUHlHV7GehHF2F42m
	MjVPEaRdiZIdNUWgclLOxf+LESu24ABnPArjoCEjn3uWh+9dlchlFQHBNFJIVZDDCscL
	4UwzSBqah9dAJqJXMy/IN7i19KP5/Hj59m3sh0PYe5QJkHucvMBODYSC11DoA6tXH98j
	fm4A==
X-Gm-Message-State: APjAAAXftAHd5FdWLXomXxmrie1Cphj0abqKf454cgAvdJuT12Jf6M2D
	utYsbRqm5h/a94Bpy0nzvTt5KTmxqryvJzUtfdsIPN/P
X-Google-Smtp-Source: APXvYqw1apaPj64I68pOq4HpUVh4fdT3UNO1PjfJT9kL9wH3r2At7ce3Y8SaP5zG/e/rqiw1qKbyhmhfgvIh2knS0kI=
X-Received: by 2002:a67:2c43:: with SMTP id s64mr8850352vss.94.1567525572823; 
	Tue, 03 Sep 2019 08:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190903152942.69625-1-alex.kanavin@gmail.com>
In-Reply-To: <20190903152942.69625-1-alex.kanavin@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Sep 2019 17:46:01 +0200
Message-ID: <CANNYZj8z_3qhvAsvC8j+kMRbb-cTssHHdCZo7Q=hs+Ywt=LdBg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: add PRIVATE_LIBS_ALL
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
X-List-Received-Date: Tue, 03 Sep 2019 15:46:12 -0000
Content-Type: multipart/alternative; boundary="000000000000f1dd860591a7fcc8"

--000000000000f1dd860591a7fcc8
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Sep 2019 at 17:29, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> PRIVATE_LIBS is used to exclude 'private' libraries from getting added to
> automatic runtime dependency resolution. That variable has to list
> all libraries by name which becomes a maintenance issue if the list
> of such libraries frequently changes, or is very large.
>
> PRIVATE_LIBS_ALL allows declaring all libraries private, either
> for a specific target package (e.g. -ptest), or for all packages
> produced by a recipe.
>

Please discard this, we can use fnmatch.fnmatch(*filename*, *pattern*) to
simply allow wildcards in PRIVATE_LIBS. I will make another patch.

Alex

--000000000000f1dd860591a7fcc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 3 Sep 2019 at 17:29, Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">PRIVATE_LIBS is used to exclude &#39;private&#39;=
 libraries from getting added to<br>
automatic runtime dependency resolution. That variable has to list<br>
all libraries by name which becomes a maintenance issue if the list<br>
of such libraries frequently changes, or is very large.<br>
<br>
PRIVATE_LIBS_ALL allows declaring all libraries private, either<br>
for a specific target package (e.g. -ptest), or for all packages<br>
produced by a recipe.<br></blockquote><div><br></div><div>Please discard th=
is, we can use <code class=3D"gmail-descclassname">fnmatch.</code><code cla=
ss=3D"gmail-descname">fnmatch</code><span class=3D"gmail-sig-paren">(</span=
><em>filename</em>, <em>pattern</em><span class=3D"gmail-sig-paren">) to si=
mply allow wildcards in PRIVATE_LIBS. I will make another patch.<br></span>=
</div><div><span class=3D"gmail-sig-paren"><br></span></div><div><span clas=
s=3D"gmail-sig-paren">Alex<br></span> </div></div></div>

--000000000000f1dd860591a7fcc8--
