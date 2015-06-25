Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0DD6AC15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 01:28:15 +0000 (UTC)
Received: by pdbci14 with SMTP id ci14so41836761pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 18:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=3Lz78EYW7c8N759zYVvrK7EEZteN6e/D8muEKPu9rvM=;
	b=LIWFTYEl+RjmOhCPdNoRU9Obd/NIsUCMl29U4e5y66J5T5q0A2om/2XMiZjXDZZi1D
	dSGo+EnL/RuCn95be6VUqwLsoFeHUPWmlhjQNS2ZM85tqMClrPjCWqrNJhw9F8MVOC0/
	f1nD3zMb9ea4ZtJzNuMopJePHRzi4D30AGxuYJgl8lL5K7tW7GtXTfQZROqhGNFVePoI
	bWAE2lzo06lJKdUZzwXgfOcB2/xMPhwxd4usBRKjv2aAy1EInT48+Rj3tfjOoaBW6BzL
	mA2Uvz1E2EPBGa7hbEiTGOGsB02x5aa5QV8F7FYMUqFkJS1V3Zwmxk7lLRe9NWGGl/k6
	BkmQ==
X-Received: by 10.70.131.35 with SMTP id oj3mr8638729pdb.80.1435195697082;
	Wed, 24 Jun 2015 18:28:17 -0700 (PDT)
Received: from Akusters-laptop-2.local
	([2601:202:4000:1239:6c94:9e2c:969d:fb5a])
	by mx.google.com with ESMTPSA id
	ko1sm28104584pdb.58.2015.06.24.18.28.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jun 2015 18:28:15 -0700 (PDT)
Message-ID: <558B592C.2030109@gmail.com>
Date: Wed, 24 Jun 2015 18:28:12 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1435022780.git.akuster808@gmail.com>
	<97b3f2e7b6b28d7540a1f69c65c319e4775e936f.1435022780.git.akuster808@gmail.com>
	<CAJTo0LZGNuW-7PjXY5PubOsnok_J8suFD53sy9JY8E80KHyXuQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZGNuW-7PjXY5PubOsnok_J8suFD53sy9JY8E80KHyXuQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] gnutls: update to 3.4.1
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
X-List-Received-Date: Thu, 25 Jun 2015 01:28:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 6/23/15 9:28 AM, Burton, Ross wrote:
>
> On 23 June 2015 at 02:37, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     +PACKAGECONFIG[openssl_compat] = "--enable-openssl-compatibility,,"
>
>
> Also add --disable-openssl-compatibility (and remove the redundant
> trailing commas).
you are slipping. those where in a previous set ; )
>
>     +PACKAGECONFIG[libind] = "--with-idn,--without-idn, libidn"
>
>
> The flag name has a typo.
Says you.  ; )

I get these in ...... (looks like 3.4.2 is out now)... the next round.

kind regards,
Armin

>
> Ross 


