Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 319B861C10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 17:27:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 6so3712417wre.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 10:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=xHw4KEsl0W2fGQKLaNHsPDScNXMi+PBYA2Ikp6oK6hQ=;
	b=JJbEkf27mREzdXmIjyeBK4ynYD9WYoURIggVmBMrwSYMW3GO4ynw3YiH6ZAvW9u+M/
	OTYuIlzBSIvUocR2kC5tYNi5ZFyF75Obb6O1a0DUPqksJ6bEy3kBL2hg1uC2zUe8/Rr/
	c/2SspD/maQ5u7y+s4fpRy0jmKnWqPdXqB4UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xHw4KEsl0W2fGQKLaNHsPDScNXMi+PBYA2Ikp6oK6hQ=;
	b=CnGVD/t6pmZBNal7tpk5pyXftHen7jShQnZTvddLsUi0OJH80AVu+g7T2UebVaWRGK
	CnpTExZRXSR6wYIDYS1VHbjGb+0G1TzEIVt70EnoYHaqURr5y/QOqaTPzNozVykd2/Qq
	IamJvsZ8d6NEy7pAj0fg1XRiOuTTkqO5vwk5kGHpGhQXiRM8apm8eF1E4Y8rL1WmggIm
	J/tO87kaHAROUC2mYGCVTS3mgTkqTBts39SeFMGCkCyCPyLEkUb0Oiz7XD7H0BBR9xN/
	YsJr6HDFSt0KBIba6Mm1A3qx5Q+IlwBla4GFKQqK5+Z2h2rok0L8h1WOV/VeIGQKHZzn
	RsIg==
X-Gm-Message-State: ANhLgQ2Zq/uveDKIJcsvl7fJC2eSdGXm24Dx/gXw41k9aFExr/Xr8my0
	2/9VCmkGYE2xzeVBJAUCQx6z3A==
X-Google-Smtp-Source: ADFU+vv6qIsmykrZwNK8+EL4Sw5JNzXDgYCElIYEvTw0OLMv378zYNeg/nzg6DgptCI8u+arrZ3u4A==
X-Received: by 2002:adf:94c7:: with SMTP id 65mr5449249wrr.393.1583947671781; 
	Wed, 11 Mar 2020 10:27:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	61sm21995649wrd.58.2020.03.11.10.27.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 10:27:51 -0700 (PDT)
Message-ID: <65455f6a8ad443729e919704ef3a9d425b5cb6ac.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 17:27:49 +0000
In-Reply-To: <4d7b32fb-2163-92dc-f3e3-219eacbc4782@gmail.com>
References: <20200310232814.48572-1-richard.purdie@linuxfoundation.org>
	<20200310232814.48572-2-richard.purdie@linuxfoundation.org>
	<4d7b32fb-2163-92dc-f3e3-219eacbc4782@gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: Ross Burton <ross.burton@intel.com>
Subject: Re: [PATCH 2/6] gcc: strip line numbers from generated code in gcc-plugins on target
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
X-List-Received-Date: Wed, 11 Mar 2020 17:27:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-11 at 10:20 -0700, Khem Raj wrote:
> 
> On 3/10/20 4:28 PM, Richard Purdie wrote:
> > From: Ross Burton <ross.burton@intel.com>
> > 
> > The line numbers are influenced by the gcc version on the host used
> > to generate
> > the code. Remove these to ensure the shipped source code is the
> > same.
> > 
> 
> Please send this paatch to gcc mailing lists for review, I am not
> sure if this will cause regressions for plugin writers since it does
> not seem  simple debug info that it is adding, and external plugins
> might rely on  this information. While I understand it might solve
> our usecaase its a kind of patch that I worry about to carry out of
> tree.

I very much doubt upstream are going to accept anything like it
unfortunately. Whilst much of the information is useful to plugins, I'm
struggling to see how/why they'd use line numbers outside of debug
information so I've assumed so far they're just that - for debug. DO
you know of it being used in other ways?

Cheers,

Richard


