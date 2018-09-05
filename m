Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id BF7A774CB8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 12:43:24 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id c14-v6so7831779wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 05:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fssFVcLbGwz/xIh2LBp/JMYc8zdFV5UppOBHUEEQmEU=;
	b=XgWx0PInGxLf0cLZYVS1YAFOSgdxbFoTxI3TwNiZ8W6MeHa7RafNymiucTKHRTRHm7
	psdNtbIFJbZsJ1afgLXSpimiu1QUd2GsfTJ957emQl8VP+t4JnQtsZ6YHEO5krSToPDH
	8Z+vn+zAp2/HnNeVnUBQzFEzhrOal3WS3uVto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fssFVcLbGwz/xIh2LBp/JMYc8zdFV5UppOBHUEEQmEU=;
	b=sR9uyuyTf8Dez5+dFlRiv35qcW3l2oRBTLrfe64JILmhDZfbJPfvsEcZdTENG8phBm
	xrR9oAZAwW+PDaXnGSp4JZiBJt9rWpIPEEblyL1AQu+e7HSZHx0gleGxkd7QSjAlStlI
	fu1jBrLaEt6owwaMkNRqpSv1ohNMtKifYwgyyR75Ix+LdiiYalB0NerTvs4mHvFNRnea
	uJ62z5MtHyy4dNZ3NEY+/eqYIcwO0/JoQ6U6Z+4BpPDTB5JU2WTL5B4BzjimZuG8p0Vv
	OCinWBmRqepjHOAfEofyzNZrnxny6W46leIZCDAt4RMnHSFVB6LC9sNgtJMcfv2o5uWM
	gC+g==
X-Gm-Message-State: APzg51ANUJljOP8fJVwhYez0RWZH+1BIuEXEONnTciPuraxau/f9wb3Z
	9Pce404LCPG8ZBp6S+7s0UspxQ==
X-Google-Smtp-Source: ANB0VdbxMPtcqUWECIRVPAB8Ipe/6G8zVJrcGgccHNp0//mHAUSvNt+p5HzvjJv44w+CHfwHtBlqVQ==
X-Received: by 2002:a1c:b709:: with SMTP id h9-v6mr127308wmf.130.1536151405278;
	Wed, 05 Sep 2018 05:43:25 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w15-v6sm2802643wrs.8.2018.09.05.05.43.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Sep 2018 05:43:23 -0700 (PDT)
Message-ID: <3d2233af61b189875478bfe65fefb96b0c2c97c5.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Steffen Sledz <sledz@dresearch-fe.de>, Koen Kooi
	<koen@dominion.thruhere.net>, Khem Raj <raj.khem@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>
Date: Wed, 05 Sep 2018 13:43:22 +0100
In-Reply-To: <94e49755-3c5a-a4fe-47da-b5881a2d7c43@dresearch-fe.de>
References: <94e49755-3c5a-a4fe-47da-b5881a2d7c43@dresearch-fe.de>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Subject: =?UTF-8?B?UmU6IERlcGVuZGVuY3kgbG9vcHMgd2hlbiBlbmFibGluZyBwdGVzdCB3aXRoIMOFbmdzdHLDtm0=?=
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
X-List-Received-Date: Wed, 05 Sep 2018 12:43:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-09-05 at 13:51 +0200, Steffen Sledz wrote:
> [Sorry for the big addressee group, but I'm not sure where to address
> this issue correctly.]
> 
> We're using meta-angstrom as base for our own software. At the moment
> we try to activate ptest for some of our components. Unfortunately
> the trys lead to dependency loops. :(
> 
> To exclude our own stuff I've set up a pure Ångström environment
> according to <https://github.com/Angstrom-distribution/angstrom-manif
> est> (angstrom-v2018.06-sumo branch).
> 
> After selecting nitrogen6x as machine and adding
> 
>  DISTRO_FEATURES_append = " ptest"
> 
> to conf/local.conf we see the same dependency loops (see attached
> loop.txt) when bitbaking e.g. console-image.
> 
> For a first analysis we've purified the logs. The first of the loops
> is that one (after removing all the unnecessary stuff):
> 
>  glib-2.0_2.54.3.bb:do_packagedata
>  glib-2.0_2.54.3.bb:do_package
>  dbus_1.12.2.bb:do_packagedata
>  dbus_1.12.2.bb:do_package
>  systemd_239.bb:do_packagedata
>  systemd_239.bb:do_package
> 
> Any ideas what's going wrong here?
> Is this worth to create an issue in Ångström bug tracker?
> Or elsewhere?

Those are all OE-Core components and build fine with ptest enabled in
poky. That suggests one of the layers does something to the recipes in
a bbappend which breaks things. I'd try bisecting your layers, remove
some and see what makes the problem go away. I'd also start by creating
the simplest test case you can (is "bitbake systemd" enough?).

Cheers,

Richard



