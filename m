Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
 by mx.groups.io with SMTP id smtpd.web12.174.1588968728130500685
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 13:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kr5HfDl+;
 spf=pass (domain: gmail.com, ip: 209.85.221.195, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f195.google.com with SMTP id k25so762083vkn.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2020 13:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4+skcV4cxKwdjC1QvfcNnuyvR/Yuz0bODrGM/HwdyvY=;
        b=Kr5HfDl+CiljvYdD4tOeLUhXt2ZAANYu8LEqDu4IR4vG0VH+OdPYOpxWb5L+cg78kT
         LOHFOl9PKj/Wxsuytlt0obC3MWl6pdmsDeOfHxlqogZT884EEw9tIViSPd8RgGwLkiA3
         iaIKCwH19nJ1Z3KYAt6eccguwChJDdBiQn5Djw72cE8pdNLRpi1gFOCdEGHMzyHi2jfJ
         ci0HKWAKgrTCWmrVPc2s0n7bqP1ryDkt5DLSrWUbvl6l5oZEgf3ye7vKKeJFFKmfySmb
         P/abw7FCWbczZCPCd5+mzCnW/o4KhcY/mTwrvC2aJy9KKa57k+nWMdwvJCF51l6p4kg7
         DzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4+skcV4cxKwdjC1QvfcNnuyvR/Yuz0bODrGM/HwdyvY=;
        b=DccWw/Z36Eq9X+RKzuQxcBHReC4jYN0PH/+V7YgWod7eOCEEHwE9N5efnEgux4Pkhs
         5GMgm9PNe0AHW2PrZyjyXKcBf5Y4HQpf6lch00m7ISjBDyIdSpbKIqtyEWCMJKEFzB9C
         8XlkXaeV8/rpGTchOUPCVc+J/ng1GN6FgJC0eWoYOO9Nt277vANv3mFlc2J8xcOdlCID
         11QCCeH74PSj93A41ZdYwwKo5h2duiyvicCzKInf1fOoP4Wbmq/aK5LkPM0RRB5DQJfC
         ZosiGsq2l+5NkU8xC/TVBubFaB7c6jD6EaNEeGjr1pE/tnxKYUT5qWFE2m40b09ouc0o
         8M1A==
X-Gm-Message-State: AGi0PuarZq+ON+presSLW8DtHRpVgiBXe0l6zuo4jTsjsYzSKc6YdjHN
	NGdUgCdSUKvaDIEyoM7gIl3XZULVM6wDYHLEiKc=
X-Google-Smtp-Source: APiQypIdvAJmLioSkYnB9/WlYC4zWdLJN3Xl459DrFJXOxO+5gB1apvtDOi+uq96rID/IKey4pPRLJflDR7iAQ574Mo=
X-Received: by 2002:a1f:c643:: with SMTP id w64mr3809576vkf.0.1588968727282;
 Fri, 08 May 2020 13:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
 <20200505130133.24930-5-alex.kanavin@gmail.com> <CAJdd5Gb7RSYrDe7jCoD37376JmMt1ss-ZZmger5xMet2uBrYUA@mail.gmail.com>
In-Reply-To: <CAJdd5Gb7RSYrDe7jCoD37376JmMt1ss-ZZmger5xMet2uBrYUA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 8 May 2020 22:11:55 +0200
Message-ID: <CANNYZj9ZWzWgpHS_tzKvAKX5c8dYyM-71K=ka7e9d=mvdeYFXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] testsdkext/devtool: initialize the test component's git repo
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008c86a905a5289c4c"

--0000000000008c86a905a5289c4c
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 May 2020 at 21:14, Joshua Watt <jpewhacker@gmail.com> wrote:

> I recently sent a patch to set GIT_CEILING_DIRECTORIES when building,
> could we do something like that here also?
>

Yes, except my patch is already merged. It doesn't hurt to put two barriers
:)

Alex

--0000000000008c86a905a5289c4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 8 May 2020 at 21:14, Joshua Watt =
&lt;<a href=3D"mailto:jpewhacker@gmail.com">jpewhacker@gmail.com</a>&gt; wr=
ote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"auto">I recently sent a patch to set=C2=A0GIT_C=
EILING_DIRECTORIES when building, could we do something like that here also=
?</div></blockquote><div><br></div><div>Yes, except my patch is already mer=
ged. It doesn&#39;t hurt to put two barriers :)</div><div><br></div><div>Al=
ex<br></div></div></div>

--0000000000008c86a905a5289c4c--
