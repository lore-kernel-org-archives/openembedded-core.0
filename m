Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.30822.1631544537150571366
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 07:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T9rk3xuo;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id j10-20020a17090a94ca00b00181f17b7ef7so6753750pjw.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 07:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=t1lqwR1RAQaPuef+/phgAwcL9VYDT53UuI0XA5Pz6F4=;
        b=T9rk3xuoL3kh5c9T1VRyd3B3CDB95fIqyfXtc/ueDpBxvJ/4gXf3OaH06qnzod5+p4
         tk7Whpzi4vRytxZrAyCJj5jeFR4cGNSWY8L2WK+B77TZtV2DP+Or4v3IZSJPDavfRfus
         U5V17riY2G+OhXUWp9/xrrVhytRcZapntwlb3thzYlyZ+hYCmRQ2dsyUtvsNobAepsEe
         98wAtgD16YmRcJ48AxSwYaYiBX4PiMNhGgRgUBHA5TM0FII6+T8VQjr+tmRN+0uTFWah
         gq7AuH/6TdofQcCaizITamIhVNu5bP3AtcDWfuUvyBjBCApayYv9MVxvH49CzDRIDC0F
         NNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=t1lqwR1RAQaPuef+/phgAwcL9VYDT53UuI0XA5Pz6F4=;
        b=veN6sQy/h5xJG4CQNVRfHH+DetE0DaNHDSZWf38fJtLh5sR0YFlu9sQ7wdAXfMIE0n
         YG0ThqkFt6FsQS1MSK3MnYVfsVqU1TKn3kj6on2kXukoSb2rovHzOE9foFoyl6drcJ/Q
         nT/apBaGllqKMTuOTgI3v4Z24doCowJQe8dR/Vs5QgnDp1gH0fU1OTtsTmsnNWXaPwX5
         tb6y7PwzpqjQTDGfuah9JILTVyPdnOmmt1F387XIhE5MBlpms6cCoU8kxH5G7rUzxn3K
         N7YOhE1UH0sUSiI3rMIgLLAR8GLRJ06Rlolq/r5ppLpHtD56yusyNj5sACNBp+v9etR0
         n6Bw==
X-Gm-Message-State: AOAM533n8osVtd6+9Rpuccr4ch3va+FfbeeadIpzm/So0Od0uEs4viJR
	pXsmIyeT/KmD+ed/f+b3EC0=
X-Google-Smtp-Source: ABdhPJwA7jlbC5emsjYoBHWXVQuneeRxI/RQJEXHKuYhlNrwgmpDaECaAbtAgdIj27tgi5ZOVoN/tA==
X-Received: by 2002:a17:90a:9310:: with SMTP id p16mr3499662pjo.193.1631544536438;
        Mon, 13 Sep 2021 07:48:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:ad54:a04f:2a83:6c06? ([2601:202:4180:a5c0:ad54:a04f:2a83:6c06])
        by smtp.gmail.com with ESMTPSA id v190sm7461527pfv.166.2021.09.13.07.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 07:48:56 -0700 (PDT)
Subject: Re: [OE-core] [poky][dunfell][PATCH] db: Whitelist CVEs
To: Saloni Jain <jainsaloni0918@gmail.com>,
 openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com, Saloni Jain <salonij@kpit.com>
References: <20210913124526.26861-1-jainsaloni0918@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <21c78d46-134b-b411-abae-3db01207f882@gmail.com>
Date: Mon, 13 Sep 2021 07:48:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913124526.26861-1-jainsaloni0918@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Saloni,

Thanks for the CVE cleanup.

On 9/13/21 5:45 AM, Saloni Jain wrote:
> From: Saloni Jain <salonij@kpit.com>
>
> Below CVE affects only Oracle Berkeley DB as per upstream.
> Hence, whitelisted them.

This situation will happen more frequently than one thinks including
with mariadb recipe.  I wounder if a "${PN}_cve_ exclude.inc"  like
scheme may help keep the recipe from getting hard to read if the listing
gets out of control?

- Armin


>
> 1. CVE-2015-2583
> Link: https://security-tracker.debian.org/tracker/CVE-2015-2583
> 2. CVE-2015-2624
> Link: https://security-tracker.debian.org/tracker/CVE-2015-2624
> 3. CVE-2015-2626
> Link: https://security-tracker.debian.org/tracker/CVE-2015-2626
> 4. CVE-2015-2640
> Link: https://security-tracker.debian.org/tracker/CVE-2015-2640
> 5. CVE-2015-2654
> Link: https://security-tracker.debian.org/tracker/CVE-2015-2654
> 6. CVE-2015-2656
> Link: https://security-tracker.debian.org/tracker/CVE-2015-2656
> 7. CVE-2015-4754
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4754
> 8. CVE-2015-4764
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4764
> 9. CVE-2015-4774
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4774
> 10. CVE-2015-4775
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4775
> 11. CVE-2015-4776
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4776
> 12. CVE-2015-4777
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4777
> 13. CVE-2015-4778
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4778
> 14. CVE-2015-4779
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4779
> 15. CVE-2015-4780
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4780
> 16. CVE-2015-4781
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4781
> 17. CVE-2015-4782
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4782
> 18. CVE-2015-4783
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4783
> 19. CVE-2015-4784
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4784
> 20. CVE-2015-4785
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4785
> 21. CVE-2015-4786
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4786
> 22. CVE-2015-4787
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4787
> 23. CVE-2015-4788
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4788
> 24. CVE-2015-4789
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4789
> 25. CVE-2015-4790
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4790
> 26. CVE-2016-0682
> Link: https://security-tracker.debian.org/tracker/CVE-2016-0682
> 27. CVE-2016-0689
> Link: https://security-tracker.debian.org/tracker/CVE-2016-0689
> 28. CVE-2016-0692
> Link: https://security-tracker.debian.org/tracker/CVE-2016-0692
> 29. CVE-2016-0694
> Link: https://security-tracker.debian.org/tracker/CVE-2016-0694
> 30. CVE-2016-3418
> Link: https://security-tracker.debian.org/tracker/CVE-2016-3418
> 31. CVE-2017-3604
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3604
> 32. CVE-2017-3605
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3605
> 33. CVE-2017-3606
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3606
> 34. CVE-2017-3607
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3607
> 35. CVE-2017-3608
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3608
> 36. CVE-2017-3609
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3609
> 37. CVE-2017-3610
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3610
> 38. CVE-2017-3611
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3611
> 39. CVE-2017-3612
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3612
> 40. CVE-2017-3613
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3613
> 41. CVE-2017-3614
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3614
> 42. CVE-2017-3615
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3615
> 43. CVE-2017-3616
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3616
> 44. CVE-2017-3617
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3617
> 45. CVE-2020-2981
> Link: https://security-tracker.debian.org/tracker/CVE-2020-2981
>
> Signed-off-by: Saloni <jainsaloni0918@gmail.com>
> ---
>  meta/recipes-support/db/db_5.3.28.bb | 92 ++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>
> diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
> index b2ae98f05c..000e9ef468 100644
> --- a/meta/recipes-support/db/db_5.3.28.bb
> +++ b/meta/recipes-support/db/db_5.3.28.bb
> @@ -39,6 +39,98 @@ SRC_URI[sha256sum] = "e0a992d740709892e81f9d93f06daf305cf73fb81b545afe7247804317
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1158e31437f4f87cdd4ab2b8613955"
>  
> +# Below CVEs affects only Oracle Berkeley DB as per upstream.
> +# https://security-tracker.debian.org/tracker/CVE-2015-2583
> +CVE_CHECK_WHITELIST += "CVE-2015-2583"
> +# https://security-tracker.debian.org/tracker/CVE-2015-2624
> +CVE_CHECK_WHITELIST += "CVE-2015-2624"
> +# https://security-tracker.debian.org/tracker/CVE-2015-2626
> +CVE_CHECK_WHITELIST += "CVE-2015-2626"
> +# https://security-tracker.debian.org/tracker/CVE-2015-2640
> +CVE_CHECK_WHITELIST += "CVE-2015-2640"
> +# https://security-tracker.debian.org/tracker/CVE-2015-2654
> +CVE_CHECK_WHITELIST += "CVE-2015-2654"
> +# https://security-tracker.debian.org/tracker/CVE-2015-2656
> +CVE_CHECK_WHITELIST += "CVE-2015-2656"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4754
> +CVE_CHECK_WHITELIST += "CVE-2015-4754"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4764
> +CVE_CHECK_WHITELIST += "CVE-2015-4764"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4774
> +CVE_CHECK_WHITELIST += "CVE-2015-4774"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4775
> +CVE_CHECK_WHITELIST += "CVE-2015-4775"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4776
> +CVE_CHECK_WHITELIST += "CVE-2015-4776"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4777
> +CVE_CHECK_WHITELIST += "CVE-2015-4777"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4778
> +CVE_CHECK_WHITELIST += "CVE-2015-4778"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4779
> +CVE_CHECK_WHITELIST += "CVE-2015-4779"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4780
> +CVE_CHECK_WHITELIST += "CVE-2015-4780"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4781
> +CVE_CHECK_WHITELIST += "CVE-2015-4781"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4782
> +CVE_CHECK_WHITELIST += "CVE-2015-4782"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4783
> +CVE_CHECK_WHITELIST += "CVE-2015-4783"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4784
> +CVE_CHECK_WHITELIST += "CVE-2015-4784"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4785
> +CVE_CHECK_WHITELIST += "CVE-2015-4785"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4786
> +CVE_CHECK_WHITELIST += "CVE-2015-4786"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4787
> +CVE_CHECK_WHITELIST += "CVE-2015-4787"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4788
> +CVE_CHECK_WHITELIST += "CVE-2015-4788"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4789
> +CVE_CHECK_WHITELIST += "CVE-2015-4789"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4790
> +CVE_CHECK_WHITELIST += "CVE-2015-4790"
> +# https://security-tracker.debian.org/tracker/CVE-2016-0682
> +CVE_CHECK_WHITELIST += "CVE-2016-0682"
> +# https://security-tracker.debian.org/tracker/CVE-2016-0689
> +CVE_CHECK_WHITELIST += "CVE-2016-0689"
> +# https://security-tracker.debian.org/tracker/CVE-2016-0692
> +CVE_CHECK_WHITELIST += "CVE-2016-0692"
> +# https://security-tracker.debian.org/tracker/CVE-2016-0694
> +CVE_CHECK_WHITELIST += "CVE-2016-0694"
> +# https://security-tracker.debian.org/tracker/CVE-2016-3418
> +CVE_CHECK_WHITELIST += "CVE-2016-3418"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3604
> +CVE_CHECK_WHITELIST += "CVE-2017-3604"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3605
> +CVE_CHECK_WHITELIST += "CVE-2017-3605"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3606
> +CVE_CHECK_WHITELIST += "CVE-2017-3606"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3607
> +CVE_CHECK_WHITELIST += "CVE-2017-3607"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3608
> +CVE_CHECK_WHITELIST += "CVE-2017-3608"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3609
> +CVE_CHECK_WHITELIST += "CVE-2017-3609"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3610
> +CVE_CHECK_WHITELIST += "CVE-2017-3610"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3611
> +CVE_CHECK_WHITELIST += "CVE-2017-3611"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3612
> +CVE_CHECK_WHITELIST += "CVE-2017-3612"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3613
> +CVE_CHECK_WHITELIST += "CVE-2017-3613"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3614
> +CVE_CHECK_WHITELIST += "CVE-2017-3614"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3615
> +CVE_CHECK_WHITELIST += "CVE-2017-3615"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3616
> +CVE_CHECK_WHITELIST += "CVE-2017-3616"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3617
> +CVE_CHECK_WHITELIST += "CVE-2017-3617"
> +# https://security-tracker.debian.org/tracker/CVE-2020-2981
> +CVE_CHECK_WHITELIST += "CVE-2020-2981"
> +
>  inherit autotools
>  
>  # The executables go in a separate package - typically there
>
> 
>

