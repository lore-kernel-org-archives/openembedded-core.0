Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1A6EF62133
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 14:32:21 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id a66so28099285wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 07:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dpL3mmJiPMD3VsBUkhnoy++h5S6029tJ0yISJLvOs9E=;
	b=j8cXrO6CNG4PtaUryvkzbpf32efB9iCfaqmPrZ3UQSgiFO9HVRhfPpetRPUrFUH1OM
	gNzIbj0zDsDf+s00M7VTWqghMRVI/BV8K77etOICKhqGwvnHpmPMODQSd0t/oOlKUQJJ
	sUoICqveZye4+DhLKLYmNFaoZDXxPJz9pknsaBbJA9LxRSB+8xT+E3+p2AaK7jeSx6XZ
	RkXVICisCWx9DE5QMTHuItVCiFA5VHHtyUa+mD+wfVCXn0ThBVV0Aer2ah8XnP3A/Ewk
	zhrvsMLo9zmS+2BAkXE4Dmo+zK8HfMLB3CCyxIae+wE9aBW382e/T2DZdrZYL13/3Yjc
	PIqg==
X-Gm-Message-State: ALyK8tL23Y4bbNMF8ZM7fHrPKqY29qpyjIyvoz3o+WbgNkp/QE+pqmcuVXSzlqOiTfVvTw==
X-Received: by 10.28.155.196 with SMTP id d187mr19255052wme.30.1466778740910; 
	Fri, 24 Jun 2016 07:32:20 -0700 (PDT)
Received: from localhost ([185.46.212.65]) by smtp.gmail.com with ESMTPSA id
	t190sm3370984wmt.24.2016.06.24.07.32.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 Jun 2016 07:32:20 -0700 (PDT)
Message-ID: <1466778738.30669.12.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Jun 2016 15:32:18 +0100
In-Reply-To: <1466777979.30669.6.camel@andred.net>
References: <1466765671-22371-1-git-send-email-git@andred.net>
	<1466765671-22371-4-git-send-email-git@andred.net>
	<CAMKF1soqpKFDgoeKcAjiqbptR4xDFQ+VYRSt9kT67Uy=Bj8v7g@mail.gmail.com>
	<CAJTo0LbTunHyH_iss4dLTzcOwADNnVp2gdmGoMrWtgyt0Myx_w@mail.gmail.com>
	<CAMKF1spjUmGWxmS_+inmTCecFLQtbwQ5Pj=LAzsarA5_ymO4CQ@mail.gmail.com>
	<1466777979.30669.6.camel@andred.net>
X-Mailer: Evolution 3.20.3-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] uclibc: really enable verbose compilation
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
X-List-Received-Date: Fri, 24 Jun 2016 14:32:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fr, 2016-06-24 at 15:19 +0100, André Draszik wrote:
> Well exactly, V=1 gives more verbose output than V=2 :-)

I'm happy enough if this patch is not wanted, though.

Is there a consensus somewhere? E.g. autotools.bbclass and cmake.bbclass
both enable verbose makefiles by default...

Cheers,
Andre'


