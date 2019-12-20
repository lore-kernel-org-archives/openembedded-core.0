Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0187FD2F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 18:19:18 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id c13so4445713pls.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 10:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=hTDU19EQfTdY0NEx7P0q05IiN1o6zrpMyUBSaKUe7Nw=;
	b=M8tQyeLNRMx2NWVTI5VAnhdsGvGSrOaDmlI5geWhLDUA+wG+zoDfqbHf3GIOVNwvbi
	tLdm4O1j/lX3V7Dtz6btEqTyKJCOEWKk2D8xk2KCkqDONQ8uVqNxNpdhTubBPN0jK+3h
	Bx39ROMolc4tH3ldIyQE17EdaTOlqDC0gJKd7Be8bC/IV952LVgbPsOwt3wfVn3E9SXa
	8xoZf9vsTtc+TN8Xt/MK+UJHHwFe62YMB71iOpy662UBQl0t/vLIghfLTy/jh2VMfJfO
	N8Oz328FvitMTf1iKbzWWTo7ZQObgw+MRI7wWvTopmgGV17sljSfw5pnNJ1Acvc9N5L7
	vrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
	:in-reply-to:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=hTDU19EQfTdY0NEx7P0q05IiN1o6zrpMyUBSaKUe7Nw=;
	b=PBiAVIbBTDHn6ak448GL8CUSSJM2OjkRccoq0aKpbf4lkYiEIeidNwq/tY48fpvuBR
	C9mawb/ZCPzthqemNX4Vs9BcKFtF4NYXzWS4m5hVEfTuZWaojdKpOV7LuLitljxXXrOz
	93M5SmcJWXTV2IRxXRewrYKJVkK27LFup5cKNKdKP33v6Zv9PWIBGaHEBYsmus+BbEW/
	Kp//nrj5CKVDVFmJmVYA8AX/h/5r7WLljiAFniyB8xP4otDHHee4Z0u+kZXBxIxPEyCY
	4hnE02ya88QyVJBvqSEgkVkaJK7ia2PabgTzP4Hevqm+UlDgBMJraW67Ux92r3aunLpu
	UN2A==
X-Gm-Message-State: APjAAAUDEjn/Q9/o8PoLu8yHmn42SF4EBXKRO/SipzfGocZajMXrI2LZ
	7EpSJwE9DFPWEpFH5sQ6btM=
X-Google-Smtp-Source: APXvYqwmM1ovMAjg8nTKaX0ciMlDrkk8SEbFJtT4Rnt4/8mAGbIOwqYNCX+omnKAN2o11r3yj3qBKg==
X-Received: by 2002:a17:902:d907:: with SMTP id
	c7mr16671124plz.40.1576865958992; 
	Fri, 20 Dec 2019 10:19:18 -0800 (PST)
Received: from apollo ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	g67sm9616872pfb.66.2019.12.20.10.19.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 10:19:18 -0800 (PST)
Message-ID: <695a949b5a88272afff1d61d06a8cfc04221a62c.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Reply-To: raj.khem@gmail.com
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Dec 2019 10:19:17 -0800
In-Reply-To: <B03D51F9-00D1-4D8A-8A21-3CF357D9DACA@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-7-alex.kanavin@gmail.com>
	<3cd13d50-b437-2438-582a-4c149711a966@intel.com>
	<bf8452d4e9f63bc463f676ff9b48ca1d573ef7d0.camel@gmail.com>
	<B03D51F9-00D1-4D8A-8A21-3CF357D9DACA@gmail.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 07/25] nss: update to 3.48
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
X-List-Received-Date: Fri, 20 Dec 2019 18:19:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-12-20 at 19:06 +0100, Alexander Kanavin wrote:
> My problem with this kind of fixing is that I have to do it blindly,
> and it may or may not uncover further issues on the AB. I’d much
> rather just drop Centris 7 and have ppl who actually use it fix the
> issues they see as they push the master revision ahead in their
> development process.
> 

I understand your point, and all of us do not have all kinds of hosts
AB will through patches at and discover problems, this is breadth of
testing and is good IMO. I am not sure if AB can expose the builders
for debugging such issues, since that would be best and second best
would be cook a patch and let AB validate it.

> Alex
> 
> > On 20 Dec 2019, at 18.44, Khem Raj <raj.khem@gmail.com> wrote:
> > 
> > > On Fri, 2019-12-20 at 11:00 +0000, Ross Burton wrote:
> > > Breaks on Centos 7:
> > > 
> > > nsinstall.c: In function ‘main’:
> > > nsinstall.c:201:5: warning: implicit declaration of function
> > > ‘getopt’ 
> > > [-Wimplicit-function-declaration]
> > >      while ((opt = getopt(argc, argv, "C:DdlL:Rm:o:g:t")) != EOF)
> > > {
> > >      ^
> > > nsinstall.c:203:20: error: ‘optarg’ undeclared (first use in this
> > > function)
> > >     case 'C': cwd = optarg; break;
> > >                     ^
> > > nsinstall.c:203:20: note: each undeclared identifier is reported
> > > only 
> > > once for each function it appears in
> > > nsinstall.c:225:13: error: ‘optind’ undeclared (first use in this
> > > function)
> > >      argc -= optind;
> > >              ^
> > > 
> > 
> > another C99 issue I guess perhaps  #include <getopt.h> in
> > nsinstall.c
> > will fix it.
> > 
> > > Ross
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


