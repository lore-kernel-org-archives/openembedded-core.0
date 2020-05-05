Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.3749.1588666283070489933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 01:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HhQfwmYY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id x17so1575454wrt.5
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=4+PMgtfNfDcyDtc80HHPjh9nCtdXTQWIghFjzH4P1Yk=;
        b=HhQfwmYYBVChwSAf7JkCt0999g7lbIqkkumeEXI1/2MMSkiMoLYNVUO465hhWZQppl
         5/Bn0q4dwf+b9xw0YLsKVJRoLQLjWPAw6sle8FxGH9lKR4Ii4Ybp7GGKNI/Is5x+tnGw
         hNr/Bo6Tr3InGknRGyCYf8VaRwZC+wRfuya3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4+PMgtfNfDcyDtc80HHPjh9nCtdXTQWIghFjzH4P1Yk=;
        b=qdiayoUwnaTkdIsUt5l2MOR50XSDqfdcXHaf7XmOEJlhrkUrgZ1SysO2m5oxDW7Kpy
         7XCmd8jZ/GoGj0nCe/NJmwZJ2dGTDI0aO+FWuAUOXk/SoKh7OiwB2AMoF1lWEPx6f7xl
         9bHIwV9bc++SgE6EwX4ACXejaML2Uu5vimZo0xRtBI7PEbYOZOIA2S82z7blBAo/V324
         aCN3JP6gT0zPI3AVYutIqkm/F8VNP13t/Gg2bahzLLKkm5sS6A0zQsovTG0KMumwWNaV
         Yu3hKw/LxXiwOezheKWFVtNMPnKqXatjn0pFEaXNN4Ih3EGKoXamUf7ZoeK/WC26ucw7
         Zbxg==
X-Gm-Message-State: AGi0PuYFCl35FjJYHrCVFsQXX9jZKXxC21ThxaoO2aplarrn0wov4okj
	Q+UhCV8CNINDXYhhp4ZEOxBJXg==
X-Google-Smtp-Source: APiQypJCQKwMy364k6dtnNX0CnJMC9WoFDCZ5Lu7D4zI3dUcJ1lAUxmcwIOc71eM7r2qBB2iaA58zg==
X-Received: by 2002:adf:814a:: with SMTP id 68mr2272673wrm.177.1588666281478;
        Tue, 05 May 2020 01:11:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c190sm2584644wme.4.2020.05.05.01.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 01:11:20 -0700 (PDT)
Message-ID: <abf15032d9b14a18031f0c017ab422365d386930.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] icu: upgrade 66.1 -> 67.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Valek, Andrej" <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 05 May 2020 09:11:20 +0100
In-Reply-To: <AM6PR10MB30002791F30A5942D6CB496592A70@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
References: <20200501082616.11296-1-andrej.valek@siemens.com>
	 <AM6PR10MB3000A0A64DB428E5ED6F33D292AB0@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
	 <CANNYZj-0k=gL0K6b5r5U4SJpRo-cnUNO7zymt4J43uzapH6JKA@mail.gmail.com>
	 <AM6PR10MB3000922C3F644E6916BDE3C092AB0@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
	 <CANNYZj8OcGr5911zfRXpKaEYY-3o_WJCoLZoybE+=863==L2tw@mail.gmail.com>
	 <AM6PR10MB3000E49EE4C38CFA9947DDA492A80@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
	 <AM6PR10MB30002791F30A5942D6CB496592A70@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-05 at 07:56 +0000, Valek, Andrej wrote:
> Hello Richard,
>  
> Could you please take a look on it?

I will. Keep in mind that I've multiple people asking me to help
understand why their patches fail in testing and I can only deal with
so many at once. As soon as something needs extra work like this does,
it makes it harder to get around to.

Cheers,

Richard



