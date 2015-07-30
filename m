Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id C8BE6762D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 16:43:42 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so27236777pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 09:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=JAQejJYbzvg0OnVJNJdDHKcpKVMMonKtKUe3LRE0gcU=;
	b=g4rMPIXDUYdfynybl56A78tdNn27qVcfo7i4Sampc2M3/Imur/h1glBtSVSKT/n0GF
	Rn5BSmGBOGY02IbaiLIqLwZENgiunJMbpEMalzGa81S5EKYWClQiA6r/qdmnp/YlbSmA
	/vIRSliwldg08DIykjYVsdU32qksuJwgQMAIBmI4j4IzNrQAw2aVAQIPQK3shOsiLmPa
	Qr6E331Bfzx4iweSoI9+OIHg9ySi/M91NQBZdqSVQvIR1kYdHdPvp3HJtuDbPw7db7c1
	vjdgib9ZJuQmUieP7xhVQ84kQqxorTQ62NsyaP3J4v36JEaWNbKPmHDIZ0jXU1bfFkgp
	C53g==
X-Gm-Message-State: ALoCoQnz0v5BGwkhWi0ufaHJunOg6JwJkcfz+qp/H1jvFCkSBb0Jl3sC6Hji7ZgS7gkmLgk2XC0b
X-Received: by 10.70.109.199 with SMTP id hu7mr109410109pdb.71.1438274622553; 
	Thu, 30 Jul 2015 09:43:42 -0700 (PDT)
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com.
	[209.85.192.181])
	by smtp.gmail.com with ESMTPSA id k5sm3066697pdb.53.2015.07.30.09.43.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 09:43:41 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdbbh15 with SMTP id bh15so27029474pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 09:43:39 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.126.133 with SMTP id my5mr108704590pdb.14.1438274619617; 
	Thu, 30 Jul 2015 09:43:39 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Thu, 30 Jul 2015 09:43:39 -0700 (PDT)
In-Reply-To: <1438273196.3455.25.camel@collabora.co.uk>
References: <CAP9ODKrUcnyNQSfevaHLFcW63tjb3pDN4AvHmfoQOjvuLe4+cg@mail.gmail.com>
	<1438273196.3455.25.camel@collabora.co.uk>
Date: Thu, 30 Jul 2015 13:43:39 -0300
Message-ID: <CAP9ODKrjd0C72B8haZh-Xk3+AXpxKtbBYbhZi8arte09jPb6_Q@mail.gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-fido] Backport for perf - support for 4.1 kernels
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
X-List-Received-Date: Thu, 30 Jul 2015 16:43:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 30, 2015 at 1:19 PM, Joshua Lock
<joshua.lock@collabora.co.uk> wrote:
> On Wed, 2015-07-29 at 17:57 -0300, Otavio Salvador wrote:
>> Hello,
>>
>> Is it possible for you to cherry-pick OE-Core:46f8420 for Fido? We
>> got
>> one board using 4.1 kernel and it fails badly.
>
> That seems reasonable. I think that would mean we'll also want 00608cf
> ?

Sure; thanks a lot.

I have tested perf build and it worked very well :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

