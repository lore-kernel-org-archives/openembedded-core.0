Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7672D61A41
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 15:10:56 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id dw13so2526350pjb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 07:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=VA4SRYchxruuXl66zVBZm8RsHGnchFWDEsVJZ0gbq6I=;
	b=naHy5Tz0im3ftjtzztTHpI/uIFCy5WssGmNVi8w7q7GeWOy9qNaXNhS+P2twqH1zEO
	hL1XFUW5yBs36Xz+IQp3YZuKrtRewNqUutLfYLd/+e31ZCNFBbHOfF29ThyixKwmIKl/
	AiA+J1F5fpFSNAhTQQjPCNZt/qjza4yQGEDTzoNvrPn2zmyoKJYe8/bZ44gZxeYd3sJh
	0qeecS0/8H77GmgXWih04g87WP2FQYgQkVv/Z5Nb8sVxXWnDSi7r76cXju56excatfqP
	3nS0wkTIEKEL2a3JuWVNKMchDku8g2CeOwA9cj1bcXq4S6AfoyXgOtLc1Va3dk7tbFuX
	4Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VA4SRYchxruuXl66zVBZm8RsHGnchFWDEsVJZ0gbq6I=;
	b=BgFE8J+fzTsaeW/yikrth9EYy9WNQq2ke9W9iwDsLMlPI++/gOjoWfdngrf2qMtOmd
	7QkEvBp3g2Izs3p0gv1UAV6GOusZ1fCWKO/0D9kOz4AJg1MyvuKliY5y3psT1B4nSzV0
	XJ00ko8c0wnq2BiJoilKqoeTox7zc1mnknBGsyrx60KIMQGNmLd6MUuZu+jvzdJ+DkQA
	f8oW46+qm1uT/y0dDwEP8E3qOzgJWmNSPKkFwa33pORcDIzvcyceVAdvyIxTv6rePC0E
	RVfEg6Eib8SW+R0fbsJDbzpWVxV87Uyn7IB7PqmsX1kAaI6qYlGQnd9mqbPgQk5JTGwk
	ujrA==
X-Gm-Message-State: APjAAAXCG9Q9ucB4/kL1mVCacoWg4QOxsQHXqKm+ewMWCQubBJo58xnD
	mJz34LAn2YfJwcDG1zWixPyvyZ+H3gc=
X-Google-Smtp-Source: APXvYqwA7Wk835w1BC42+ZBrbr9m8O1WkvVXv6aGsg5L32+Z4myRJT2mSYFKcMLrQ5vc1T0EpAzLkw==
X-Received: by 2002:a17:90a:858c:: with SMTP id
	m12mr10144990pjn.127.1582989057168; 
	Sat, 29 Feb 2020 07:10:57 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:8446:2edf:6d4c:9a00?
	([2601:646:9200:4e0:8446:2edf:6d4c:9a00])
	by smtp.gmail.com with ESMTPSA id
	iq22sm6275923pjb.9.2020.02.29.07.10.56
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 29 Feb 2020 07:10:56 -0800 (PST)
To: Petr Vorel <petr.vorel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20200228061225.32003-1-petr.vorel@gmail.com>
	<6558d8c05b858a831ecd4dd79df70f4764b10c6c.camel@linuxfoundation.org>
	<20200228120849.GA31133@dell5510>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <c74b94c5-b3d0-2eaa-9ba9-2de687cb44ce@gmail.com>
Date: Sat, 29 Feb 2020 07:10:55 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228120849.GA31133@dell5510>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Sat, 29 Feb 2020 15:10:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/28/20 4:08 AM, Petr Vorel wrote:
> Hi Richard,
> 
>>> Changes v3->v4:
>>> * Fix musl build with LIBS=-lfts
> 
>> Unfortunately the musl build is still failing with this version:
> 
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1627
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1631
> Any idea, how to fix it? libcgroup uses the same flag LIBS=-lfts.
> Maybe the variable isn't propagated.
> Or is the dependency expressed enough?
> 
> DEPENDS_append_libc-musl = " fts "
> EXTRA_OEMAKE_append_libc-musl = " LIBC=musl LIBS=-lfts "
> 
> I'll have to put back patch
> 0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch, but that's bad,
> buildroot works without it.
> 

yeah in OE we fixed it differently so far, by patching makefiles, but I 
agree its perhaps suboptimal since the patch will not go upstream, we 
should pass -lfts via LIBS to configure

> Kind regards,
> Petr
> 

