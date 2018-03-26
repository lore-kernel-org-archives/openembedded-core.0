Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id F38EF71A9D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 15:12:57 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id l3so23697572iog.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 08:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9Mi1BseY9c1smNUovcaXpEaW3W0VBajlMFLcjoKQ4uU=;
	b=RUB5F3DrWo2U+785l4kqvyXc8VlOZkPA3y3e8Che+sveG5PaHClZN/rPl6PNiM76qC
	q/aFhoCVgwfs2CybGfCpxakuoczXli3g0t++A/rImqpvO/hhczO7R8jTQY0Fe0V8Bfvg
	DDv0MTlXzZ74ieeiJJj9/DMgZQClX8WKJ8NpMcODgCQzoYlBpY/5E2XZzxzDgAvtFsfi
	tG2gp744kz7H9SE7RIy3H9w5M46fZ9D/12Euxte2e5pELjizRo13nXNw9HxV0buHmCfs
	hTO4T4dZV2XmZRs5GbtAneldEwmlm+ObNWDNMPHDdfUfsgSxEXC04WF3TESRfArdWqqV
	HbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9Mi1BseY9c1smNUovcaXpEaW3W0VBajlMFLcjoKQ4uU=;
	b=b9+7ByyHYsu65p66a/1xlXDgoARGYCNvT/quCUJkHQrSDMEB4FerNvD9SU41+aOl3A
	ojN9+CnzeqQW5hgnthUPLdBSZzgNm+tTR619WuukuHJmScLVJlPR5/rY4qt/WB5+Zyur
	xiTAlDaXd6OHdN4xTQlaCtl1GQenP1bqE8+74c/SGXQgKEAI0HSe/qjfoA6UMkyJZJZl
	mQeBcl0Gk7l4X/V1KIfpEsTNzkxJtV5evWFLa8+fWoq1drJyV4Piql6x2Ch60FNZkD+c
	LgRMGijKs6q7QBMfYWhm8YYzpnLT/J4AEpCsJ/owSZ0tnHkmjd0hG4gH78m4Knm+ZG9/
	NLJQ==
X-Gm-Message-State: AElRT7E9Hg77sib/sE6dTcYgcdFmCn5cc5fwdFa+nDORn+fTzXSNUTA5
	E0LYj4/PRj+3MKdQemcJ21FKcsBhTj+ywoi0El73mA==
X-Google-Smtp-Source: AG47ELuuRODYgPVEbhpIsizaqSAEcu6G3UvcoU7KWTFwX36MMztU3Ougs7cH5mK+V4Pcdk2ROJGKX6dg53wiH8HHIQ4=
X-Received: by 10.107.161.200 with SMTP id k191mr38260378ioe.270.1522077179110;
	Mon, 26 Mar 2018 08:12:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 26 Mar 2018 08:12:38 -0700 (PDT)
In-Reply-To: <d4836bc9-3f31-19fa-34d0-c4783a14bfe0@gmail.com>
References: <cover.1521989435.git.akuster@mvista.com>
	<917fba1ddf9aabf3aebf25ccd9def83808ac8a4c.1521989435.git.akuster@mvista.com>
	<849d5550-fa4a-3378-461d-71acc30ff504@linux.intel.com>
	<d4836bc9-3f31-19fa-34d0-c4783a14bfe0@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Mar 2018 16:12:38 +0100
Message-ID: <CAJTo0LakxNrm3bkohyh5oBBqYOFtDqmGcp_QgxWYCTUhgRacuw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/21] libshmfence: update to 1.3
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
X-List-Received-Date: Mon, 26 Mar 2018 15:12:58 -0000
Content-Type: text/plain; charset="UTF-8"

On 26 March 2018 at 16:09, akuster808 <akuster808@gmail.com> wrote:
> Does this mean you are looking for a V2 ?

Yes, the patch that was rebased is now pointless.

Ross

