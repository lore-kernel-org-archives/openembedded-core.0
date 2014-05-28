Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (unknown [209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id F018D6B711
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 17:35:28 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id z60so18929294qgd.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 10:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IBONaPjm9ppQqERsvmabAx5p8jITOiftwquQM3e/c5c=;
	b=CYWt9seLeNvvKh74UP8L4C3v1HQve5S8CSpCyM5uFlBeyoI7GgUcrycXTAlzBlf6q6
	UaejAm0xaj9490BfDG4QtppMjV1MvGi3rUeg80AV/TntIkXbJ3ejtd1xaT9uUVKpgrUH
	mEVEPGv28ZK3wrJRmzR/bXkjilKztJ9goDU5cEtpbYGe2pULcHgg1h7+K9BitRLmT4FG
	MueFskCU4aC6fQv12bFKHOB8zC5zN7ErcIsu2X9xHnFk0F/WI2gLki3yCFumVQPiVHbf
	m7NGT26/BjGzwTQbHHGjuwtWQRJ2buFnlQg7aZi6cNi2W9Nwi7SrltuicybUKnhI0Voe
	7rLA==
X-Gm-Message-State: ALoCoQnaCvAaiaXxFOsroPKABGK02/YI8OqoBCWdBUh2ZV/qS7lmRg7/V2IOSFM59POn5dyf1lJ4
X-Received: by 10.224.121.72 with SMTP id g8mr1338497qar.79.1401298528844;
	Wed, 28 May 2014 10:35:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Wed, 28 May 2014 10:35:08 -0700 (PDT)
In-Reply-To: <1401295116.2607.51.camel@ted>
References: <1401295116.2607.51.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 May 2014 18:35:08 +0100
Message-ID: <CAJTo0LagoxEMZ=HpppS1OhY8U26zQZ7LAqwCsprAwvugcypfQg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstatesig: Move saferecipedeps handling to be earlier
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
X-List-Received-Date: Wed, 28 May 2014 17:35:31 -0000
Content-Type: text/plain; charset=UTF-8

On 28 May 2014 17:38, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> This change has no effect on existing uses but makes gcc-cross become
> shared as desired.

As the reporter of the problem to Richard I confirm that this fixes the problem.

Ross

