Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web12.125.1588279584286309690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 13:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dweEnNAb;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id u12so2081071vsq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 13:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=v1RU7NkS7ezvLTTGD7jEzUicjWUk0hJK8yVwW8Ge5Is=;
        b=dweEnNAbKJGIVfeBg+p7yzLEs6I2QSHR6Rm0B9vxgi3zzUoMaOGanPbe8TtRkl2Hfz
         GqhoggvjtcgGtTJvhTRH+tvNtNEtKaZ8FAsy2fkPau2jlfV8hb4jpCg/bxmoBJdzrTfl
         oy4F7legZH/iZgSti7BiJw0XXvzB+2vsTV8Pb8UWjNVkHLmnpvgcBzMVJ+XTLASaPa13
         Y37kArXQfJGCNGxQEIlL4rfhjS/XbSU9VDc9qf7PhpxBhDSeQvJkzjGYZZLncdcj1xZy
         d9388DcGE4eAsYoyz6ymhuEUJ0bd/k8413qpflC/wTEpx62JP7KRaCLcMiW4bNLY8eiA
         f7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=v1RU7NkS7ezvLTTGD7jEzUicjWUk0hJK8yVwW8Ge5Is=;
        b=PRSIrub5MFJru9yXDHcccYcVcnWuoAVtl52ydek4LgQrW+JkNO00ghB0NACXn5Gk4r
         SwHQx2rS2wimAeour/7Uq9TORKIPRd3uYy64nezL9jX5IpeEewasqhsITRszpMxYbEEQ
         zu3yNylbQtpC19R88PwrBk/I/QvBQ/gYs44WF8qmVu7YrLP0cM0gVfChJJerQb5+3GMj
         LZabIVn3O7g1I6mSUtrHio7a26w0DjsCh/41NmZZwGfPQ5fG3sJJdv7UBOumrLu8Qa/G
         XSq297YM2JXpzKqA2kXNDd8lri0v35+eA3skG2YbntmUreDbApg1MVrsy0Kg3Lspu/or
         ekKA==
X-Gm-Message-State: AGi0PuZsBuUWiAYj1zUQZa6IH/1u1aqJNu9RrHG35t7FZBtVgjUQ62Vx
	EutTedk7YA3q8YhP1uqgB41/plDA61yHjqD0fMc=
X-Google-Smtp-Source: APiQypJilRyljmvjkTpfhF90Q+NHy/WCBTkOrCWKsmUuQS2iLGZ1zQNyyDm2qEGbHrxyN5Dp/2WsWpJ4ldk+kY8iRkA=
X-Received: by 2002:a67:f597:: with SMTP id i23mr705799vso.137.1588279560570;
 Thu, 30 Apr 2020 13:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095815.2824-1-alex.kanavin@gmail.com> <20200430095815.2824-5-alex.kanavin@gmail.com>
 <3bf99c3f-7ab1-d4ad-e8e1-c462222c34a8@gmail.com> <CANNYZj90=e_zRbAcUT5zNZ-S5StHgPTJg_EJwp_4jdQ15ykWuA@mail.gmail.com>
 <6a314323-ec76-5375-c37e-dfb5f32cfb71@gmail.com> <CAJ86T=XR+CWD8T=HLXUrfwUoiOjcwf2sifb1B4OWT=76OzKjQA@mail.gmail.com>
 <CANNYZj-TcGD6QJ1Vnjme4fpZ4uwQB-LAZ-coaSm+jXsjiPHe4g@mail.gmail.com>
In-Reply-To: <CANNYZj-TcGD6QJ1Vnjme4fpZ4uwQB-LAZ-coaSm+jXsjiPHe4g@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 30 Apr 2020 13:45:52 -0700
Message-ID: <CAJ86T=XEgKFR8=Aw9Qjv6KAG1C64ei8cMueS4SFFSP3yTaUTFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/17] kmscube: update to latest commit
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 1:17 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> On Thu, 30 Apr 2020 at 22:05, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> "No way to understand it" seems a little over dramatic :-) It's
>> testing for the availability of a function (gbm_bo_map) within a
>> library (libgbm) and then making some code and one of the source files
>> conditional on the result of the test.
>>
>>   https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/L=
ibraries.html
>
> Andre, I would be more sympathetic to this, if more people would actually=
 work on core recipe upgrades, but alas, it seems like it's now me alone, d=
espite all the mail that AUH sends to supposed 'maintainers'. I have about =
60 updates queued [1], and 60 more yet to come, so when I see a patch like =
this (not trivial to rebase, abandoned by original submitter, not possible =
to test), I simply drop it so that progress can be made. If you can help, p=
lease do.

Has anyone tried to contact the original submitter? If they are not
responsive then there are other Linaro folks active on the list who
could possibly help out.

AUH is a great tool but it does seem to create a division between
those in the exclusive little club of recipe maintainers and the rest
of us. If you want to reduce your workload then maybe you could remove
yourself as maintainer for some of your recipes? If that leaves
recipes without a maintainer then maybe they should default to
"community support" with AUH emails being sent to the mailing list
instead of the named individual?

> [1] http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dakana=
vin/package-version-updates
