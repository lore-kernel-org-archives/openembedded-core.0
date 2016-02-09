Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id C8B036FFC8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 21:52:53 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id f81so141666iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 13:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dYrh8HAYTPQUTWDkjqLVsyE9JD6ZnKEv2u85bVAvoUk=;
	b=N4BVLp/vzjyRGMQ9krKTUvxAeNGvnFCx/HNNbkKngg8rGw3F6vMGzxqNBu5PhAi55I
	L0J1Qara36d/ukAT1j47qh0eQtFaKpdVCAmhM9nEYuKYlxq9HYROpG8Ta0c3oCAC6MRr
	6iVQmU4aQ9LEOenPzofZhvm0xLSr8QzYdOPVrhRoA5XBQbeGbCZMRhx3EyAurZ/f6vRp
	IC1qhjsYDPreVysoKjVtumFQXc9Slf7ara5hSq7CIvxHMBQGgHcRjshyRZUGQHnNc4Cz
	ExnMmqwdlR/k9HWi+POcMjPuuQd5Kcdnu1fVOZaaMFxaikfYgYlEUKLHJDAsYfu7ag5f
	kCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=dYrh8HAYTPQUTWDkjqLVsyE9JD6ZnKEv2u85bVAvoUk=;
	b=fYedu7AxRZiV73tb6WGJhBZuexvDk6MckzkPu4lMVxBbVFYxx2LQNaM9GBmbpgG+6b
	3Qvwfnh1vT5APu4HOAr57W28jyscRDkRa8eVzYukiDmAzWaKPC4dzxAj9td1g08fhKuh
	IWirQx4awbqNUkFSTf1dOzfqJrjmEyWVWyBlIIRhyhgYiZ2z4BehpwknhY4WDSDswjzG
	8xmUbmUeFoSfEj9spzTB0YCnsJVclvJ/smqRNbmawrDztj9SmvVW2rhlMec778UM0LM/
	xjNN43wjzUwBefsI25SYWKBipiO15hXTv8R6lgK1Gixe4vAkMZZmaciv2sqzb12/Cbd9
	9GrA==
X-Gm-Message-State: AG10YOS9Ei18dL/AMU2FRrzNGxu3RIJcw4I7ID1Ytyj9yGCzwLLvtqZXXPA0MAYrBEOmtoU8LRRoesC4Ck9FhQ==
MIME-Version: 1.0
X-Received: by 10.107.164.15 with SMTP id n15mr32416732ioe.148.1455054774004; 
	Tue, 09 Feb 2016 13:52:54 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Tue, 9 Feb 2016 13:52:53 -0800 (PST)
In-Reply-To: <56BA47DD.6020007@windriver.com>
References: <cover.1455047631.git.peter.seebach@windriver.com>
	<56BA47DD.6020007@windriver.com>
Date: Tue, 9 Feb 2016 22:52:53 +0100
Message-ID: <CALbNGRQfNy=M5Y-zQXgXb-nQcbNKe5G_3D816HnK37w2Lag1SA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] pseudo 1.7.5 [jethro][fido]
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
X-List-Received-Date: Tue, 09 Feb 2016 21:52:54 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 9, 2016 at 9:11 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> Once the corresponding tarball is available, this should likely be
> backported/merged to Jethro and Fido as well.
>
> Everything remains compatible, but it does fix a subtle race condition that can
> lead to files under pseudo control inheriting their host system permissions.
Are user IDs affected? If yes there would be a chance to reduce loads
of host contamination warnings..

Andreas

