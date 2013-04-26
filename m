Received: from mail-ve0-f181.google.com ([209.85.128.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UVgtz-0005Sc-9h
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 13:33:20 +0200
Received: by mail-ve0-f181.google.com with SMTP id d10so1753397vea.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 04:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=8we1QoPom9yVn+orL/NpNZBG8/79x5PXrseJEIMwW/Q=;
	b=na3KODzcD0UKnQxIOTwEvPKa8wTcm0zZm8xWbpDivSmYRDjrZvbUzRjEQPJAyDlbXB
	TPwnE1p/dqFF16VpEvY/CTNobcmy4hfpFnxFQLkp9SLuuxY0I+zr8iuXLo4F97j7mjNl
	RfUZwN/rAyBhB7t5qmgCK3dxoeIrX8GNZVyJhhrNrj3zPFQ0cX6FDXS66Uwo8ZGFBf8l
	kD/6cuuC+RWGypxLwq1cZnHWpL0iO0ZvfcnOa3A3tUQXx/Y86FoCio5/x6lDWSvqOlFF
	mp8ySBt+kbz/exgbdU/EHwb77oruB4Gale9HFX54YwdO/d6IRHGiEkvdkzgZ1xSZ7nfV
	3gWA==
X-Received: by 10.58.15.193 with SMTP id z1mr28964239vec.40.1366974934236;
	Fri, 26 Apr 2013 04:15:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 26 Apr 2013 04:15:14 -0700 (PDT)
In-Reply-To: <1366973665-8779-1-git-send-email-ml@communistcode.co.uk>
References: <1366973665-8779-1-git-send-email-ml@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Apr 2013 12:15:14 +0100
Message-ID: <CAJTo0LajtYn68VZSezRjj9GDS3CBvznnz+bG1s2V5O=rK18SRA@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
X-Gm-Message-State: ALoCoQlabBvH4CAshrPcwRjCXJofr5Bdq3M3qJI6VsotddJMbMZD6LI5SWahwdcI+5f/2DbqizJL
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] connman: add PACKAGECONFIG options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Apr 2013 11:33:30 -0000
Content-Type: text/plain; charset=UTF-8

On 26 April 2013 11:54, Jack Mitchell <ml@communistcode.co.uk> wrote:
> +PACKAGECONFIG[tist] = "--enable-tist,,"

Please also --disable-tist so it's explicit as to what's happening.

Ross


