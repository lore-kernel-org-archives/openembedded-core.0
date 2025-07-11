Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE32CC83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 18:10:09 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.20450.1752257402908344137
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 11:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M56QoxhF;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: hiagofranco@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74b56b1d301so1526892b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 11:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752257402; x=1752862202; darn=lists.openembedded.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/yijG8H2rHC/uZoeQOsRG2LXYx0x0wBc9FKgwvTaAE=;
        b=M56QoxhFixLpKVo6Lyh3sDc1tnxLRkGjLCEVes4HauEvaq7iv4izm+m+P83mVkLJpN
         K/AJcGBqPr5Mftt3gAnccsnnAPp+TtNP1Eoab5Ys5H4mgJEDIRS0ovtvhp/oqk9Exc8/
         WgxvL6bEuo3vg3hIMSOKTIY3FbhAtID8vWBPjOJBmolcF8FMx7FggOE0hzxC+W3vSR8P
         QIJeme2iCUthFjoWJga7ser/O0vRiKfYLnKehc3OUxxsaNzjY8iZ5zLUMYeqVoUpbChr
         1GSL6NuJe16KDxZKCCQi7ZZJvu41kQp3WFKm9me3WZeeCmqxFZTQPqqTCHHBpraWwOYs
         KkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752257402; x=1752862202;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/yijG8H2rHC/uZoeQOsRG2LXYx0x0wBc9FKgwvTaAE=;
        b=T+2KHl/r0Q7mLAScBvu6l0gi/U+NlL6m2BOZcgeM93vMTPD48KGlTTgfPDksB29nLu
         67Zsqxiadaaxrvw05ygogjsWfD2Q/ZeVFQQspfBC/d4iSr5OYvcLcFPQgY7uJrcrZk/F
         tLwLZt8Wh0us7Un7Ye+DOax7+c1naXTGQkogEd/X/gg9XiEAK/g0Mt3k3Sjh4arE6cyw
         vxuvNr3eAqFz2AU/l7lOaSY0bDBTL38pDttsXyQ42PWiLUkOD3IFvXothQi1/XCRyG6W
         Qceuz+YrZSINwBYG9r3NqinP0gRm1N9YruYjhNWLi29pRk+UgPhNQ49/xLp7ssuF4XqF
         49cQ==
X-Gm-Message-State: AOJu0YyovTMg0ddxsSRBpUO/yjq11qqD2nlh3fkfRUOd3W+sRP4KACBw
	THD91A87HJm+IXHI81uUKjDqJ0unYlBeexrEawMkrAkpceJvIu0PL70RN0sPoA==
X-Gm-Gg: ASbGncu8b7UO7jBZ4VMSCqSG3ZhrnR9f/l0SQULxvK6Sg8Rc8QtrqMyoN8pc7ZPtwiW
	XLuwMkWlCJvfvFlf8gCHnF1J/8TEwbBCezrr0oREN2n51oq/I5eky6NsiBxUx80mpw88J48JWSc
	1xqlvGVCQPqogFOmYMKM3MT/HhSY3ePZLKojjgcQuMsw1XYc5NN1ZaOlEu+uqpjktvJy6jVcfma
	aReF3LjZrJEiwRLxUODpiOquo9fyQyHjX/aflv7DGEvkTmjHVspSr8IKn0+dOZ22O1eFZG/t5KD
	0mFPkOmUPzgb4ERHS7EqiR56KyZZLBodBbv0M5soyS/58r81zDZReMthZtj/Uqh+kOFBdWakv1E
	Z4hXjuvTR/AAWvZApmOE=
X-Google-Smtp-Source: AGHT+IH70yivkstM+qA2QZD7PiBQZ2CK7LmPcCL2Ok+1QuDU0faCkq0vs3BYfNkOwId2M1LKynvY1w==
X-Received: by 2002:a05:6a20:d80f:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-231367684b9mr6457672637.23.1752257401847;
        Fri, 11 Jul 2025 11:10:01 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd59f1sm5473758b3a.3.2025.07.11.11.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 11:10:01 -0700 (PDT)
Date: Fri, 11 Jul 2025 15:09:58 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>
Subject: Circular dependency error on util-linux fstrim service
Message-ID: <20250711180958.tbmriqtce25kxd2q@hiagonb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 18:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220166

Hello all,

Currently there is a circular dependecy error on util-linux recipe if we
try to use fstrim.service and fstrim.timer. These files depend on
libsystemd, therefore when you enable the systemd PACKAGECONFIG of
util-linux the recipe breaks because systemd is also dependent on
util-linux.

I was wondering if we should create an util-linux-libuuid recipe
equivalent for fstrim as well (util-linux-fstrim_<version>.bb ?), so we
can get rid of this error. I am not sure if this is the correct
approach, do anybody has any reccomendations? I will be happy to send a
patch to fix this issue.

Best Regards,
Hiago.

