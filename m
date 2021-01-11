Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.34700.1610375639276364591
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 06:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Esw9kbKD;
 spf=pass (domain: konsulko.com, ip: 209.85.161.48, mailfrom: paul.barker@konsulko.com)
Received: by mail-oo1-f48.google.com with SMTP id k7so4136532ooa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 06:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bVAqITBV1LSvGerOcx8lsfsIRkD6q/4gcMJlBZt+eqQ=;
        b=Esw9kbKDtFeHfvKA5D+8dNBpcOMMSg4raYeFIAInZ1xk95+UK3pHWvuYkqUzByqIxl
         CTDLrgAPYtANx0BoaRPloHyoM6Iq+dhJameJKKBf96/UlwuvUwTHo/Z9EB9d5BDZTZgX
         kEQP4mKJHs/PBICOcTVDGO+3nfAn8M3/Zkkt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bVAqITBV1LSvGerOcx8lsfsIRkD6q/4gcMJlBZt+eqQ=;
        b=OzhMHnV3ckuofjZzYrXXo2e4a4Dkp38q6qKcnNl4mXsnnWQgk331L+KDNi1c0jIIMK
         1gCQPmT+u5jEK8WexDcEbmwHrOwJkKhpMZTiXHtOYmdxJQ+VO/W5KIAQ2dM81pLAO8+G
         sWzeAk2tzgo8kKJ0nS9BTeL/rQgdqpF5z79MZNkkza/GTvJ56n8HgdKN0YCHTqWpdIDn
         15QVy2+uNg4ZXBp2Ya8Fpp3chOrS2zjb2bEJogyCOqMoaxhvynaIyuQSudnjTJNgQAfV
         4nn++TAPhEqAT+375o4r5VhJSd5tTwR2DB/5hx6MPHyC4T0OLzo6NhR/OSA0cmd8wfA7
         mCdg==
X-Gm-Message-State: AOAM532vitVNjT14lwqtKi8DKjdhLFgBBsHz1OeXgLUEqS5ZAt9Xbeq4
	g18yHqx9m3Phhy683kJzY6/Esz6uYCKP3xrexne97Q==
X-Google-Smtp-Source: ABdhPJxkBi4sCEdkEamRp1iKBXipayg+ioqtU6ZaV/0Nuo6ek0JXuXfIRngpfcNfUn19uNNv1AvGf7ye7weVGExrggQ=
X-Received: by 2002:a4a:751a:: with SMTP id j26mr12101491ooc.68.1610375638705;
 Mon, 11 Jan 2021 06:33:58 -0800 (PST)
MIME-Version: 1.0
References: <20210111103247.11685-1-pbarker@konsulko.com> <MWHPR11MB20008B3181D901FA9C20BC8CB9AB0@MWHPR11MB2000.namprd11.prod.outlook.com>
 <CAM9ZRVuG7ZBZX1C+MB+NfX-ctqAq+tPN3vs-915g2_cFCXS_uQ@mail.gmail.com>
In-Reply-To: <CAM9ZRVuG7ZBZX1C+MB+NfX-ctqAq+tPN3vs-915g2_cFCXS_uQ@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 11 Jan 2021 14:33:48 +0000
Message-ID: <CAM9ZRVuu+ypKKvHpatDO2x5_zR5wrqhVuqX7crZDFr5T+diuRw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] wic: Add workdir argument
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Jan 2021 at 14:22, Paul Barker <pbarker@konsulko.com> wrote:
>
> On Mon, 11 Jan 2021 at 14:17, Lee, Chee Yang <chee.yang.lee@intel.com> wrote:
> >
> > You might want to update scripts/lib/wic/help.py with description for this new features too
>
> /me looks at help.py
>
> That is really frustrating. The help output should be generated from
> the argument parsers instead of carrying hand-written duplicate
> information.

I'll send a follow up patch to add to the documentation in help.py.

-- 
Paul Barker
Konsulko Group
