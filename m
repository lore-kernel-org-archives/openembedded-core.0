Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 22B4277438
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 17:50:02 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id 194so82859089pgd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=W8nnL4kBdHMU3IVpIbHHdxGKE0I6RBrHDz1lcXvqZyk=;
	b=EMIoQA8Na7zyP+rTBAx1lZlrRBOR3QauxoJQOmc+azttl5v+sIiMVKAY+F120eQUTK
	lG9L/6OB4YCQ/XHTNUIRL0h0tKIsWa++qT9+YIsvOxn6yJZ1cwI8sgt2RytZvlH9Y1z9
	rh9SNJiY1EbqcSNIzpMEBpglravyB75hKpP0knym87hHbz4JerieAGSlYsTWNtjMPfQE
	BQllMPUA0/x3m4CTakUcrny7rtm8AVX8pUPNxuk/Ri/NeVIUZE6BBttgTBBpusaZ6dJJ
	ymJG+RjF/2QwSe7uEhqc+D2c+Q3b4/dvSPWkHsDg6On+b5SEVn2C4UAFtGhfs0HUqCF+
	lRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=W8nnL4kBdHMU3IVpIbHHdxGKE0I6RBrHDz1lcXvqZyk=;
	b=Q9nJTv4mtKtnImLwrW4I3HIlk/3BIqFYleLIVIOzEbTrspD+t/kGzBlcXVdIRDNyg7
	TgRHBAj6AKetrBxEd3zUKmpBUK0yxLMGRxRvanEUatLxbYNoH7y4RicD0eO+hwupeo9q
	Sv0YI5IBs1jvRGLlto8ujyEdume3wk08uUUDMvG3GAW+1AAbHc0BEy2zjZD20ef59nW6
	nwstOSB8ADsqRCPJGFQR0ZNK44CRQcv0NFG/hga3VJH7xXFP48emQ1DZ5BuLSEEwjV3D
	IPMMXvyddcO1SsSb9pSBUvHydg/5YxkS2F20M9FYUZQwQSCYof0PCCy7aPZfRW+g2cwq
	FbzA==
X-Gm-Message-State: AIkVDXJ3tBVAnKwNZBLGUG6sEiWn10yXhgsvIju8C7sfzo9dzNd82QjQFp7zlum1SvkJIQ==
X-Received: by 10.98.209.73 with SMTP id t9mr10677280pfl.9.1485539402911;
	Fri, 27 Jan 2017 09:50:02 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:6d8d:a1ec:12d:52de])
	by smtp.gmail.com with ESMTPSA id
	r17sm12893886pgg.19.2017.01.27.09.50.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 09:50:02 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.20.1701271013090.21304@uk63952.mitel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <c0812a20-bec4-8e9b-5375-742adf17d496@gmail.com>
Date: Fri, 27 Jan 2017 09:50:01 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1701271013090.21304@uk63952.mitel.com>
Subject: Re: why do (some) apache module recipes depend on both apache2 and apache2-native?
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
X-List-Received-Date: Fri, 27 Jan 2017 17:50:03 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 1/27/17 7:17 AM, Robert P. J. Day wrote:
> 
>   i was poking around some apache module recipes, eg,
> apache-websocket_git.bb, and noticed:
> 
>   DEPENDS = "apache2 apache2-native"
>   RDEPENDS_${PN} += "apache2"
> 
> i can certainly understand that run-time dependency, but why would an
> apache module recipe have a build-time dependency on both the native
> and target form of apache?

it might be needing some tools which are build during building the
apache2 itself. Since we do cross compile we will have to separate
building native and target pieces of apache2. Thats one of reason why
such deps are needed.

> 
>   is there something unique about the structure of apache that
> requires the native component of the sysroot even when building for a
> different target?
> 
> rday
> 

