Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id A87276FAFA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 01:28:40 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 142so5559704ykq.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jun 2014 18:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Clh4N1K8qGcWM0EaJmpsRn69+c8PmEyfJInlZhhrMHc=;
	b=gBnHnX/Ov/5zwCnRsyyrdZ0cWBX8iJJE06yV5JSrHH+2cReTMZDTHbpoUNcRCKVSuo
	kUTjy+yZgFDlDKv5HJnX/SbyMiLTHn9xDMqsejjOxPRCk1D5aVdvRgd5MI0H2FvVf7EV
	UhBFIXb+ovdcbQxuBJyhi0/Yiwz6cCd43QjuXdM9m1ixTjbQKOU0WvOzfoHV3QYmG+Ob
	xLJFodb2cs7qJh+HvuTwWQwWvyDxA77Hv5n+XIgByc7mcrYaFMbGsFQVNeTXvHSJR79D
	xguH+/60FGl6kT17+dMq6WtL4b9ZS8aFXgfL6PhMel0cDmiczUbIACVBzpMgjfzyCstM
	5xag==
X-Received: by 10.236.157.40 with SMTP id n28mr68664781yhk.29.1401845321502;
	Tue, 03 Jun 2014 18:28:41 -0700 (PDT)
Received: from [192.168.0.12] ([201.53.220.23])
	by mx.google.com with ESMTPSA id k65sm1526064yhl.43.2014.06.03.18.28.40
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Jun 2014 18:28:41 -0700 (PDT)
Message-ID: <538E7647.2000803@gmail.com>
Date: Tue, 03 Jun 2014 22:28:39 -0300
From: =?UTF-8?B?Sm/Do28gSGVucmlxdWUgRmVycmVpcmEgZGUgRnJlaXRhcw==?=
	<joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Adrian Calianu <Adrian.Calianu@enea.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1400117848-4350-1-git-send-email-joaohf@gmail.com>
	<1400117848-4350-3-git-send-email-joaohf@gmail.com>
	<A1661D2DDD942248A02617DE63569A0125CB32DA@SESTOEX04.enea.se>
In-Reply-To: <A1661D2DDD942248A02617DE63569A0125CB32DA@SESTOEX04.enea.se>
Cc: "tom.zanussi@linux.intel.com" <tom.zanussi@linux.intel.com>
Subject: Re: [PATCH 2/2] wic: add support to look in all layers and get plugins
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
X-List-Received-Date: Wed, 04 Jun 2014 01:28:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Thanks to point this.

> [Adrian Calianu]
> 1) It looks like a bad indentation, here, adding 'dl' path for each found BBLAYER. Probably those two lines from above should not be part of 'for' statement.

Yes, it is.

> 2) If BBLAYERS variable is empty/None then the "self.layers_path.split()" will generate an error:
> AttributeError: 'NoneType' object has no attribute 'split'

I will protect it. So if BBLAYERS is empty/None the default will be 
used. Then the raw mode of the wic works too.

-- 
João Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil


