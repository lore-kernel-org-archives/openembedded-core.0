Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4FAECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 11:50:03 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web08.11131.1662032994234230776
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 04:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b3kvkD40;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id s15so12463518ljp.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 04:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=cdrlGoREIpcGyI/VA50pEMctv8F2tVa+YVD5TkfMXLs=;
        b=b3kvkD40Y41thnx5TsmcfidyeiOYqpYopwZW1RNm3Lq0jAHxA/tB/kwJWps7GYAMuS
         +YCjMVL5lNELX1ZyZd3hxC3gf/8e9rjnCcsyGdq/BAuBXjGlJjcxQfTIz7zMLW70n+tW
         Aucu4BaqaIjZ9wEcmmL04U10WOUC7ZdwFg8k52K0IvWsoatcmS67aepe8uLsgttMNXuy
         Ev47yGZHeDTnEP74jm408/O1Y2KA90OKa3aRmOFBA4acZjR3LR1tHgANiXkJ5ykBgZjs
         qg/6Wo7QsZIeodMCxTMofMLv4+l8hPEr6dTquucpNO/VHUZBbH6nF/wTQDsp96Xs39sS
         f8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=cdrlGoREIpcGyI/VA50pEMctv8F2tVa+YVD5TkfMXLs=;
        b=ktbi2syrgvDPrwGE+UO0QJeseLjSi0ghokmE0pEDpvBk+P7PL00v7/an6a6KpyMj3K
         rUFb1j8FZa9zAT2Q7NF7b5sfevhZwaqfaO1tqMde0ajKOAQ3eXbSwQPClTVsM9aZWhqj
         oUj0SMFVh8g858ASZhyzXnF3jHjbxe9cacIaIuV/d3/G0rloMowVomSDKYZ9tKcBx/Vb
         L/q/Rlq2Moovq9ptUh7BTF8K4i+hu+VCVn7jN7pLOD3iHjQn3OpVsnghSsSzvIudTUHl
         s+wEfWUFuYIKd4nZQlmm7YDDs9HBrn8q1w7yx91zystPlSDe8thk1Uei4yvOIH5+Uja1
         3ZZA==
X-Gm-Message-State: ACgBeo2/KGOADLZhIuhaScAZFkt0E3fM8aJrHGCxxmM/7xIbiKNfdv/K
	IMUp839022YZlZ2qJYurS5F5QWGz+0Ltvw==
X-Google-Smtp-Source: 
 AA6agR4ldfrHyfLJ2vTWmyrHhGbDaD2sWLP20jwUtWLrUKE494knlqeRAptA/IGCUvERsAhkcz9TfA==
X-Received: by 2002:a05:651c:10ba:b0:266:ee76:26a9 with SMTP id
 k26-20020a05651c10ba00b00266ee7626a9mr3932091ljn.382.1662032992212;
        Thu, 01 Sep 2022 04:49:52 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 x12-20020a05651c104c00b0025e6de76589sm2388226ljm.106.2022.09.01.04.49.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 04:49:51 -0700 (PDT)
Message-ID: <f3e55ccb-67a1-5cef-c9ee-ed1ba4747c6c@gmail.com>
Date: Thu, 1 Sep 2022 13:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
Subject: Error with TEMPLATECONF value
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 11:50:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170160

Hi,

After updating to master branches I'm getting:

> Error: TEMPLATECONF value (which is /home/jkroon/Projects/codab-linux/openembedded-core/meta/conf) must point to meta-some-layer/conf/templates/template-name

What is the proper solution to this ?

Jacob

