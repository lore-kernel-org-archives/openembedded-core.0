Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4226474C0D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 11:17:38 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id e135-v6so1292506oib.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 04:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9RoayYbtMd+zflpo/Hm+c1Ff/RJFikU1fNEYvY7uYq0=;
	b=bJq8mMjli3/OkVUGl5VzeJNaBqdOJmvFxYX/z/gdnSkLg/AVek78tj/uIoPZgj9aQd
	/Hl+inH3PTv2ECvodUrvnUR1qrt8d9WtaqwgAPocsUT4oJ/gzJnYBMC2bipchlDnGNmS
	CTvNbBh/q4WuP3UqpWKci7+tb3o4kZ9Rh+H3C/JVoOnF344EvKfhvLLgL3x+KsqqRi5A
	meySa8NSbW5+nWUR69KGOcJSr2O52M9xzo2O3HgeF3s0PMRw9+Zhn3y8J0haRFqPcyKj
	DCa6X0Qmzt3Rh4ZZlZ4upxBeCcaI5sXKqHWHp4LhTFR1eTT5E1Q/u9LdYOU7l8y+T2jB
	aeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9RoayYbtMd+zflpo/Hm+c1Ff/RJFikU1fNEYvY7uYq0=;
	b=tkowgA7V5jEfHTP3DfjAdJKNUzjIuhksL75j8SkE/nNZDHKgkz/bvhvZm+Nb5D9L9n
	Cy3NPBojROtxE+nyUDHuNrcokSSmyrXBiB8/t7pMMbXV/GUgPYvwkW2YxJjfm5FJdU8A
	iOPFGgmsObcr5GIfKOr8EIR/zhhTa8QFrqGmeypnJ1OAGUcunE0bVU7AXw5TXVt7xusI
	N4hbnpKXthTpp7uzuKZFKcMSqJ054xGiaEfdRSEREhe+aRMA3lxgKLVaOiP+f49RsFbk
	KoTC6wBYEj0SjvHyWzLf/vFwJ4Pm+h/FRNnTha9/wAQg2WarAYsnbyWy8fZ9N+HPou+O
	HkVw==
X-Gm-Message-State: APt69E240dVp7UZRvuH6dobbV6IT6cf39XaEsamJ1P4TVXCM0w0yeWT8
	W2wOvGyS4sB3Yd5n3f4XW/4w4fgcL/k9lO82Lcg=
X-Google-Smtp-Source: ADUXVKJsaoqUnVzV5oKGNaUJgpNfqPCKocsKicAhp58BXBXGRyI01Ot//a6ZY0aFB2IHgKFSCEQ6UFiCSvc2nlCopvE=
X-Received: by 2002:aca:c4c3:: with SMTP id
	u186-v6mr666564oif.51.1529752659251; 
	Sat, 23 Jun 2018 04:17:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Sat, 23 Jun 2018 04:17:38
	-0700 (PDT)
In-Reply-To: <CANNYZj_Vprkd=2gJKydazzUtTKoLYgyZcOd_yjQymzfRp=vqrw@mail.gmail.com>
References: <1527502858-81691-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0LZVcc+_ocfuYEUBKK0Hbr0SaZEH7CUYKK17gMk+CXwxwg@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AE9A7F@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CANNYZj-ege3VdhZ_AR=CpTmOZc3yyO55BOpt0YZNMk+Ww2BpJA@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AE9E2F@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CANNYZj-xJa=pQwc3ORfzjOXqvOyKWHbOFVFPh=oH1J-urrZmKg@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AEB0BC@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CANNYZj_Vprkd=2gJKydazzUtTKoLYgyZcOd_yjQymzfRp=vqrw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Jun 2018 13:17:38 +0200
Message-ID: <CANNYZj-L9xYx2Ofbee+G7Fjn7QZLwksu=gx2dvbwhB291J8OdQ@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Hatle, Mark G (Wind River)" <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-toolchain: Added dnf-nativesdk into cross-development toolchain.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Jun 2018 11:17:38 -0000
Content-Type: text/plain; charset="UTF-8"

Maybe Mark can add a few things as well.

Alex

2018-06-23 13:15 GMT+02:00 Alexander Kanavin <alex.kanavin@gmail.com>:
> 2018-06-23 12:50 GMT+02:00 Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>:
>> Yes, modifying the image recipe can actually customize your root file system, as linux vendors, they are familiar with bitbake and it's very easy to them.
>> But, as I know, there are many users who are not very familiar with bitbake but also want to customize their root file system. And it's hard to make them learn how to use bitbake.
>>
>> So if dnf-nativesdk can be used in sdk, as linux vendors, they only need to provide rpm packages and sdk to users instead of teaching them how to use bitbake. At last, users can use dnf-nativesdk to manage their packages as what they do in their host.
>>
>> So I hope to add dnf-nativesdk in toolchain.
>
> Thanks - I see the point now. I guess this is something we need RP's opinion on.
>
> Alex

