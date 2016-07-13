Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2F96067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 10:14:37 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so5321467wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 03:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iBO8FVRcOFF9cNbksrY8RVLrys57s+GubGpF8yADbMA=;
	b=YMOddecaJ4yVWsNsahiHC/Ty4cigkTEBGvS5sGjzRPN0rR3oRtkIwdeL4aQQfqC8KL
	xBmMwPRjHq7IWIQNKy/kRZ47vU2hwetG9LR7tnZpxR1udWBldoUTtuFkewegZ4yHivjd
	LASbRbg/iFm+dEaIC4vAGTZfwxXN6UilXpR4uEYbuVHcpLIRAtXcHET0CnI4QPgjbGsH
	MVepodaOyX1WUynrJBQKS5tVgJ1fyELGZ98VtTAUogBtaUGefNN9AAUJzhDJRF/SPq4j
	aR7oNFEsnKNI25xUzKdEU/dAJXY3eo/OLdizCtH5wopsQRs8kHIFVN1Q7xPm1w6iBSNQ
	Brtg==
X-Gm-Message-State: ALyK8tK1AD4oMbluuw3qlU1Omo3feT6N0u74PwMuwKJg7G7+v/atllNLBvq+4yd/EQOxPA==
X-Received: by 10.28.193.140 with SMTP id r134mr4127498wmf.81.1468404877710;
	Wed, 13 Jul 2016 03:14:37 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	r13sm8014131wmf.12.2016.07.13.03.14.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Jul 2016 03:14:36 -0700 (PDT)
Message-ID: <1468404872.23527.7.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2016 11:14:32 +0100
In-Reply-To: <aa5165d3-c97f-3a37-73b3-31cd5cc704e9@linux.intel.com>
References: <cover.1467914773.git.raj.khem@gmail.com>
	<cee6d405-3fdf-157b-967b-91022d5e9b9c@linux.intel.com>
	<CAMKF1sp+XRQ5bUd-8387q5PcWuQRspRj+UJS9LkuGGhr1WPw6w@mail.gmail.com>
	<aa5165d3-c97f-3a37-73b3-31cd5cc704e9@linux.intel.com>
X-Mailer: Evolution 3.20.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/4] musl/glibc/binutils updates
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
X-List-Received-Date: Wed, 13 Jul 2016 10:14:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fr, 2016-07-08 at 17:19 +0300, Alexander Kanavin wrote:
> On 07/08/2016 05:07 PM, Khem Raj wrote:
> > > > Fix gcc5 hang in SDK with -mmusl
> > > > Update musl to 1.1.15 release
> > > > Update binutils to 2.26.1
> > > > Update glibc to latest on 2.24 freeze tree
> > > 
> > > 
> > > What about uclibc? It should be updated as well.
> > 
> > I do not test it regularly. If there are users who want it we can
> > continue
> 
> Maybe we should reassign the recipes to André Draszik then?

Thanks for thinking of me :-) I do have a plan to move away from uClibc as
well, though.

Ross, so if consensus is to remove it from OE, I don't really have a problem
with that.


Cheers,
Andre'


