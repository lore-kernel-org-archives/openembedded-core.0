Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7lTe-0005zg-Vd
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 12:35:38 +0100
Received: by mail-vb0-f41.google.com with SMTP id l22so4140472vbn.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 03:19:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=2HS/QOMLBw+PD4hrZPEncHHDnHvPBjBv9MumrTfyBrQ=;
	b=hwbePgc/JWlrAb7t4liYXiuHwx+xi5DPCDnIRap5HxPEJBZ3/bVXnY/Yq4Q5NvSn3L
	SXG5MLPXLCOYsTCg1F8JOgMbW0COTi5pCrAKkNdxJoDsrxleaDNePFQxmatLzfzZBMSM
	WzrdBTMcWWfelRyBC7oG7q9/30FXdfp0U1a0xUfC+nuwfZIZvySQJXM+J/RWXXC27BHh
	aGKZV5o2CeRUnEMek8NyCB5JnyRO2VS4wg5NpHICUmGo633IQ4OVFFSG0CNxtYo870Id
	q/HHGBbX6/QH+eVPUuBIFXK4Gax0pT07+RCU9Tib+R8hlde9/fNH7Myf7SfRlAk7ZXnH
	NGmg==
X-Received: by 10.58.252.72 with SMTP id zq8mr20701237vec.20.1361272745492;
	Tue, 19 Feb 2013 03:19:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Tue, 19 Feb 2013 03:18:45 -0800 (PST)
In-Reply-To: <1360979912-470-1-git-send-email-denis@denix.org>
References: <1360979912-470-1-git-send-email-denis@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Feb 2013 11:18:45 +0000
Message-ID: <CAJTo0LYsEN7X_pDA40qsrCkrX_-A=oLr3Tae7tvrE59VcBXbiA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Gm-Message-State: ALoCoQnIesDZj6gahR0rruBrOjqiUEScr/dawEc3b4cg0fkiGcXBsb2PeCUdeeoveFy0QNOCahW3
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][for-danny] scripts/bitbake: Remove all instances of paths to a layer's scripts directory.
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
X-List-Received-Date: Tue, 19 Feb 2013 11:35:39 -0000
Content-Type: text/plain; charset=UTF-8

On 16 February 2013 01:58, Denys Dmytriyenko <denis@denix.org> wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
>
> * Currently the assumption is made that only oe-core can include a scripts
>   directory.
>
> * However, when other layers create a scripts directory the bitbake script
>   freaks out causing a infinite recursive loop until it crashes.
>
> * Simply changing the regular expression to remove all instances of scripts path
>   instead of just the first one fixes this problem.
>
>  [Yocto Bug 3872]

Queued in danny-next but probably won't make 1.3.1.

Thanks,
Ross


