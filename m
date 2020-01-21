Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id DA0BB7FD34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 12:04:15 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id t17so2129146ilm.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 04:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QfBloNDFmoiUvsCuNSuwGjAqT15fi2WlQgK2Pok1/mE=;
	b=FlTPktvb+CoVrlE3ygsTD0bH/0EIsbMUTkZ8ZYva4Pn1RdFAqa7vRtkbTdkb1QPVdK
	o1OjtudWmCCh+yhYcGJVNeUjnrhd2LNkehQWECUsa/SZBrerz3+Ck0hwSbc8lZK0byzf
	Vu9NI7gvz/reixW4fZ10tRUcTRn4PbEwVVRa1h0RgThsbK667qk8rWazhzWmB8XUdrvI
	bP80mwep9IOkumJWaf0d30DUMIHPvRyqZXc5TDLIYOThd7P7+X9CL5cdjpq1Xydi9Gma
	fv45Y/CyEzbGOTFrPH52jDJyA7sU3v1iwmi9drseJPsG/g+KH7foA3FCtGIjg38neHNC
	Z8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QfBloNDFmoiUvsCuNSuwGjAqT15fi2WlQgK2Pok1/mE=;
	b=dPzu2Hklr4QodjN7JE2l4Kkmw7eSFqGH8cm/7rHjCzlsIBXO5mBzSQf/P65RWagpvM
	VTjdKhzi443q7T+0bJdT+gZFKjjn6qSmzhGY4jOPdGtiznKs+joJ/t8Jos+92bBdKdbA
	VtSqU6ZfrnAY/p2K71Wb9T1rLbTFoh2mEhMF80D9dy+q6phw8F+KfHiH1C/EJnIMRTIP
	QxOCHkJiLjvbznJGPQNjJ6HOKpcWUjbnxNcMPVqp4wNiZCNOXaDiqtOVdY+QU/cHTlWG
	DtJDBR1h4AvHsTE1cQusghbATo4D+PRDYSooVZlcrq9XgocwZVtDjuExNSV1v47xLHh/
	NRzQ==
X-Gm-Message-State: APjAAAWrXVzznqu1hcTmnk9Kyngm0+tFJeIxU2HFW5K+flQnJvZD3eIZ
	by0bKDW/hFDcl3KuRuECW+ItTdGVWpqATwLB99Q=
X-Google-Smtp-Source: APXvYqyRYpCmAHBaN1xlMkCb1Hlad69HaT4nG0Nl2Il31ecCOs+yglTxcN8nr8EOUkndwfFxYE/hOibMDHMPjA2Vh/A=
X-Received: by 2002:a92:3b98:: with SMTP id n24mr3526868ilh.108.1579608256809; 
	Tue, 21 Jan 2020 04:04:16 -0800 (PST)
MIME-Version: 1.0
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
	<20200120172510.22648-5-alex.kanavin@gmail.com>
In-Reply-To: <20200120172510.22648-5-alex.kanavin@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 21 Jan 2020 13:04:05 +0100
Message-ID: <CALbNGRTcVRb7obS2g8d6fipNUervDr0ZYvJ+izLmCJH4h5QRyQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/24] nss: update to 3.49.1
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
X-List-Received-Date: Tue, 21 Jan 2020 12:04:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 20, 2020 at 6:26 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Drop a backport, and a patch that causes build errors with
> the new version.
>
> Add a patch to make ARM HW crypto optional; upstream for some
> reason does not allow disabling it.
Thanks and FWIW - I tried to subscribe to their mailing list to ask if
that was intended. To my surprise I received:

| Your request to the nss-dev mailing list
|
|    Subscription request
|
| has been rejected by the list moderator.  The moderator gave the
| following reason for rejecting your request:
|
| "Not an active NSS developer. Contact jc@mozilla.com to argue :)"

Wow...

Andreas

