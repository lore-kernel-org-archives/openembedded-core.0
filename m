Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web09.1576.1603218177936131245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2020 11:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nk7leuZm;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: petr.vorel@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id k18so3071028wmj.5
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2020 11:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=FkkL5MeqXMcdozrfC0ltbY7h9xzD+0cKOGP4rMK9GUM=;
        b=Nk7leuZm9yVjpeTeNxqTu3yj0+1BvQiHps/UYSvC+McLxxXcp0o0TzhldGVGMkbyKj
         JOVvuMOoPh3kglkz6rzz1Vp2QDY0y4aJuGkaJuoEfOCxJwHX9OLqE6VvX4vUBB6NfI1h
         nmKu+cS312GXn5inQAEEHAoqx4/XyFNyXiEnQzlv06YWQ17me2PEaKQmXKhRgoV/1eg0
         o+d2kA3j0LX6Bcdk5MF8Bvi4FA+naBHWjuVxNNT16RFgTitBwdP6cnYpGuvPq6FO3Muv
         rjpvr27ySWr0bzOGu3VUiPQFk0eSpkOMW9ULBM7PH6kLytgE08al/N44HdgOvJ8Ij7EW
         Kn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=FkkL5MeqXMcdozrfC0ltbY7h9xzD+0cKOGP4rMK9GUM=;
        b=qWox1HwnxlhEDi0EylIdrVtnomD5fhs+JyH82lhLxDObtGoCbU+DOkC1cJWBaYaLsD
         24N2yeRPPNmrfdb9Ba1Nm8pxHsoYLKQxB5yxkPfxMpr+L6AvAGNMa670if4fM47ZZzt+
         cZSb9ns5TaY5X7TrVIYYDsSmfRcKk8D9PirG2HcKc3ESCKYwQ12KSkn75VdbPKsKUrm7
         bme9toQ/VW+IhqTb7UxeMeIGkw8fyZCPhnAvIHj6fdpl+Uw0R3uXF8Yvryp2Bm//VK9s
         4wX4BXT+77AHxch1MgobGsb0INQyn53dYAK5IxnH85do3JYSUplJ6jKdJ5PuLmClm4MS
         uXXw==
X-Gm-Message-State: AOAM531YfiHo4r/WbjJMqt9zkQhVQlSzcY9WuOw8lH4NelMhR7kQ7WPE
	l57EGxoH/xgP/54QN1OUKQA=
X-Google-Smtp-Source: ABdhPJwutwQaQ0Q/PkEdtxcLhWY8a5efkVJOinyH5XAGWteP51bd9J5cFTiXzyImWtOF5y4bUMcuNw==
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr4459860wmy.51.1603218176335;
        Tue, 20 Oct 2020 11:22:56 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from dell5510 ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id c130sm3944661wma.1.2020.10.20.11.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 11:22:55 -0700 (PDT)
Date: Tue, 20 Oct 2020 20:22:53 +0200
From: "Petr Vorel" <petr.vorel@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>,
	He Zhe <zhe.he@windriver.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	Yi Zhao <yi.zhao@windriver.com>,
	Daniel =?iso-8859-2?Q?D=EDaz?= <daniel.diaz@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20200930
Message-ID: <20201020182253.GB18387@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20201019201332.12446-1-petr.vorel@gmail.com>
 <CANNYZj8k8zbpQMD-Y2EQF_y4AffOReL1v=5Luw2dy2yAxA9r8g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8k8zbpQMD-Y2EQF_y4AffOReL1v=5Luw2dy2yAxA9r8g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

> Thank you, but please set Upstream-Status properly for the two newly added
> patches.
Thanks, fixed in v2.

Kind regards,
Petr
