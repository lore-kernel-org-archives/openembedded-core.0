Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id A61397F9BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 11:22:36 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id f2so14135538wrs.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 03:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Pp8nLNPW/wqiLJCT2KDjHQADLbsnVqxOnboFbhly8Iw=;
	b=TWXzl+rcK4D3hBLFAX1NujnkI3CleoE9m44i9lcyqMfvUbLT0IzkDEaV9Fwi1ggRUh
	Ujntjj7zqdhlmULIHBFl7DiCzPOiIYEewhqLJPfQ0HOFOOq8q7CN6QTLjeBBCwCDgwVb
	MtPjjycRVi+g2473vwx61eSCE7ztBpypAywyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Pp8nLNPW/wqiLJCT2KDjHQADLbsnVqxOnboFbhly8Iw=;
	b=F3NTWqrk1+orpASehnFlouc9bAgfCxaxE31ZPKCQptxwYVBQbSOji4WinyZJU0tD7L
	koRqFlYDiEupEwTS5PN0b6vJBXQMsiBlIPZhfudE9gN8tvpFDdb4ewNkKnsYXOSh77xf
	6zBKm25609k7KmDrqnye/t2QBu3nvgzp+yfQmjExk/qeEg14tPPr4lRKEG9IeCojozHO
	rLmeQfqDZq/E6vuCLAyIX3ARvXEj4lXzQy7V005hZkJYbxw4g4zPdC4x3eH6R2jQzAie
	dYQ1HkiQLw+DUfdhXiYtfjZVfjcj2eAG1+MYFV8nlkho625MrFe3QEkq50ZgbqZLMrg3
	kSCA==
X-Gm-Message-State: APjAAAXD0imqqsZa6q0NfuHhgg9VhrDH6dEHOCwO63/GgVLsV0rgvW8c
	pWm9N7GqxnHqJRxTnQsP47vmCQ==
X-Google-Smtp-Source: APXvYqwbA8dr1j1TvwGcH3jCFD0sVdR51gAvIeJYfwPGaEXJlsjrmVAzToqFuNOZOuXwh8r8lmMZYA==
X-Received: by 2002:a5d:42d1:: with SMTP id t17mr8315795wrr.56.1573471357304; 
	Mon, 11 Nov 2019 03:22:37 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v128sm26347513wmb.14.2019.11.11.03.22.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 03:22:36 -0800 (PST)
Message-ID: <ec1a8e75a2c5eb4dc341501f1f919aa070c8c226.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de
Date: Mon, 11 Nov 2019 11:22:35 +0000
In-Reply-To: <20191107075931.GD2398@hiutale>
References: <20190925122349.14872-1-ross.burton@intel.com>
	<CAD0U-hJLV7F3K4VdX0GUKO9LRazWLz1rvp1xmWh6fzgzP3gcFQ@mail.gmail.com>
	<20191106160618.GC2398@hiutale>
	<e3de40a47b9b208f08c3123ad59c8caf25d581d6.camel@linuxfoundation.org>
	<20191107075931.GD2398@hiutale>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: maintaining sumo (was Re: [PATCH][thud] cve-check: backport rewrite from master)
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
X-List-Received-Date: Mon, 11 Nov 2019 11:22:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-07 at 07:59 +0000, Mikko.Rapeli@bmw.de wrote:
> I need to maintain sumo in a project for a while longer so I can
> publish that work. The CVE checker patches are just a start.
> 
> Providing funding for Yocto Project LTS work is possible but a lot
> harder for me to do. Testing and publishing patches is much easier.
> 
> Could you clarify Yocto Project side answers to these questions:

I just want to be clear I'm not ignoring this but I need the TSC to
figure a few things out before we can answer this. I suspect that may
take a short while as its tied into the discussions about LTS and that
rests with the YP governing board at the moment.

We need to consistently handle everything with a plan so patience with
this is appreciated!

Cheers,

Richard


