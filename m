Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.399.1592848867449345850
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=L4CUzopx;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id p82so5686863oif.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KmIkBDH6MV25fDXVEWnAsqK33Q9gNDoqE5C560aWb/s=;
        b=L4CUzopxIHCU4fZHk9P8x4s99y8By97MRavWIv0CYUb6rkBrEymnQsA0bFRHBMmTmZ
         eIcLstctcVH8jLp5PrTe8MmhFyFz1i/TUks8RmlE526aPBri8wO6dvw1aPHIcJ7+7X+R
         U5LVFAPKrilN0H3BKoCQ03PH403h0JuArF+jG/Kz1bG1QONIk27Iayvlh/9HZ0aq7ZRR
         KGvPrhPPscmgTIIUtOiJjWgNkiA5JBfnKh3pUGuxjuqfmO4n86Pq3Yiz0bZNlDc4H4u1
         gI0yKxfUYMSSThY2zs39JwIUll4Gw3VsPxlPRWOPJ2X0R7/zYjXj29NMmSNG9iRjce9t
         6ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KmIkBDH6MV25fDXVEWnAsqK33Q9gNDoqE5C560aWb/s=;
        b=E4/g9UuF9GP/4LdGFdH2O6VHdPGHH1zmBDcsNmo6oBORfcvz2Xbflxl7PIHau2Q8g0
         T9R8Z655NAaPitaHCN5N1foyW71CmmfB54u+Jal/azgDqycySOGgJfZrVFyoGiHIQcIB
         gW1BFb1cU1y0V8POLKfGZvqvDRdT3YCiMPiMxfvOYYYKH+rN9UkrzXaQlq9NcGOCHGt+
         4GzkY+fsSY4cMDDpK2vsP1eL9xG2a3Zo3QCxOjW2wYKRIKoBOH47rMmaCU9xIIMUrNfo
         ySRTqVwMnk76JPML8HUEdPBjRmAw1fOtwf7YKTtbdW3Nn3H3bCGCaw9z4hR989js7vTa
         eRFQ==
X-Gm-Message-State: AOAM530X7zCbikcpClev6I3rjE2LYOJ7UgQxABH85AE9ubfuZ9pfsdhT
	Ecg9hKt6QbosN15uuCrRRwoRq02jp87Qdg==
X-Google-Smtp-Source: ABdhPJxfLxllxF5z250zRW4iHwqMDiSI3pV9Pq1JG2y8XTIl7hlgwtxkoVUTgyAmsNl/wuQ3Qs4UOg==
X-Received: by 2002:aca:c501:: with SMTP id v1mr13597491oif.40.1592848866171;
        Mon, 22 Jun 2020 11:01:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.01.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:01:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/33] common-licenses: add BSD-2-Clause-Patent
Date: Mon, 22 Jun 2020 07:58:15 -1000
Message-Id: <f5b7bb5f34ad45400712d6190f1f836056c4bc18.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d6e8c4a63caefdf36dfbc9d230c9e8db4b43dc5a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../common-licenses/BSD-2-Clause-Patent.txt   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta/files/common-licenses/BSD-2-Clause-Patent.txt

diff --git a/meta/files/common-licenses/BSD-2-Clause-Patent.txt b/meta/files/common-licenses/BSD-2-Clause-Patent.txt
new file mode 100644
index 0000000000..1184c02957
--- /dev/null
+++ b/meta/files/common-licenses/BSD-2-Clause-Patent.txt
@@ -0,0 +1,47 @@
+Copyright (c) <YEAR> <COPYRIGHT HOLDERS>
+
+Redistribution and use in source and binary forms, with or without modification,
+are permitted provided that the following conditions are met:
+
+1. Redistributions of source code must retain the above copyright notice,
+this list of conditions and the following disclaimer.
+
+2. Redistributions in binary form must reproduce the above copyright notice,
+this list of conditions and the following disclaimer in the documentation
+and/or other materials provided with the distribution.
+
+Subject to the terms and conditions of this license, each copyright holder
+and contributor hereby grants to those receiving rights under this license
+a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable
+(except for failure to satisfy the conditions of this license) patent license
+to make, have made, use, offer to sell, sell, import, and otherwise transfer
+this software, where such license applies only to those patent claims, already
+acquired or hereafter acquired, licensable by such copyright holder or contributor
+that are necessarily infringed by:
+
+(a) their Contribution(s) (the licensed copyrights of copyright holders and
+non-copyrightable additions of contributors, in source or binary form) alone;
+or
+
+(b) combination of their Contribution(s) with the work of authorship to which
+such Contribution(s) was added by such copyright holder or contributor, if,
+at the time the Contribution is added, such addition causes such combination
+to be necessarily infringed. The patent license shall not apply to any other
+combinations which include the Contribution.
+
+Except as expressly stated above, no rights or licenses from any copyright
+holder or contributor is granted under this license, whether expressly, by
+implication, estoppel or otherwise.
+
+DISCLAIMER
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
+LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
+CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
+USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 
2.17.1

