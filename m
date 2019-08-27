Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 862167E3BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 13:08:48 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id t6so46130212ios.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 06:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=00Bwuea7bNt9h17DdNnFn+MRTYh6Ywlls+fsNatXSGg=;
	b=mjGMFA52vaQUWs8313RiBxcpEyTtvlHeGRYXcAT96NFPapk+NTXtC+mKkeC1QV+Edw
	/w41MyLR1x8ds5qk+qb764JUlf6IZNug+qX61wXFxQQoYSgIxVP6WPDyjeQ2lnSmQefk
	49w6CRlWfCkvPjHrOOs7DFOMTXUesuKhtVvTgDi4m5aSMYC3izuvlqW0qPm2+Q8NmvyL
	d4wBKht3LSNwP8he94oyARmOxMcWrIkHrDbgf/1nMHU32xeLN4NDsTmoYWsjq/1RYMuj
	KZOkoA4Y7NwGUEwsawHO9zvqpBLEdP2aL8yDwWv2hoj+mVrwg3/vGhX4/I/5tbpvBFPm
	oE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=00Bwuea7bNt9h17DdNnFn+MRTYh6Ywlls+fsNatXSGg=;
	b=UqY+Go60wRABLjvEyy1oOzUoz6U3vq6SSYAqe8L4ZV5+4SUKvxMqPmFqHoiukpsSRE
	mZtJJ1IsUBbt8VbX4zIixGfTD+fIAYE4Q6gGaS9bSsNc8NAnM/EuPsQGioPsEyHw/3nU
	xSD+ukqjJ2bHJDUYLGxXKumbHB5ypfSGP0ElepdpHicwHCEjWRCvv0ByZ9kKOZU53yo/
	0rL+3YFGB2ymDPRznVK4SITOAdod9pbAiYRhGXZtDQlMrw0unYQXq3mv4xZxr5vtwEs6
	q86M829gefaON2wo1ou3Fa8a138lqoDCSAKptUQMqwpkAc6SwOyb+tF1vLFmSzs0p+5N
	tcLw==
X-Gm-Message-State: APjAAAVBtgjuTxN+F8rmmEUtaQPIBycwjfldM6bvnplH3wXkizToDlpj
	4lyA8x6w4NrWLA7ttSfRmK2YApfh
X-Google-Smtp-Source: APXvYqwTfnKtYdOYRjYN+jX/Lv5C/MznJJVkompzCymCtibJ3J05OQ/imN6VFRI08zUaZpWFd3E2eQ==
X-Received: by 2002:a02:a703:: with SMTP id k3mr21910735jam.12.1566911328821; 
	Tue, 27 Aug 2019 06:08:48 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id h9sm14266512ior.9.2019.08.27.06.08.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 27 Aug 2019 06:08:47 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190827124617.18207-1-JPEWhacker@gmail.com>
	<CANNYZj_zr9+LbbGfhtd46pnUBYgpSW5LL5pE_fuvhxwne6yPrA@mail.gmail.com>
Message-ID: <de80b1e5-dc0e-cabc-409a-0c8c84bc8ef2@gmail.com>
Date: Tue, 27 Aug 2019 08:08:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_zr9+LbbGfhtd46pnUBYgpSW5LL5pE_fuvhxwne6yPrA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix documentation DEPENDS
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
X-List-Received-Date: Tue, 27 Aug 2019 13:08:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 8/27/19 7:56 AM, Alexander Kanavin wrote:
> On Tue, 27 Aug 2019 at 14:46, Joshua Watt <jpewhacker@gmail.com 
> <mailto:jpewhacker@gmail.com>> wrote:
>
>     perl is required to generate the OpenSSL documentation, and therefore
>     should be present at do_compile. If not, OpenSSL will skip the
>     documentation generation, which isn't reproducible
>
>
> I'm not sure I follow you. If perl is present, documentation is 
> generated. If perl is not present, documentation is not generated. 
> Where is the non-reproducibility in this?

RSS doesn't clear out the sysroots if it goes back and executes previous 
tasks as part of a rebuild. As such, if perl gets added by a later task, 
then bitbake goes back and re-executes the task (I don't remember 
exactly which one... do_configure maybe?), perl may be present when it 
wasn't before.

This is generally true of all RSS dependencies, and until it gets 
resolved the best we can say for reproducible builds is that two builds 
from stratch without sstate can be binary identical. It will have to be 
resolved eventually, but my current plan is to do the reproducible build 
test as two clean builds for now so if there is a lot of push back we 
can drop it.


>
> Alex

