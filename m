Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web12.11478.1605634438056303551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 09:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tC4e/W87;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id r5so4204134vsp.7
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 09:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X5nf7rn+RT24p7hpcSDAMiL3BTu+sJMZ8w+4DtGUwS8=;
        b=tC4e/W87WoAlrdA1buT1ZxMP7k8LhR2Pc7eWPsFTD8B2168iVW4n+xT2r6b346uM/w
         hRWLoMbg9meykXd2yhMs02w0OG49/oPYJQFMB5N1imQyOYXJDkgHmDl1LMJpLHH0MIj2
         dU9CR+ziHhyj7NlzCg8efxqFbVBLkYFm0c0HyST7Bkl9HRzFHKPnOrjBOFuFMlbrBSZt
         g3yXfggqHEBPlqAWQBo80o7VfubHBcxBx9h3HO4rV6FHEa2OTfjMPtrwiTRS6bPRvwH4
         pZ3Tn6HTg7oWEFWvWqvsEnzN63pfMSaCOsje6Q3CgRyHVizMg8eyT7eUBlKzWI2vaOD2
         svyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X5nf7rn+RT24p7hpcSDAMiL3BTu+sJMZ8w+4DtGUwS8=;
        b=mCgmTBs6sm/A9qTRUcOql1PM5tFSl2xF5OtLO9DK84a62lLdkpPVIbfoOQlHHck+7l
         7+j8AxwZu6trhSLvoiS5DujJRPZFBHpLTusVkvj5kqrPpnOlRdhuZ8K+EqvMCrLW5SLS
         /AtThoKwNntHYPmeFkjeZD1+rAzKbIR6pPK8qPPcahosw34jBxSfUBvaSaQ76eVTpGXc
         lQC120b9JFmJ5y2p819nvvMJnM5fBb52VE/4HhW4rf3ooYfmgXoUontq2FQMNgwwh2eS
         fOyxnek1wulNV/TxJ7u/cONU4nM/+UaPERK0e/Q9vy118ASBylhYOygEfOkZzHQwcz6d
         WOkQ==
X-Gm-Message-State: AOAM531NhRG4AdSOhKmvf1+V8IZ38R4+hLxCTvz/SeGbi5PbtXMlvbbk
	T5moc0bDKCcFDyOCG354ki9aVLRK8RAoIzYGSwU=
X-Google-Smtp-Source: ABdhPJz4uSpfg3XONISOE+VXyhLPVWdXGHX+Ek+YGvOHntn+gdysI9QtDSueat41ZnHkLrVQNGY0Di/8cfAaNPeaiys=
X-Received: by 2002:a67:e3b1:: with SMTP id j17mr491935vsm.51.1605634437215;
 Tue, 17 Nov 2020 09:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20201117065508.1575532-1-raj.khem@gmail.com> <CANNYZj-mVEE0vD8tpJQTPvA_+0Ny7JNk0co97xU5gs+U=PbUOg@mail.gmail.com>
 <CA+chaQcyh_i92pMt32-iiehDsxr1TyhF5pNKiRQstwPz7UVArQ@mail.gmail.com>
 <CANNYZj-SwsznTXvooSHeVijaUPVPgBBN_gFfKednZCe-OGcdow@mail.gmail.com> <CAMKF1sqzEw8sAhzsUvPz6rB1OR=i8Cg7-2WUtpjW8tmS3HGF_Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqzEw8sAhzsUvPz6rB1OR=i8Cg7-2WUtpjW8tmS3HGF_Q@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 17 Nov 2020 18:33:45 +0100
Message-ID: <CANNYZj_Eu38-cpsb767mdgqLn6SEXjdfiJKdQheRWuZv47FYAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] distutils3-base.bbclass: Inherit python3targetconfig only for target recipes
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000044f9ad05b450e64e"

--00000000000044f9ad05b450e64e
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2020 at 16:41, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Nov 17, 2020 at 1:19 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Yes - and if python3-scons-native is the only such recipe we can find, I
> think it's better to merge the recipe with the target one.
> >
> python3-scons-native is just a manifestation of a larger problem which
> is a regression and this suggestion compounds the problem by setting
> an unequal rule where non-python packages can
> have a native-recipe and recipe but python ones can not, therefore we
> need to fix this properly in core classes instead.
>

If non-python native-only recipes inherit something that DEPENDS on a
target item, they will have the exact same problem. This is what needs
fixing - but not by special-casing DEPENDS in every class where it happens,
or might happen.

I'd rather convert all native-only recipes to target ones + BBCLASSEXTEND,
so it works the same way everywhere, and minimizes surprises.

Alex

--00000000000044f9ad05b450e64e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 17 Nov 2020 at 16:41, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Tue, Nov 17, 2020 at 1:19 AM Alexander Kanav=
in<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Yes - and if python3-scons-native is the only such recipe we can find,=
 I think it&#39;s better to merge the recipe with the target one.<br>
&gt;<br>
python3-scons-native is just a manifestation of a larger problem which<br>
is a regression and this suggestion compounds the problem by setting<br>
an unequal rule where non-python packages can<br>
have a native-recipe and recipe but python ones can not, therefore we<br>
need to fix this properly in core classes instead.<br></blockquote><div><di=
v class=3D"gmail_quote"><div><br></div>If non-python native-only recipes in=
herit something that DEPENDS on a target item, they will have the exact sam=
e problem. This is what needs fixing - but not by special-casing DEPENDS in=
 every class where it happens, or might happen.</div></div><div><br>I&#39;d=
 rather convert all native-only recipes to target ones + BBCLASSEXTEND, so =
it works the same way everywhere, and minimizes surprises.<br></div><div><b=
r></div><div>Alex<br></div><div>=C2=A0</div></div></div>

--00000000000044f9ad05b450e64e--
