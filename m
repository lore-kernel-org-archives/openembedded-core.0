Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.31066.1631545391220971658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 08:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IumBzBhR;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.54, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f54.google.com with SMTP id t8so10171855wrq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 08:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cYNcUmjnCW3x4i9uFDkRm7jkNcp/GzYqxg5G351qp6Y=;
        b=IumBzBhRxsnzSFB+/e58CMsRvsI4fO0u40LetAees3ikV7vFe6jSCKTs9X23xu5LNU
         R8fLYEQ09bSJ1wtyKeHsAprKWHGZYENTOf8VaCTPeLNzKv1tPGW/+6k2o40tiUKabA2q
         Tu1Xznkpekg95cxpQmZqLldyY7bNy+NyVSiocLFhoXkGsur9z0aWFFgQbx2sUL2snMvJ
         AfRrFlxUW9tlJTsiRQ7a8YM0CU0oYCpFARkXgPoU9Miv5Zzwf9UoPxZ/CVL4FGlhSZsZ
         lGp92XKyEHZqYQxjBN/CS7OmQkLlDoVJX2WJfzrrZnlSa/FmRGDQ+FP7mfsyWE84fJ8m
         28ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cYNcUmjnCW3x4i9uFDkRm7jkNcp/GzYqxg5G351qp6Y=;
        b=kuhHXMpkIpYL3fMXA+3pGkVgQxyKRjoQzkiDopGZ3Vr2wtPW9M/m+0StigffWgcWFP
         Vr/oOsNAmSmb23QIT7QlvA0KbiSzuya/bMwRtbD2d9PFznJCLjuusMT24V8mQ94lMVsW
         ty+M2uqUudq+DAziBaWuBfKG7Bjm6XGzBzgF3pjt1TFoGokWZZBrszkYzOlk8A1yVWpp
         PwbRhYmfzs1AVqD7RHqaGMK3rbYbMY+mpHGEU6AiZ0hGKo1UmfBUEb6+JvjlQSli06FF
         xhf0w+38npzKCtNWdnKebYglgyo2ZbZ7PakXuZWG0BKQCBiodMsmMfS6yfP61IjFkRtg
         cCPQ==
X-Gm-Message-State: AOAM5323GSWUjL5Cx3S1AmMWwahVYbNyG4KCgjtbsDsePUOl98Vc+tQL
	VVH5TSwDm9rzRjTTVIxoLXHyL5/mTCr2gSjdlGQ5Jw==
X-Google-Smtp-Source: ABdhPJxEQMCxvcpUpbhH2rZ6FMhWq/YYhfORNbYJON5d0KOAoGP/Hfckkl+ZgWbmMlxpWg5qjOtpZVrDd9cZf+VVuVk=
X-Received: by 2002:a5d:4803:: with SMTP id l3mr13236982wrq.61.1631545389451;
 Mon, 13 Sep 2021 08:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210913124526.26861-1-jainsaloni0918@gmail.com> <16A46989BBD4976A.22787@lists.openembedded.org>
In-Reply-To: <16A46989BBD4976A.22787@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 13 Sep 2021 05:02:57 -1000
Message-ID: <CAOSpxdZt_mGQr5X_v1B1dAnYL6kyJod_1L7HU2B4yaNWM2f_7w@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] db: Whitelist CVEs
To: Steve Sakoman <steve@sakoman.com>
Cc: Saloni Jain <jainsaloni0918@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Saloni Jain <salonij@kpit.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 4:56 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> On Mon, Sep 13, 2021 at 2:45 AM Saloni Jain <jainsaloni0918@gmail.com> wrote:
> >
> > From: Saloni Jain <salonij@kpit.com>
> >
> > Below CVE affects only Oracle Berkeley DB as per upstream.
> > Hence, whitelisted them.
>
> I suspect that a cleaner solution might be to revert:
>
> db: update CVE_PRODUCT
> (https://git.openembedded.org/openembedded-core/commit/?id=ad799b109716ccd2f44dcf7a6a4cfcbd622ea661)
>
> which adds berkeley_db to CVE_PRODUCT
>
> I did a quick test and this eliminates all of the CVE's below. And of
> course it makes sense to only check for oracle_berkeley_db since that
> is the source code we are using.
>
> Also, this same issue is present in master, so any fix would need to
> go there first and I will cherry-pick.
>
> Could you confirm that this approach works for you too?

And for those who are wondering why the db CVE's don't show up in the
weekly reports, it is because the script that Ross provided me many
moons ago whitelisted db and db-native.

I figured he had a good reason for that, so I left it in for
consistency with the reports he had run :-)

db and db-native are the only whitelisted packages for those who might
be wondering.

Steve

> > 1. CVE-2015-2583
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-2583
> > 2. CVE-2015-2624
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-2624
> > 3. CVE-2015-2626
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-2626
> > 4. CVE-2015-2640
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-2640
> > 5. CVE-2015-2654
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-2654
> > 6. CVE-2015-2656
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-2656
> > 7. CVE-2015-4754
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4754
> > 8. CVE-2015-4764
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4764
> > 9. CVE-2015-4774
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4774
> > 10. CVE-2015-4775
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4775
> > 11. CVE-2015-4776
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4776
> > 12. CVE-2015-4777
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4777
> > 13. CVE-2015-4778
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4778
> > 14. CVE-2015-4779
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4779
> > 15. CVE-2015-4780
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4780
> > 16. CVE-2015-4781
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4781
> > 17. CVE-2015-4782
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4782
> > 18. CVE-2015-4783
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4783
> > 19. CVE-2015-4784
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4784
> > 20. CVE-2015-4785
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4785
> > 21. CVE-2015-4786
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4786
> > 22. CVE-2015-4787
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4787
> > 23. CVE-2015-4788
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4788
> > 24. CVE-2015-4789
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4789
> > 25. CVE-2015-4790
> > Link: https://security-tracker.debian.org/tracker/CVE-2015-4790
> > 26. CVE-2016-0682
> > Link: https://security-tracker.debian.org/tracker/CVE-2016-0682
> > 27. CVE-2016-0689
> > Link: https://security-tracker.debian.org/tracker/CVE-2016-0689
> > 28. CVE-2016-0692
> > Link: https://security-tracker.debian.org/tracker/CVE-2016-0692
> > 29. CVE-2016-0694
> > Link: https://security-tracker.debian.org/tracker/CVE-2016-0694
> > 30. CVE-2016-3418
> > Link: https://security-tracker.debian.org/tracker/CVE-2016-3418
> > 31. CVE-2017-3604
> > Link: https://security-tracker.debian.org/tracker/CVE-2017-3604
> > 32. CVE-2017-3605
> > Link: https://security-tracker.debian.org/tracker/CVE-2017-3605
> > 33. CVE-2017-3606
> > Link: https://security-tracker.debian.org/tracker/CVE-2017-3606
> > 34. CVE-2017-3607
> > Link: https://security-tracker.debian.org/tracker/CVE-2017-3607
> > 35. CVE-2017-3608
> > Link: https://security-tracker.debian.org/tracker/CVE-2017-3608
> > 36. CVE-2017-3609
> > Link: https://security-tracker.debian.org/tracker/CVE-2017-3609
> > 37. CVE-2017-3610
> > Link: https://security-tracker.debian.org/tracker/CVE-2017-3610
> > 38. CVE-2017-3611
> > Link: https://security-tracker.debian.org/tracker/CVE-2017-3611
> > 39. CVE-2017-3612
> > Link: https://security-tracker.debian.org/tracker/CVE-2017-3612
> > 40. CVE-2017-3613
> > Link: https://security-tracker.debian.org/tracker/CVE-2017-3613
> > 41. CVE-2017-3614
> > Link: https://security-tracker.debian.org/tracker/CVE-2017-3614
> > 42. CVE-2017-3615
> > Link: https://security-tracker.debian.org/tracker/CVE-2017-3615
> > 43. CVE-2017-3616
> > Link: https://security-tracker.debian.org/tracker/CVE-2017-3616
> > 44. CVE-2017-3617
> > Link: https://security-tracker.debian.org/tracker/CVE-2017-3617
> > 45. CVE-2020-2981
> > Link: https://security-tracker.debian.org/tracker/CVE-2020-2981
> >
> > Signed-off-by: Saloni <jainsaloni0918@gmail.com>
> > ---
> >  meta/recipes-support/db/db_5.3.28.bb | 92 ++++++++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> >
> > diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
> > index b2ae98f05c..000e9ef468 100644
> > --- a/meta/recipes-support/db/db_5.3.28.bb
> > +++ b/meta/recipes-support/db/db_5.3.28.bb
> > @@ -39,6 +39,98 @@ SRC_URI[sha256sum] = "e0a992d740709892e81f9d93f06daf305cf73fb81b545afe7247804317
> >
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1158e31437f4f87cdd4ab2b8613955"
> >
> > +# Below CVEs affects only Oracle Berkeley DB as per upstream.
> > +# https://security-tracker.debian.org/tracker/CVE-2015-2583
> > +CVE_CHECK_WHITELIST += "CVE-2015-2583"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-2624
> > +CVE_CHECK_WHITELIST += "CVE-2015-2624"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-2626
> > +CVE_CHECK_WHITELIST += "CVE-2015-2626"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-2640
> > +CVE_CHECK_WHITELIST += "CVE-2015-2640"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-2654
> > +CVE_CHECK_WHITELIST += "CVE-2015-2654"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-2656
> > +CVE_CHECK_WHITELIST += "CVE-2015-2656"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4754
> > +CVE_CHECK_WHITELIST += "CVE-2015-4754"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4764
> > +CVE_CHECK_WHITELIST += "CVE-2015-4764"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4774
> > +CVE_CHECK_WHITELIST += "CVE-2015-4774"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4775
> > +CVE_CHECK_WHITELIST += "CVE-2015-4775"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4776
> > +CVE_CHECK_WHITELIST += "CVE-2015-4776"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4777
> > +CVE_CHECK_WHITELIST += "CVE-2015-4777"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4778
> > +CVE_CHECK_WHITELIST += "CVE-2015-4778"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4779
> > +CVE_CHECK_WHITELIST += "CVE-2015-4779"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4780
> > +CVE_CHECK_WHITELIST += "CVE-2015-4780"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4781
> > +CVE_CHECK_WHITELIST += "CVE-2015-4781"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4782
> > +CVE_CHECK_WHITELIST += "CVE-2015-4782"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4783
> > +CVE_CHECK_WHITELIST += "CVE-2015-4783"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4784
> > +CVE_CHECK_WHITELIST += "CVE-2015-4784"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4785
> > +CVE_CHECK_WHITELIST += "CVE-2015-4785"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4786
> > +CVE_CHECK_WHITELIST += "CVE-2015-4786"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4787
> > +CVE_CHECK_WHITELIST += "CVE-2015-4787"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4788
> > +CVE_CHECK_WHITELIST += "CVE-2015-4788"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4789
> > +CVE_CHECK_WHITELIST += "CVE-2015-4789"
> > +# https://security-tracker.debian.org/tracker/CVE-2015-4790
> > +CVE_CHECK_WHITELIST += "CVE-2015-4790"
> > +# https://security-tracker.debian.org/tracker/CVE-2016-0682
> > +CVE_CHECK_WHITELIST += "CVE-2016-0682"
> > +# https://security-tracker.debian.org/tracker/CVE-2016-0689
> > +CVE_CHECK_WHITELIST += "CVE-2016-0689"
> > +# https://security-tracker.debian.org/tracker/CVE-2016-0692
> > +CVE_CHECK_WHITELIST += "CVE-2016-0692"
> > +# https://security-tracker.debian.org/tracker/CVE-2016-0694
> > +CVE_CHECK_WHITELIST += "CVE-2016-0694"
> > +# https://security-tracker.debian.org/tracker/CVE-2016-3418
> > +CVE_CHECK_WHITELIST += "CVE-2016-3418"
> > +# https://security-tracker.debian.org/tracker/CVE-2017-3604
> > +CVE_CHECK_WHITELIST += "CVE-2017-3604"
> > +# https://security-tracker.debian.org/tracker/CVE-2017-3605
> > +CVE_CHECK_WHITELIST += "CVE-2017-3605"
> > +# https://security-tracker.debian.org/tracker/CVE-2017-3606
> > +CVE_CHECK_WHITELIST += "CVE-2017-3606"
> > +# https://security-tracker.debian.org/tracker/CVE-2017-3607
> > +CVE_CHECK_WHITELIST += "CVE-2017-3607"
> > +# https://security-tracker.debian.org/tracker/CVE-2017-3608
> > +CVE_CHECK_WHITELIST += "CVE-2017-3608"
> > +# https://security-tracker.debian.org/tracker/CVE-2017-3609
> > +CVE_CHECK_WHITELIST += "CVE-2017-3609"
> > +# https://security-tracker.debian.org/tracker/CVE-2017-3610
> > +CVE_CHECK_WHITELIST += "CVE-2017-3610"
> > +# https://security-tracker.debian.org/tracker/CVE-2017-3611
> > +CVE_CHECK_WHITELIST += "CVE-2017-3611"
> > +# https://security-tracker.debian.org/tracker/CVE-2017-3612
> > +CVE_CHECK_WHITELIST += "CVE-2017-3612"
> > +# https://security-tracker.debian.org/tracker/CVE-2017-3613
> > +CVE_CHECK_WHITELIST += "CVE-2017-3613"
> > +# https://security-tracker.debian.org/tracker/CVE-2017-3614
> > +CVE_CHECK_WHITELIST += "CVE-2017-3614"
> > +# https://security-tracker.debian.org/tracker/CVE-2017-3615
> > +CVE_CHECK_WHITELIST += "CVE-2017-3615"
> > +# https://security-tracker.debian.org/tracker/CVE-2017-3616
> > +CVE_CHECK_WHITELIST += "CVE-2017-3616"
> > +# https://security-tracker.debian.org/tracker/CVE-2017-3617
> > +CVE_CHECK_WHITELIST += "CVE-2017-3617"
> > +# https://security-tracker.debian.org/tracker/CVE-2020-2981
> > +CVE_CHECK_WHITELIST += "CVE-2020-2981"
> > +
> >  inherit autotools
> >
> >  # The executables go in a separate package - typically there
> > --
> > 2.17.1
> >
> >
> >
> >
>
> 
>
