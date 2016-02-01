Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7393F77241
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 08:14:20 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id t15so29352131igr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 00:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=WcDnoidcjyS/hFC8Lq34fjnxAKu4MKJeqmAXIlVHi4o=;
	b=Io5BAPrp1rBZ+4k+aj9i6bHjWKwvdzAlXNMNDDYHE8QtE+RlSJm5oInPIEJM80VVQu
	33fO3OELcep8tX3QEPoKE3rd8JEa5eKaXp2ioh43W70Yi978UWwsI7WrqiY+3P3y50A5
	x3F+4DkRzep9j8+sJzDl4RoOzG+4ZZBcBsVUheZ3oNcQtPJlmVkpV7WbRB+LxXAumowH
	04RTDYWX+Y7ITyyTG2bfw27JOcOBCHY2Jbyjs8zNOA6PTiNY51Kk0dF9tAhtmxl+08Gz
	Rexx1vUCbj00b9UnpwsKSwWaD/by5KH6vlf/y+NSAvoDo+pMg52xHz7pUvMpRcQIhDLJ
	bcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=WcDnoidcjyS/hFC8Lq34fjnxAKu4MKJeqmAXIlVHi4o=;
	b=fWyH+IVuhXwMbLtzY7qObYb4AgKV0lWcy9ipicEsC8ej3C+fzkGvYnDKCEzeuumzOI
	4kwsjsuKiceuprGlBMgDH001bPh66nqQ9TX3eGMeNiuibz6MMuOTEeWZZPPFiRVxbOxM
	JTvhXtjUMPUI8Z1HMw5+eGPJhi+AbZW4PFO5cIclREecRV8qdDMmGD1D4+EU1DDgNRx+
	QNWq2Rgod9NblqR6ZNMSJiSuBPO6k7QQaCQaK53mb779fs900APC1P2UbPRJ3mJX01hZ
	rjFaW/TX+S3DONpFcCHB4/7G5wWj/H2xe8u6DAt2mj/vW6lY3MY9RSq9b12qkmdiMZBS
	WNNw==
X-Gm-Message-State: AG10YOTo4TxA/4QQxqRabzOT36/iuq0cZLz9LUybOBqw62YCjvvzlqo8ONTzjNA1sLAQ9Vez
X-Received: by 10.50.141.193 with SMTP id rq1mr9174627igb.44.1454314460913;
	Mon, 01 Feb 2016 00:14:20 -0800 (PST)
Received: from pohly-mobl1 (p5DE8C9AC.dip0.t-ipconnect.de. [93.232.201.172])
	by smtp.gmail.com with ESMTPSA id
	d36sm8978142ioj.18.2016.02.01.00.14.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Feb 2016 00:14:19 -0800 (PST)
Message-ID: <1454314457.20696.16.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 01 Feb 2016 09:14:17 +0100
In-Reply-To: <CAJ86T=U6jUg7+nLPVz_=cEodqRNcK=zHvu3yJBOvg+b9V0XXWA@mail.gmail.com>
References: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=U6jUg7+nLPVz_=cEodqRNcK=zHvu3yJBOvg+b9V0XXWA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox: Add support for busybox-init
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
X-List-Received-Date: Mon, 01 Feb 2016 08:14:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-25 at 11:39 -0800, Andre McCurdy wrote:
> > +        if grep "CONFIG_INIT=y" ${B}/.config; then
> > +                install -D -m 0777 ${WORKDIR}/rcS
> ${D}${sysconfdir}/init.d/rcS
> > +                install -D -m 0777 ${WORKDIR}/rcK
> ${D}${sysconfdir}/init.d/rcK
> > +                install -D -m 0755 ${WORKDIR}/runlevel
> ${D}${base_sbindir}/runlevel
> > +                if grep "CONFIG_FEATURE_USE_INITTAB=y"
> ${B}/.config; then
> > +                        install -D -m 0777 ${WORKDIR}/inittab
> ${D}${sysconfdir}/inittab
> > +                        tmp="${SERIAL_CONSOLES}"
> > +                        for i in $tmp
> > +                        do
> > +                                j=`echo ${i} | sed s/\;/\ /g`
> > +                                label=`echo ${i} | sed -e 's/tty//'
> -e 's/^.*;//' -e 's/;.*//'`
> > +                                echo "tty$label::respawn:
> ${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> > +                        done
> > +                fi
> > +        fi

SERIAL_CONSOLES is typically set differently for different machines. But
busybox is not machine-specific, therefore using SERIAL_CONSOLE like
this prevents sstate/package reuse or worse, causes package versioning
problems.

This probably was not noticed by the auto-testers because it only causes
tests to fail when SERIAL_CONSOLES is really set differently. I'm
wondering whether there should be variable flag for machine-specific
variables: then using such variables in machine-independent recipes
could trigger a QA warning.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




