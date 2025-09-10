Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC45CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 16:45:13 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.web11.23879.1757522706536549056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 09:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=auPPpCVH;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-60170e15cf6so3429282d50.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757522706; x=1758127506; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9/cgUIq4HT4XXD0Kloqb/nHu5CRd802q8h8JBxckVM=;
        b=auPPpCVHXNDki0ZoGan/BS2A9NSNHs7DSmMLtzf1IpnuT40tLJkxUvCROGuxG3/nfT
         HMY3D7e+yz453WDnaihgw2FroaxQD2oWlOzBgQuE80H1p6gIQK6ba1MygvrUzwAxoMIo
         qcQYybARteUmNDhMzfOoGepwfTq61q1Ukdt8sufjbtJ9o00Il/6nnWs0lHRXl87/qaOh
         egRmLDkjJje2naN5/FALz4EQGT8h0emKbNGnK/Oiy+uiyF65TOi1VKx3nWmRqjO7xXQh
         Xz8ex2uDCkMf6+k5vZHcE/ccvBBs6+eG6faK8ozEory101hgFtlUKzlaIMcCYC+4YbY0
         N2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757522706; x=1758127506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9/cgUIq4HT4XXD0Kloqb/nHu5CRd802q8h8JBxckVM=;
        b=edB2VTxcn6RHdkEGz/3EZ4GgosIzJqZ+RR/rLnHzpfvql8rHJxLfcG3OpeFztGi0H/
         arpp29em+fjicYEPMZot/qOwSVtNYalRpOIA6y4s8zuG6dSqwv9Lnx/W+WVIGaKvBr4G
         dqTQ99vza8hA1d1SFYSv9txaQQg+TzazrcWyR9KHdJduoM+pJSocoDyAp0eIAxpaCu9K
         CbKPFE3axfFqvbZIj0Qf8oEVoMasaM4e7XO/USN/oO0S9o0O01Hcn2L5/ZKpJLtQTvDo
         QwBB7hBypdJD5+LLcsk2bpNu2SjhxgJ4IJlZkOmwiOxYVpyrIHymjpVA/g+Vz6WwqcdO
         VVqA==
X-Gm-Message-State: AOJu0Yxrtmr6GLjDxCyb2CxZo9Q/gHXoZcFkhZGN+f9KMm+xFDxmOwIc
	a1oTmtXmKlHMk0+Jxm9XCrNzU00DZ1Ivo6XFpvWSvktZI5oV5zJhbjoztdg6Um2Sdl0VOatn78a
	hjVF34n61+9UWShdiOr7H9zHoaNsM/qM=
X-Gm-Gg: ASbGncsKbruUXegxXQ7enJnr9DgiJWMizme8iQaxY8mAJ2cmEfOPmHHUuHTlufjPtba
	dbUAaDK0XUF9kx7R3LVXS7rsK8H1JMjIFQnT1XfWelJma20Sjqjvf9OXSc/MNcWRmXGIB8iz/3B
	N/QGkFDLzdeBlj6otev5q9wSlCERLLfOEdHdVyxZpghWjVRiY8luUi4PK0MJFOZ1r2KRtwX44/c
	AtnfxWyUKbGzlg8rHR14KneJ7lowvQjQ6y6XZkXpz2I/vbQE+XWo35v1qc2dblPBvh/huoId/1o
	m+L7+OxN3vamVm7cAFgV7CEWO/eyQDGdyCdlkgvSU+7LPuFsJYrdGx8P7g==
X-Google-Smtp-Source: AGHT+IFtyGeKriOgTISGOeJ08UJBoh0Q6LbsUvRMdvjW1xgXXP/7TFn1l/0V6zJ5o5Zc95XncSpqZlnUxCaVVLzW+nk=
X-Received: by 2002:a05:690e:15c3:b0:60b:9396:2723 with SMTP id
 956f58d0204a3-61023ba2e3bmr10090871d50.12.1757522705381; Wed, 10 Sep 2025
 09:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <DS0PR11MB79014CF356CC7621C30E755AE00CA@DS0PR11MB7901.namprd11.prod.outlook.com>
 <CAMKF1spW9RueDyMXqj5oTqhfkq6csjPP7CaOc3Jwk2gx4V=Xyg@mail.gmail.com> <23dd8abf-716f-4f21-8375-1b0a102170fa@windriver.com>
In-Reply-To: <23dd8abf-716f-4f21-8375-1b0a102170fa@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Sep 2025 09:44:39 -0700
X-Gm-Features: Ac12FXwVapDMrxOih6y6TJu-Z08NM19mTRjhATPiryIx7kMalcFyveJhhM5dSgY
Message-ID: <CAMKF1spJqiAoYPjs0-Zd9RPeuTJw3O745cdXk+pPYScgp=OW=A@mail.gmail.com>
Subject: Re: Clang - Question on dropping D144541 clang patch in OE
To: Sunil Kumar Dora <sunilkumar.dora@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 16:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223230

On Wed, Sep 10, 2025 at 9:34=E2=80=AFAM Sunil Kumar Dora
<sunilkumar.dora@windriver.com> wrote:
>
>
> On 9/10/2025 9:56 PM, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Mon, Sep 8, 2025 at 7:45=E2=80=AFPM Dora, Sunil Kumar
> > <SunilKumar.Dora@windriver.com> wrote:
> >> Hi Khem,
> >>
> >> I'm cleaning up our clang patches in OE and I am looking at the one we=
 have from
> >> D144514 (The one that adds #undef TIMEBITS in sanitizer_platform.h).
> >>
> >> I see you already got the main fix for that TIMEBITS=3D64 error commit=
ted LLVM upstream
> >> in D140812( Commit - 26800a2) for Linux in sanitizer_platform_limits_p=
osix.cpp.
> >>
> >> In our builds, I haven't seen any issues without the D144514 patch. Si=
nce we're only building
> >> for Linux, can we just drop the D144514 patch and rely on your upstrea=
m Linux fix?
> >>
> >> My Question is: did D144514 serve a broader purpose for other OSes tha=
t we might still
> >> need to account for? Is there a specific arch or multilib config you'd=
 recommend
> >> I test on to be 100% confident we can drop this?
> >>
> > It looks like we can drop it. But try building  compiler-rt-sanitizers
> > for arm32 ?
> > to ensure.
>
> Yes, I built compiler-rt-sanitizers for the arm32 architecture, and the
> build succeeded without this patch. Looks safe to drop.
>

In that case yes

> Thanks,
> Sunil
>
> >
> >> Thank you.
> >>
> >> Regards,
> >> Sunil Dora
> >>

