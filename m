Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UVR4j-0006eO-Mx
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 20:40:21 +0200
Received: by mail-vc0-f175.google.com with SMTP id lf10so3083961vcb.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 11:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=DUlAaPV30WyTkEC9cAJRWOLPIGDhED/x/va0UKTxDTQ=;
	b=RpPWj7c4j+iFgELBqmqpw9K4y0mROSP0ccp0Ll+xk//dk1guB7mFPaHtUMBf2j/Yi/
	+oPeVjPSoOxAprqiHPN3CLbT27oxnsIZ+1WmxZ5XLe/YfZVqYinfMX/EEgPzVDzQSdo+
	K+eQuQPybGQa3lcBgPlkjwYcYm4ba5O39/TW1GIvdu43YvdRAbSd22RvrQM4X97ZMqyE
	AvZs6auD3rNOM3hSBU9btPYTvUj1BH8fDLzIwLXUtAU0wD1GjYGyKyBsmtU+BGUH6/3E
	2K5MhymCgRbRkgTutgGUT8uOPJBIEWSDnQAFOixmZYqYa3m1Yw52iDJnGtwW09Ds+lRX
	xYhg==
X-Received: by 10.58.188.48 with SMTP id fx16mr27588128vec.22.1366914096725;
	Thu, 25 Apr 2013 11:21:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Thu, 25 Apr 2013 11:21:16 -0700 (PDT)
In-Reply-To: <2617360.KvDFvdIEGN@helios>
References: <AAE0766F5AF36B46BAB7E0EFB927320630E4A540CC@GBTWK10E001.Technology.local>
	<AAE0766F5AF36B46BAB7E0EFB927320630E4A540D1@GBTWK10E001.Technology.local>
	<CAP9ODKra5FDPMw9AnGhxVijp43_0SnVZVxhfPGwnBpeEaaWUaw@mail.gmail.com>
	<2617360.KvDFvdIEGN@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Apr 2013 19:21:16 +0100
Message-ID: <CAJTo0La_iM04he4jMCRtcj7+3zOLDH1dncH=M2aNdbRB0mTyog@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQlLdcD6qqqYToZ3d10rb9G6m6+WNwcpQuzl2RmsI6uBIBVn6aNIib5kksrPpumzwxI5zKH/
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: Problems with PACKAGE_CLASSES = "package_tar"
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
X-List-Received-Date: Thu, 25 Apr 2013 18:40:34 -0000
Content-Type: text/plain; charset=UTF-8

On 25 April 2013 18:05, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> as danny maintenance should end when 1.5 is released.
>
> This is not correct. We've continued maintenance of denzil (the previous
> stable release) up to this point, and the community is free to continue that
> maintenance almost indefinitely; the same should be applicable to danny.

In fact there's a pre-release of 1.3.2 running on the autobuilder
right now.  I think several of the bigger users are sticking with
Danny for some products, so I don't expect the stream of requests for
danny to stop once Dylan is out.

Ross


