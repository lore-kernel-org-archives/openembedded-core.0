Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F5EC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 10:02:06 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.10977.1635415325542322978
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 03:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ezsSaSWn;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id x3so10381050uar.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 03:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RoYYpnN00RbKIrX3T71utUEO+7qLs4nKBxQ1ewuXEmw=;
        b=ezsSaSWn6HyJnr5R49E8PJ7zupj5rsZrnvRdWQGQZGl6wAsXUEtMBnZowL+my4taaW
         2fYEaVbm//c59yNbGwNeZ+I8owyYBPVd9BRZhX4Iu8+haqN4OYBO2Lf6OdCQtzMvpAou
         yqAvUjCbbvFes2M49hNiwWv08smQdaSiqGesRD2fppRClDl1DZY/AOs05KFAgg01j1cQ
         nuGxg37RVQF6SuJcP6MGQSwXDvf0w/lmXTxsPMJi104XKYSjnmywXySM3oN0upCA4XUQ
         icql9y4eAg34P/bmCSea8vQ4420oB/QGRgnTjHUqEV4KBVZ0SwGAQ5eIlEFBC0rphK6T
         QAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RoYYpnN00RbKIrX3T71utUEO+7qLs4nKBxQ1ewuXEmw=;
        b=IhdNJXDhePDI1GNAKeBzyG/cJNkzMlDKinCpJv7MCalM9gWr+Nd4x4Wm3qxV3jMKwn
         l42KIJ4/42+HITDKp2JfT76arX6rjxhGslFwZ05QNi6JR9tQE/mahMe3splRfGzBwCs9
         nsgEVJWwuSnUh93KxSHMZ/QEEo2qR5FJ4OFQ/NTODtrbqsAqOCVTs8+uWqwQijis09eo
         N8UPapnDkpTNqgpyQsX4nh3hCP9Ko6j8WI4+NJa9nSukX4cXuCDgE0m3JKvziajb6qFg
         m+gg9v0r5xLKuiEWxsj/3qO51JePRaNFYzT81LiSM4nFHB40zRtgnOtaNspjJzQaQ2h5
         23QA==
X-Gm-Message-State: AOAM531gN9iumXqMdehzpuW85e8BkrHsKHnsSjzRQNF8AlgvL83FUe4X
	LqFD/Ji5P+3H3uQZ12CRpIzBcUdt8Xw5WW9oRNc=
X-Google-Smtp-Source: 
 ABdhPJwd9No6bOAsj2cdt9QIGJYFHW7YkXABgm12YlaWDorSr8AQiD7XrPuBNM41+3xKm9mFZKalfqzJcPLkTLVNqbA=
X-Received: by 2002:ab0:812:: with SMTP id a18mr3058043uaf.33.1635415324673;
 Thu, 28 Oct 2021 03:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211027104705.113970-1-pgowda.cve@gmail.com>
 <3ecdc625beb6f5c01b49fb01965ba4917090fcfe.camel@intel.com>
In-Reply-To: <3ecdc625beb6f5c01b49fb01965ba4917090fcfe.camel@intel.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Thu, 28 Oct 2021 15:31:54 +0530
Message-ID: 
 <CALY4984sWHkua+2R=-uPJjQA-5zSQR3kkSoaqN9aJwBAgH85EA@mail.gmail.com>
Subject: Re: [hardknott][PATCH] binutils: Fix CVE-2021-3530
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>,
 "umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 10:02:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157583

Hi Anuj,

Thanks for checking the patch and providing your comments.

>> This needs a CVE tag, your Signed-off-by and Upstream-Status.
Done.

>> Also, it looks like this will break MinGW builds and would also need:
Added.

Will check for the CVE tags and other indentations properly.
Please find the modified patch posted at following link:-
https://lists.openembedded.org/g/openembedded-core/message/157582

Thanks,
Pgowda

