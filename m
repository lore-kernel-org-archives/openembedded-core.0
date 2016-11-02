Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8008E6072C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 08:10:49 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id c13so5933560lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=5EEFhXmKThWKiHyink8vcbJa/V+3wWGp1MM5tiy0eJc=;
	b=dtJrVn4t72Eaa9UoElU/vxMeLVp7L8wTXAajJfvsrUz2H20Hj0BWcOQUX7fFIULwKE
	xQHqxh6rwQ+aezm6dodsmid9wHwslIQWb6s5xQvVQoD3BCIbYwLZ8RbyVx7qZYx6PAgM
	LbOC67toTOcUvtP4fQJL7VUKbovw+Rtv7ra2Kp1alBQNA07q/mtE0JSSCQaAKd7M1d0E
	GQlifMNn1PotDiz9700mE7OBQq4JXdZJdWwbniGdO0LagOcXBYZ6ws2MQbT588VMaDAa
	F1HMHr7BSvD0Seze8tJe4d4+tFiaSNQCpS4aJ85ZlKL+/Si6QcE+UguxRm5m+tSMEffI
	W0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=5EEFhXmKThWKiHyink8vcbJa/V+3wWGp1MM5tiy0eJc=;
	b=M652nUfa2IUlN14r25amOj/Qy28JgUjWVqGW00mrLRoYV+AzGPDOb55IgfwBR7QvcC
	gRSGVl7rxXRi8hgSeKJUr40lhxSYM0MV22eiXN9q19hjHHk/zGkIjkLgzV4aJiD6fhK8
	bdtsZtrjvK4sRM06RnBpkVLvIrKneArdy4MCD86RtuFrrXxr9WCrkAEQqKBvIhIyHzf9
	rKWvmMnrQqzRGqZ9vX4/WsNXC7Eb0bQHRqBKrw5RMbBavVYz0DLdYnhP8/2cVoCEmInV
	F3LVNwdqVEt3Y98C3o0FARU/z8i0+EjC+7keW+46qP3KKpKNzUoxdRvviN6GK4GfT6TE
	QDwA==
X-Gm-Message-State: ABUngvcz3j5QupU6KR9yAyqz6oIF6J4H9E4d4XC07M14/xLGSz0IMusrWFDIeePx3lPMRw==
X-Received: by 10.25.35.6 with SMTP id j6mr1088991lfj.137.1478074250272;
	Wed, 02 Nov 2016 01:10:50 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-49-no126.business.telia.com.
	[213.64.218.49])
	by smtp.gmail.com with ESMTPSA id 144sm190440ljf.6.2016.11.02.01.10.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Nov 2016 01:10:49 -0700 (PDT)
Date: Wed, 2 Nov 2016 09:10:48 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20161102081048.jsxkqya6o6oibyep@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <c64cf308-d847-eac0-a2f7-bc8e686c2262@gmail.com>
	<CAJTo0LbR6gQYppuR6EPo30xnADd7-mfG6wg3Nf_r7a2-xgHgrw@mail.gmail.com>
	<a7611154-80b8-3a80-131a-9200ba4ccb34@gmail.com>
MIME-Version: 1.0
In-Reply-To: <a7611154-80b8-3a80-131a-9200ba4ccb34@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20161014 (1.7.1)
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
X-List-Received-Date: Wed, 02 Nov 2016 08:10:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Lukasz Nowak <lnowak.tyco@gmail.com> [161101 13:57]:

> It is a re-send. Apologies, but I have not received either of my two
> e-mails back from the mailing list, so I assumed the first one got
> stuck somewhere. I can see both of them in the web archive, though. Is
> that normal?

Are you receiving any email you send to an list? GMail is pretty good at
removing the e-mails from a list that you sent yourself... At least,
I've never received any of them myself.

There's quite a few old threads about this on GMails support forum.

/Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

