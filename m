Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id 84AB071C14
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 20:44:28 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id 63so85728266ywr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 13:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mrqK0DAn8f7AazIDdeJVpkFuQF0gpLA6UTWLfH35xsk=;
	b=nLsGXX9fBNHcTbmW0w5vtUZQyixMgvzktTKh69lZE9RhBfpI6drqCvvhNFJrD+562z
	vUrgPRtLXZIA0pp2IikAqrV4dq+50WvZbuaH0B6CET5jm6ANuZRbADAdk/5r7DF2GcEM
	QJCqwSsnK36tCqmONpm2a3Hy7alXh2p5d6ueQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mrqK0DAn8f7AazIDdeJVpkFuQF0gpLA6UTWLfH35xsk=;
	b=TFYuT6ddLvwJPZjh8oRCSdyOx9Qkio03bb7PvHJwwq326qDaKFNctqYAW2382+WYVb
	7YNAMBSlrI0azJ1oA0Yrp2dxApx2d0R4E6hMtQQnnQZvCF5UC4XBzKZz6x0HcKkJHGdb
	ldIfDNkE6wyHIstFQj88hMo3IIiP8wI1PdandZxfpMtUgOfUx4lBvtRnZDa2381Mismn
	f4PHtS2opRXGMecA2vBU86JKkF8bmkcYhPR2A0fkwECPOjoCnz2638LA+nsJ+Z5aTWWO
	hKNWlWtZqASZ3g/xvzwilgB9ksa3RIsDNbk0E3xIQhmnaMDzYZTozyODKLzGadjP4p1O
	oNIQ==
X-Gm-Message-State: AKS2vOwUdgolDtCBj68AsmlzID2XdjRR082GqWAK9LLeyMdrYUQ90NP1
	RTEfTojEuTlqxRKh
X-Received: by 10.129.73.78 with SMTP id w75mr31623606ywa.244.1499201070262;
	Tue, 04 Jul 2017 13:44:30 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	p189sm8374301ywb.30.2017.07.04.13.44.29
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 04 Jul 2017 13:44:29 -0700 (PDT)
Date: Tue, 4 Jul 2017 16:45:19 -0400
From: Tom Rini <trini@konsulko.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Message-ID: <20170704204519.GO9889@bill-the-cat>
References: <20170703105918.21597-1-fathi.boudra@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170703105918.21597-1-fathi.boudra@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: naresh.kamboju@linaro.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] ltp: add acl, attr, curl and util-linux runtime dependencies
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
X-List-Received-Date: Tue, 04 Jul 2017 20:44:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 03, 2017 at 01:59:18PM +0300, Fathi Boudra wrote:

> * Use a list and re-order alphabetically to make it easier to read and
>   update.
> * Add missing runtime dependencies:
>   - acl (getfacl/setfacl commands are required)
>   - attr (getfattr/setfattr commands are required)
>   - curl (curl command is required)
>   - util-linux (ipcs command is required)
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>

I've found that the netns tests need to know what version of ip they
have, so need real iproute and not busybox.  That should be another
RDEPENDS.

-- 
Tom

