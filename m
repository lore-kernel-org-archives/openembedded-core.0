Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 979A07FB43
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 16:09:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id f129so13851596wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 08:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=zf4grwxplmJ+yp0FkCC17lY2ZbmcbyMZ4ihQc3mbJM0=;
	b=ejunsvNeHeGns8QjVof6oXdXTk91KbnNsDsLiY8kx5LKru9Gc5akublF3qD9nXSiwA
	wBX3UZg61GHwPWHzSEG/wQAgZ5XDBMnQxxGKP48HrXHZF1h8gJ0blYUa5wIJEm1P+PIF
	o4iz3m40Lf5NGSzZXvzJao4UEzCFJ91HLIb1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zf4grwxplmJ+yp0FkCC17lY2ZbmcbyMZ4ihQc3mbJM0=;
	b=Upe7L48J6j2hBRNFmwPICTokcdB8TnOYt6Q6Az/OVZt445VwgBkJMXK3ZjHDqdBnM9
	8BnTpqSd0Qqd0PO84VX8sp/8kOq2xiXOKvicjSZpZ0ipSGt6Hkld8pSf38qFjHml+fje
	1RVj4qoWJoNBLCThdXFWSqPWQvICqk1AsxZod13hp1sdmKvSMVzYut/HbuAXKEbOU0gK
	7epD9O2RsH0aVJ3Z6THx+nV0DxhySqpW2iit+wBiWN7B7sFMW+jyca37AIwGRWyNn5W9
	q9N0ck4hWKyRfN4DwKV14w+kEN2EX9PD8xflf8hXeHlUY1XxR1v4JN7TJ85a4pdKr2GE
	COcg==
X-Gm-Message-State: APjAAAX4VtTn1o3nFLeDwEXRY+uB24brcFs1J4LBOfWJvwPYhka4r5cL
	6X9Dndk0plK1kF8/sJuYEPJBFA==
X-Google-Smtp-Source: APXvYqyEmEtI0eUv7Qdzcy5rT7QxJJacleI1IdPF1lcqTBn6qfxE2PkC2vJTqvJcYJ6zc+UZG2NUuQ==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr28418250wmk.15.1577030970110; 
	Sun, 22 Dec 2019 08:09:30 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p17sm17258609wmk.30.2019.12.22.08.09.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 22 Dec 2019 08:09:29 -0800 (PST)
Message-ID: <cd4a5e26597d3b09392d76edfeb018ea38a368ff.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 22 Dec 2019 16:09:27 +0000
In-Reply-To: <CAJdd5GYZydn+kxHw3jP9AuJWWv60nxYwFPYWtrSGi1-q4NJNiQ@mail.gmail.com>
References: <ce6615e19c75117b5d4458334af60107fba830a6.camel@linuxfoundation.org>
	<f92e77c992efa93542732e335a99177b5903a11f.camel@linuxfoundation.org>
	<a73ba44d3f16704691971ebfede683de21b2e65d.camel@linuxfoundation.org>
	<CAJdd5GYZydn+kxHw3jP9AuJWWv60nxYwFPYWtrSGi1-q4NJNiQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Debug from failing hashequiv builds - server side problem?
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
X-List-Received-Date: Sun, 22 Dec 2019 16:09:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-12-22 at 10:00 -0600, Joshua Watt wrote:
> On Sun, Dec 22, 2019, 6:49 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > On Sun, 2019-12-22 at 12:08 +0000, Richard Purdie wrote:
> > 
> > At query time in a clean build, the hashserver cannot know which of
> > the two output hashes it needs to return the value for.
> 
> In the case of multiple taskhashes mapping to different output
> hashes, the server is supposed to simply return the oldest unihash.
> If it's not doing that, there might be a bug.


The problem here is a single taskhash mapping to two different outputs.

m4-native:do_populate_sysroot (on aarch64)
m4-native:do_populate_sysroot (on x86-64)

When we query based on the input hash we'll get the first built.

We then rebuild as its not in sstate and can match a previous task
output, we then get a new hash.

If we start a new build with no cache, we lookup the input hash and get
the first built task of the wrong arch again.

> > I can think of two possible options:
> > 
> > a) When we report after running a task, we check if that input hash
> > already has a value and then reuse it for the output hash mapping.
> 
> I don't quite follow this one, can you be a little more precise with
> what hashes you are referring to (e.g. taskhash, unihash, outhash)?

We lookup a taskhash, get unihash A but its not in sstate (wrong arch).
We build this thing, send the outhash, currently we get unihash B.

I'm saying we map that outhash to unihash A since the server already
has an entry for it.

> > b) We start adding some kind of suffix to the reported hashes for
> > native output which is used within the hash equiv server but not
> > sstate.

I was thinking about this further and I had a slightly evil idea. What
if we set the method to XXX:<native arch>"? (where XXX is the current
value).

This would namespace the two native arches separately and I think then
avoid the problems?

> Just for clarification, this is because "native" can either be x86_64
> or aarch64 but the actual arch (HOST_ARCH ?) isn't part of the
> taskhash calculation?

Correct.

> This sounds related to the gcc-cross issues we had with the eSDK.

The previous problem was on the boundary between cross/native and
target. This is a pure native (or cross) issue.

> Is there a reason that the host arch isn't part of the taskhash?

Yes. Should the target output depend upon which arch it was built on?
(answer, no it shouldn't so the native hashes have to match).

> I think it might be possible to report additional inputs in the
> hashes reported to the server. The server doesn't really care if it's
> the exact taskhash, as long as the client is consistent. Perhaps that
> would help with the gcc-cross issue as well?

It won't help the other native/cross to target boundary mapping issue.

See above, I'm wondering if we could abuse the method field to make
this work? Certainly we could test that...

Cheers,

Richard



