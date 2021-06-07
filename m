Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.32063.1623043777708627553
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 22:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hfdz3m+0;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id w21so18673146edv.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 22:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=ZnjLkgv2aZ6DxQK53l1pP66brJFmGNYsboj0EcyhrWM=;
        b=hfdz3m+0re8973ycYXoBjXypbH4EStmrz7rBW3+OmpmhtqLiw+dLGp17+TTzbVfrnV
         hRqKZJmbAQ8h2ErFr3HtgNp8Ct4+ZMQDekNvcwGxkpl9svGHrPYtC2vXG3Jb9Mx9M2by
         wA/NXnehYCt889/vgRxJEiEAr79xYD1R5v4IpKYm5LVdRoTW6hFBa792ltaIyBJcQA1N
         fm+YUelt6265da1Mpe5bHAVDAklyWlPQwgBu19iVcfRwhMhuhS6VrIQe7hwY6En5aFCq
         c7h3SPoPP8GUv3QfZGmrdtnNhK6aqaKA+wF1EGzKPmgTNNUxTGtDzyLoEHJ7W4BpGaom
         BZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZnjLkgv2aZ6DxQK53l1pP66brJFmGNYsboj0EcyhrWM=;
        b=UQXuWWUp2Rkzaw+0KMAESL7Yy1wzTAbMQqyWHEvvyQwRsCSVXJQgJLLC0JQfQ3JZIL
         A1XmEBBHrnjssVdHJ+x33lg05dPtCcV8KMmFIAUHLU5l5CCnVr0mUFrElYJQv+aAOn91
         Qq8/ylHnKUqeZokof8i4Zt+8BwfqotkVtDAD6LBMmAqxcK/AUAkGFmYZm0vV5s/hBuLy
         z4u3x4N26E0jETAcN9edx+yWG+pPMOVA9LaHgUh6tytJl4cNzw5jpMNTDvIP8nUpy2qL
         5p2QVs0wUD75GF+REnWqwoba8kGPdAVTQyPKhUkd2swNtrdBTyPHnqByhxXqblBUnj1G
         cTJw==
X-Gm-Message-State: AOAM530x8psIy3A7xXiVGqdiYbOQzVO/exzqG0jSwTj8v7132wPDZPGt
	GrfmbCmR+iHrx0ltNg1Tgw8WHAqf5RK11jvy
X-Google-Smtp-Source: ABdhPJzav9B4yR7KsOWYz/rNjPpcKf+ReJW01MPCork5vQ7aBvAspGHdX7hmuXsQaMHTnrGlHXRjNw==
X-Received: by 2002:aa7:d84e:: with SMTP id f14mr18315203eds.12.1623043775992;
        Sun, 06 Jun 2021 22:29:35 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from [192.168.10.102] (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id l8sm3262499ejp.40.2021.06.06.22.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jun 2021 22:29:35 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 05/10] perl: split perl-cross into its own recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
 <20210604091458.1381144-5-alex.kanavin@gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <4b7aa337-ccce-e08e-aab8-04218fff0dec@gmail.com>
Date: Mon, 7 Jun 2021 07:29:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604091458.1381144-5-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/4/21 11:14 AM, Alexander Kanavin wrote:
> As perl and perl-cross need to be updated (and patches rebased)
> in lockstep, devtool upgrade (and therefore AUH) can't cope with it.
> Manually updating is still possible, but painful.
> 
> Split determinism.patch into perl and perl-cross parts, move the
> rest of the perl-cross patches.
> 

Not sure if this is intentional, but when I build master now I get a new 
dependency pulled in that is built called "perlcross-native". Given the 
sound of that name, is that intentional ?

Regards,
Jacob
