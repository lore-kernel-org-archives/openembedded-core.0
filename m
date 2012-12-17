Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TkZfp-0007bl-VB
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 13:19:58 +0100
Received: from mail-vc0-f197.google.com ([209.85.220.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 04:05:16 -0800
Received: by mail-vc0-f197.google.com with SMTP id m8so8105727vcd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 04:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=+C5oB5aJMkFwAWUX80y6ZwHChSDi4ivR6SBBdJ0JjuM=;
	b=UrgLOS5FWRnHzw+c9+PZvmzdr4Oj4aJl6cXaOTEYdzBf9ieUNv1ofgSQFEhMaFow6h
	QIgBUzvQtC2pITvLKM9snZ3E5mPcKIoFP9agLGoN7xiHhpDfgbBCLZAmWi7600TtEjUr
	wufY75UzoIhY1no+LcomxcjWmo7szGOHcNVCpgGVmFI4BgF+68C8LwUfNXzgSx3w7FcJ
	vwWhn9kjZEG+JQxVjKKLxO8EYqXhtJHuIFxqBlloZPnRdeP8dCbfIqJ/kLSqU66SWzV3
	c+bjwXTtDImf/op4nEfYXXLVQRJLwCAqRTwQB0xXrLJG9x1JpvnkwF3LSZiayFQz/4F8
	SfUw==
Received: by 10.52.75.105 with SMTP id b9mr19855816vdw.28.1355745915091;
	Mon, 17 Dec 2012 04:05:15 -0800 (PST)
Received: by 10.52.75.105 with SMTP id b9mr19855809vdw.28.1355745914976; Mon,
	17 Dec 2012 04:05:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Mon, 17 Dec 2012 04:04:54 -0800 (PST)
In-Reply-To: <1355743753-12947-1-git-send-email-alexandru.damian@intel.com>
References: <1355743753-12947-1-git-send-email-alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Dec 2012 12:04:54 +0000
Message-ID: <CAJTo0LauziyyE76hxLuuLqAzjZaB5UCF-yGxDYTNZsc3mYpR1A@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQkUTupof1lwcnQr7XVeIe28JHULWsTiQ1HKRX8AgjpyAF5CfUIAka08h3cfpaFcuaBEJ+vrl2fNJePfcEQ2u+ijeMGX8X4s4HuB6Spwhpcac//W/8VlAWgj8OY5IsItctTuHFWzikWg/WMMz6ccJajhWVl/VOyETS5asJwZ6s5cWO+wDiraQWMgdoSVu141fwtvRx+q
Cc: damien.lespiau@intel.com, dvhart@linux.intel.com, otavio@ossystems.com.br,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] init-live: default to initrd shell if image isn't found
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
X-List-Received-Date: Mon, 17 Dec 2012 12:19:58 -0000
Content-Type: text/plain; charset=UTF-8

On 17 December 2012 11:29, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> +  # don't wait for more than 3 seconds

3 is very short for slower hardware, please make the timeout a bit longer.

Ross


