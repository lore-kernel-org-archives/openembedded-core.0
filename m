Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.17.1614015435312450575
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 09:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IAcIP5e+;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id m6so7051632pfk.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 09:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YSXLpkW32VTbCERepVMiThYXomHhawS30a6uDh95Q74=;
        b=IAcIP5e+J703d3RtAvpA0UMW1hzV4rHXPx3VdqpYT8iKiPq6pAByNccEQK1m1REcAm
         AQO3KUb55LhT9qQCGZNYEO34Nxci95RX+3wfkD8AcjLbxfgGFzz2lYFgDSKUxhXTabSP
         vOjEnvF4RtnNNw31tR4hkvCtue2rArJZAT2bRK8HXlRAZN9Hq6ZqwS5x9AgBXlL+ZNEN
         pHOE+cw70yVjslzgix5++ydJoAoHx6/NYtFy6OHq9XddurmdaSoN/ea986TkN96zlHQm
         uF41oLnnmedzqCAK2OP9Uf7DYGDyVf/4UUo1c6/KVBJK6Q+Kr/vI4OFAukE4LHJuTnPk
         0TmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YSXLpkW32VTbCERepVMiThYXomHhawS30a6uDh95Q74=;
        b=e/SiPXcoBHWpm8QPUNYuVxDa3iSZ4y3LKyfk17UUQkjG5tZWWlzM+idXmU6ExPZyrs
         h1sU68EiiD1a2aClQORhi6Z6qEzDnQlrP86MvtypmRZ2EQn6REnhL55GN/BZB8kujKMc
         8sX3UE3pPszwVgtHebPLMgwFX9zmdsOBGeBgcF2zueYU72cPR2rdqaeNxVp/o88RVTzZ
         Ud7hO7Bt/ykl8/4eqqGFbXkvtScZo3AtpZtCasnX0p5IbTCJKMu5YhEL+5iki5M8GzL5
         ImCFNb5rTs8J2VbOeAxcO06djpMxg52o1hvfVyGI13BD5yc7ib3d6kY1VWZEQEAdeX//
         xIrg==
X-Gm-Message-State: AOAM5331Ybq+xh0MKC/Z8IEUAGQMXNBB6YDbRNIgE5cHVgu0CmNkXT3/
	b6eY1v5Hs846zUDb8aQBBbs=
X-Google-Smtp-Source: ABdhPJyNijWpDGLFjh6D1KhJYGMr1nuZ9a0+KH3aoIhXsafiWmL2kO/4B0j4yaOQ+F8ivJpTUHefZw==
X-Received: by 2002:a63:34c9:: with SMTP id b192mr21202731pga.175.1614015434678;
        Mon, 22 Feb 2021 09:37:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:db81:2f56:60e4:2c64? ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id w25sm2834851pfn.106.2021.02.22.09.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 09:37:14 -0800 (PST)
Subject: Re: [OE-core][PATCH] busybox: search stable versions for AUH
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andrej Valek <andrej.valek@siemens.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
 Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
References: <20210222154956.27267-1-andrej.valek@siemens.com>
 <4462ffe940c0fa879486300e5d7d358045604133.camel@linuxfoundation.org>
 <CANNYZj_1RL9rSJxaaRTQf__mnzEr49Eze5gW44TBtJn7FEhN0Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <9ea4df35-c70e-e03e-7fea-e56960ef17c6@gmail.com>
Date: Mon, 22 Feb 2021 09:37:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj_1RL9rSJxaaRTQf__mnzEr49Eze5gW44TBtJn7FEhN0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/22/21 8:39 AM, Alexander Kanavin wrote:
> On Mon, 22 Feb 2021 at 17:02, Richard Purdie 
> <richard.purdie@linuxfoundation.org 
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
> 
>      > +UPSTREAM_CHECK_URI = "https://busybox.net/ <https://busybox.net/>"
>      > +UPSTREAM_CHECK_REGEX = "BusyBox\ (?P<pver>\d+\.\d+\.\d+)\
>     \(stable\)"
>     I just realised/wondered whether:
> 
>     inherit upstream-version-is-even
> 
>     would work here?
> 
> 
> I don't think so - busybox seems to declare x.y.0 as unstable, and 
> everything else as stable.
> 

is it documented somewhere that x.y.0 is unstable ?
https://git.busybox.net/busybox/commit/?id=a4c3a341394a1fb25be8c15d2ddfe3ec77cbb83c

seems to indicate its a normal release.

> Alex
> 
> 
> 
> 
