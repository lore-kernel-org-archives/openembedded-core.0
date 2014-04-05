Return-Path: <trevor.woerner@linaro.org>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id EB98B6B5DD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Apr 2014 08:47:02 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id o6so4548182oag.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Apr 2014 01:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=dORGx03dFZC1z2RelNb79oJQ4kGg9P1iZhzzkRv0eoQ=;
	b=ewhygJ1JnMsoykMpGcpUQiHAv+G9WK8ti/ktxy+FIIOiUVwwp2cNWeGMNorJBgwXS4
	tqYGYNLocdb5LKOHDA1JgwGrY7Medq9WS07vnrOptXdthj+/W3w3d3buGghM5Scird1n
	j414SAJcWbOy38Wuedi/PVCE0VZtkFjA1I9/DBaN0XC2ksIEbrPK+Gtzn2YXFsPG6ex4
	AO3sO7bmXQhk78pwoMpCsM3f/mfpjmsPbmtF16kpix1Hj0zoCle2zd6Ab/kcXiRWJwmh
	JoS3QJgdfrIEBO+7MRVayKMEHOQMCGQjBqu9PAm1t0yBGzY7JXq7OMaqKfSbejKgqYp6
	oBXA==
X-Gm-Message-State: ALoCoQn5tuOZQmdg5jvyWq+U6Hdyvg+sQYeBQrfVK1W1bLVYoZ63ribuELhQoTXrVTAIrFQ0jEhK
X-Received: by 10.182.196.3 with SMTP id ii3mr6184382obc.11.1396687622493;
	Sat, 05 Apr 2014 01:47:02 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id h3sm1354621obh.8.2014.04.05.01.47.01
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Apr 2014 01:47:01 -0700 (PDT)
Message-ID: <533FC305.7050101@linaro.org>
Date: Sat, 05 Apr 2014 04:47:01 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
References: <20140403130609.GF2132@jama>
In-Reply-To: <20140403130609.GF2132@jama>
Subject: Re: State of bitbake world, Failed tasks 2014-04-03
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
X-List-Received-Date: Sat, 05 Apr 2014 08:47:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/03/14 09:06, Martin Jansa wrote:
> Other recipes are still "free" for fixing, please fix them and send reply to this thread
> when you start looking into it, so that nobody duplicates work.

I'm going to be looking at some of the qa.log warnings over the weekend.

