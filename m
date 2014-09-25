Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7052F60144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 21:07:56 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id n8so5126284qaq.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 14:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=to2JOfBUDRyLkqBXPTb68xg/wa57+BAKzzsVv6AJcDY=;
	b=bIlnW+u5Vmvabvyg/XaLrnY4P3D6KVxf5VGOM2ci0uCWOn7fi2JgDYV8T8DIRngv/j
	Wld0GOAQlOysz9fnCp3IH6fWJ4nSBM3kXt8ZpBFabAkw1BpnlpUmkGMwrzESwnGyEZ4Q
	uO3lflU8ZcNgqtnJDO0iiSX8VHQbbYPv5kdeCVWxQPdQ98vVgKncbsTmvKWFYWE77io6
	m8fjoJ/RjPN+/EgKcuemDLG3+2TuoQdHA1uonURAPWYLqokjz+TR9Ye/j8BAcS51abo6
	ZRjgH5y91v1khAAE1fFxzfMAYxutX27V0F/44Xpc2me049C/7H+hT8zh/asKgl6TJK1C
	x5QA==
X-Gm-Message-State: ALoCoQnoUAR5HFZj9a6h6mw3tmiJVqhix9PxtCsrCy4NK3uFBeUZlKqdPOfHb4XnhnzCkZIsKhXY
X-Received: by 10.140.40.84 with SMTP id w78mr25189236qgw.87.1411679277444;
	Thu, 25 Sep 2014 14:07:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Thu, 25 Sep 2014 14:07:37 -0700 (PDT)
In-Reply-To: <20140925171754.GA7840@sestofb10.enea.se>
References: <1411644990-20122-1-git-send-email-maxin.john@enea.com>
	<CAJTo0LbhFF0g1swk1y250QOESwvjmJcuPcbZNvX_ESJTMt3GKA@mail.gmail.com>
	<20140925171754.GA7840@sestofb10.enea.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Sep 2014 22:07:37 +0100
Message-ID: <CAJTo0LbXWbR=P==Na2tZ5+rmMKqoKfESu9rHUV-HK7LOsiJUZQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: Security Advisory - CVE-2014-3613 & CVE-2014-3620
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
X-List-Received-Date: Thu, 25 Sep 2014 21:07:58 -0000
Content-Type: text/plain; charset=UTF-8

On 25 September 2014 18:17, Maxin B. John <maxin.john@enea.com> wrote:
> I have tried it with the latest master and it "worked for me".
> Could you please confirm if it was applied on the "master" branch ?
> (Couldn't recreate this failure at my PC)

I applied this patch to origin/master
(8ac8eca2e3bd8c78e2b31ea974930ed0243258a3) and it still fails to apply
the patches at build time with rejects in tests/data/test31.

Ross

