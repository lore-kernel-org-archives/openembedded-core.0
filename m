Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8B40660AE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 03:06:23 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id m33so19536948qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=twgZCMeyh63xw52PYEFUgZRnkOvsYPa4bstOVZeVK6E=;
	b=iQggvE4FLBbGVxrEIXxxzlA8SOx1efT9PlPVmJwceVI/4SGr+mHmX+Enxyq4Gcn6OU
	45f91dFTzYsrFDVGTClZCY6H0beI6zv6a4iV+lF2VniIRcCvvMB2zu0J5d1s0Mg+fQjL
	rGxkl1a0PIxXb758kkhLunu9mmdBPiftgr1G1BcLqW7FUyZ+R4vl7VfKrhjvBSV7VZ0b
	pzHignwvdHuj0BGKC34Z0IL9UyDBzfEIHZQuBSy1RI6Ce7yw3Q0sJdRDrU0El3b+B4sE
	0qw8BWGC6uJbieT0OnMgMcOXpquGZI2yIay1Ydxi14Oi8HNoCPt8gq7bzQ62rTZaQjzs
	M0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=twgZCMeyh63xw52PYEFUgZRnkOvsYPa4bstOVZeVK6E=;
	b=bqB/1aD41XO/kl9bF32JFWzcgWIlKwfL+6XeMJzxsvsYeoUl/0PHTFzll09Ff1CIwW
	qjZrQctdXTrUPgap7CiD31mmRr96FEe2EhDlyQspXg6bYu1pjUsoL5+5WzWPbF07tPIa
	2fvFG/2JoRFXUDmTUEDC8jPYIFcqzAltI/3I02qZdL/0naGaiXNWNuV/uRWHspdIWsg5
	3+lcguKKM6Jka19/YBBlT06ncn/m/olcFeIIR0xiO38T/PEhIzvAT26weZtomtdAGoL2
	o3RerXiK9ILXpfydvANB0pzauyVX0jpX/M3+Wdd8y0l5v+lTjB3dM9U58UpzD+Ooif2X
	Ptpw==
X-Gm-Message-State: ANhLgQ0a/ynLFtlNYpagWJuTxoETIM61opFeXsXwCqDW2MlFMFjXoT98
	lnBDmQ5YlaT/eTH0wSR8I+wYWXzATvlikQ==
X-Google-Smtp-Source: ADFU+vsXlnDSQFcGHU0kGQ6VLgk3Z1i4woTB2wcUqrkX/UslMqPVzmphCgWTxaCg/OYb2BpHb38K+A==
X-Received: by 2002:ac8:4784:: with SMTP id k4mr2417673qtq.78.1584500784167;
	Tue, 17 Mar 2020 20:06:24 -0700 (PDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com.
	[209.85.219.48]) by smtp.gmail.com with ESMTPSA id
	x65sm1577286qkd.65.2020.03.17.20.06.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 17 Mar 2020 20:06:23 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f48.google.com with SMTP id q73so2720733qvq.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:06:23 -0700 (PDT)
X-Received: by 2002:ad4:5429:: with SMTP id g9mr2229797qvt.134.1584500783094; 
	Tue, 17 Mar 2020 20:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
	<20200317152303.4600-7-alex.kiernan@gmail.com>
In-Reply-To: <20200317152303.4600-7-alex.kiernan@gmail.com>
Date: Wed, 18 Mar 2020 00:06:11 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqZTmhZsgKTFtV5vxV6=fqTZwrw8m8NJvUkXgZQuKDyGw@mail.gmail.com>
Message-ID: <CAP9ODKqZTmhZsgKTFtV5vxV6=fqTZwrw8m8NJvUkXgZQuKDyGw@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 06/11] psplash: Set RemainAfterExit on systemd units
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
X-List-Received-Date: Wed, 18 Mar 2020 03:06:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 17, 2020 at 12:29 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> psplash is only expected to run during startup, but if any dependency is
> pulled into a transaction and the unit is inactive, then it can be
> restarted.
>
> Set RemainAfterExit to ensure that the unit remains active and is not
> gratuitously restarted.
>
> Drop the nonexistent systemd-start.service from the unit.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

