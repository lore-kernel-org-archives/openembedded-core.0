Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD436007C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 14:08:55 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id j20so6585163qka.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 06:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=DqZ+gUwk8hNMll4MmYQLrS4vg+sshoQkJYvt1TkXD2A=;
	b=nAxQXfyD703kZYz3HKB5SneLXouPb9MxPkDvgGtIpkfpacJ1RBrBJ2nT0STNJ5gNKj
	7vHCH9r/7r4KPEpoHNFi5PjZVQFXCo6QMEV8ZceCj6QLJfvWKdRmbTVnQX59A9aMyt58
	BuimVdkwDjSIdAOnKXPOcWI3M642RVNS0cR7EuIX4qwHAL93kClnd8uU6FaZEkfOj+Es
	uOBs9LDg0tuKVFIOKwGu1pXm7u5I02SzU0qK78x8EourvRAZNU76Pkk+LAEBNfsWT3Vl
	IfihGz8e0CDG5hySJ2stjHgcwEfP8RSQGeh/9JJBo6cB0MzLTDqSGyQoHhXUcUhow/cj
	lgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=DqZ+gUwk8hNMll4MmYQLrS4vg+sshoQkJYvt1TkXD2A=;
	b=I3xtvQ188yiJH9lCu+oPZb8h+EAWM2LrmJUuWly1g39sZjHUs/9g7XcZt1+Xrb2Urs
	C1iB6CfYDwaH0TZIyi6I5fcXx29cQGEFQJVvM/P4PL5MDemmk1zc7K9pkfw2Ij7nrCZ0
	Qv6zbaCLhqpZQThSJNqm2dOBkzB4SJCIjaZ7pkwHI1S5TLbE+8N8/KELsL53b/zbJi9k
	mtTqYJQyQHoTnIFceI5gguWLyVJbILjWvuNDk/puF1KlrEoXjtvfNB2FiY3AZIv6P7Uz
	2T732yCcb6Gpf0991JcvWCsIaD8wrp7+E8kn0wLij6hMF3J1Xnb6AZAlww3XVVOdB6k3
	g9pg==
X-Gm-Message-State: APjAAAUqREx/DhJ8JjV+X0jXzCxCCEp3tMyMgVi9WKXDL/fubH+lSJF+
	si4bldnAJIxSND+GAqplt8+ueT1NQNM+VA==
X-Google-Smtp-Source: APXvYqzKX15NFwKqP2cMpkL3OotVFRAnE40wY+ev/AvP8xaLIE//BM3Ss/rAM7ziAmx8r7F8LWR5dg==
X-Received: by 2002:a37:6551:: with SMTP id z78mr11224779qkb.144.1580479735836;
	Fri, 31 Jan 2020 06:08:55 -0800 (PST)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
	[209.85.160.175]) by smtp.gmail.com with ESMTPSA id
	y27sm5158397qta.50.2020.01.31.06.08.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 31 Jan 2020 06:08:54 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f175.google.com with SMTP id d9so5423797qte.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 06:08:54 -0800 (PST)
X-Received: by 2002:aed:3e53:: with SMTP id m19mr10911014qtf.387.1580479734182;
	Fri, 31 Jan 2020 06:08:54 -0800 (PST)
MIME-Version: 1.0
References: <20200131133324.3791406-1-otavio@ossystems.com.br>
	<20200131133324.3791406-2-otavio@ossystems.com.br>
	<CANNYZj8C6JNTypMzoVSheVfCt78bxh_RdDmjjijsGhSXGB1gFg@mail.gmail.com>
In-Reply-To: <CANNYZj8C6JNTypMzoVSheVfCt78bxh_RdDmjjijsGhSXGB1gFg@mail.gmail.com>
Date: Fri, 31 Jan 2020 11:08:42 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqPip50E7Ovrsm8_zpip-EH6n4jw=GeyVbA=BoBnUrN1A@mail.gmail.com>
Message-ID: <CAP9ODKqPip50E7Ovrsm8_zpip-EH6n4jw=GeyVbA=BoBnUrN1A@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] linux-firmware: Update 20190815 -> 20200122
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
X-List-Received-Date: Fri, 31 Jan 2020 14:08:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 31, 2020 at 10:46 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> I have sent a patch for the same, and I think my patch might be a bit better as it adds the two newly added license files?
> (there's been a problem with oe-core list for the past couple of days so you may not have received it)

Good. No problem. I'll drop mine here.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

