Return-Path: <twoerner@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 64AD97FAA5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 13:45:01 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m4so1766275qke.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=sERxgBFFJ2wwYEI8X7Pufq+sYe7fdhaAE+dkhzu5Ih8=;
	b=qpqsbje8NVMwaAN1Lww+t00gH5aPAYQOtx8R56jp870MXikeojSH6Moewj12fi3zVC
	tPDFYVHzW30+BE6+R5T+2WnerDQ1kA4v+zXcBwNYMnaD+CiCJh9bGzvRo9bZy/8c9baZ
	p4yyzcHqkQ0uXzC69Qz31YXOgqS6H7COhWEgomPNv/Gxdx8YGNpFMFkbIx6saKcYzLND
	d66TFBLZYPbs/wJ4Y2zW2VCcmIQAMaLX/2sTdFyPNlxebszlNPZ9UvxVns2dx3+imO/k
	MLXSm7c9gW6xzyo4ZvD22etJ4+lQjy1t8AqQoyq/bgHknlFHtVPdriL7OhDT9vFk6zGD
	nTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=sERxgBFFJ2wwYEI8X7Pufq+sYe7fdhaAE+dkhzu5Ih8=;
	b=ANV7vRWHyHw2XXiV0VXSreO+tGKBwdOLPDhF7h9eLIYxSxNtffgni7PGcgTB31Krxm
	2akbV+DkOrpXiioaghDSjmw46WylGTm+XB/dMqU1drdUhx0lSRxR1+RrXsfJt5WbH3gK
	/CQRAe4Ff6x60y/z20NpmxKVr815knwxDNJ5Z3WY/pGCVdTKlVb0ofURXsE2sxkzoQUI
	ou9wtYXB6liiYrSO1w4IQvRyPSVHLKCzyFORLS52TaW1YAjbpZbGUENK6YjM/a+knrb0
	0jtomoJnetRwSGGSkCldoVngBb1wr6eIjkaGQ0Uyq4wdPw+jjWKo+cE0Hw5mh4PEf79J
	1JyA==
X-Gm-Message-State: APjAAAUjaqcn0+fNBJkvkFrlNFAtMnKihFIxuip9GnNIe0fKM4AKU6IA
	t1UYI9iPqj+2Bzb22lEsT2k=
X-Google-Smtp-Source: APXvYqwuftL8f/G0Sw9BMatpK+iUel6HVCVFxeD+xpUzQPptzzF3aShHh+ERdUPsWr5plsuqbHbelg==
X-Received: by 2002:ae9:ee18:: with SMTP id i24mr3023997qkg.86.1572011101934; 
	Fri, 25 Oct 2019 06:45:01 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id 56sm1748002qty.15.2019.10.25.06.45.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Oct 2019 06:45:01 -0700 (PDT)
Date: Fri, 25 Oct 2019 09:44:58 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191025134458.GA22739@linux-uys3>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<20191024230510.smxm7zf3qvpec3xy@apollo.localdomain>
	<20191025132204.GB19333@linux-uys3>
MIME-Version: 1.0
In-Reply-To: <20191025132204.GB19333@linux-uys3>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Fri, 25 Oct 2019 13:45:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri 2019-10-25 @ 09:22:04 AM, Trevor Woerner wrote:
> On Thu 2019-10-24 @ 04:05:10 PM, Khem Raj wrote:
> > perhaps you need to add -pthread to LDFLAGS
> 
> I'll set up a test build.

Yes, adding the following line fixes it:

	LDFLAGS_append_class-native = " -lpthread"

(unless there's a distro-override way of doing it...?)

