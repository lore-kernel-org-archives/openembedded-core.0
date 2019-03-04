Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 04A4B7BF70
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 10:26:55 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id e74so4033775wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 02:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=DNrAETGCdy2cxsok0VprR9IGa2DWT10wfL3O43j9a/A=;
	b=DEE4/801Au0mLV7F1Ts8NycsoEYZlvov90AeXi7HCg0XcYHrcHUkNR0dHmgdXyrCgk
	dHx0oOZl7XVhAwCs3R/cbq1llAQRSKAXGGZVuV0ihCeHENloYRcggNsBgyWyXJWx6KW2
	UuMxoL/tqOAIe6KlHxdl3mEXKcLOlvaDZWGTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=DNrAETGCdy2cxsok0VprR9IGa2DWT10wfL3O43j9a/A=;
	b=hEZVJ+OTG2Ex7RgmQVDsGzYT3/I2OjL04eq+3nNPymcrzHhkslTTVg5C3igpW3QmFn
	qoNtkXzLbT0djZylD1Ouup3z7IW0M7gjp3MlELUHNMIajefzgkQERydU3CFANDR3mFJy
	AMekdtden+kdTOOjqpIXVB06MgHqPMfimA06sKFU8ZWFsKfFENm0gKMe5VBfu7FugEe7
	LYhiDwZpPxyNeRziTdeBr/RgUiFTXgq6ShghntwzUvRNITkTOnRPekAkADf1WRVyBqBI
	Ss87RPNk6tPCIn3nVzw4O1agy/MdSNcLRdnpdlfBtE+jaM+gtEn3bA75erU4L538g+9w
	XdcA==
X-Gm-Message-State: AHQUAublpEXOggFKJwNxwQevqKp+eZDiZrUgxjoxrYPWSoRROwVXlIZ9
	bVlL5hke6b9xTT7z8GdVWwrWkw==
X-Google-Smtp-Source: APXvYqxSEE1Je1vMgx0Qqp5yJborGG2zIY+f7AWlLymJLVIP0ZsbegpukZ5O/+bW0Xs+dT6cYguDKg==
X-Received: by 2002:a1c:6788:: with SMTP id
	b130mr11408133wmc.102.1551695216490; 
	Mon, 04 Mar 2019 02:26:56 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a8sm11131512wmh.26.2019.03.04.02.26.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 04 Mar 2019 02:26:55 -0800 (PST)
Message-ID: <7aff7260ddd7791dde2cd381de46eaf02e937174.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Mar 2019 10:26:54 +0000
In-Reply-To: <31ec3ae0-3d38-7725-54ab-f5c3fda864b5@windriver.com>
References: <20190204181314.22496-1-raj.khem@gmail.com>
	<e0f4b1c8-54f9-63c9-b08b-147243ebe1ce@windriver.com>
	<12b1452d894058e0a03398ae65b0f52deaeb9182.camel@linuxfoundation.org>
	<31ec3ae0-3d38-7725-54ab-f5c3fda864b5@windriver.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH] send-error-report: Use https instead of http protocol
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
X-List-Received-Date: Mon, 04 Mar 2019 10:26:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-04 at 18:02 +0800, Robert Yang wrote:
> Hi RP,
> 
> On 3/4/19 5:23 PM, Richard Purdie wrote:
> > On Mon, 2019-03-04 at 15:50 +0800, Robert Yang wrote:
> > > Hi Khem,
> > > 
> > > We have an internal error web server, this patch breaks it:
> > > 
> > > You're accessing the development server over HTTPS, but it only
> > > supports HTTP
> > > 
> > > So I tried to use runsslserver, but it doesn't work either since
> > > the
> > > host is
> > > Ubuntu 14.04 (python 2.7.6):
> > > 
> > > $ python manage.py runsslserver
> > > 
> > > [snip]
> > >       ssl_version=ssl.PROTOCOL_TLSv1_2,
> > > AttributeError: 'module' object has no attribute
> > > 'PROTOCOL_TLSv1_2'
> > > 
> > > This is because python is old.
> > > 
> > > I think that make it default to https would make the server
> > > harder to
> > > set up,
> > > so is it possible to:
> > > 
> > > * Make it default to http, and add an option such as --https (or
> > > --
> > > ssl) for https
> > > 
> > > Or:
> > > 
> > > * Add an option such as --no-ssl to make it use http.
> > > 
> > > I prefer the first one since https server is harder to setup than
> > > http in django. I can work on it if no objections.
> > 
> > At this point the project does require python3 so python2 being old
> > shouldn't be a reason to be changing this.
> 
> The python3 + error-report-web doesn't work for me:
> 
> $ python3 manage.py runserver ip:8000
> 
> And when I tried to access http://128.224.156.132:8000, it raised
> errors:
> 
> error-report-web/Post/views.py", line 16, in <module>
>      from parser import Parser
> ImportError: cannot import name 'Parser'
> 
> So I use python 2 for it. I thought that it didn't support python3,
> or didn't
> test well.

Fixing it to work with python3 would be the preferred option...

Cheers,

Richard


