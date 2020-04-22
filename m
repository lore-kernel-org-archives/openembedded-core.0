Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.1994.1587540280092208650
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 00:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LksFFY/+;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id j2so1081154wrs.9
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=3zQ6Kd+4DXEFCrZutCULgZZo+Cl5dE3poKW23XeWu9c=;
        b=LksFFY/+Zpy70r1nBLDa/aY792UKb9cLfb7h4lpvSyI4Ut4EjghbGFRNxxvvkG5pzZ
         CVpUMRnNPWr/eCzjep5btSbypeHwBsXeI+ZSq+WE9tPqpLB8OX5EBPmqE/9hIXak7OW+
         JRq3H/iA3EgmEDL7xUbywlWV2cPAWSm037/TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=3zQ6Kd+4DXEFCrZutCULgZZo+Cl5dE3poKW23XeWu9c=;
        b=GA0BvjKYa3NRFeDSgwX0pkixpp1KzcFvKkWikOn2NEzK+gmwfOXZcSF3KzOWTKBfJ8
         QYA1pbEwl5zX/kP7+wFxfaZestzHe6Q4aX9mPgwDEJcf12LLdYbRUdtOOcYSy0LHlSUL
         ZW8qpa/NgdXNvK5k+NzBF96JAFXjbe0DBa7PMMzXxfuTL6klDbwYSdKMoSd6r5vfdbyi
         DSovwIFJ+v4mNfDqtvJnV1aKWGqX0K55wukJeRdWLN4bLeA3QNB8VpHKV1rmAvto4M0g
         WU+NBhqnGyuhF+lmRMRZWI8vNSu7wlxNbg/2+NfWTmLJNU7B+lTuUDgpRqcKIwycKYQH
         uq2Q==
X-Gm-Message-State: AGi0PubP3AKn3cH0nh+fVGNKgfg/Q1Cp3pYJOjqXcMFQCPQheigXRVhi
	kDrkHto76D68uvnShc5uWJ704g==
X-Google-Smtp-Source: APiQypLYMkg1jX340729CP1vxSr1Y7hZAXqrYAax48HYEWO/OaP2LccDl6TYc9S5Fecpuh7+cNmEdQ==
X-Received: by 2002:adf:fa41:: with SMTP id y1mr27322754wrr.131.1587540278605;
        Wed, 22 Apr 2020 00:24:38 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id g69sm6839758wmg.17.2020.04.22.00.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 00:24:38 -0700 (PDT)
Date: Wed, 22 Apr 2020 08:24:35 +0100
From: "Paul Barker" <pbarker@konsulko.com>
To: "Philip Balister" <philip@balister.org>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>, openembedded-core
 <openembedded-core@lists.openembedded.org>, openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Yocto Project
 <yocto@yoctoproject.org>
Subject: Re: [yocto] OpenEmbedded developers virtual happy hour
Message-ID: <20200422082435.151a49f1@ub1910>
In-Reply-To: <98d30536-4d57-16f9-88f4-1a678fd75970@balister.org>
References: <98d30536-4d57-16f9-88f4-1a678fd75970@balister.org>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Apr 2020 15:34:57 -0400
"Philip Balister" <philip@balister.org> wrote:

> We (the OpenEmbedded board, with help from Automotive Grade Linux who
> are providing the meeting "space") would like to invite you a a virtual
> happy hour on April 29 at Noon EDT, 6PM CET (Is that the right TZ)
> 
> We'd like to come and show off their projects and give us all a chance
> to say hello since so many of our chances to meet in person are not
> happening for the foreseeable future. We would also like to discuss what
> kind of events we should host in the future to help build the community.
> 
> Topic: OpenEmbedded Developer Happpy Hour
> Time: Apr 29, 2020 06:00 PM Amsterdam, Berlin, Rome, Stockholm, Vienna
> 
> Join Zoom Meeting
> https://zoom.us/j/94557245630
> 
> Meeting ID: 945 5724 5630

Sounds like an excellent idea, thanks for organising this! I'll see you
all there.

-- 
Paul Barker
Konsulko Group
