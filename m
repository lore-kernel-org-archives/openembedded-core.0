Received: from mail-ia0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UD53K-0004wA-R6
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 04:30:08 +0100
Received: by mail-ia0-f171.google.com with SMTP id z13so6925828iaz.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2013 19:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=V+O3+v6ODNe8YoaKNGHsf1yd5Ehkp47mLRLYoLuEJbk=;
	b=Bim6Sxj3I9wBXDVtwhsVZpZOmuRZ6iHWP7eVZEDNsewxx34E2HQn/btzo/zxZnZZTR
	PYSuH57hXZZ9ydBC0uR89LgY21lCJ6uPMcv/Xq3EaS3lo6+B4fuU+Q52ajm/kHO+oTIg
	TLpLTtC4ovRzS9qhTr/wNQqX+IJrckPxKWmiD2eNJq8Zaeb3eHZ7D6BwkcAI2Lnwvk+I
	bM4+Fmt6WYOc9UQsKnUn/JKOvdtwBn69pogH+PX/r50dLxshKf6Ndc6/lKQFUUuatgpO
	zqynK6zJ96fg1Wgwr2QavHtcHxLb//KJU9pz4zVHI/Eu4PnpVoZN6ZzujNsN9isAmm2l
	xtHg==
X-Received: by 10.50.153.198 with SMTP id vi6mr9100736igb.112.1362539612179;
	Tue, 05 Mar 2013 19:13:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Tue, 5 Mar 2013 19:13:02 -0800 (PST)
In-Reply-To: <1362391887.29587.5.camel@ted>
References: <1362360870-12148-1-git-send-email-randy.macleod@windriver.com>
	<20130304081846.GC3268@jama> <1362391887.29587.5.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Mar 2013 19:13:02 -0800
Message-ID: <CAMKF1spo15CEJUyq2sf9cHA=VMgdhOHVgeHGQ3EAsJzcY9q-9g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] apr: add libtool to SSTATE_SCAN_FILES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2013 03:30:08 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 4, 2013 at 2:11 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> > [ CQID: WIND00405372 ]
>>
>> You can drop this.
>
> Is this really a big problem? I can understand people wanting to be able
> to track commits back to defect reports...

it would not make sense for most of people in community. Having
reference to yocto project
bug reports is still some information since people can go and look at the bug.
 each one of us have one or another way of internal tracking,


