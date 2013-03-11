Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFAqC-0001iF-NR
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 23:05:08 +0100
Received: by mail-vc0-f180.google.com with SMTP id fo13so2317185vcb.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 14:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=mgOSSD/cOL84oBcxCDF8WUR8mAF3/Pbm+BSNyMepwW0=;
	b=IP5La2cID33347MXXias/DZDIqDlwXiCyw6FwwnKZRab07b62FViZPXQTQcGtzwlEz
	o2RRBkX0Y6/umzkE+j5IdLB4batryMo/Nhh7ZWotO9irZnOY/LxFGJIYwPLibXtAzgkY
	bnrMNNBNbCAf8EbsMjtRJPkjRkcLceKLww8NgbvzMkE4wn0cIjQnOSk0vssDQBmsAOtw
	o3HdtZvAi9tiX04GO7D+7xWq/79wIpUbhOCgxDkKrlCunTUDaeS7AVbM5f2zguKjT3e9
	wQ37v731IooB0QsRSStXPqAIVlO74JpSnt06vtA9wEzatdO2Sjp4pFW/3XBowDwUwf+H
	PxLw==
X-Received: by 10.220.141.132 with SMTP id m4mr5321886vcu.17.1363038510041;
	Mon, 11 Mar 2013 14:48:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.232.226 with HTTP; Mon, 11 Mar 2013 14:48:09 -0700 (PDT)
In-Reply-To: <1363021522-14994-1-git-send-email-jstashluk@dekaresearch.com>
References: <1363021522-14994-1-git-send-email-jstashluk@dekaresearch.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Mar 2013 14:48:09 -0700
Message-ID: <CAJTo0LYWR2B94aCe86M70rRqReVQ+Eb+2sqEunLOBai+Yk+Xmw@mail.gmail.com>
To: Jeremy Stashluk <stashluk@gmail.com>
X-Gm-Message-State: ALoCoQkK7jjUr6IPvhjJ6C0TlNCLcscOGWkVLtD9UFaAtAGzBk1w+/+W9uO/jaA9L1/zojWdu/Hl
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gst-plugins-gl: allow empty packages
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
X-List-Received-Date: Mon, 11 Mar 2013 22:05:09 -0000
Content-Type: text/plain; charset=UTF-8

On 11 March 2013 10:05, Jeremy Stashluk <stashluk@gmail.com> wrote:
> +ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY_${PN}-apps = "1"
> +ALLOW_EMPTY_${PN}-glib = "1"

Why would you want to do this?

Ross


