Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.10272.1621952181080447559
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 07:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WIYjVTin;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id u4-20020a05600c00c4b02901774b80945cso13568060wmm.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ONF+Dcb52PL2/JWn1NiRVvRsfadzqImxDeE7Enx7vhw=;
        b=WIYjVTiny7NiF2b0OjYu9D0S133OUfI7ociecIokWVclD8XxtopzxZdd7nWVg9cYn+
         7qvqfCMjWaGUfrCYaUKpCrP7G3hQxnuxOuWfscCO4Ddg/vsl6n/27uCGZrHyoHy2m56v
         KvdIMnzoEpFu6UlrW1YvVgKGOma2EGCzxUobw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ONF+Dcb52PL2/JWn1NiRVvRsfadzqImxDeE7Enx7vhw=;
        b=QnxggxqhY73zZ2gFeZPk2b4eIAFBsRTla+4kHTPNsAur09T5/og0+fR8UVVOP/cD/S
         zOgQ6VCOeE238q2AKd/Ou7zIHVQPwA2J19KnTWLVydcAciyB+MRggaZW0I7Kzgge+P3P
         4mNKmNsyeJ+ZlL2sWOZAiBba91iiVuT8ZXOW+apMKzGmsoZo7zRN/YWz8HHnCzybGoQi
         OX5zoHtkRXe7MEMmQvX90X92BO1CamwM8ZN0m856SIwVCxKP4X6EjwNSkcIeU9ArrDnK
         gXXttPZHBSndwzn7cy9LtrWu3J/dTee7Mk9I4VcMMtzmOmGnyl0xbkFQefzc5eoilY6e
         aJ4A==
X-Gm-Message-State: AOAM531Zu6nLbU+fvB3tiU1xaPcRyXsseh03Tq4A6VGOhXM4R9cn7rxn
	d/H7rWKYwFih7sRemYKfBQ9lKg==
X-Google-Smtp-Source: ABdhPJwiH+l0YA8kTNYyLH0kO7LzpQCp8vN0BTx+p/kcK+PCiTh3CqT8fS5+V0HAHwn3XzJ6bvvyug==
X-Received: by 2002:a1c:b6d5:: with SMTP id g204mr4169317wmf.106.1621952179583;
        Tue, 25 May 2021 07:16:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9654:ad4a:4a61:2e32? ([2001:8b0:aba:5f3c:9654:ad4a:4a61:2e32])
        by smtp.gmail.com with ESMTPSA id f6sm19142315wru.72.2021.05.25.07.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 07:16:19 -0700 (PDT)
Message-ID: <2e6c986f556ca09bce5789200a2f64dcc550cb5e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/21] systemd: update 247.6 -> 248.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 25 May 2021 15:16:17 +0100
In-Reply-To: <CANNYZj-ZH+ew+8KShNcZAvQiqZEDu5mVBHF=rQk1Q0eKmkVzPQ@mail.gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
	 <20210524091347.419253-2-alex.kanavin@gmail.com>
	 <CAMKF1sq9mwdOOPFebQ1xXHXEJOLrx_-3jgHCb_6VhBd5yoZh8A@mail.gmail.com>
	 <CAMKF1sp3yeZV3VW7i0MHhaj0e8LvMpXd4yb5SUKXRf-WArDkPA@mail.gmail.com>
	 <CANNYZj9V6e9+uqA=PPF06SKop4mp-UGfsoZ21mZF7spVsm21Aw@mail.gmail.com>
	 <CAMKF1srLE4eN4JoQfXyt4ma6_uVxZwpxB8AqmyWN8xZx=dWKpQ@mail.gmail.com>
	 <CANNYZj-ZH+ew+8KShNcZAvQiqZEDu5mVBHF=rQk1Q0eKmkVzPQ@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-05-25 at 16:02 +0200, Alexander Kanavin wrote:
> Sorry, but that is not a good answer. If the next version upgrade 
> is a pain because of those patches, I will actually make a patch
> that drops them.

I'm going to wade in on this at this point.

systemd is a tricky one. Khem has been doing a good job keeping it 
working on musl and that is important to some set of our users so 
I'm going to continue to enable him and others to do that.

I'm not sure the current patch approach cases a huge issue, worst
case it gets broken and then fixed as just happened.

Cheers,

Richard

