Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2290A758E8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 01:42:07 +0000 (UTC)
Received: by qkoo18 with SMTP id o18so18395795qko.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 18:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=I1UDrrzNDGf2IkEkUwnsA0B3/k+yHe0YMS5x+ad588U=;
	b=FnPqNKDEp18XwRmfjAOufLCYhdQZ5RAHbOKmYzcpC68JfsZ/yNJ8u67AKwfkKLsslC
	kpy/jChpBSafOcNRucl716FcbbG2h3WW/OQfCSfyzfLMPBgyMFoNcrk/Mhmq1a/qt9nh
	yQQHTMGMonaYWUxPwUNyPYDlJ7OsT5z+2XVtdBFFh9fSfYDJHkSy84CLp+3fhTOjY06F
	B2ry5K02ys9w6uIGS5SBP/VJXjpIkxhH95qlstoNNZuK3h1LqdQystvhzbO4T+nHJ9og
	TofPSp0bsweW7fQt4BRjuswdaaiwbgqEtOG3GIKIDFQt5BJrA5PyCqFcp3SmfnBh+C81
	D/ug==
X-Received: by 10.140.33.21 with SMTP id i21mr715446qgi.4.1433900528439;
	Tue, 09 Jun 2015 18:42:08 -0700 (PDT)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id 78sm3495357qhv.38.2015.06.09.18.42.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Jun 2015 18:42:07 -0700 (PDT)
Message-ID: <557795EE.4030901@gmail.com>
Date: Tue, 09 Jun 2015 18:42:06 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1433878226-21350-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LbixBMU_CFPAegnVpnmFmTq_VpQK6SMnLsyBfUsMq3VwA@mail.gmail.com>
In-Reply-To: <CAJTo0LbixBMU_CFPAegnVpnmFmTq_VpQK6SMnLsyBfUsMq3VwA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] gnutls update to 3.4.1
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
X-List-Received-Date: Wed, 10 Jun 2015 01:42:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/09/2015 01:16 PM, Burton, Ross wrote:
>
> On 9 June 2015 at 20:30, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     re-sending as I think I may have done it incorrectly before. did not
>     see it in patch queue.
>
>
> You sent fine it but it results in neon not linking correctly (silently,
> unless you apply a patch I sent earlier).  Can you have a look?

sure.

- armin
>
> Ross

