Return-Path: <lnowak.tyco@gmail.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4C64660079
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 12:53:53 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id b81so125219023lfe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 05:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=QtwxdHpLXU54dy6mfcHwsaJsi2kE4OpN0dEdqQK7PsM=;
	b=tuzGc5UUHRXGcTR3Upt2Q6/EmAKV4Geq0wypn39W1r4G7znHWskjfC8XYSFE6Bql5k
	HCQt7zbyQzpBAA8rtbcdU3/jiHaQRUpPnrwd3FJyanuoR2IVPWUVnKwPrR6WlQyk4vaM
	GwklnppgUJWbjaJ5LIW+3VxdtikagBQmFXa6XH20b1byTSkBIuoprvHoAikc7MEK7BhP
	dLsdF4073Lg5iQum58pzLzgPnT3h9ZyUyLxnQv8P1/phHonCWnICHDN6dw/kTfdjluct
	PVT52sF3DdqzRiuf5mNFpy1k9IGuDATzAOFdzOet95MQAzIPTFIXt/K+zE83ghnj4xdw
	QhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=QtwxdHpLXU54dy6mfcHwsaJsi2kE4OpN0dEdqQK7PsM=;
	b=B9uJx2VFaR0NrMyPQH4tZYKiQ8uArxD2vaVXYfxpKIP8pjhB3v9eT4jbn3Cw9a5zSK
	q4fN3rHXGtvXJuG3IN0yMaPHStgRO9I3PQHsuCfnfaemOleWhhhcz0fSlTdPDVAbIUe+
	qovBCUrvNmVqFlolMXSVbsLqAS/SeMtmr3Pwj3l0vc0OHajfzsQXWt8NDDpWwGDkRBZy
	XORS4QB0XFh7QL0YOPsZ4CE/ArpSRvP5zfQGIgLk++6GS17VBB1YX2NVaBFJWs8Dv8sP
	Mbb6cU3QhcIygcs/dcN4ciSeF4rQMi/7UXq9HSVwGEjiXYwFVaU7Etp5TAl3V4SdOPGt
	IF0g==
X-Gm-Message-State: ABUngvf9/em7wRnAuuWaWJ1cpaPNRS3HsOwob4QRLTOG6CqsltTYJZsuXgSwF8+LKgCC3w==
X-Received: by 10.25.166.8 with SMTP id p8mr101211lfe.47.1478004833987;
	Tue, 01 Nov 2016 05:53:53 -0700 (PDT)
Received: from [10.20.30.24] (159-205-99-3.adsl.inetia.pl. [159.205.99.3])
	by smtp.gmail.com with ESMTPSA id
	127sm3182280ljf.27.2016.11.01.05.53.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Nov 2016 05:53:53 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <c64cf308-d847-eac0-a2f7-bc8e686c2262@gmail.com>
	<CAJTo0LbR6gQYppuR6EPo30xnADd7-mfG6wg3Nf_r7a2-xgHgrw@mail.gmail.com>
From: Lukasz Nowak <lnowak.tyco@gmail.com>
Message-ID: <a7611154-80b8-3a80-131a-9200ba4ccb34@gmail.com>
Date: Tue, 1 Nov 2016 13:53:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbR6gQYppuR6EPo30xnADd7-mfG6wg3Nf_r7a2-xgHgrw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: fix bad file descriptor initialisation
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
X-List-Received-Date: Tue, 01 Nov 2016 12:53:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Ross,

It is a re-send. Apologies, but I have not received either of my two e-mails back from the mailing list, so I assumed the first one got stuck somewhere. I can see both of them in the web archive, though. Is that normal?

I've just checked and I have the "Receive your own posts to the list?" option set to Yes.

Lukasz


On 01.11.2016 12:46, Burton, Ross wrote:
> On 1 November 2016 at 08:50, Lukasz Nowak <lnowak.tyco@gmail.com <mailto:lnowak.tyco@gmail.com>> wrote:
> 
>     From: Lukasz Nowak <lnowak@tycoint.com <mailto:lnowak@tycoint.com>>
> 
>     Import a patch from upstream, which fixes a connman daemon freeze
>     under certain conditions (multiple active interfaces, no r/w storage).
> 
>     Signed-off-by: Lukasz Nowak <lnowak@tycoint.com <mailto:lnowak@tycoint.com>>
>     ---
> 
> 
> Is this a resent of your earlier patch, or a v2?
> 
> Ross

