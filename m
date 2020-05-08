Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.5768.1588918206997970045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 23:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EAwG34xg;
 spf=pass (domain: gmail.com, ip: 209.85.167.66, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f66.google.com with SMTP id d25so475238lfi.11
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 23:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X8yWspv+2rGO8Mf+Ddk51mPLVkfYZARSpdEnWsPfdfA=;
        b=EAwG34xgDHYpZuWgOpaINARf6wfKrxdXiygcf6MFzfp7NwUev37SvvX+ptamHH5+/R
         Eyy8xgln2qNAhn3v1pqZCFn1Hij53wOsAhKVhwON9wZmM8hgRK6IGcUCZbEt6XPYnAXs
         2mKb5xIyfDuKROP8Q4GIN4OncoFP0EMgikKmxTeeUe+5gkYF9r4vK1kNAFS3OhIDV21O
         6lY5o8tDXjwIaDttRexABoLbTMVD3Cx6WB/Iamb2WLwT2OYnZA/qcJ/vcYoMcFKuAJIa
         lAJQCrO2lrN8e+ULJcoFTEMz3VKvktQDkX9U7UsXlUF70ExZDpYQNJ2njruZqR4ymDSj
         gsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X8yWspv+2rGO8Mf+Ddk51mPLVkfYZARSpdEnWsPfdfA=;
        b=lvxJxhSWx/HaYKEANXKAd1RtViJaZ1Svgfe5CFEnjPpQykKJTvhvMN8GJ1XIO+ERc3
         kOBpF7FKDPDfohcGgXWhaI93Sd7oTaGSk7/Z8vMTt22yU81ntvdFPtN41jiXlN4E5dMW
         oQjfeeiJ34BMj2CmHA+BtJeXaBQWAPpVC7MllTUO0VGGS9hSjxMdwbGzefvMaZJVthAy
         dPusKCy6xZrUehvfZLVzObV6RGYda+wZVjG4VLHxQ2tKc/PImbsHpKUmV3YbV8rxnrHH
         POfJVybGoVV2ylni6/GJepLqNbM0r+MX1rWkFdzQNms0DJjO4DC/SEgCXrnmolkHPQFk
         PL3g==
X-Gm-Message-State: AOAM531sCLW1KFYKykgBYg+wPo4ZIGTDyIs2GG/Vr/4QJVT7H6EHwNph
	qNR0D3UKEZYElSJNNX0eI/CTUFpGsls=
X-Google-Smtp-Source: ABdhPJwkv49aeVwuB7H4vKzaNIzjyGQLWIttK244EWdkYTw5Aub4bkba+d8qkZjHV/C8Crars997aQ==
X-Received: by 2002:a05:6512:1051:: with SMTP id c17mr255315lfb.206.1588918204498;
        Thu, 07 May 2020 23:10:04 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id z11sm435299ljn.96.2020.05.07.23.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 23:10:00 -0700 (PDT)
Subject: Re: [OE-core] [pseudo][PATCH] pseudo_ipc.h: Fix enum typedef
To: Seebs <seebs@seebs.net>
Cc: openembedded-core@lists.openembedded.org
References: <20200503042712.1878496-1-jacob.kroon@gmail.com>
 <20200503002852.1273f3a1@seebsdell>
 <e8a9982b-1412-087f-b8ac-283b657106aa@gmail.com>
 <20200503112621.32e1e1ed@seebsdell>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <b554cabf-b8dd-5cf2-40ca-9aa5ffc53834@gmail.com>
Date: Fri, 8 May 2020 08:09:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200503112621.32e1e1ed@seebsdell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Peter,

On 5/3/20 6:26 PM, Seebs wrote:
> On Sun, 3 May 2020 17:49:09 +0200
> "Jacob Kroon" <jacob.kroon@gmail.com> wrote:
> 
>> The type has never been used, so an alternative fix would be to get
>> rid of it altogether, and just keep the enum identifiers.
> 
> I think I anticipated the type being used for something but it did
> indeed not happen. It could also just be changed to 'enum [type]
> { ... }', I guess.
> 
> But I think your fix is the simplest and closest to what I probably
> thought I was doing at the time.
> 

Do you have any plans on merging this, and also the pending patches in 
oe-core, anytime soon ? Then we could bump the pseudo git rev in oe-core 
and remove those patches, if not then I can add the patch to the pseudo 
recipe. Any way you'd prefer ?

/Jacob
