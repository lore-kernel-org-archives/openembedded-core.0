Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SzUfi-0003IM-Uf
	for openembedded-core@lists.linuxtogo.org;
	Thu, 09 Aug 2012 17:29:15 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 09 Aug 2012 08:16:19 -0700
Received: by obbuo19 with SMTP id uo19so687017obb.25
	for <openembedded-core@lists.linuxtogo.org>;
	Thu, 09 Aug 2012 08:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=hHBr1hJbd0OUAjPKsKFpIYYoRXv4hebZ85pGHOyUMLY=;
	b=ndYtakN9iRgoDAMk6Xf5XJXh6ges5dw5GvS0RJAYM8HYNReaQ00zLA0xN2aXN8cwsT
	UICtP1rnDy6UBtYajlnZVCwKT9TnEWUBHPYP6/MaB5xTVkXXEDLZMEDrpjehlcAfDMGJ
	fYf7Vqh+yhLPmSGF9ALX3rPxhONXYKnflqW3e75L/D/giEA447QV5KNqXKGZi+XykqSn
	3QEIi/V7R1L54vUOSicO+3tKGNaYbRNk7w/cDBiOZ/tI+IcmUFDJYcJvovc6NC18JoNj
	Bg71bj/rpDnRiN2sNZaO6SbbzjVygRSkhlJ5R9fOj1fkNrimnATkGxXMEghGTgAKzVFi
	D9QQ==
Received: by 10.182.131.73 with SMTP id ok9mr36195385obb.19.1344525378568;
	Thu, 09 Aug 2012 08:16:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Thu, 9 Aug 2012 08:15:57 -0700 (PDT)
In-Reply-To: <5154002.dhIIyVWEkz@helios>
References: <1344524789-17424-1-git-send-email-ross.burton@intel.com>
	<5154002.dhIIyVWEkz@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Aug 2012 16:15:57 +0100
Message-ID: <CAJTo0LaLdBA4qoUHO8swNM2dBuR6DcUVSxuPDE3ky8wE3iMdPw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQnzAGxTDgvridAEQ/fO1i308BciDQCiheY0WQ6XbcISAAeHHa1BWFcg9c00tQAkkUK2yXHb
Cc: openembedded-core@lists.linuxtogo.org
Subject: Re: [PATCH] pimlico: Remove
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Aug 2012 15:29:15 -0000
Content-Type: text/plain; charset=UTF-8

On 9 August 2012 16:13, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Thursday 09 August 2012 16:06:29 Ross Burton wrote:
>> Remove the Pimlico applications (Contacts, Dates, Tasks) and associated
>> libraries, features, documentation and tasks.  oe-core isn't a reference PIM
>> stack, so we don't need this.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  documentation/dev-manual/dev-manual-intro.xml      |    4 -
>>  documentation/poky-ref-manual/ref-features.xml     |    2 -
>>  documentation/poky-ref-manual/resources.xml        |    3 -
>
> These docs are not part of OE-Core, the changes need to be separated out,
> applied to the yocto-docs repo and sent to the yocto ML.

Damn, I split out the meta-yocto changes already.  Pretend these don't
exist, I'll fix up the branch tonight.

Ross


