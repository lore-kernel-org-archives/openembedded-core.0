Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id B38D26B5B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 12:50:31 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id sa20so955602veb.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Mar 2014 04:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=p44jHYwvxGi3RIY0YcLy0Fx0dOdV3jFnbLfX39gBS5w=;
	b=t7ZdqTbIpv6LGhKCZ2n843V/Vwgl/Zj5LweT1ubeRqjNVt4cn23i4xn0MAnk8n2Zie
	uYzlAFR/YYTRUDyP7fdnThf53fBVVu/mCr8OpxLPgBB+H8HyT+ibETVfHHoZT4I3wMG4
	QKS5peiWaWbkbF3BrA+UiYZhSCwZn3urSpChZjTPv4jbUI7unxOz4+qNanz2D0nQ+GOS
	z7dEZId5pIGWaU0zzkCAz9rD9Vs7FvxnvRFgxQpVuf3pTm0Y6cZGop70qIXbTp3YiaKY
	2oW+kldovZCHMr/DeYQkmrSRnQZE7dQG5Zb6+ZAGDI41L9/y2XYrc/g/ErgEhGLeZv2S
	A87A==
X-Received: by 10.58.128.72 with SMTP id nm8mr245211veb.18.1394023832689; Wed,
	05 Mar 2014 04:50:32 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Wed, 5 Mar 2014 04:49:52 -0800 (PST)
In-Reply-To: <5316F554.1030201@windriver.com>
References: <cover.1394010463.git.Chong.Lu@windriver.com>
	<c00e7a2047ec6a4b4f46722f49176b08ded90509.1394010463.git.Chong.Lu@windriver.com>
	<1394011283.31845.97.camel@ted> <5316F554.1030201@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 5 Mar 2014 12:49:52 +0000
X-Google-Sender-Auth: Fl_8j3x0L8PNavYiHS3CN9pDvhk
Message-ID: <CANyK_8eviu1Tpoggak7UGEX_i7EJBfWN8ugwUoSMifC8hNXjDA@mail.gmail.com>
To: Lu Chong <Chong.Lu@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] flex: not to build shared libraries
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
X-List-Received-Date: Wed, 05 Mar 2014 12:50:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 5 March 2014 09:58, Lu Chong <Chong.Lu@windriver.com> wrote:
>
> In flex 2.5.38, libfl.so was built by libtool.
>
> ipsec-tools shows this problem.
> When link libipsec.so to libfl.so, it uses '-lfl' flag. It will link from
> libfl.so.
> But libfl.so doesn't define yylex, we may get "libfl.so not found" through
> `ldd libipsec.so'.

I've used flex before, this is correct, libfl is not supposed to
define yylex. See for example
https://www.mail-archive.com/tools-linking@mail.opensolaris.org/msg00601.html

The problem is in how ipsec-tools is being linked, not in flex. I'd
suggest patching that recipe instead.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

