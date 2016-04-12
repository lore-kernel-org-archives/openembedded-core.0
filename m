Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3498760123
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 16:35:46 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id n1so16674646pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 09:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=eVI/SDkBnmoYSIUTITH+FqFvBD3QW0CBECCBhMRq38k=;
	b=rn4YekTglvqiXt53ambEzDNioqL02+4oW9DP8lOxIXDSYkaRqNbMZxNC17gLxco7Ih
	gja++atKSqWP8ytyLIBlgXVHKEpx2nzHIPeu9Sd0wHzi3mRbwemep3xCBpbURk7ERSMx
	UAgQKmiJAoOfMwfZZucDU7e4hZs214kkcZ3O93XOwTfh7pZ4LOLjOP9Tk5vxycW7I4fN
	wSxWJ3rcccGUkXc8qTJ+iMtAKGTJblwz+9KCUNuLLcwnj2iZuaFqnxXWI9kNRAndG+z+
	GeTV7AUL0q/3bZrMlqmg6+OAKWF+x7jaVkXNPq8A9YXtS+dFlfuwjfbiLhDdXR8qgS20
	rw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=eVI/SDkBnmoYSIUTITH+FqFvBD3QW0CBECCBhMRq38k=;
	b=dcf32A0xJOGHCYpIr8uZJtw7hjpvpkqZfhzzGNh3So1Z18h+Sapm549fBk9d6UrgH0
	nMqcowmcRs+POH6gAxOsRGqTbFrtE0B0elxuBKn81sxLHNeri8sNiRjzCINwxoPM2W9l
	uuC0Rh05O/PYKWRpcRRgw9Vbh/8iq9SUFrG1TkAZNrrtjyCAteJWAcxcxohmDyrF7J3K
	3J+ZqaXeX4MGxQvbk+rcMOfeNeUa4nyIP/QybQ3TDpAQK3ef0t4Og0GwL1YmoZuBTCsl
	Hs7pPhyaMAAD5352EWloNQ6YiHf9dL/jkkVB/2cJN1W0eNwc0BgeMN1K1ENBOQNcpfz4
	EzeA==
X-Gm-Message-State: AOPr4FUmpsxWWwZHTghVAyY7kxLzA64belNvd+KLXU8QTPuk8ZhWko8HqUgxRKmEfmbbfw==
X-Received: by 10.98.11.205 with SMTP id 74mr5910349pfl.98.1460478946845;
	Tue, 12 Apr 2016 09:35:46 -0700 (PDT)
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com.
	[209.85.220.46]) by smtp.gmail.com with ESMTPSA id
	17sm44848093pfs.40.2016.04.12.09.35.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Apr 2016 09:35:45 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f46.google.com with SMTP id zm5so16409599pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 09:35:44 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.67.6.10 with SMTP id cq10mr5922891pad.120.1460478944307;
	Tue, 12 Apr 2016 09:35:44 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Tue, 12 Apr 2016 09:35:44 -0700 (PDT)
In-Reply-To: <1460472857.9308.63.camel@linuxfoundation.org>
References: <cover.1460467072.git.pkj@axis.com>
	<7251ce8da0aed3f9ad921daa66186a2c2fc6a932.1460467072.git.pkj@axis.com>
	<1460472857.9308.63.camel@linuxfoundation.org>
Date: Tue, 12 Apr 2016 13:35:44 -0300
X-Gmail-Original-Message-ID: <CAP9ODKobRBigE8Wur600MDdFgL+Z-3C7noAJyWfsjTE8d18vBA@mail.gmail.com>
Message-ID: <CAP9ODKobRBigE8Wur600MDdFgL+Z-3C7noAJyWfsjTE8d18vBA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/1] Revert "useradd.bbclass: remove user/group created by the package in clean* task"
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
X-List-Received-Date: Tue, 12 Apr 2016 16:35:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 12, 2016 at 11:54 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2016-04-12 at 15:18 +0200, Peter Kjellerstedt wrote:
>> Removal of users/group when cleansstating a recipe as implemented
>> here
>> totally breaks when multiple recipes install the same user/groups.
>>
>> This reverts commit b5304ce438666a7418746f4ddd32703ae3188089.
>>
>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> ---
>>  meta/classes/sstate.bbclass  |  5 -----
>>  meta/classes/useradd.bbclass | 29 -----------------------------
>>  2 files changed, 34 deletions(-)
>
> This is one of these situations where we can't win.
>
> Without this code, there is no way to clean up these users out the
> sysroot. Having to tell people to "wipe TMPDIR" when the parameters
> used to create a user change for example is rather bad. It also has bad
> implications for build determinism and the expectation that a "clean"
> undoes the changes a recipe makes.
>
> Have we ever documented we support the same user being created by
> multiple recipes?
>
> I'm open to proposals about how to fix this but an outright revert
> doesn't seem like the right thing to do. Making it optional so you can
> disable it for your multiple recipes case would perhaps be a better
> option for example.

I am not against the change by the timing; it should be merged in
master as soon it is open for 2.2 work.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

