Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id BAB227FD8B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 22:16:20 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id r3so4782983wrj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 15:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=SxKV3WAvoASiooH1KYBKQkYlEWgf9eX86U90UHi3Xhs=;
	b=GmAvMKRxxJO2qENa135JLLvvifiHA8F4wh2FYQZgcL8RcyrNRZpjk40K778XGvrOVT
	r1becMfRsYOIoGHuo4oPvSaDojjcIszczvtmkUzLyVsGav+US7Q0Z2xQzeKwMRdJIUaB
	0jIqxpBOMbtg6myCxOAV1suRLcLmNU/HkJiZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=SxKV3WAvoASiooH1KYBKQkYlEWgf9eX86U90UHi3Xhs=;
	b=XIk1Bw2EqsuzPfrBIcdOnJJygWqQ8WFD8nYoB+EjxiLgdf4/fZ8j/wnE8yhP29Pe8R
	VHEygSFitODa3u5y+TOalFEd9W6Xn35f5MHnggmsCwRw2xG/glr1GeWBTFtSJurC3P3x
	ExRF1NWfQ85gZIJ8OSEIg7OvzvlWbmaagYiXuCwBCvb4pKE+52IV2NiAGyZrJ+uZPP85
	ZNUlQ5hJcV9W8LxqSFWG4rposU6Awcgp434R96D25Rrn6ewn9fdtsOyP6RaSAuzmwkb4
	eGd/+t35StEjHv7B1XVQXNZmhaF3nkHAVia+mLxOi6hx/zMexg5JrT9MSeFoURQMk1wC
	9+lA==
X-Gm-Message-State: APjAAAW/9aloW1/DKwHNQ/VaIoySc299sePptAYDpvXjKjT2IzB3N467
	g8jGlMlQPQl544V8h7mmOzMdrA==
X-Google-Smtp-Source: APXvYqzthbDb4ev/Ekwx32LDMi6aTtb3ryj7P1F6Wpk4s6dmMPibaGM46s8r6DCalmBZ9kcCI4Ygbw==
X-Received: by 2002:a5d:5048:: with SMTP id h8mr555044wrt.280.1568758581444;
	Tue, 17 Sep 2019 15:16:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a13sm8352467wrf.73.2019.09.17.15.16.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 15:16:20 -0700 (PDT)
Message-ID: <8efc4f66f7509b3cc4235939f542858051b61b8a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 23:16:19 +0100
In-Reply-To: <20190917153613.4954-1-dbaryshkov@gmail.com>
References: <20190917153613.4954-1-dbaryshkov@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: Re: [PATCH v3 1/9] uefi.conf: add config file holding configuration for UEFI applications
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
X-List-Received-Date: Tue, 17 Sep 2019 22:16:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-09-17 at 18:36 +0300, dbaryshkov@gmail.com wrote:
> From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
> 
> Create new config file defining common variables for all UEFI-related
> packages (bootloaders, test applications, etc).
> 
> Signed-off-by: Dmitry Eremin-Solenikov <
> dmitry_eremin-solenikov@mentor.com>
> ---
>  meta/conf/uefi.conf | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta/conf/uefi.conf

This is heading in the right direction however if we're going to try
and clean things up I've concluded we need to do it properly and get it
right.

Now I understand more about how this configuration file is being used,
should it be called image-uefi.conf ?

I feel really strongly that we do not want an uefi.bbclass, its simply
not warranted and will just continue to expand the current mess of
classes. If all we need it for is some functions, those functions
should be added elsewhere.

I hadn't realised they were shell functions earlier, sorry about that.
One option could be to convert them to python since they could be
written in python easily. You could call a python function as a prefunc
or postfunc of another shell or python function.

Other options could be to make them shell commands (via the script
directory) or create an image-functions.bbclass which contains such
shared functions generically. As long as things are namespaced (which
they already are), that should be fine. I would ask that documentation
comments be added to them to say what the functions do.

I'm also on the lookout for tests of these kinds of codepaths. Code is
much more likely to be accepted if tests are added for it. I'm not
quite sure what would make most sense here in this case buts its a
general point I will be pushing for going forward.

Cheers,

Richard



