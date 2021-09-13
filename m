Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.28859.1631537148674519856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 05:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qk0Uz2pD;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: jainsaloni0918@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id f11-20020a17090aa78b00b0018e98a7cddaso6384152pjq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 05:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=729AWyIaSDRKhv/EatkfwArSM1gx2jbYQdhnaEHKf/0=;
        b=Qk0Uz2pDofMJtYrYGgjdBbuIErc5bjWIQSbQJlhkL+BbcjKUxGnB2bjo8Ot+GjbfoC
         iPeDeNfcKYtv82B8NG1vS+AFAKlDLtNWLRsi9rkvj31O+gPx0kAfz5VjGAtYiQ/hRFUt
         LQ7XYuGG4LrajleTGTdOb79vmlLJ+lDHKD88+dSMMgaeoDjc6CG7wjadRgDXUsfW1qZj
         Dgg4GA5Gw/HZGnkARGwfKh+2pl8UFecPuAePk93hSYLuJT5IntPdTDDIgFZT9E3OcaT3
         6Sf61+fob7rJoQ16q/an2AkqcN36i5i5A5QXxp0tC8CQTyopeGdq2zq3GSm4NUAi6gzo
         uAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=729AWyIaSDRKhv/EatkfwArSM1gx2jbYQdhnaEHKf/0=;
        b=V5Wh7a5+1wu4w3vpaLccR4bVu1IAt67jU3UBym/7imc24rHXXvuBbYUxN0nuDcZccI
         +MxVmXfHWBahS7E/WkBanuzuWIVQPf23lZpYL4FQ4We9bYwAvHHucgy/TyYBpSFUgsT5
         rZJPFI3Q5yGM2edNqm8PaOWqshbcAUQdBfiJGJCZmU1n0dUiYyI6jLBWB0DX14xO340O
         +0UyFQd10qeWMx3eKB7Tao4YU1kORCUUhKi9B1VHfTSABAj+GwxYtwgilvNQVJVMCBIS
         oDXpG5lwbaA65mHsDrm3fLoJmdv9vmLk5H9E8lH7qRY9eGzDsQobsqf2vwZ8YI0VtHTv
         S1wQ==
X-Gm-Message-State: AOAM532CyQbegDJAkrhrJdR6IOygjCIq9bypF7FUrR5DvP4mA/NP/IUR
	aXVVd9264Sgc+0F7lWLxfWuoJleDiPrS06UG
X-Google-Smtp-Source: ABdhPJwgtm0TSh4YuBd+iwv7STTfG1Y+9wW/bccbUv6k5rjCK3GcWMvoOUIjOz+Q8oB4fKPzyuRuWw==
X-Received: by 2002:a17:90a:5a86:: with SMTP id n6mr12707603pji.3.1631537147844;
        Mon, 13 Sep 2021 05:45:47 -0700 (PDT)
Return-Path: <jainsaloni0918@gmail.com>
Received: from localhost.localdomain ([27.97.77.182])
        by smtp.gmail.com with ESMTPSA id t28sm7446086pfe.144.2021.09.13.05.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 05:45:47 -0700 (PDT)
From: "Saloni Jain" <jainsaloni0918@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Saloni Jain <salonij@kpit.com>
Subject: [poky][dunfell][PATCH] db: Whitelist CVEs
Date: Mon, 13 Sep 2021 08:45:26 -0400
Message-Id: <20210913124526.26861-1-jainsaloni0918@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Saloni Jain <salonij@kpit.com>

Below CVE affects only Oracle Berkeley DB as per upstream.
Hence, whitelisted them.

1. CVE-2015-2583
Link: https://security-tracker.debian.org/tracker/CVE-2015-2583
2. CVE-2015-2624
Link: https://security-tracker.debian.org/tracker/CVE-2015-2624
3. CVE-2015-2626
Link: https://security-tracker.debian.org/tracker/CVE-2015-2626
4. CVE-2015-2640
Link: https://security-tracker.debian.org/tracker/CVE-2015-2640
5. CVE-2015-2654
Link: https://security-tracker.debian.org/tracker/CVE-2015-2654
6. CVE-2015-2656
Link: https://security-tracker.debian.org/tracker/CVE-2015-2656
7. CVE-2015-4754
Link: https://security-tracker.debian.org/tracker/CVE-2015-4754
8. CVE-2015-4764
Link: https://security-tracker.debian.org/tracker/CVE-2015-4764
9. CVE-2015-4774
Link: https://security-tracker.debian.org/tracker/CVE-2015-4774
10. CVE-2015-4775
Link: https://security-tracker.debian.org/tracker/CVE-2015-4775
11. CVE-2015-4776
Link: https://security-tracker.debian.org/tracker/CVE-2015-4776
12. CVE-2015-4777
Link: https://security-tracker.debian.org/tracker/CVE-2015-4777
13. CVE-2015-4778
Link: https://security-tracker.debian.org/tracker/CVE-2015-4778
14. CVE-2015-4779
Link: https://security-tracker.debian.org/tracker/CVE-2015-4779
15. CVE-2015-4780
Link: https://security-tracker.debian.org/tracker/CVE-2015-4780
16. CVE-2015-4781
Link: https://security-tracker.debian.org/tracker/CVE-2015-4781
17. CVE-2015-4782
Link: https://security-tracker.debian.org/tracker/CVE-2015-4782
18. CVE-2015-4783
Link: https://security-tracker.debian.org/tracker/CVE-2015-4783
19. CVE-2015-4784
Link: https://security-tracker.debian.org/tracker/CVE-2015-4784
20. CVE-2015-4785
Link: https://security-tracker.debian.org/tracker/CVE-2015-4785
21. CVE-2015-4786
Link: https://security-tracker.debian.org/tracker/CVE-2015-4786
22. CVE-2015-4787
Link: https://security-tracker.debian.org/tracker/CVE-2015-4787
23. CVE-2015-4788
Link: https://security-tracker.debian.org/tracker/CVE-2015-4788
24. CVE-2015-4789
Link: https://security-tracker.debian.org/tracker/CVE-2015-4789
25. CVE-2015-4790
Link: https://security-tracker.debian.org/tracker/CVE-2015-4790
26. CVE-2016-0682
Link: https://security-tracker.debian.org/tracker/CVE-2016-0682
27. CVE-2016-0689
Link: https://security-tracker.debian.org/tracker/CVE-2016-0689
28. CVE-2016-0692
Link: https://security-tracker.debian.org/tracker/CVE-2016-0692
29. CVE-2016-0694
Link: https://security-tracker.debian.org/tracker/CVE-2016-0694
30. CVE-2016-3418
Link: https://security-tracker.debian.org/tracker/CVE-2016-3418
31. CVE-2017-3604
Link: https://security-tracker.debian.org/tracker/CVE-2017-3604
32. CVE-2017-3605
Link: https://security-tracker.debian.org/tracker/CVE-2017-3605
33. CVE-2017-3606
Link: https://security-tracker.debian.org/tracker/CVE-2017-3606
34. CVE-2017-3607
Link: https://security-tracker.debian.org/tracker/CVE-2017-3607
35. CVE-2017-3608
Link: https://security-tracker.debian.org/tracker/CVE-2017-3608
36. CVE-2017-3609
Link: https://security-tracker.debian.org/tracker/CVE-2017-3609
37. CVE-2017-3610
Link: https://security-tracker.debian.org/tracker/CVE-2017-3610
38. CVE-2017-3611
Link: https://security-tracker.debian.org/tracker/CVE-2017-3611
39. CVE-2017-3612
Link: https://security-tracker.debian.org/tracker/CVE-2017-3612
40. CVE-2017-3613
Link: https://security-tracker.debian.org/tracker/CVE-2017-3613
41. CVE-2017-3614
Link: https://security-tracker.debian.org/tracker/CVE-2017-3614
42. CVE-2017-3615
Link: https://security-tracker.debian.org/tracker/CVE-2017-3615
43. CVE-2017-3616
Link: https://security-tracker.debian.org/tracker/CVE-2017-3616
44. CVE-2017-3617
Link: https://security-tracker.debian.org/tracker/CVE-2017-3617
45. CVE-2020-2981
Link: https://security-tracker.debian.org/tracker/CVE-2020-2981

Signed-off-by: Saloni <jainsaloni0918@gmail.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 92 ++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index b2ae98f05c..000e9ef468 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -39,6 +39,98 @@ SRC_URI[sha256sum] = "e0a992d740709892e81f9d93f06daf305cf73fb81b545afe7247804317
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1158e31437f4f87cdd4ab2b8613955"
 
+# Below CVEs affects only Oracle Berkeley DB as per upstream.
+# https://security-tracker.debian.org/tracker/CVE-2015-2583
+CVE_CHECK_WHITELIST += "CVE-2015-2583"
+# https://security-tracker.debian.org/tracker/CVE-2015-2624
+CVE_CHECK_WHITELIST += "CVE-2015-2624"
+# https://security-tracker.debian.org/tracker/CVE-2015-2626
+CVE_CHECK_WHITELIST += "CVE-2015-2626"
+# https://security-tracker.debian.org/tracker/CVE-2015-2640
+CVE_CHECK_WHITELIST += "CVE-2015-2640"
+# https://security-tracker.debian.org/tracker/CVE-2015-2654
+CVE_CHECK_WHITELIST += "CVE-2015-2654"
+# https://security-tracker.debian.org/tracker/CVE-2015-2656
+CVE_CHECK_WHITELIST += "CVE-2015-2656"
+# https://security-tracker.debian.org/tracker/CVE-2015-4754
+CVE_CHECK_WHITELIST += "CVE-2015-4754"
+# https://security-tracker.debian.org/tracker/CVE-2015-4764
+CVE_CHECK_WHITELIST += "CVE-2015-4764"
+# https://security-tracker.debian.org/tracker/CVE-2015-4774
+CVE_CHECK_WHITELIST += "CVE-2015-4774"
+# https://security-tracker.debian.org/tracker/CVE-2015-4775
+CVE_CHECK_WHITELIST += "CVE-2015-4775"
+# https://security-tracker.debian.org/tracker/CVE-2015-4776
+CVE_CHECK_WHITELIST += "CVE-2015-4776"
+# https://security-tracker.debian.org/tracker/CVE-2015-4777
+CVE_CHECK_WHITELIST += "CVE-2015-4777"
+# https://security-tracker.debian.org/tracker/CVE-2015-4778
+CVE_CHECK_WHITELIST += "CVE-2015-4778"
+# https://security-tracker.debian.org/tracker/CVE-2015-4779
+CVE_CHECK_WHITELIST += "CVE-2015-4779"
+# https://security-tracker.debian.org/tracker/CVE-2015-4780
+CVE_CHECK_WHITELIST += "CVE-2015-4780"
+# https://security-tracker.debian.org/tracker/CVE-2015-4781
+CVE_CHECK_WHITELIST += "CVE-2015-4781"
+# https://security-tracker.debian.org/tracker/CVE-2015-4782
+CVE_CHECK_WHITELIST += "CVE-2015-4782"
+# https://security-tracker.debian.org/tracker/CVE-2015-4783
+CVE_CHECK_WHITELIST += "CVE-2015-4783"
+# https://security-tracker.debian.org/tracker/CVE-2015-4784
+CVE_CHECK_WHITELIST += "CVE-2015-4784"
+# https://security-tracker.debian.org/tracker/CVE-2015-4785
+CVE_CHECK_WHITELIST += "CVE-2015-4785"
+# https://security-tracker.debian.org/tracker/CVE-2015-4786
+CVE_CHECK_WHITELIST += "CVE-2015-4786"
+# https://security-tracker.debian.org/tracker/CVE-2015-4787
+CVE_CHECK_WHITELIST += "CVE-2015-4787"
+# https://security-tracker.debian.org/tracker/CVE-2015-4788
+CVE_CHECK_WHITELIST += "CVE-2015-4788"
+# https://security-tracker.debian.org/tracker/CVE-2015-4789
+CVE_CHECK_WHITELIST += "CVE-2015-4789"
+# https://security-tracker.debian.org/tracker/CVE-2015-4790
+CVE_CHECK_WHITELIST += "CVE-2015-4790"
+# https://security-tracker.debian.org/tracker/CVE-2016-0682
+CVE_CHECK_WHITELIST += "CVE-2016-0682"
+# https://security-tracker.debian.org/tracker/CVE-2016-0689
+CVE_CHECK_WHITELIST += "CVE-2016-0689"
+# https://security-tracker.debian.org/tracker/CVE-2016-0692
+CVE_CHECK_WHITELIST += "CVE-2016-0692"
+# https://security-tracker.debian.org/tracker/CVE-2016-0694
+CVE_CHECK_WHITELIST += "CVE-2016-0694"
+# https://security-tracker.debian.org/tracker/CVE-2016-3418
+CVE_CHECK_WHITELIST += "CVE-2016-3418"
+# https://security-tracker.debian.org/tracker/CVE-2017-3604
+CVE_CHECK_WHITELIST += "CVE-2017-3604"
+# https://security-tracker.debian.org/tracker/CVE-2017-3605
+CVE_CHECK_WHITELIST += "CVE-2017-3605"
+# https://security-tracker.debian.org/tracker/CVE-2017-3606
+CVE_CHECK_WHITELIST += "CVE-2017-3606"
+# https://security-tracker.debian.org/tracker/CVE-2017-3607
+CVE_CHECK_WHITELIST += "CVE-2017-3607"
+# https://security-tracker.debian.org/tracker/CVE-2017-3608
+CVE_CHECK_WHITELIST += "CVE-2017-3608"
+# https://security-tracker.debian.org/tracker/CVE-2017-3609
+CVE_CHECK_WHITELIST += "CVE-2017-3609"
+# https://security-tracker.debian.org/tracker/CVE-2017-3610
+CVE_CHECK_WHITELIST += "CVE-2017-3610"
+# https://security-tracker.debian.org/tracker/CVE-2017-3611
+CVE_CHECK_WHITELIST += "CVE-2017-3611"
+# https://security-tracker.debian.org/tracker/CVE-2017-3612
+CVE_CHECK_WHITELIST += "CVE-2017-3612"
+# https://security-tracker.debian.org/tracker/CVE-2017-3613
+CVE_CHECK_WHITELIST += "CVE-2017-3613"
+# https://security-tracker.debian.org/tracker/CVE-2017-3614
+CVE_CHECK_WHITELIST += "CVE-2017-3614"
+# https://security-tracker.debian.org/tracker/CVE-2017-3615
+CVE_CHECK_WHITELIST += "CVE-2017-3615"
+# https://security-tracker.debian.org/tracker/CVE-2017-3616
+CVE_CHECK_WHITELIST += "CVE-2017-3616"
+# https://security-tracker.debian.org/tracker/CVE-2017-3617
+CVE_CHECK_WHITELIST += "CVE-2017-3617"
+# https://security-tracker.debian.org/tracker/CVE-2020-2981
+CVE_CHECK_WHITELIST += "CVE-2020-2981"
+
 inherit autotools
 
 # The executables go in a separate package - typically there
-- 
2.17.1

