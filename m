Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C685B74D7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 14:54:44 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id j5-v6so27104936wme.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 07:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+9QaXBiZOY4QVgsuqwW0ENgCrGeOgEZCqitpiv8IJKs=;
	b=HWPHfZxMG4d/tathHK75rFs8Lp/fAppoRcdwORQNa3q7tTuykexH93Z5iiqJm4JT+F
	nTW2m2Wg7ENKBkldOe3VHUepQ1cnkcselod60h7gSgeAjT63vPTs7CAhGVRuvyTx8HE1
	3rdXrIMPWACkf21kfRMUw3yz5GpWPxazd9brNecE6Zm/efGndFFKHmVEULJwXT3Ssr9u
	6dJKx0c8vZQlE8VJp4EvQ8OTvBNkhXiwIQBN5+aMGdnUQZf/bOUe+44/6kOG9BPAt7Zh
	9zxaLHrLTTDokp9Xr0/Ra2a215KBHBMv6+J2yTv5xik8GQhiXulzVGDGkvYrLta2N+/6
	6GMQ==
X-Gm-Message-State: ALKqPwdbDer6i6zyB/ZcDAZB8mMz35aYAlGwadD5cHExZokgLmytRnpk
	H9QKR5RFXKHM7jfxNGT8XT5aY9EN
X-Google-Smtp-Source: AB8JxZoKRTjLMejzv0ATPBUKLc0tAGogpTOcPCngBpuWNzQSZyEjzxI2R6ToBZPyJhj3abog/L0Hiw==
X-Received: by 2002:a50:b042:: with SMTP id
	i60-v6mr24218894edd.68.1526914485109; 
	Mon, 21 May 2018 07:54:45 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c35-v6sm7298625edb.61.2018.05.21.07.54.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 May 2018 07:54:44 -0700 (PDT)
Message-ID: <752f5015703628b09b32decb68732fc46e2e784c.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2018 15:54:43 +0100
In-Reply-To: <148bdddc-cb1e-f083-d6c8-10950aa72ba9@windriver.com>
References: <20180309130000.1937-1-git@andred.net>
	<20180321163130.23765-1-git@andred.net>
	<1525939504.5115.18.camel@andred.net>
	<1526464678.32156.14.camel@andred.net>
	<148bdddc-cb1e-f083-d6c8-10950aa72ba9@windriver.com>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] rootfs-postcommands: put image testdata under sstate control
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
X-List-Received-Date: Mon, 21 May 2018 14:54:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 2018-05-17 at 14:29 +0800, ChenQi wrote:
> Hi,
> 
> I've also noticed this problem. The growing testdata.json files also 
> bothered me a little bit.
> 
> I think the only small flaw with your patch is you deleted the following 
> check.
> 
> if testdata_link != testdata:
> 
> Checking the values of IMAGE_NAME and IMAGE_LINK_NAME in bitbake.conf, 
> such check seems not necessary.
> But these values could be overridden. How about still keeping such check?

I made this fragment identical to all other uses of IMAGE_LINK_NAME and
IMAGE_LINK within this class. None of the other uses have such a test, so it
doesn't seem to make sense to have this check in write_image_test_data()
either.


Cheers,
Andre'


