Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CA50160F44
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 16:38:43 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id u6so2490919wrt.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 08:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=2w+cgQL+Z6qS+oV59fLbIMHL5s21319a4vj1aBP9g8Q=;
	b=E7rQ4pvgKDA2iQW3DWECHovXwV8qc2FPOBj9/XSYEMJyyt/atte9Lc+CmfcGh2gfHn
	jegupYNa9UhJ9GhZ1c1ArU5ol56f+SvJLxFDuXoFPyT4K2zf6nbGL5PG+MCjoTSwDVs1
	JpfiJlccpjyPagix/km1rxO6qyrnhKJZgLfDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2w+cgQL+Z6qS+oV59fLbIMHL5s21319a4vj1aBP9g8Q=;
	b=qy1Hh/9+0RIvTsr8PUhYjZti7DuKS8pcGqgsNIb/InmPcDBoQ1qF5PIGe7Oegi9Sg1
	I+X/HjGBcRqheVFzU/Y3SCGjiGcRLiV7ffuVLhHpFTjIKZ+8tTI40GEJk/RO86hF3oPK
	W/h+ehULh98OVuY8tiFP5f8liAjKhobbGpqQnx+YVYg24xsNa2F2pHU6JMnMpFDvVjTw
	m51aGW5ashWsSVj5jiOCG/oJD+tgo+weLC7g6lQXgw7awIBAij/oCfWFiLUGDTr6hldr
	sjEjN1dLoLfUotnUpnFq15+aYSx0svg4BLmCC6hzBn3oc379osUrdF3Gb7qYKzI8Gh9z
	zC6Q==
X-Gm-Message-State: APjAAAUqcCC2+TVXWkHOlZlDDwT/pqJ+CAPLR6KGNYZggX6aIZvFU7QL
	UA7e1ADUGWGtOAVBXUfKo1+Oqw==
X-Google-Smtp-Source: APXvYqxo40sDPr3tmYVxBZYk1aVltj4DBKX7r1H9SFhpH8z5aVEkFotDllpFRq1waPerHbf6ShswRA==
X-Received: by 2002:adf:f507:: with SMTP id q7mr5998408wro.384.1581179924499; 
	Sat, 08 Feb 2020 08:38:44 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s22sm7633416wmh.4.2020.02.08.08.38.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 08 Feb 2020 08:38:43 -0800 (PST)
Message-ID: <351a57e7950a487d5e6b7ba40d0807fac56582c7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Sat, 08 Feb 2020 16:38:42 +0000
In-Reply-To: <36734d21-1649-3a14-1355-eb998c0ede12@gmail.com>
References: <836aaccb82a2781c00e26249ab896d7ef0e25a27.camel@linuxfoundation.org>
	<6207024170e32fe8ef7262433124efc64d614132.camel@linuxfoundation.org>
	<36734d21-1649-3a14-1355-eb998c0ede12@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: Reproducible Build Status (and implications for zeus 3.0.2)
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
X-List-Received-Date: Sat, 08 Feb 2020 16:38:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-02-08 at 08:36 -0800, akuster808 wrote:
> 
> On 2/8/20 5:56 AM, Richard Purdie wrote:
> > On Fri, 2020-02-07 at 14:23 +0000, Richard Purdie wrote:
> > > I think we're now down to:
> > > 
> > > sudo path issues (Ross is poking)
> > > ncurses-doc issue (assigned to JPEW)
> > > perl host compiler flags issue 
> > > sysvinit missing group problem (assigned to Mingli Yu at present)
> > We're now down to:
> > 
> > A gstreamer issue with libcap:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=13786
> > 
> > and some potential perl host compiler flags leaking in
> > (no bug for that, we've not seen it in the last build and I'm not
> > 100%
> > sure if we fixed it or not yet)
> > 
> > I've queued up the recent fixes into zeus-next as I think they're
> > stable material.
> I can not  find your changes so that puts a hold on any zeus work I
> was planning on doing.  I guess this frees up my weekend. 

Sorry, they're pushed now. My scripts don't seem to update zeus-next
for some reason.

> > I'm seriously considering letting 3.0.2 wait a little to include
> > those
> > fixes in an rc2 and abandon rc1. 
> My vote was for rc2 if it counts.
> > If we do that, we may want to get the
> > bitbake hashequiv+multiconfig fixes in master-next sorted too.
> Is we "You" in this case to?

Yes, I merged those to master now.

Cheers,

Richard


