Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id B57C277193
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 13:06:46 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id p194so119270674iod.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jun 2016 06:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=38CVQODvK35YTF5zBc+pUPL1G954iG5oPpix5emTFME=;
	b=yrfj5hM5Oec/JMjf0gvzYK9t1k9k2cyHUKXHclo2a0lFEY323bA2GGdVf/NCUJeIsB
	IswCq0YVKbsR5ChJilLl2bU5XuGUAMnVyXEpf95Hgl3dvWBvxVJKPamAizmxTVi5QElq
	Riaj6qtuVWZT095mKORM4aDCpA5gvfYyTBCRlAaucFyDFFPQvvKLCUnKtQqR5whPCtTe
	WdHbPWzYICbhMbyrBJRirc9spgvEOFID373neiTGZuGanomT3XOm7KZss52GcF2M6k4Y
	t/Vg/C2FRGQXNY/K4GdtRW7bGY2jlP3NJfZqeWmoRjgWYG+YDytb6YbkSwqbVMm8DipI
	bqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=38CVQODvK35YTF5zBc+pUPL1G954iG5oPpix5emTFME=;
	b=Ig7jGrKWpu4CJiPavJx4aZs31rlFMxhJDkupOberGbaFNwnp1AoeZFi2R5MOZsp01W
	zYi9ubQ9YoX9aiNtRGW3qloHyjCTSOktn66667fXpqVr5CWtcFc9GosEcIFRqUXAFac1
	NsCCxUOl9zHOofhlv9NfEhq3Mlhf0CZFMv9/KG0zi5Bh/xu9nCovk3/RNmVnYTCqW+99
	hAO4tocoUyGIvLsD8xDdf1q2YcIs5aJ1h2EcaR7sKptNRBmnp7CRRHLVq3MNnyXQFD2S
	Fp5zkNJS8HCoEqVMUfvUm0dB5uCodEA3QRgcbBfqWziWhGqsgbCs9TKAN1cRW+JJ1tEH
	LusQ==
X-Gm-Message-State: ALyK8tJx8QCXXntMBn1yilGzmlbk63hv8q5Aie7zTWu2dY75uUdKgB2ey0ZfSqbpe4tJrw==
X-Received: by 10.107.183.8 with SMTP id h8mr16593837iof.127.1465132007225;
	Sun, 05 Jun 2016 06:06:47 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	e37sm6892549iod.25.2016.06.05.06.06.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Jun 2016 06:06:46 -0700 (PDT)
Date: Sun, 5 Jun 2016 09:06:50 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160605130650.GD5652@openSUSE-i7.site>
References: <20160604225509.GB28175@openSUSE-i7.site>
	<1465111211.13979.38.camel@linuxfoundation.org>
	<20160605130253.GB5652@openSUSE-i7.site>
	<20160605130412.GC5652@openSUSE-i7.site>
MIME-Version: 1.0
In-Reply-To: <20160605130412.GC5652@openSUSE-i7.site>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: INHERIT += "image-buildinfo" doesn't parse
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
X-List-Received-Date: Sun, 05 Jun 2016 13:06:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun 2016-06-05 @ 09:04:12 AM, Trevor Woerner wrote:
> oh... wait, sorry my mistake I didn't test properly, let me try again...

yes, that fixes it :-D

(i was using git://git.yoctoproject.org/poky's meta instead of
git://git.openembedded.org/openembedded-core.git's)

