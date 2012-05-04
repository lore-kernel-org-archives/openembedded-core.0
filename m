Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SQJ3I-0008ND-7Z
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 16:00:08 +0200
Received: by wibhj13 with SMTP id hj13so1248606wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 06:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=OVzhtJCbgO886pzilKyvPr+5IBoIgpINrt3uHTFJNCc=;
	b=RF+gUTHMARWndScZ4Yt3jN9mmbXybrnkYJW+xfcNn64zua5p9GyKZDlVq7ZJspi23P
	GWSpINknVT0zLKFSI4j9t/W9AkUWu6RbNnpocnuhlUbPHMqu/eB31w9uCMHkCAqEJJ7c
	FltF1pBfKydECtLCt/iPjJXY4zu6Y4gNG80yA87p+6CgGls0KDF3z9B/ReytUwWSOWo5
	BkzFPKIEz6WRMMOfFAmMYhVzKapvR9f+wl6IUKbYaecLZ6TawSy1Ckp3wr3FPn0LroUc
	jGrjSZ5XinH3vgKzbwsODBW7U5VuL+VrLkUDufZVSroSsTyRJh25KOhp2ZOvLu3mx90N
	oOGw==
Received: by 10.180.24.7 with SMTP id q7mr12703987wif.11.1336139418500;
	Fri, 04 May 2012 06:50:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o2sm15204234wiv.11.2012.05.04.06.50.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 06:50:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <372b4f451158c03f0d62bf406db1a16a883faa80.1336138307.git.paul.eggleton@linux.intel.com>
Date: Fri, 4 May 2012 15:50:16 +0200
Message-Id: <020C25C7-7981-4351-9AC3-F666A813A35A@dominion.thruhere.net>
References: <cover.1336138307.git.paul.eggleton@linux.intel.com>
	<372b4f451158c03f0d62bf406db1a16a883faa80.1336138307.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlWZscinaKu9MHYNNPANU06y769wRcw7bNtz72vwdHdObpBh4JNzZMfuJXX3ryJEOixGvQ0
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 1/1] buildhistory: fix multiple commit of images and packages at the same time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2012 14:00:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 4 mei 2012, om 15:36 heeft Paul Eggleton het volgende geschreven:

> The echo line here was merging multiple lines into one, and the result
> was that if both image and package changes had to be comitted then only
> the image changes were being committed and the package changes could
> potentially be merged into the next package change. Quoting the variable
> reference fixes this.
> 
> Fixes [YOCTO #2411]
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Looks good to me. If this goes in, can it go on the denzil shortlist as well?

regards,

Koen


