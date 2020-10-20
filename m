Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web09.906.1603224652308867484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2020 13:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oC9GDn9n;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: petr.vorel@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id n18so4009838wrs.5
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2020 13:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=4i4oawLJMOfwijbZhJ9WqxEFSY6vkUWW/3q5X6PioR0=;
        b=oC9GDn9nUl8cJSyy0HixK2r9HkIAqWYXMnwJFiXiCSWZv4JYQcjBTRf93xl3vjUnDt
         NqBRHu+BZ75CKIdv+2xQi0PY1mntyHScLeEkykUJhrrJ4WWybm4c0FOgaiMTTjhu7ekj
         Oq7PW17MKwNNalTDe1Ni25m7TqIzanayTg9TlKLxeer6WtjhImz78IgW2RdGuUg29p0/
         m+7/g3xBrI9HQJH1lOhukU3gxWMJRsjMz/bV0yUERJ9t81aoSOYwc5YFXP+llc5hvH4V
         eCLOGv8jgDutI0XBGZY0+X7A0IpKq1JgsPg6Pp5BpaCogocjo/55SlIG+YxCUSGg8jLo
         FIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=4i4oawLJMOfwijbZhJ9WqxEFSY6vkUWW/3q5X6PioR0=;
        b=nU+QmAGWlnCqkhmy0AYOdA90uSvAWKn0SQmrZQK61aimtrFiEkXLtIWkixff4SZduw
         0GxWpotx54SfYmu8Nh0ew9TLps3/VQ9aw7kL6rrQD8utXv+JAjcvkpm0FzIdTQoCdyDP
         2pWLMsGQ4RRdyqv7CUjaSqpNj6cH/rXsf7ryMlJchI2BJNbywZe7Og+cSnZPrZxb4gtq
         MgQcy/Rbe7JAwh7UDlmKpxzSPcl9eTUCYl1YG7gGX1cgEdZgoCqrSWwMM2s6hRGaClzP
         VQktEI5n3lZKO3ruiowMHbBB5xP/uJQ8BPCpZtTaCcAPAElveDrn2nxLmbAT4dy7E8MH
         9qGQ==
X-Gm-Message-State: AOAM530aWeArG1u9MqBkX5vaUR2penDKcQ6lTEjQC1FiPoFV6XVl07gy
	J4QDeBV+T8yuVjZ58hu4RjEaglttw+sJkQ==
X-Google-Smtp-Source: ABdhPJyOgE/Aa/MU5lFxzEexu32hlTW42UFfmzDkYVyJeB+55MK945iHtooEtFcQ+3ef/Oe9gM5xow==
X-Received: by 2002:adf:9793:: with SMTP id s19mr110907wrb.139.1603224650919;
        Tue, 20 Oct 2020 13:10:50 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from dell5510 ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id g17sm4902337wrw.37.2020.10.20.13.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 13:10:50 -0700 (PDT)
Date: Tue, 20 Oct 2020 22:10:48 +0200
From: "Petr Vorel" <petr.vorel@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>,
	He Zhe <zhe.he@windriver.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	Yi Zhao <yi.zhao@windriver.com>,
	Daniel =?iso-8859-2?Q?D=EDaz?= <daniel.diaz@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH v3 1/1] ltp: Update to 20200930
Message-ID: <20201020201048.GA2215@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20201020185435.24361-1-petr.vorel@gmail.com>
 <CANNYZj-Cz4tk=Vi8Us-f3ieQXnzbs=O=jPQLnnS3OSbv5txo7Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-Cz4tk=Vi8Us-f3ieQXnzbs=O=jPQLnnS3OSbv5txo7Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> On Tue, 20 Oct 2020 at 20:54, Petr Vorel <petr.vorel@gmail.com> wrote:

> > -Upstream-Status: Pending
> > +Upstream-Status: Pending [pvorel: this is not going to be merged, instead
> > +each test needs to be fixed]


> Nearly there - this should say 'Inappropriate' then, and the status should
> be kept as a single line, with no line breaks. Same with the other status
> adjustment.
Thanks, fixed! Hopefully we're there now.

Kind regards,
Petr

> Alex
