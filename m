Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.4149.1605347777725407178
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2020 01:56:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QwQsolpD;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id w13so17384380eju.13
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2020 01:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=ze/4NER/ZhrVdpUOfR4EzQXvsx+Kr2w5TjOMB6GIknA=;
        b=QwQsolpDRnMUjqOCdH0jvaB9xO2PgDhaYb+OqsSv6+KYGLZPAuTJtK6lRSPwIbWaTw
         YmYIzCQvFkIhIlPGxsMd5mO8ECmlJrgd8k0VqEGuKJRFTG7WHIhhSzaq3drVJD8O821/
         2xyN4yUV4BPOpR3Dl2+GeC2bmpp6xILZ3qfoTQNYcESBopsVI1l7K7f6CQG8WD0apgXh
         EQFvXbP9qmQYh0Lo08UC70XO7a2mEfP17YL6kdy6GKM/IkfCtwSLnV8BFAcGEw+WPFkn
         RIqxZvlZaWyfCAkFGGk1+wa7LqliI97bRYzPFbaV81LwHtp7iaBzHckOJJzv1EVt8tdM
         K8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=ze/4NER/ZhrVdpUOfR4EzQXvsx+Kr2w5TjOMB6GIknA=;
        b=cm9Q5zdik1Zjt2rhGiztocajLsAWc5gbPuZdeh6gVPfpDZmTzg6uzTyb2qmL3yJ4cI
         o9r4+pXufc23CvEhUZ/MlXdvYSKpKH7gWrxvvvbtgL6hpy6avu7EYuuTG4LmQb//FbAF
         5620e1XHDcrXSRKMM9+jl0QOZAGluZU+LYBeNmbMI7SKk9g8SlIZk7oIDobVMjPJuhxz
         WWyOe7n3EDFo8R6Stmfep2KQjf/3tJG25aRkwqeFE0zaOVlRH+TtXxI3sSmPu0RRIiHW
         GjraG4eOB04+I8zvUm8EGUxqWr14gNR/DN/BvHiKYVZlBbfB9TGZeMjr2x93sVH+TO8l
         NJpA==
X-Gm-Message-State: AOAM531XLvlyfctwD4zswxG0EFdL6E1NgXrMaxniYfU+2MQBLWxAAGZr
	XRl3toU0mT0s1tFp8GcNy0PCM0NZwkw=
X-Google-Smtp-Source: ABdhPJzEJoxzHNfxtpKiELHjtWnCxOiXoQzKcj+mGxthQtTws6fq6E4apubba/knQb73oRUjr3yKLw==
X-Received: by 2002:a17:906:f286:: with SMTP id gu6mr6218277ejb.182.1605347775951;
        Sat, 14 Nov 2020 01:56:15 -0800 (PST)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.ad001.siemens.net (c-93-184-20-132.customer.ggaweb.ch. [93.184.20.132])
        by smtp.gmail.com with ESMTPSA id k2sm6013051ejp.6.2020.11.14.01.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 01:56:15 -0800 (PST)
Message-ID: <cc5225a182325f116b5028e26027d3e6cef1f6a8.camel@gmail.com>
Subject: dunfell update reproducible_build.bbclass
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org, steve@sakoman.com
Date: Sat, 14 Nov 2020 10:56:14 +0100
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Steve

We are on Dunfell LTS branch and have a small problem with reproducible
builds. The problem is already solved for gatesgarth. So it would help
us if the following three patches were picked to dunfell. They apply
straight forward and update the reproducible_build.bbclass to paritiy
with gatesgarth.

- classes/reproducible: Move to library code
  371dcc688c3b7ec4493669226bc3dd75877c9db2  
- lib/oe/reproducible: Fix error when no git HEAD
  3acfd33fa9c56ac69423af8f222a13be365fb29b
- lib/oe/reproducible.py: Fix git HEAD check
  ada41f184961fa62f2e87cbba82b446373faf4ac

Thank you.
Regards,
Adrian

