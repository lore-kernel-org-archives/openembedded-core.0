Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD1477040
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 23:51:35 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so35400229pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 16:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=WT4kC8v4hgVkljfNPFshQuE2ye2PqUIZew7zjG5K6Dc=;
	b=ZH8ilHZcW2JKbDkmuEEjUv4meR07zhwILZ9QMhzRO6KtKQT9NJ0dEppDtU1zMcL3NN
	kK7LQmKChc+Zkd1949OcKaj3iR/KmqPddT+e/qRS7CHxMDEIzq7yYM7wy3hV3R6XUlfO
	sHpNcqJ6P3Iv8dmq98wTiw144+UiSDZnu8WgFEp/icZVuT2wGvBnkgfv52tix2t0+NKN
	GFt+n7ooyZQY4dL8mwAGDJniz0FwU4OSYfFL3xaGTSXgCFkldqSeG9OR2cyp23PJplFn
	sk2ZE1Qm2uaZ+jHt6m9LaPzjGRW7p1kWrIMI+R+gt3P2bJDd3yI9cgA8Q37LBDb3yvtT
	FfTw==
X-Received: by 10.66.218.135 with SMTP id pg7mr13790825pac.141.1441410695639; 
	Fri, 04 Sep 2015 16:51:35 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:ccfc:abc4:daa5:b1aa?
	([2601:202:4000:1239:ccfc:abc4:daa5:b1aa])
	by smtp.googlemail.com with ESMTPSA id
	f5sm3782916pas.23.2015.09.04.16.51.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 16:51:34 -0700 (PDT)
Message-ID: <55EA2E85.8020700@gmail.com>
Date: Fri, 04 Sep 2015 16:51:33 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"joshua.lock" <joshua.lock@collabora.co.uk>
References: <1441139962.24871.16.camel@linuxfoundation.org>
In-Reply-To: <1441139962.24871.16.camel@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Fido and dizzy collaboration?
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
X-List-Received-Date: Fri, 04 Sep 2015 23:51:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 09/01/2015 01:39 PM, Richard Purdie wrote:
> Hi Armin, Joshua,
> 
> I've just been looking at the patches queued for the dizzy/fido
> branches. In fact I ended up merging them before I realised there are
> some issues.
> 
> The problem is there are dizzy patches which aren't in fido, which
> breaks our policies. 

I thought the changes had to be in Master first. Are you saying I need
to wait for them to be in fido first?

Could the two of you work to resolve that and give
> me fido branch to pull which resolved it please?

Will do.

- armin
> 
> I didn't take the dizzy patch related to S = ${WORKDIR} since that
> looked more like a change appropriate to master only. The bitbake
> patches also need handling on the bitbake list if we really do want to
> backport them to 1.26 and 1.24.
> 
> Cheers,
> 
> Richard
> 

