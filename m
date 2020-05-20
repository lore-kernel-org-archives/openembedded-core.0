Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web12.7689.1589955488512070985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 23:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DXq3mLd3;
 spf=pass (domain: gmail.com, ip: 209.85.167.194, mailfrom: petr.vorel@gmail.com)
Received: by mail-oi1-f194.google.com with SMTP id o7so2000876oif.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 23:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=FeZdzhQ7o+hEFdkQ9ckM9lXOSGwvk/X1hN6zUemgoME=;
        b=DXq3mLd3hNbsRRy927pllpeLYHVLKkBuq0eLsEW7ErfhboOFJF9wdVDOaH7iX5+j14
         w/b4W+QedicFdv9pl1EA9Y68XT2i5fZsVyQbAZQyetW7CyvqvclA2zBa52TVWlM/B3ns
         y4OVmAPnKbxuT5o6rezo6eTECHCe5TpsO9w2CmdDIWFaxkdPFsqmMUJIvLIYBxul2rbp
         HE/ybl07n+dly0OrCiIYyZAG9uTFv9gAc5C8O7hT6CiC2hPkaLf09pkCAqkutuYStum7
         8mQXb+rjpRxlKWGpUwNpayL5r7Ggn7kMskBoEHEErZIceq6Ib+Doc8fhPxHtl1mIUYbZ
         hj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=FeZdzhQ7o+hEFdkQ9ckM9lXOSGwvk/X1hN6zUemgoME=;
        b=b7vPxw7dC9h2zIJxSONxp4KmLfi1yhcHybBk/0doU9+7gW/oBY2jktAeKUYZRevPTx
         wDzxufAhiFDwFQttlR/cKND16aoBZ3bkEN0mmKB9u5Jm7Ps7F8x3IR6G+7KPW381P64+
         0VPVsSXIzYVY9rPSfqXD9gQ7derrk1OoA8d1cfHWPfPkTuyHGDZSWPiZiINbVaXEyPJ2
         YuizY1sDa2X1/bCYCfQU30bFSRUTAFDcRAkbkaTZ616I+n1BKqxO0V8S/J5hQ07TlgaU
         YZ9uPypJThZyMq7QGB5SClAv9faB0T6L3KGDBRqE0lemunYl0S7aeSNTNADNwWDAWkfo
         3Ahw==
X-Gm-Message-State: AOAM530Pjd4Z0/VognDA4xX/X7WhLTrxKPNr5Sp0upnCIxpVSUn5OSjt
	ZMvKh1weUAVFkGplajmPZX0=
X-Google-Smtp-Source: ABdhPJxHCjoQtyOAcu5hfxbSlNQ5j+gDWbqQPzC7DLz1VnWL3xs8bbi6RChUvrUP5XmTZQ+ouPZsuw==
X-Received: by 2002:aca:bcd4:: with SMTP id m203mr2029366oif.138.1589955487849;
        Tue, 19 May 2020 23:18:07 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from dell5510 ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id c12sm577389oib.22.2020.05.19.23.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 23:18:07 -0700 (PDT)
Date: Wed, 20 May 2020 08:18:03 +0200
From: "Petr Vorel" <petr.vorel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Daniel =?iso-8859-2?Q?D=EDaz?= <daniel.diaz@linaro.org>
Subject: Re: [PATCH] ltp: Fix format security warnings with gcc10
Message-ID: <20200520061803.GB7338@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20200520052634.3291199-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200520052634.3291199-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

I see patch has already merged in upstream.
How about adding Upstream status: 58424835952641f4fd60c0ae3ab6c64decca3f8a

Kind regards,
Petr
