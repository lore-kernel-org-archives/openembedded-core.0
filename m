Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 061646025E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 09:23:43 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r5so4655551wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 01:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=rv8sFMlPW6F/70swoAR0tJOsah+54fmV0sUD/GXLcM4=;
	b=SEJ6g/fYbPRhokTABwNA20zh17059itDLbj/rDZgO/Whb2/qBWWGVCSSAJ6POmYpnK
	s2zEqzO3B8p52oJCNbOISLjwJMQJ86Mx2l4TBbL5WT7xe0Acr0BO0I+o8gVjY5xbJwgQ
	HF04GDHdyOcBVCD4CTFxRSEEadpsphuratlPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rv8sFMlPW6F/70swoAR0tJOsah+54fmV0sUD/GXLcM4=;
	b=evOgsP6s+t3KjjGiRA02Sz9GK3I7L9eeDeEMXCvgXqHeagEk/wiD4nLIi83ZV+gZiq
	3kZUi1mqXBx5NpAwpJsrgfT5RXwQGRF0f/zV9bxxfIJSn6V7A2YA0lBIsovFskU5J4Aw
	jhHQa+euNnJpV5yudHfzvUSngsW4bg0ugWMDX8paQq0QYTcvMgdb1VgS1q0dEbjDFepR
	kDQFPYLdsjWpWAXZKXEWL/z0ePoN8BAhoThNYnQpvj6nw0layqR3N5Vw8EAHgtx3DG/0
	wkb3BOUkEMGk7tdi33gJXvkEZK0jHLCo8TBLMeUQ2GvfvJGOJKkPUWf8uUeUZEk+gIgO
	wu8g==
X-Gm-Message-State: APjAAAWnSZST33T5tNax+y+CnEgbcr6Aof8irfGlE4N31k4kuLMBCW7+
	4drYCnVBLlnh3EC1iXjiRir78Q==
X-Google-Smtp-Source: APXvYqwGkIC6dSO+N5wQ5tW5vlKoMjYZMITX/v4d/sXtIOJ8aYd13Y/0l1NpZMuVKxJJ5/Kg8OVIsQ==
X-Received: by 2002:a05:6000:1c2:: with SMTP id
	t2mr12610118wrx.109.1551691424532; 
	Mon, 04 Mar 2019 01:23:44 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x74sm5835582wmf.22.2019.03.04.01.23.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Mar 2019 01:23:43 -0800 (PST)
Message-ID: <12b1452d894058e0a03398ae65b0f52deaeb9182.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Mar 2019 09:23:42 +0000
In-Reply-To: <e0f4b1c8-54f9-63c9-b08b-147243ebe1ce@windriver.com>
References: <20190204181314.22496-1-raj.khem@gmail.com>
	<e0f4b1c8-54f9-63c9-b08b-147243ebe1ce@windriver.com>
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
X-List-Received-Date: Mon, 04 Mar 2019 09:23:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-04 at 15:50 +0800, Robert Yang wrote:
> Hi Khem,
> 
> We have an internal error web server, this patch breaks it:
> 
> You're accessing the development server over HTTPS, but it only
> supports HTTP
> 
> So I tried to use runsslserver, but it doesn't work either since the
> host is
> Ubuntu 14.04 (python 2.7.6):
> 
> $ python manage.py runsslserver
> 
> [snip]
>      ssl_version=ssl.PROTOCOL_TLSv1_2,
> AttributeError: 'module' object has no attribute 'PROTOCOL_TLSv1_2'
> 
> This is because python is old.
> 
> I think that make it default to https would make the server harder to
> set up,
> so is it possible to:
> 
> * Make it default to http, and add an option such as --https (or --
> ssl) for https
> 
> Or:
> 
> * Add an option such as --no-ssl to make it use http.
> 
> I prefer the first one since https server is harder to setup than
> http in django. I can work on it if no objections.

At this point the project does require python3 so python2 being old
shouldn't be a reason to be changing this.

The project also needs to be seen to encourage secure practises so I
think https should be the default but adding an option to use http
should be ok.

Cheers,

Richard




