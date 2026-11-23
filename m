Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48075.1795411938961945541
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ItKtRfEI;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so27054715e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 21:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795411937; x=1796016737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6NbGH93wwQPHr6JMwsA5va7R4glWF3vjSxKRBzvveAo=;
        b=ItKtRfEI6Kq4lX31UlQqDl2WfOJtlcZFGqXdIb8C6iYG9jsR/mVFAXBHfxyBzfQj65
         aj9a4LXsGpZIWVxMevWGtP3YVBdfKijGnpiBUDTeOo25biOxw8Jd/7CiKgPEOwZMVfjO
         8t0dvXnp8AQIQrscMzWA9WkAMU7jVz/1sNfF6Eaefy40MGncLwVCoE+P7FkHcuyb9auq
         AVJmkoi9900zvjcGDSECWuXkXzf9lOTVJyU84s7oE1u2UUVjF6OAQiohciZ5OR9qTyUF
         0Dk8/ok+sCzh6x+7X4AWizDZK/V2tdCe90fTenJYpvlFeCkB9IgZGVSHOlkSowOsl+OS
         /cUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411937; x=1796016737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6NbGH93wwQPHr6JMwsA5va7R4glWF3vjSxKRBzvveAo=;
        b=SYGVlWjzGhtBIGK4GV0J00AbnAiSgzoU/tCQfbB2X+h+jbQoPKiGH0W4YFPj4PtZm/
         OjwaUTpt+W2cdNGUPnAcjb9otwAZySbbVfqK0dChw8mLl5UrxZv4EaRkixpfilE0rp+x
         9hjINwg+V0Dwrz2z7y2wdqHrj7JibJf4er3P0SkysPt2DfawtEWKzzgXYH05o0XbwHP9
         awGqVuQUO9M2UvJIBfzpJcZTEwand/3jS/GeejJSIqxn7FFLHCgGR/IfzJAiX/KKMj/0
         4D4mWro/F5m7OtiCW1cpTXHjAd/bBX769Dz/HTLBDUWSvytxMLZpwN/qx9TrX/fXlkuh
         aJYg==
X-Gm-Message-State: APuU4Z+MtE/odzqtWyI6BC6qeSZkHuA3R6fYQsVftbg2jF4awYVeqt35
	El/ymeb83UawLPjviqy/qEXBpVBy5uriwyTjug00L6BSSxt4PnSNYHtMytUkEEaEcr+v4D8RYAq
	4SwmxRvc=
X-Gm-Gg: AZFdTZdgYrvyQQaltRE6gv0adWni5goomb5uZbOngzUY2Hf73f7kZ+M+bSi6UajO2Iq
	1U4WlfV0RENxjBnFKhuWnKYbABwY9TLGbOAGddCUV5zig+hoRSRV//FPRGbQhCZPexCOYVnhR5J
	byBTOcTgDpLyYU2kLzHm9bRDVuQ2vWIW63eLBQWMxCgWSp4MKUjD8NH9gp0flbu40lnbo15tVGH
	dvaZEaZCEtHcQP8vS3L4zsH5VYS3OC7QqS2iGvyT9RAkS7bqhBZukcewrlY9WZTW/tpimkACICM
	YT8b2mEMxVvTqtxuafffgkxAtjTXO9y64rY8/CEjXXlzyeG7t6/vCETNcHyvGKgYbasefgKuumm
	VBOUjmK1ha3HZJOb+cHVQJckKk/fYzQo58k3arOfDW1KNgk5hSw2unzwpPYjx4aMkzMjWuXQIvU
	YhawvojmbVGQz44MxjgrRdHxVtDNOzCQFHLpFHFmnSLz+mP2ESeJ/oiNPRIujKLXIEua/APLUY8
	JwCc+0r37/J8aBSnPTrod7jVI+dCbpBbtWkT6i8MdOLwTK0/tBH8azxVaLRR9QDeEBXOWYditIO
	ciXmai2svUET+T2+cIQ2o2C8YjyrDp3fwF6FH6QiJ3m41eVE4y8SCwXSlsnDP6f0+GBioiblUG8
	U3jz+B9swFAhFCwug7pqI8VzQp66CoeFk9h7BNEzuGKabnfF9jQhNg/4OfdPtXi4v49TIlk0Rg8
	pALcHclkFDneLV4DeRs26v
X-Received: by 2002:a05:600c:4f4c:b0:4bb:8503:69f4 with SMTP id 5b1f17b1804b1-4bb888097a2mr261773245e9.5.1795411936072;
        Sun, 22 Nov 2026 21:32:16 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from runner-ekioero5r-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm18933985f8f.22.2026.11.22.21.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:32:15 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for blacksail on Mon Nov 23 04:29:55 2026
Date: Mon, 23 Nov 2026 05:32:12 +0000
Message-ID: <20261123053215.22-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 05:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250878
Content-Type: text/plain; charset="utf-8"

Branch: blacksail

New this week: 460 CVEs
CVE-2026-35190 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-35190 *
CVE-2026-84786 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-84786 *
CVE-2026-95690 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-95690 *
CVE-2026-99289 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99289 *
CVE-2026-99291 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99291 *
CVE-2026-99292 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99292 *
CVE-2026-99293 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99293 *
CVE-2026-99295 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99295 *
CVE-2026-99296 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99296 *
CVE-2026-99297 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99297 *
CVE-2026-99298 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99298 *
CVE-2026-99299 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99299 *
CVE-2026-99300 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99300 *
CVE-2026-99301 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99301 *
CVE-2026-99302 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99302 *
CVE-2026-99303 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99303 *
CVE-2026-99304 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99304 *
CVE-2026-99305 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99305 *
CVE-2026-99306 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99306 *
CVE-2026-99307 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99307 *
CVE-2026-99308 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99308 *
CVE-2026-99310 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99310 *
CVE-2026-99314 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99314 *
CVE-2026-99315 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99315 *
CVE-2026-99316 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99316 *
CVE-2026-99317 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99317 *
CVE-2026-99318 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99318 *
CVE-2026-99319 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99319 *
CVE-2026-99320 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99320 *
CVE-2026-99322 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99322 *
CVE-2026-99323 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99323 *
CVE-2026-99324 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99324 *
CVE-2026-99325 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99325 *
CVE-2026-99326 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99326 *
CVE-2026-99327 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99327 *
CVE-2026-99329 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99329 *
CVE-2026-99331 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99331 *
CVE-2026-99333 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99333 *
CVE-2026-99334 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99334 *
CVE-2026-99335 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99335 *
CVE-2026-99337 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99337 *
CVE-2026-99338 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99338 *
CVE-2026-99339 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99339 *
CVE-2026-99340 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99340 *
CVE-2026-99341 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99341 *
CVE-2026-99342 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99342 *
CVE-2026-99343 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99343 *
CVE-2026-99344 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99344 *
CVE-2026-99345 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99345 *
CVE-2026-99346 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99346 *
CVE-2026-99347 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99347 *
CVE-2026-99348 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99348 *
CVE-2026-99349 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99349 *
CVE-2026-99351 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99351 *
CVE-2026-99352 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99352 *
CVE-2026-99353 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99353 *
CVE-2026-99354 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99354 *
CVE-2026-99357 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99357 *
CVE-2026-99358 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99358 *
CVE-2026-99359 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99359 *
CVE-2026-99360 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99360 *
CVE-2026-99361 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99361 *
CVE-2026-99362 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99362 *
CVE-2026-99363 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99363 *
CVE-2026-99364 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99364 *
CVE-2026-99365 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99365 *
CVE-2026-99366 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99366 *
CVE-2026-99367 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99367 *
CVE-2026-99369 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99369 *
CVE-2026-99371 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99371 *
CVE-2026-99372 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99372 *
CVE-2026-99373 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99373 *
CVE-2026-99374 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99374 *
CVE-2026-99375 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99375 *
CVE-2026-99376 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99376 *
CVE-2026-99377 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99377 *
CVE-2026-99378 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99378 *
CVE-2026-99379 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99379 *
CVE-2026-99380 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99380 *
CVE-2026-99381 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99381 *
CVE-2026-99382 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99382 *
CVE-2026-99383 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99383 *
CVE-2026-99384 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99384 *
CVE-2026-99385 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99385 *
CVE-2026-99387 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99387 *
CVE-2026-99389 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99389 *
CVE-2026-99390 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99390 *
CVE-2026-99391 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99391 *
CVE-2026-99392 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99392 *
CVE-2026-99393 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99393 *
CVE-2026-99394 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99394 *
CVE-2026-99395 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99395 *
CVE-2026-99396 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99396 *
CVE-2026-99397 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99397 *
CVE-2026-99398 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99398 *
CVE-2026-99399 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99399 *
CVE-2026-99400 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99400 *
CVE-2026-99401 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99401 *
CVE-2026-99403 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99403 *
CVE-2026-99404 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99404 *
CVE-2026-99405 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99405 *
CVE-2026-99406 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99406 *
CVE-2026-99407 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99407 *
CVE-2026-99408 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99408 *
CVE-2026-99409 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99409 *
CVE-2026-99410 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99410 *
CVE-2026-99411 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99411 *
CVE-2026-99412 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99412 *
CVE-2026-99413 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99413 *
CVE-2026-99414 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99414 *
CVE-2026-99415 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99415 *
CVE-2026-99416 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99416 *
CVE-2026-99419 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99419 *
CVE-2026-99420 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99420 *
CVE-2026-99421 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99421 *
CVE-2026-99422 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99422 *
CVE-2026-99423 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99423 *
CVE-2026-99424 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99424 *
CVE-2026-99425 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99425 *
CVE-2026-99426 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99426 *
CVE-2026-99427 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99427 *
CVE-2026-99428 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99428 *
CVE-2026-99429 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99429 *
CVE-2026-99430 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99430 *
CVE-2026-99432 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99432 *
CVE-2026-99433 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99433 *
CVE-2026-99434 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99434 *
CVE-2026-99438 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99438 *
CVE-2026-99441 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99441 *
CVE-2026-99443 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99443 *
CVE-2026-99444 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99444 *
CVE-2026-99445 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99445 *
CVE-2026-99446 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99446 *
CVE-2026-99447 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99447 *
CVE-2026-99448 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99448 *
CVE-2026-99449 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99449 *
CVE-2026-99450 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99450 *
CVE-2026-99451 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99451 *
CVE-2026-99452 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99452 *
CVE-2026-99453 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99453 *
CVE-2026-99454 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99454 *
CVE-2026-99455 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99455 *
CVE-2026-99456 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99456 *
CVE-2026-99457 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99457 *
CVE-2026-99458 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99458 *
CVE-2026-99459 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99459 *
CVE-2026-99460 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99460 *
CVE-2026-99461 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99461 *
CVE-2026-99462 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99462 *
CVE-2026-99463 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99463 *
CVE-2026-99464 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99464 *
CVE-2026-99465 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99465 *
CVE-2026-99466 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99466 *
CVE-2026-99467 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99467 *
CVE-2026-99469 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99469 *
CVE-2026-99470 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99470 *
CVE-2026-99471 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99471 *
CVE-2026-99472 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99472 *
CVE-2026-99473 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99473 *
CVE-2026-99474 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99474 *
CVE-2026-99475 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99475 *
CVE-2026-99476 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99476 *
CVE-2026-99477 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99477 *
CVE-2026-99478 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99478 *
CVE-2026-99479 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99479 *
CVE-2026-99482 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99482 *
CVE-2026-99483 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99483 *
CVE-2026-99484 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99484 *
CVE-2026-99485 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99485 *
CVE-2026-99486 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99486 *
CVE-2026-99487 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99487 *
CVE-2026-99488 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99488 *
CVE-2026-99489 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99489 *
CVE-2026-99490 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99490 *
CVE-2026-99492 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99492 *
CVE-2026-99494 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99494 *
CVE-2026-99495 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99495 *
CVE-2026-99496 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99496 *
CVE-2026-99497 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99497 *
CVE-2026-99498 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99498 *
CVE-2026-99499 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99499 *
CVE-2026-99500 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99500 *
CVE-2026-99501 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99501 *
CVE-2026-99502 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99502 *
CVE-2026-99504 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99504 *
CVE-2026-99505 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99505 *
CVE-2026-99506 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99506 *
CVE-2026-99508 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99508 *
CVE-2026-99509 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99509 *
CVE-2026-99510 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99510 *
CVE-2026-99511 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99511 *
CVE-2026-99512 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99512 *
CVE-2026-99513 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99513 *
CVE-2026-99514 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99514 *
CVE-2026-99515 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99515 *
CVE-2026-99516 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99516 *
CVE-2026-99517 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99517 *
CVE-2026-99518 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99518 *
CVE-2026-99519 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99519 *
CVE-2026-99520 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99520 *
CVE-2026-99521 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99521 *
CVE-2026-99522 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99522 *
CVE-2026-99523 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99523 *
CVE-2026-99524 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99524 *
CVE-2026-99526 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99526 *
CVE-2026-99527 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99527 *
CVE-2026-99528 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99528 *
CVE-2026-99529 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99529 *
CVE-2026-99530 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99530 *
CVE-2026-99531 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99531 *
CVE-2026-99532 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99532 *
CVE-2026-99533 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99533 *
CVE-2026-99537 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99537 *
CVE-2026-99538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99538 *
CVE-2026-99540 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99540 *
CVE-2026-99542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99542 *
CVE-2026-99543 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99543 *
CVE-2026-99544 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99544 *
CVE-2026-99545 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99545 *
CVE-2026-99546 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99546 *
CVE-2026-99547 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99547 *
CVE-2026-99548 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99548 *
CVE-2026-99549 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99549 *
CVE-2026-99550 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99550 *
CVE-2026-99551 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99551 *
CVE-2026-99552 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99552 *
CVE-2026-99553 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99553 *
CVE-2026-99554 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99554 *
CVE-2026-99556 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99556 *
CVE-2026-99557 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99557 *
CVE-2026-99559 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99559 *
CVE-2026-99561 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99561 *
CVE-2026-99563 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99563 *
CVE-2026-99564 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99564 *
CVE-2026-99565 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99565 *
CVE-2026-99566 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99566 *
CVE-2026-99567 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99567 *
CVE-2026-99568 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99568 *
CVE-2026-99569 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99569 *
CVE-2026-99572 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99572 *
CVE-2026-99573 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99573 *
CVE-2026-99574 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99574 *
CVE-2026-99575 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99575 *
CVE-2026-99576 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99576 *
CVE-2026-99577 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99577 *
CVE-2026-99578 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99578 *
CVE-2026-99579 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99579 *
CVE-2026-99580 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99580 *
CVE-2026-99581 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99581 *
CVE-2026-99583 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99583 *
CVE-2026-99584 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99584 *
CVE-2026-99585 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99585 *
CVE-2026-99586 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99586 *
CVE-2026-99587 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99587 *
CVE-2026-99588 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99588 *
CVE-2026-99589 (CVSSv3: 8.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99589 *
CVE-2026-99590 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99590 *
CVE-2026-99591 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99591 *
CVE-2026-99592 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99592 *
CVE-2026-99593 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99593 *
CVE-2026-99595 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99595 *
CVE-2026-99598 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99598 *
CVE-2026-99599 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99599 *
CVE-2026-99601 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99601 *
CVE-2026-99602 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99602 *
CVE-2026-99603 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99603 *
CVE-2026-99605 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99605 *
CVE-2026-99606 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99606 *
CVE-2026-99607 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99607 *
CVE-2026-99608 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99608 *
CVE-2026-99609 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99609 *
CVE-2026-99610 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99610 *
CVE-2026-99611 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99611 *
CVE-2026-99612 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99612 *
CVE-2026-99613 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99613 *
CVE-2026-99614 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99614 *
CVE-2026-99615 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99615 *
CVE-2026-99616 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99616 *
CVE-2026-99617 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99617 *
CVE-2026-99618 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99618 *
CVE-2026-99619 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99619 *
CVE-2026-99620 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99620 *
CVE-2026-99621 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99621 *
CVE-2026-99622 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99622 *
CVE-2026-99623 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99623 *
CVE-2026-99624 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99624 *
CVE-2026-99625 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99625 *
CVE-2026-99626 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99626 *
CVE-2026-99627 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99627 *
CVE-2026-99628 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99628 *
CVE-2026-99629 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99629 *
CVE-2026-99630 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99630 *
CVE-2026-99632 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99632 *
CVE-2026-99633 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99633 *
CVE-2026-99634 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99634 *
CVE-2026-99637 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99637 *
CVE-2026-99638 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99638 *
CVE-2026-99639 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99639 *
CVE-2026-99640 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99640 *
CVE-2026-99641 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99641 *
CVE-2026-99642 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99642 *
CVE-2026-99643 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99643 *
CVE-2026-99644 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99644 *
CVE-2026-99645 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99645 *
CVE-2026-99646 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99646 *
CVE-2026-99647 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99647 *
CVE-2026-99648 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99648 *
CVE-2026-99649 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99649 *
CVE-2026-99650 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99650 *
CVE-2026-99651 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99651 *
CVE-2026-99652 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99652 *
CVE-2026-99653 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99653 *
CVE-2026-99655 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99655 *
CVE-2026-99656 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99656 *
CVE-2026-99657 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99657 *
CVE-2026-99658 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99658 *
CVE-2026-99659 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99659 *
CVE-2026-99660 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99660 *
CVE-2026-99663 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99663 *
CVE-2026-99664 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99664 *
CVE-2026-99665 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99665 *
CVE-2026-99666 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99666 *
CVE-2026-99667 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99667 *
CVE-2026-99668 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99668 *
CVE-2026-99669 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99669 *
CVE-2026-99670 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99670 *
CVE-2026-99671 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99671 *
CVE-2026-99672 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99672 *
CVE-2026-99674 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99674 *
CVE-2026-99675 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99675 *
CVE-2026-99677 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99677 *
CVE-2026-99678 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99678 *
CVE-2026-99679 (CVSSv3: 9.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99679 *
CVE-2026-99680 (CVSSv3: 9.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99680 *
CVE-2026-99683 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99683 *
CVE-2026-99684 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99684 *
CVE-2026-99685 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99685 *
CVE-2026-99686 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99686 *
CVE-2026-99688 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99688 *
CVE-2026-99689 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99689 *
CVE-2026-99691 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99691 *
CVE-2026-99692 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99692 *
CVE-2026-99693 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99693 *
CVE-2026-99694 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99694 *
CVE-2026-99695 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99695 *
CVE-2026-99696 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99696 *
CVE-2026-99697 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99697 *
CVE-2026-99698 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99698 *
CVE-2026-99699 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99699 *
CVE-2026-99700 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99700 *
CVE-2026-99701 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99701 *
CVE-2026-99702 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99702 *
CVE-2026-99703 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99703 *
CVE-2026-99704 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99704 *
CVE-2026-99705 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99705 *
CVE-2026-99706 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99706 *
CVE-2026-99707 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99707 *
CVE-2026-99708 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99708 *
CVE-2026-99710 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99710 *
CVE-2026-99712 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99712 *
CVE-2026-99713 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99713 *
CVE-2026-99714 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99714 *
CVE-2026-99716 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99716 *
CVE-2026-99717 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99717 *
CVE-2026-99718 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99718 *
CVE-2026-99719 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99719 *
CVE-2026-99720 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99720 *
CVE-2026-99721 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99721 *
CVE-2026-99724 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99724 *
CVE-2026-99725 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99725 *
CVE-2026-99727 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99727 *
CVE-2026-99728 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99728 *
CVE-2026-99729 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99729 *
CVE-2026-99730 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99730 *
CVE-2026-99732 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99732 *
CVE-2026-99733 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99733 *
CVE-2026-99734 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99734 *
CVE-2026-99735 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99735 *
CVE-2026-99736 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99736 *
CVE-2026-99737 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99737 *
CVE-2026-99738 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99738 *
CVE-2026-99739 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99739 *
CVE-2026-99741 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99741 *
CVE-2026-99742 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99742 *
CVE-2026-99743 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99743 *
CVE-2026-99744 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99744 *
CVE-2026-99745 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99745 *
CVE-2026-99746 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99746 *
CVE-2026-99747 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99747 *
CVE-2026-99749 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99749 *
CVE-2026-99750 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99750 *
CVE-2026-99751 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99751 *
CVE-2026-99752 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99752 *
CVE-2026-99753 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99753 *
CVE-2026-99754 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99754 *
CVE-2026-99755 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99755 *
CVE-2026-99756 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99756 *
CVE-2026-99757 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99757 *
CVE-2026-99758 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99758 *
CVE-2026-99759 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99759 *
CVE-2026-99760 (CVSSv3: 7.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99760 *
CVE-2026-99761 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99761 *
CVE-2026-99762 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99762 *
CVE-2026-99763 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99763 *
CVE-2026-99764 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99764 *
CVE-2026-99766 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99766 *
CVE-2026-99767 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99767 *
CVE-2026-99769 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99769 *
CVE-2026-99770 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99770 *
CVE-2026-99771 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99771 *
CVE-2026-99772 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99772 *
CVE-2026-99773 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99773 *
CVE-2026-99774 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99774 *
CVE-2026-99775 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99775 *
CVE-2026-99776 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99776 *
CVE-2026-99777 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99777 *
CVE-2026-99778 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99778 *
CVE-2026-99779 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99779 *
CVE-2026-99780 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99780 *
CVE-2026-99781 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99781 *
CVE-2026-99782 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99782 *
CVE-2026-99783 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99783 *
CVE-2026-99785 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99785 *
CVE-2026-99786 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99786 *
CVE-2026-99787 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99787 *
CVE-2026-99788 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99788 *
CVE-2026-99789 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99789 *
CVE-2026-99790 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99790 *
CVE-2026-99791 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99791 *
CVE-2026-99792 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99792 *
CVE-2026-99793 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99793 *
CVE-2026-99794 (CVSSv3: 8.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99794 *
CVE-2026-99795 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99795 *
CVE-2026-99796 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99796 *
CVE-2026-99797 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99797 *
CVE-2026-99798 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99798 *
CVE-2026-99799 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99799 *
CVE-2026-99800 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99800 *
CVE-2026-99801 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99801 *
CVE-2026-99802 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99802 *
CVE-2026-99803 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99803 *
CVE-2026-107493 (CVSSv3: 7.7): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-107493 *
CVE-2026-107494 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-107494 *
CVE-2026-109908 (CVSSv3: 7.8): libfontenc:libfontenc-native https://nvd.nist.gov/vuln/detail/CVE-2026-109908 *
CVE-2026-109909 (CVSSv3: 6.1): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-109909 *
CVE-2026-109920 (CVSSv3: 5.5): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-109920 *
CVE-2026-111760 (CVSSv3: 8.0): git:git-native https://nvd.nist.gov/vuln/detail/CVE-2026-111760 *
CVE-2026-121481 (CVSSv3: 5.9): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-121481 *
CVE-2026-121482 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-121482 *
CVE-2026-121758 (CVSSv3: 5.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-121758 *
CVE-2026-124709 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-124709 *
CVE-2026-126765 (CVSSv3: 3.7): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-126765 *
CVE-2026-127039 (CVSSv3: 5.9): gnutls:gnutls-native https://nvd.nist.gov/vuln/detail/CVE-2026-127039 *
CVE-2026-127040 (CVSSv3: 5.9): gnutls:gnutls-native https://nvd.nist.gov/vuln/detail/CVE-2026-127040 *
CVE-2026-127231 (CVSSv3: 5.9): gnutls:gnutls-native https://nvd.nist.gov/vuln/detail/CVE-2026-127231 *
CVE-2026-130335 (CVSSv3: 2.9): zip:zip-native https://nvd.nist.gov/vuln/detail/CVE-2026-130335 *
CVE-2026-132825 (CVSSv3: 7.4): ruby:ruby-native https://nvd.nist.gov/vuln/detail/CVE-2026-132825 *
CVE-2026-133519 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-133519 *
CVE-2026-134703 (CVSSv3: 3.7, CVSSv4: 6.3): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-134703 *
CVE-2026-134832 (CVSSv3: 3.3, CVSSv4: 4.8): vim:vim-tiny https://nvd.nist.gov/vuln/detail/CVE-2026-134832 *

Removed this week: 1 CVEs
CVE-2026-99283 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99283 *

Full list: Found 864 unpatched CVEs
CVE-2019-14899 (CVSSv2: 4.9, CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-14899 *
CVE-2020-10774 (CVSSv2: 2.1, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-10774 *
CVE-2020-27748 (CVSSv2: 4.3, CVSSv3: 6.5): xdg-utils https://nvd.nist.gov/vuln/detail/CVE-2020-27748 *
CVE-2021-3714 (CVSSv3: 5.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3714 *
CVE-2021-3864 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3864 *
CVE-2022-4543 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4543 *
CVE-2023-3397 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3397 *
CVE-2023-3640 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3640 *
CVE-2023-6238 (CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6238 *
CVE-2023-6240 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6240 *
CVE-2024-2236 (CVSSv3: 5.9): libgcrypt:libgcrypt-native https://nvd.nist.gov/vuln/detail/CVE-2024-2236 *
CVE-2024-47850 (CVSSv3: 7.5): cups https://nvd.nist.gov/vuln/detail/CVE-2024-47850 *
CVE-2024-50613 (CVSSv3: 6.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2024-50613 *
CVE-2025-15367 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15367 *
CVE-2025-52194 (CVSSv3: 7.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2025-52194 *
CVE-2026-3099 (CVSSv3: 7.3): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3099 *
CVE-2026-3632 (CVSSv3: 5.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3632 *
CVE-2026-3633 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3633 *
CVE-2026-3634 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3634 *
CVE-2026-5673 (CVSSv3: 7.1): libtheora https://nvd.nist.gov/vuln/detail/CVE-2026-5673 *
CVE-2026-6844 (CVSSv3: 5.5): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6844 *
CVE-2026-6845 (CVSSv3: 5.0): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6845 *
CVE-2026-12548 (CVSSv3: 4.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12548 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-14968 (CVSSv4: 7.0): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2026-14968 *
CVE-2026-15534 (CVSSv3: 5.7): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-15534 *
CVE-2026-16052 (CVSSv4: 2.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-16052 *
CVE-2026-17025 (CVSSv3: 6.4): graphene https://nvd.nist.gov/vuln/detail/CVE-2026-17025 *
CVE-2026-18448 (CVSSv4: 5.6): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2026-18448 *
CVE-2026-18477 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18477 *
CVE-2026-18487 (CVSSv3: 5.4): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-18487 *
CVE-2026-18508 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18508 *
CVE-2026-18839 (CVSSv3: 2.2): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18839 *
CVE-2026-19547 (CVSSv4: 7.0): ghostscript https://nvd.nist.gov/vuln/detail/CVE-2026-19547 *
CVE-2026-19552 (CVSS: N/A): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19552 *
CVE-2026-19672 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19672 *
CVE-2026-28529 (CVSSv3: 7.8, CVSSv4: 8.5): cryptodev-linux https://nvd.nist.gov/vuln/detail/CVE-2026-28529 *
CVE-2026-35190 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-35190 *
CVE-2026-38752 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38752 *
CVE-2026-38753 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38753 *
CVE-2026-38755 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38755 *
CVE-2026-39919 (CVSSv3: 9.8, CVSSv4: 9.3): ghostscript https://nvd.nist.gov/vuln/detail/CVE-2026-39919 *
CVE-2026-53613 (CVSSv3: 7.0): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://nvd.nist.gov/vuln/detail/CVE-2026-53613 *
CVE-2026-66337 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66337 *
CVE-2026-66338 (CVSSv3: 7.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66338 *
CVE-2026-66339 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66339 *
CVE-2026-68086 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68086 *
CVE-2026-71971 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71971 *
CVE-2026-71972 (CVSSv3: 5.9, CVSSv4: 6.0): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71972 *
CVE-2026-71973 (CVSSv3: 5.2, CVSSv4: 5.2): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71973 *
CVE-2026-71974 (CVSSv3: 4.8, CVSSv4: 4.3): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71974 *
CVE-2026-74220 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74220 *
CVE-2026-74221 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74221 *
CVE-2026-74222 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74222 *
CVE-2026-74225 (CVSSv3: 7.1, CVSSv4: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74225 *
CVE-2026-75818 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75818 *
CVE-2026-75819 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75819 *
CVE-2026-75820 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75820 *
CVE-2026-78376 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-78376 *
CVE-2026-82474 (CVSSv3: 7.8, CVSSv4: 8.5): sudo https://nvd.nist.gov/vuln/detail/CVE-2026-82474 *
CVE-2026-82560 (CVSSv3: 7.5): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-82560 *
CVE-2026-83596 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-83596 *
CVE-2026-84243 (CVSSv3: 7.0): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-84243 *
CVE-2026-84786 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-84786 *
CVE-2026-85091 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-85091 *
CVE-2026-86410 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-86410 *
CVE-2026-86412 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-86412 *
CVE-2026-86413 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-86413 *
CVE-2026-86414 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-86414 *
CVE-2026-86415 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-86415 *
CVE-2026-87861 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-87861 *
CVE-2026-87862 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-87862 *
CVE-2026-87863 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-87863 *
CVE-2026-87865 (CVSSv3: 7.4): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-87865 *
CVE-2026-87866 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-87866 *
CVE-2026-88806 (CVSSv3: 7.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-88806 *
CVE-2026-88807 (CVSSv4: 8.9): libxrender:libxrender-native https://nvd.nist.gov/vuln/detail/CVE-2026-88807 *
CVE-2026-88812 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-88812 *
CVE-2026-88822 (CVSSv3: 6.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-88822 *
CVE-2026-88823 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-88823 *
CVE-2026-90801 (CVSSv2: 4.3, CVSSv3: 6.6, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90801 *
CVE-2026-90802 (CVSSv2: 3.2, CVSSv3: 4.4, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90802 *
CVE-2026-90803 (CVSSv2: 4.3, CVSSv3: 6.8, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90803 *
CVE-2026-90804 (CVSSv2: 4.3, CVSSv3: 6.1, CVSSv4: 2.4): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90804 *
CVE-2026-90828 (CVSSv2: 4.3, CVSSv3: 6.6, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90828 *
CVE-2026-90829 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90829 *
CVE-2026-90830 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90830 *
CVE-2026-90831 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90831 *
CVE-2026-91779 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91779 *
CVE-2026-91780 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91780 *
CVE-2026-91781 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91781 *
CVE-2026-91782 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91782 *
CVE-2026-92386 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92386 *
CVE-2026-92387 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92387 *
CVE-2026-92390 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92390 *
CVE-2026-92391 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92391 *
CVE-2026-92392 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92392 *
CVE-2026-93515 (CVSSv4: 6.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93515 *
CVE-2026-93516 (CVSSv3: 5.5): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93516 *
CVE-2026-93517 (CVSSv4: 8.5): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93517 *
CVE-2026-93518 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93518 *
CVE-2026-93519 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93519 *
CVE-2026-93520 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93520 *
CVE-2026-93521 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93521 *
CVE-2026-93522 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93522 *
CVE-2026-93523 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93523 *
CVE-2026-93524 (CVSSv4: 6.9): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93524 *
CVE-2026-93536 (CVSSv3: 5.3): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93536 *
CVE-2026-93541 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93541 *
CVE-2026-93542 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93542 *
CVE-2026-93543 (CVSSv3: 7.4): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93543 *
CVE-2026-93544 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93544 *
CVE-2026-93545 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93545 *
CVE-2026-94265 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-94265 *
CVE-2026-94266 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-94266 *
CVE-2026-94281 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-94281 *
CVE-2026-94282 (CVSSv3: 5.6): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-94282 *
CVE-2026-94283 (CVSSv3: 6.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94283 *
CVE-2026-94284 (CVSSv3: 5.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94284 *
CVE-2026-94285 (CVSSv3: 5.1): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94285 *
CVE-2026-94286 (CVSSv3: 7.1): libxtst:libxtst-native https://nvd.nist.gov/vuln/detail/CVE-2026-94286 *
CVE-2026-95690 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-95690 *
CVE-2026-95691 (CVSSv3: 8.1): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-95691 *
CVE-2026-95692 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-95692 *
CVE-2026-96674 (CVSSv3: 4.4, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-96674 *
CVE-2026-96675 (CVSSv3: 3.3, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-96675 *
CVE-2026-97033 (CVSSv3: 8.8): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97033 *
CVE-2026-97034 (CVSSv3: 8.8): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97034 *
CVE-2026-97035 (CVSSv3: 8.8): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97035 *
CVE-2026-97036 (CVSSv3: 8.8): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97036 *
CVE-2026-97037 (CVSSv3: 8.8): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97037 *
CVE-2026-97038 (CVSSv3: 8.8): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97038 *
CVE-2026-97039 (CVSSv3: 8.3): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97039 *
CVE-2026-97040 (CVSSv3: 9.8): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97040 *
CVE-2026-97042 (CVSSv3: 8.8): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97042 *
CVE-2026-97043 (CVSSv3: 8.8): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97043 *
CVE-2026-97054 (CVSSv3: 5.9): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97054 *
CVE-2026-97229 (CVSSv3: 10.0): ruby:ruby-native https://nvd.nist.gov/vuln/detail/CVE-2026-97229 *
CVE-2026-97631 (CVSSv4: 9.5): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2026-97631 *
CVE-2026-97876 (CVSSv3: 6.4): grub:grub-efi:grub-native https://nvd.nist.gov/vuln/detail/CVE-2026-97876 *
CVE-2026-98869 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98869 *
CVE-2026-99218 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99218 *
CVE-2026-99219 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99219 *
CVE-2026-99220 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99220 *
CVE-2026-99221 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99221 *
CVE-2026-99222 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99222 *
CVE-2026-99223 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99223 *
CVE-2026-99224 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99224 *
CVE-2026-99225 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99225 *
CVE-2026-99226 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99226 *
CVE-2026-99227 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99227 *
CVE-2026-99228 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99228 *
CVE-2026-99229 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99229 *
CVE-2026-99230 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99230 *
CVE-2026-99231 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99231 *
CVE-2026-99232 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99232 *
CVE-2026-99233 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99233 *
CVE-2026-99234 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99234 *
CVE-2026-99235 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99235 *
CVE-2026-99236 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99236 *
CVE-2026-99237 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99237 *
CVE-2026-99238 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99238 *
CVE-2026-99239 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99239 *
CVE-2026-99240 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99240 *
CVE-2026-99241 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99241 *
CVE-2026-99242 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99242 *
CVE-2026-99244 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99244 *
CVE-2026-99245 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99245 *
CVE-2026-99253 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99253 *
CVE-2026-99254 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99254 *
CVE-2026-99255 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99255 *
CVE-2026-99269 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99269 *
CVE-2026-99271 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99271 *
CVE-2026-99272 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99272 *
CVE-2026-99273 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99273 *
CVE-2026-99274 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99274 *
CVE-2026-99275 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99275 *
CVE-2026-99276 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99276 *
CVE-2026-99277 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99277 *
CVE-2026-99278 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99278 *
CVE-2026-99279 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99279 *
CVE-2026-99280 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99280 *
CVE-2026-99281 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99281 *
CVE-2026-99282 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99282 *
CVE-2026-99284 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99284 *
CVE-2026-99287 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99287 *
CVE-2026-99288 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99288 *
CVE-2026-99289 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99289 *
CVE-2026-99291 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99291 *
CVE-2026-99292 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99292 *
CVE-2026-99293 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99293 *
CVE-2026-99295 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99295 *
CVE-2026-99296 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99296 *
CVE-2026-99297 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99297 *
CVE-2026-99298 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99298 *
CVE-2026-99299 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99299 *
CVE-2026-99300 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99300 *
CVE-2026-99301 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99301 *
CVE-2026-99302 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99302 *
CVE-2026-99303 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99303 *
CVE-2026-99304 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99304 *
CVE-2026-99305 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99305 *
CVE-2026-99306 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99306 *
CVE-2026-99307 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99307 *
CVE-2026-99308 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99308 *
CVE-2026-99310 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99310 *
CVE-2026-99314 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99314 *
CVE-2026-99315 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99315 *
CVE-2026-99316 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99316 *
CVE-2026-99317 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99317 *
CVE-2026-99318 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99318 *
CVE-2026-99319 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99319 *
CVE-2026-99320 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99320 *
CVE-2026-99322 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99322 *
CVE-2026-99323 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99323 *
CVE-2026-99324 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99324 *
CVE-2026-99325 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99325 *
CVE-2026-99326 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99326 *
CVE-2026-99327 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99327 *
CVE-2026-99329 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99329 *
CVE-2026-99331 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99331 *
CVE-2026-99333 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99333 *
CVE-2026-99334 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99334 *
CVE-2026-99335 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99335 *
CVE-2026-99337 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99337 *
CVE-2026-99338 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99338 *
CVE-2026-99339 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99339 *
CVE-2026-99340 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99340 *
CVE-2026-99341 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99341 *
CVE-2026-99342 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99342 *
CVE-2026-99343 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99343 *
CVE-2026-99344 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99344 *
CVE-2026-99345 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99345 *
CVE-2026-99346 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99346 *
CVE-2026-99347 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99347 *
CVE-2026-99348 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99348 *
CVE-2026-99349 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99349 *
CVE-2026-99351 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99351 *
CVE-2026-99352 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99352 *
CVE-2026-99353 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99353 *
CVE-2026-99354 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99354 *
CVE-2026-99357 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99357 *
CVE-2026-99358 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99358 *
CVE-2026-99359 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99359 *
CVE-2026-99360 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99360 *
CVE-2026-99361 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99361 *
CVE-2026-99362 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99362 *
CVE-2026-99363 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99363 *
CVE-2026-99364 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99364 *
CVE-2026-99365 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99365 *
CVE-2026-99366 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99366 *
CVE-2026-99367 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99367 *
CVE-2026-99369 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99369 *
CVE-2026-99371 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99371 *
CVE-2026-99372 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99372 *
CVE-2026-99373 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99373 *
CVE-2026-99374 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99374 *
CVE-2026-99375 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99375 *
CVE-2026-99376 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99376 *
CVE-2026-99377 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99377 *
CVE-2026-99378 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99378 *
CVE-2026-99379 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99379 *
CVE-2026-99380 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99380 *
CVE-2026-99381 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99381 *
CVE-2026-99382 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99382 *
CVE-2026-99383 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99383 *
CVE-2026-99384 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99384 *
CVE-2026-99385 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99385 *
CVE-2026-99387 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99387 *
CVE-2026-99389 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99389 *
CVE-2026-99390 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99390 *
CVE-2026-99391 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99391 *
CVE-2026-99392 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99392 *
CVE-2026-99393 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99393 *
CVE-2026-99394 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99394 *
CVE-2026-99395 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99395 *
CVE-2026-99396 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99396 *
CVE-2026-99397 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99397 *
CVE-2026-99398 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99398 *
CVE-2026-99399 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99399 *
CVE-2026-99400 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99400 *
CVE-2026-99401 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99401 *
CVE-2026-99403 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99403 *
CVE-2026-99404 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99404 *
CVE-2026-99405 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99405 *
CVE-2026-99406 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99406 *
CVE-2026-99407 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99407 *
CVE-2026-99408 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99408 *
CVE-2026-99409 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99409 *
CVE-2026-99410 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99410 *
CVE-2026-99411 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99411 *
CVE-2026-99412 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99412 *
CVE-2026-99413 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99413 *
CVE-2026-99414 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99414 *
CVE-2026-99415 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99415 *
CVE-2026-99416 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99416 *
CVE-2026-99419 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99419 *
CVE-2026-99420 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99420 *
CVE-2026-99421 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99421 *
CVE-2026-99422 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99422 *
CVE-2026-99423 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99423 *
CVE-2026-99424 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99424 *
CVE-2026-99425 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99425 *
CVE-2026-99426 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99426 *
CVE-2026-99427 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99427 *
CVE-2026-99428 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99428 *
CVE-2026-99429 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99429 *
CVE-2026-99430 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99430 *
CVE-2026-99432 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99432 *
CVE-2026-99433 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99433 *
CVE-2026-99434 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99434 *
CVE-2026-99438 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99438 *
CVE-2026-99441 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99441 *
CVE-2026-99443 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99443 *
CVE-2026-99444 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99444 *
CVE-2026-99445 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99445 *
CVE-2026-99446 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99446 *
CVE-2026-99447 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99447 *
CVE-2026-99448 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99448 *
CVE-2026-99449 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99449 *
CVE-2026-99450 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99450 *
CVE-2026-99451 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99451 *
CVE-2026-99452 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99452 *
CVE-2026-99453 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99453 *
CVE-2026-99454 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99454 *
CVE-2026-99455 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99455 *
CVE-2026-99456 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99456 *
CVE-2026-99457 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99457 *
CVE-2026-99458 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99458 *
CVE-2026-99459 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99459 *
CVE-2026-99460 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99460 *
CVE-2026-99461 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99461 *
CVE-2026-99462 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99462 *
CVE-2026-99463 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99463 *
CVE-2026-99464 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99464 *
CVE-2026-99465 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99465 *
CVE-2026-99466 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99466 *
CVE-2026-99467 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99467 *
CVE-2026-99469 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99469 *
CVE-2026-99470 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99470 *
CVE-2026-99471 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99471 *
CVE-2026-99472 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99472 *
CVE-2026-99473 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99473 *
CVE-2026-99474 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99474 *
CVE-2026-99475 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99475 *
CVE-2026-99476 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99476 *
CVE-2026-99477 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99477 *
CVE-2026-99478 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99478 *
CVE-2026-99479 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99479 *
CVE-2026-99482 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99482 *
CVE-2026-99483 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99483 *
CVE-2026-99484 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99484 *
CVE-2026-99485 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99485 *
CVE-2026-99486 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99486 *
CVE-2026-99487 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99487 *
CVE-2026-99488 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99488 *
CVE-2026-99489 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99489 *
CVE-2026-99490 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99490 *
CVE-2026-99492 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99492 *
CVE-2026-99494 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99494 *
CVE-2026-99495 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99495 *
CVE-2026-99496 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99496 *
CVE-2026-99497 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99497 *
CVE-2026-99498 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99498 *
CVE-2026-99499 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99499 *
CVE-2026-99500 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99500 *
CVE-2026-99501 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99501 *
CVE-2026-99502 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99502 *
CVE-2026-99504 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99504 *
CVE-2026-99505 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99505 *
CVE-2026-99506 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99506 *
CVE-2026-99508 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99508 *
CVE-2026-99509 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99509 *
CVE-2026-99510 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99510 *
CVE-2026-99511 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99511 *
CVE-2026-99512 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99512 *
CVE-2026-99513 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99513 *
CVE-2026-99514 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99514 *
CVE-2026-99515 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99515 *
CVE-2026-99516 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99516 *
CVE-2026-99517 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99517 *
CVE-2026-99518 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99518 *
CVE-2026-99519 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99519 *
CVE-2026-99520 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99520 *
CVE-2026-99521 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99521 *
CVE-2026-99522 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99522 *
CVE-2026-99523 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99523 *
CVE-2026-99524 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99524 *
CVE-2026-99526 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99526 *
CVE-2026-99527 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99527 *
CVE-2026-99528 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99528 *
CVE-2026-99529 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99529 *
CVE-2026-99530 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99530 *
CVE-2026-99531 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99531 *
CVE-2026-99532 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99532 *
CVE-2026-99533 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99533 *
CVE-2026-99537 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99537 *
CVE-2026-99538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99538 *
CVE-2026-99540 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99540 *
CVE-2026-99542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99542 *
CVE-2026-99543 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99543 *
CVE-2026-99544 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99544 *
CVE-2026-99545 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99545 *
CVE-2026-99546 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99546 *
CVE-2026-99547 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99547 *
CVE-2026-99548 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99548 *
CVE-2026-99549 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99549 *
CVE-2026-99550 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99550 *
CVE-2026-99551 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99551 *
CVE-2026-99552 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99552 *
CVE-2026-99553 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99553 *
CVE-2026-99554 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99554 *
CVE-2026-99556 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99556 *
CVE-2026-99557 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99557 *
CVE-2026-99559 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99559 *
CVE-2026-99561 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99561 *
CVE-2026-99563 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99563 *
CVE-2026-99564 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99564 *
CVE-2026-99565 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99565 *
CVE-2026-99566 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99566 *
CVE-2026-99567 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99567 *
CVE-2026-99568 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99568 *
CVE-2026-99569 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99569 *
CVE-2026-99572 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99572 *
CVE-2026-99573 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99573 *
CVE-2026-99574 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99574 *
CVE-2026-99575 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99575 *
CVE-2026-99576 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99576 *
CVE-2026-99577 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99577 *
CVE-2026-99578 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99578 *
CVE-2026-99579 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99579 *
CVE-2026-99580 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99580 *
CVE-2026-99581 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99581 *
CVE-2026-99583 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99583 *
CVE-2026-99584 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99584 *
CVE-2026-99585 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99585 *
CVE-2026-99586 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99586 *
CVE-2026-99587 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99587 *
CVE-2026-99588 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99588 *
CVE-2026-99589 (CVSSv3: 8.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99589 *
CVE-2026-99590 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99590 *
CVE-2026-99591 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99591 *
CVE-2026-99592 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99592 *
CVE-2026-99593 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99593 *
CVE-2026-99595 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99595 *
CVE-2026-99598 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99598 *
CVE-2026-99599 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99599 *
CVE-2026-99601 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99601 *
CVE-2026-99602 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99602 *
CVE-2026-99603 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99603 *
CVE-2026-99605 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99605 *
CVE-2026-99606 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99606 *
CVE-2026-99607 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99607 *
CVE-2026-99608 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99608 *
CVE-2026-99609 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99609 *
CVE-2026-99610 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99610 *
CVE-2026-99611 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99611 *
CVE-2026-99612 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99612 *
CVE-2026-99613 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99613 *
CVE-2026-99614 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99614 *
CVE-2026-99615 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99615 *
CVE-2026-99616 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99616 *
CVE-2026-99617 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99617 *
CVE-2026-99618 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99618 *
CVE-2026-99619 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99619 *
CVE-2026-99620 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99620 *
CVE-2026-99621 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99621 *
CVE-2026-99622 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99622 *
CVE-2026-99623 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99623 *
CVE-2026-99624 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99624 *
CVE-2026-99625 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99625 *
CVE-2026-99626 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99626 *
CVE-2026-99627 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99627 *
CVE-2026-99628 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99628 *
CVE-2026-99629 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99629 *
CVE-2026-99630 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99630 *
CVE-2026-99632 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99632 *
CVE-2026-99633 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99633 *
CVE-2026-99634 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99634 *
CVE-2026-99637 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99637 *
CVE-2026-99638 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99638 *
CVE-2026-99639 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99639 *
CVE-2026-99640 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99640 *
CVE-2026-99641 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99641 *
CVE-2026-99642 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99642 *
CVE-2026-99643 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99643 *
CVE-2026-99644 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99644 *
CVE-2026-99645 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99645 *
CVE-2026-99646 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99646 *
CVE-2026-99647 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99647 *
CVE-2026-99648 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99648 *
CVE-2026-99649 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99649 *
CVE-2026-99650 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99650 *
CVE-2026-99651 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99651 *
CVE-2026-99652 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99652 *
CVE-2026-99653 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99653 *
CVE-2026-99655 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99655 *
CVE-2026-99656 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99656 *
CVE-2026-99657 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99657 *
CVE-2026-99658 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99658 *
CVE-2026-99659 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99659 *
CVE-2026-99660 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99660 *
CVE-2026-99663 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99663 *
CVE-2026-99664 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99664 *
CVE-2026-99665 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99665 *
CVE-2026-99666 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99666 *
CVE-2026-99667 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99667 *
CVE-2026-99668 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99668 *
CVE-2026-99669 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99669 *
CVE-2026-99670 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99670 *
CVE-2026-99671 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99671 *
CVE-2026-99672 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99672 *
CVE-2026-99674 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99674 *
CVE-2026-99675 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99675 *
CVE-2026-99677 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99677 *
CVE-2026-99678 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99678 *
CVE-2026-99679 (CVSSv3: 9.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99679 *
CVE-2026-99680 (CVSSv3: 9.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99680 *
CVE-2026-99683 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99683 *
CVE-2026-99684 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99684 *
CVE-2026-99685 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99685 *
CVE-2026-99686 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99686 *
CVE-2026-99688 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99688 *
CVE-2026-99689 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99689 *
CVE-2026-99691 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99691 *
CVE-2026-99692 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99692 *
CVE-2026-99693 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99693 *
CVE-2026-99694 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99694 *
CVE-2026-99695 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99695 *
CVE-2026-99696 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99696 *
CVE-2026-99697 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99697 *
CVE-2026-99698 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99698 *
CVE-2026-99699 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99699 *
CVE-2026-99700 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99700 *
CVE-2026-99701 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99701 *
CVE-2026-99702 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99702 *
CVE-2026-99703 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99703 *
CVE-2026-99704 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99704 *
CVE-2026-99705 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99705 *
CVE-2026-99706 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99706 *
CVE-2026-99707 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99707 *
CVE-2026-99708 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99708 *
CVE-2026-99710 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99710 *
CVE-2026-99712 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99712 *
CVE-2026-99713 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99713 *
CVE-2026-99714 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99714 *
CVE-2026-99716 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99716 *
CVE-2026-99717 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99717 *
CVE-2026-99718 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99718 *
CVE-2026-99719 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99719 *
CVE-2026-99720 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99720 *
CVE-2026-99721 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99721 *
CVE-2026-99724 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99724 *
CVE-2026-99725 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99725 *
CVE-2026-99727 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99727 *
CVE-2026-99728 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99728 *
CVE-2026-99729 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99729 *
CVE-2026-99730 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99730 *
CVE-2026-99732 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99732 *
CVE-2026-99733 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99733 *
CVE-2026-99734 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99734 *
CVE-2026-99735 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99735 *
CVE-2026-99736 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99736 *
CVE-2026-99737 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99737 *
CVE-2026-99738 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99738 *
CVE-2026-99739 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99739 *
CVE-2026-99741 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99741 *
CVE-2026-99742 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99742 *
CVE-2026-99743 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99743 *
CVE-2026-99744 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99744 *
CVE-2026-99745 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99745 *
CVE-2026-99746 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99746 *
CVE-2026-99747 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99747 *
CVE-2026-99749 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99749 *
CVE-2026-99750 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99750 *
CVE-2026-99751 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99751 *
CVE-2026-99752 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99752 *
CVE-2026-99753 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99753 *
CVE-2026-99754 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99754 *
CVE-2026-99755 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99755 *
CVE-2026-99756 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99756 *
CVE-2026-99757 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99757 *
CVE-2026-99758 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99758 *
CVE-2026-99759 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99759 *
CVE-2026-99760 (CVSSv3: 7.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99760 *
CVE-2026-99761 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99761 *
CVE-2026-99762 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99762 *
CVE-2026-99763 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99763 *
CVE-2026-99764 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99764 *
CVE-2026-99766 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99766 *
CVE-2026-99767 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99767 *
CVE-2026-99769 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99769 *
CVE-2026-99770 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99770 *
CVE-2026-99771 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99771 *
CVE-2026-99772 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99772 *
CVE-2026-99773 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99773 *
CVE-2026-99774 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99774 *
CVE-2026-99775 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99775 *
CVE-2026-99776 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99776 *
CVE-2026-99777 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99777 *
CVE-2026-99778 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99778 *
CVE-2026-99779 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99779 *
CVE-2026-99780 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99780 *
CVE-2026-99781 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99781 *
CVE-2026-99782 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99782 *
CVE-2026-99783 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99783 *
CVE-2026-99785 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99785 *
CVE-2026-99786 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99786 *
CVE-2026-99787 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99787 *
CVE-2026-99788 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99788 *
CVE-2026-99789 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99789 *
CVE-2026-99790 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99790 *
CVE-2026-99791 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99791 *
CVE-2026-99792 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99792 *
CVE-2026-99793 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99793 *
CVE-2026-99794 (CVSSv3: 8.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99794 *
CVE-2026-99795 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99795 *
CVE-2026-99796 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99796 *
CVE-2026-99797 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99797 *
CVE-2026-99798 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99798 *
CVE-2026-99799 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99799 *
CVE-2026-99800 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99800 *
CVE-2026-99801 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99801 *
CVE-2026-99802 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99802 *
CVE-2026-99803 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99803 *
CVE-2026-100080 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100080 *
CVE-2026-100081 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100081 *
CVE-2026-100082 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100082 *
CVE-2026-100290 (CVSSv3: 3.7): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-100290 *
CVE-2026-102555 (CVSSv3: 8.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102555 *
CVE-2026-102556 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102556 *
CVE-2026-102557 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102557 *
CVE-2026-102558 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102558 *
CVE-2026-102559 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102559 *
CVE-2026-102560 (CVSSv3: 9.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102560 *
CVE-2026-103658 (CVSSv3: 5.9): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-103658 *
CVE-2026-103995 (CVSSv4: 2.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-103995 *
CVE-2026-105437 (CVSSv3: 7.5): git:git-native https://nvd.nist.gov/vuln/detail/CVE-2026-105437 *
CVE-2026-105840 (CVSSv3: 7.5, CVSSv4: 7.7): lrzsz https://nvd.nist.gov/vuln/detail/CVE-2026-105840 *
CVE-2026-105841 (CVSSv3: 7.5, CVSSv4: 7.7): lrzsz https://nvd.nist.gov/vuln/detail/CVE-2026-105841 *
CVE-2026-105842 (CVSSv3: 6.4, CVSSv4: 6.1): lrzsz https://nvd.nist.gov/vuln/detail/CVE-2026-105842 *
CVE-2026-106552 (CVSSv3: 6.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106552 *
CVE-2026-106553 (CVSSv3: 7.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106553 *
CVE-2026-106555 (CVSSv3: 7.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106555 *
CVE-2026-106582 (CVSSv3: 3.7): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106582 *
CVE-2026-106583 (CVSSv3: 7.8): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106583 *
CVE-2026-106584 (CVSSv3: 3.3): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106584 *
CVE-2026-106585 (CVSSv3: 6.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106585 *
CVE-2026-106586 (CVSSv3: 4.3): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106586 *
CVE-2026-106587 (CVSSv3: 3.6): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106587 *
CVE-2026-106588 (CVSSv3: 3.1): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106588 *
CVE-2026-106589 (CVSSv3: 2.9): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106589 *
CVE-2026-107493 (CVSSv3: 7.7): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-107493 *
CVE-2026-107494 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-107494 *
CVE-2026-107496 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-107496 *
CVE-2026-107675 (CVSSv3: 5.9, CVSSv4: 6.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107675 *
CVE-2026-107676 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107676 *
CVE-2026-107677 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107677 *
CVE-2026-107678 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107678 *
CVE-2026-107696 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107696 *
CVE-2026-107885 (CVSSv3: 5.5): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107885 *
CVE-2026-107928 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-107928 *
CVE-2026-107929 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-107929 *
CVE-2026-109088 (CVSSv3: 6.5): libxtst:libxtst-native https://nvd.nist.gov/vuln/detail/CVE-2026-109088 *
CVE-2026-109089 (CVSSv3: 7.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-109089 *
CVE-2026-109090 (CVSSv3: 7.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-109090 *
CVE-2026-109091 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109091 *
CVE-2026-109092 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109092 *
CVE-2026-109093 (CVSSv4: 8.5): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109093 *
CVE-2026-109094 (CVSSv4: 8.5): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109094 *
CVE-2026-109095 (CVSSv4: 6.9): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109095 *
CVE-2026-109096 (CVSSv3: 5.5): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109096 *
CVE-2026-109518 (CVSSv4: 7.7): apt https://nvd.nist.gov/vuln/detail/CVE-2026-109518 *
CVE-2026-109828 (CVSSv2: 5.0, CVSSv3: 4.3, CVSSv4: 5.3): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2026-109828 *
CVE-2026-109903 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109903 *
CVE-2026-109904 (CVSSv4: 6.9): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109904 *
CVE-2026-109908 (CVSSv3: 7.8): libfontenc:libfontenc-native https://nvd.nist.gov/vuln/detail/CVE-2026-109908 *
CVE-2026-109909 (CVSSv3: 6.1): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-109909 *
CVE-2026-109920 (CVSSv3: 5.5): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-109920 *
CVE-2026-110855 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110855 *
CVE-2026-110856 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110856 *
CVE-2026-110857 (CVSSv3: 7.5, CVSSv4: 7.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110857 *
CVE-2026-110858 (CVSSv3: 8.1, CVSSv4: 9.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110858 *
CVE-2026-110859 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110859 *
CVE-2026-110860 (CVSSv3: 6.1, CVSSv4: 6.9): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110860 *
CVE-2026-111183 (CVSSv3: 9.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-111183 *
CVE-2026-111497 (CVSSv3: 9.8, CVSSv4: 9.2): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2026-111497 *
CVE-2026-111760 (CVSSv3: 8.0): git:git-native https://nvd.nist.gov/vuln/detail/CVE-2026-111760 *
CVE-2026-112271 (CVSSv3: 5.5, CVSSv4: 6.8): libdisplay-info https://nvd.nist.gov/vuln/detail/CVE-2026-112271 *
CVE-2026-112272 (CVSSv3: 5.5, CVSSv4: 6.8): libdisplay-info https://nvd.nist.gov/vuln/detail/CVE-2026-112272 *
CVE-2026-113351 (CVSSv3: 7.5, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-113351 *
CVE-2026-113408 (CVSSv3: 3.3): git:git-native https://nvd.nist.gov/vuln/detail/CVE-2026-113408 *
CVE-2026-113679 (CVSSv3: 7.0, CVSSv4: 7.3): harfbuzz:harfbuzz-native https://nvd.nist.gov/vuln/detail/CVE-2026-113679 *
CVE-2026-113680 (CVSSv3: 5.5, CVSSv4: 6.8): harfbuzz:harfbuzz-native https://nvd.nist.gov/vuln/detail/CVE-2026-113680 *
CVE-2026-114466 (CVSSv3: 4.4): git:git-native https://nvd.nist.gov/vuln/detail/CVE-2026-114466 *
CVE-2026-114467 (CVSSv3: 3.3): git:git-native https://nvd.nist.gov/vuln/detail/CVE-2026-114467 *
CVE-2026-114469 (CVSSv3: 4.4): git:git-native https://nvd.nist.gov/vuln/detail/CVE-2026-114469 *
CVE-2026-115506 (CVSSv3: 7.5, CVSSv4: 8.7): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-115506 *
CVE-2026-115559 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-115559 *
CVE-2026-115683 (CVSSv3: 6.8): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-115683 *
CVE-2026-115791 (CVSSv4: 5.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-115791 *
CVE-2026-115819 (CVSSv3: 4.8): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-115819 *
CVE-2026-115863 (CVSSv3: 7.6): connman https://nvd.nist.gov/vuln/detail/CVE-2026-115863 *
CVE-2026-116566 (CVSSv4: 5.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-116566 *
CVE-2026-116741 (CVSSv3: 6.5, CVSSv4: 8.3): speex https://nvd.nist.gov/vuln/detail/CVE-2026-116741 *
CVE-2026-117610 (CVSSv3: 7.5, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-117610 *
CVE-2026-118370 (CVSSv3: 8.2, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-118370 *
CVE-2026-118384 (CVSSv3: 6.1): mtools https://nvd.nist.gov/vuln/detail/CVE-2026-118384 *
CVE-2026-118598 (CVSSv3: 6.5): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-118598 *
CVE-2026-118599 (CVSSv3: 5.5): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-118599 *
CVE-2026-119170 (CVSSv4: 8.2): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119170 *
CVE-2026-119194 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-119194 *
CVE-2026-119195 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-119195 *
CVE-2026-119196 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-119196 *
CVE-2026-119197 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-119197 *
CVE-2026-119371 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119371 *
CVE-2026-119372 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119372 *
CVE-2026-119373 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119373 *
CVE-2026-119374 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119374 *
CVE-2026-119375 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119375 *
CVE-2026-119376 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119376 *
CVE-2026-119377 (CVSSv3: 3.3, CVSSv4: 2.0): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119377 *
CVE-2026-119378 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119378 *
CVE-2026-119379 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119379 *
CVE-2026-119586 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119586 *
CVE-2026-119591 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119591 *
CVE-2026-119741 (CVSSv3: 7.5, CVSSv4: 8.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-119741 *
CVE-2026-120210 (CVSSv3: 4.3, CVSSv4: 5.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120210 *
CVE-2026-120243 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120243 *
CVE-2026-120244 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120244 *
CVE-2026-120245 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120245 *
CVE-2026-120246 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120246 *
CVE-2026-120247 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120247 *
CVE-2026-121481 (CVSSv3: 5.9): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-121481 *
CVE-2026-121482 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-121482 *
CVE-2026-121758 (CVSSv3: 5.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-121758 *
CVE-2026-124249 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-124249 *
CVE-2026-124317 (CVSSv3: 4.8, CVSSv4: 6.3): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-124317 *
CVE-2026-124709 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-124709 *
CVE-2026-125064 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125064 *
CVE-2026-125065 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125065 *
CVE-2026-125066 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125066 *
CVE-2026-125067 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125067 *
CVE-2026-125068 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125068 *
CVE-2026-125069 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125069 *
CVE-2026-125070 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125070 *
CVE-2026-125071 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125071 *
CVE-2026-125072 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125072 *
CVE-2026-125073 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125073 *
CVE-2026-125095 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125095 *
CVE-2026-125096 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125096 *
CVE-2026-125097 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125097 *
CVE-2026-125098 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125098 *
CVE-2026-125099 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125099 *
CVE-2026-125100 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125100 *
CVE-2026-125101 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125101 *
CVE-2026-125102 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125102 *
CVE-2026-125103 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125103 *
CVE-2026-125104 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125104 *
CVE-2026-125170 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125170 *
CVE-2026-125171 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125171 *
CVE-2026-125172 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125172 *
CVE-2026-125173 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125173 *
CVE-2026-125175 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125175 *
CVE-2026-125176 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125176 *
CVE-2026-125177 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125177 *
CVE-2026-125178 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125178 *
CVE-2026-125179 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125179 *
CVE-2026-125180 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125180 *
CVE-2026-125181 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125181 *
CVE-2026-125182 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125182 *
CVE-2026-125183 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125183 *
CVE-2026-125184 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125184 *
CVE-2026-125185 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125185 *
CVE-2026-125186 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125186 *
CVE-2026-125187 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125187 *
CVE-2026-125188 (CVSSv3: 2.5, CVSSv4: 2.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125188 *
CVE-2026-125189 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125189 *
CVE-2026-125190 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125190 *
CVE-2026-125191 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125191 *
CVE-2026-125192 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125192 *
CVE-2026-125193 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125193 *
CVE-2026-125194 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125194 *
CVE-2026-125195 (CVSSv3: 2.5, CVSSv4: 2.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125195 *
CVE-2026-125196 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125196 *
CVE-2026-125197 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125197 *
CVE-2026-125198 (CVSSv3: 2.5, CVSSv4: 2.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125198 *
CVE-2026-125199 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125199 *
CVE-2026-125200 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125200 *
CVE-2026-125202 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125202 *
CVE-2026-125204 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125204 *
CVE-2026-125205 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125205 *
CVE-2026-125206 (CVSSv3: 2.5, CVSSv4: 2.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125206 *
CVE-2026-125207 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125207 *
CVE-2026-125208 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125208 *
CVE-2026-125210 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125210 *
CVE-2026-125211 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125211 *
CVE-2026-125212 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125212 *
CVE-2026-125213 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125213 *
CVE-2026-125214 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125214 *
CVE-2026-125215 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125215 *
CVE-2026-125216 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125216 *
CVE-2026-125217 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125217 *
CVE-2026-125218 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125218 *
CVE-2026-125219 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125219 *
CVE-2026-125220 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125220 *
CVE-2026-125221 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125221 *
CVE-2026-125222 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125222 *
CVE-2026-125223 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125223 *
CVE-2026-125224 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125224 *
CVE-2026-125225 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125225 *
CVE-2026-125226 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125226 *
CVE-2026-125227 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125227 *
CVE-2026-125229 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125229 *
CVE-2026-125230 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125230 *
CVE-2026-125231 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125231 *
CVE-2026-125232 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125232 *
CVE-2026-125233 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125233 *
CVE-2026-125234 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125234 *
CVE-2026-125235 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125235 *
CVE-2026-125236 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125236 *
CVE-2026-125237 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125237 *
CVE-2026-125238 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125238 *
CVE-2026-125239 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125239 *
CVE-2026-125240 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125240 *
CVE-2026-125241 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125241 *
CVE-2026-125242 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125242 *
CVE-2026-125243 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125243 *
CVE-2026-125245 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125245 *
CVE-2026-125246 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125246 *
CVE-2026-125247 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125247 *
CVE-2026-125248 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125248 *
CVE-2026-125249 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125249 *
CVE-2026-125250 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125250 *
CVE-2026-125251 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125251 *
CVE-2026-125252 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125252 *
CVE-2026-125253 (CVSSv3: 5.3, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125253 *
CVE-2026-125254 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125254 *
CVE-2026-125255 (CVSSv3: 5.3, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125255 *
CVE-2026-125256 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125256 *
CVE-2026-125257 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125257 *
CVE-2026-125258 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125258 *
CVE-2026-125259 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125259 *
CVE-2026-125260 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125260 *
CVE-2026-125261 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125261 *
CVE-2026-125262 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125262 *
CVE-2026-125263 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125263 *
CVE-2026-125264 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125264 *
CVE-2026-125265 (CVSSv3: 5.3, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125265 *
CVE-2026-125266 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125266 *
CVE-2026-125268 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125268 *
CVE-2026-125269 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125269 *
CVE-2026-125270 (CVSSv3: 5.3, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125270 *
CVE-2026-125396 (CVSSv3: 7.8, CVSSv4: 8.5): ghostscript https://nvd.nist.gov/vuln/detail/CVE-2026-125396 *
CVE-2026-126765 (CVSSv3: 3.7): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-126765 *
CVE-2026-127039 (CVSSv3: 5.9): gnutls:gnutls-native https://nvd.nist.gov/vuln/detail/CVE-2026-127039 *
CVE-2026-127040 (CVSSv3: 5.9): gnutls:gnutls-native https://nvd.nist.gov/vuln/detail/CVE-2026-127040 *
CVE-2026-127231 (CVSSv3: 5.9): gnutls:gnutls-native https://nvd.nist.gov/vuln/detail/CVE-2026-127231 *
CVE-2026-128241 (CVSSv3: 4.4, CVSSv4: 4.1): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-128241 *
CVE-2026-130335 (CVSSv3: 2.9): zip:zip-native https://nvd.nist.gov/vuln/detail/CVE-2026-130335 *
CVE-2026-132825 (CVSSv3: 7.4): ruby:ruby-native https://nvd.nist.gov/vuln/detail/CVE-2026-132825 *
CVE-2026-133519 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-133519 *
CVE-2026-134703 (CVSSv3: 3.7, CVSSv4: 6.3): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-134703 *
CVE-2026-134832 (CVSSv3: 3.3, CVSSv4: 4.8): vim:vim-tiny https://nvd.nist.gov/vuln/detail/CVE-2026-134832 *

Summary of CVE counts by recipe:
  linux-yocto: 498
  ffmpeg: 126
  xwayland: 20
  curl:curl-native: 19
  libsoup: 15
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 14
  openssl:openssl-native: 13
  go:go-binary-native:go-cross-x86-64-v3:go-runtime: 11
  openssh: 11
  sqlite3:sqlite3-native: 11
  python3:python3-native: 10
  libxi:libxi-native: 9
  u-boot-tools: 8
  expat:expat-native: 7
  git:git-native: 6
  python3-git: 6
  glibc: 5
  ovmf:ovmf-native: 4
  epiphany: 4
  aspell: 4
  libx11:libx11-native: 4
  python3-pyasn1: 4
  libsndfile1: 3
  ghostscript: 3
  busybox: 3
  lrzsz: 3
  gnutls:gnutls-native: 3
  cups: 2
  perl:perl-native: 2
  tar: 2
  webkitgtk: 2
  libxtst:libxtst-native: 2
  alsa-lib:alsa-lib-native: 2
  ruby:ruby-native: 2
  libxfont2: 2
  libdisplay-info: 2
  harfbuzz:harfbuzz-native: 2
  xdg-utils: 1
  libgcrypt:libgcrypt-native: 1
  libtheora: 1
  graphene: 1
  popt:popt-native: 1
  cryptodev-linux: 1
  util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native: 1
  sudo: 1
  zlib:zlib-native: 1
  libxrender:libxrender-native: 1
  grub:grub-efi:grub-native: 1
  apt: 1
  libfontenc:libfontenc-native: 1
  gstreamer1.0: 1
  connman: 1
  speex: 1
  mtools: 1
  rsync:rsync-native: 1
  zip:zip-native: 1
  vim:vim-tiny: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/
