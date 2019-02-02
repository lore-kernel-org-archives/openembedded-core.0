Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id F00FD7C2A6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Feb 2019 11:11:19 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l9so9654115wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Feb 2019 03:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=fI73mVWur1keKlwxm4rMX/NkhLUpVwAWDAS7oR1ar74=;
	b=GjM4ezNHiei2fSY8mwLBSKq5Uz/+uZvLfSzKYrM/hbih1XF2lqkwt+tMXz4IlRNzZy
	SRn/h55f+nFp0qrlIy4vxKs7rh94rX6lfM1LPudoneFULhRIYt0Ern0+dSTYmzEAJwjx
	vbfINiB9Xcm6JRd/kAm23pbdl/pMOSZOpDPlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fI73mVWur1keKlwxm4rMX/NkhLUpVwAWDAS7oR1ar74=;
	b=b1DWxVVCGSkYE9ehbyN3t/Y7JA4qHpgfv/ZMOcxzT+GcmCoOy40xWX67pGwkGVhYgG
	+LmV06NQkdjHB9cFBQiUqpxZrvnNnrMGvXup1hw8u5v0tWrfRnS8yAu0sPynnTBUdubQ
	SFWtzqD5PoPQBeE9munARgXdmZglZ2F3gPO0gNyT9XImDUS8DK8uWLvZhWdI5jGqpYse
	dWfxfJmbbuo77MNNwUmxa81Ga3tqsNKpXIYuc1Doj+oycAJthX0GFNqomZGwmhylw5Ra
	3XqNdpfu1hh33UtP7sDBQ+/ILvx9T61x1fynWNWaJf0OImD6ryDiJeJUp6DFzgNbtyl4
	QEEw==
X-Gm-Message-State: AJcUukeifA+hlBAhK3aGlFBODPFUS0Qe81Z9iFLJhwVGem3f1xFMW6Ih
	9DGNvTyHeNtEWQWZhMmYwkGOAyqI2Ks=
X-Google-Smtp-Source: ALg8bN5PL4oouyKxC0GDEWFC7vJwVygaMFXdQUk+mGng7fZwUyW22u1uJkmI9Nr6Uf5+ZUu3KAVp1g==
X-Received: by 2002:adf:bc87:: with SMTP id g7mr41225629wrh.250.1549105880601; 
	Sat, 02 Feb 2019 03:11:20 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id l6sm6330089wrv.70.2019.02.02.03.11.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 02 Feb 2019 03:11:19 -0800 (PST)
Message-ID: <8c5afdcfe1a0d04dfd6fc2ecd85af16be6e636cb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 02 Feb 2019 11:11:18 +0000
In-Reply-To: <20190201211628.29409-1-Randy.MacLeod@windriver.com>
References: <20190201211628.29409-1-Randy.MacLeod@windriver.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] libsolv: upgrade from 0.7.2 to 0.7.3
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
X-List-Received-Date: Sat, 02 Feb 2019 11:11:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-01 at 16:16 -0500, Randy MacLeod wrote:
> Also drop the musl specific fopencookie patches since musl
> added support for fopencookie in:
>    06184334 implement the fopencookie extension to stdio
> in December 2017 so it has been in musl since v1.1.19.
> There was no change in libsolv's configure log when building
> with musl and these patches dropped.
> 
> libsolv NEWS
> ------------
> Version 0.7.3
> - selected bug fixes:
>   * fixed a couple of null pointer derefs and potential memory
>     leaks
>   * made disfavoring recommended packages work if strong recommends
>     is enabled
>   * no longer disable infarch rules when they don't conflict with
>     the job
> - new features:
>   * do favor evaluation before pruning allowing to (dis)favor
>     specific package versions
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

There was another upgrade patch already in testing but I've stripped
this patch down to the musl patch removal and queued it in -next.

Cheers,

Richard


