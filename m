Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 63B9E610F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 21:40:39 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id hv10so3486556vcb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 14:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gOyL2W9RIsCLsfU4L2Gz7HoALaUb5qsVzn9pxGBbIOY=;
	b=lUngP3PG8rKYtsAdxak0iP4PKZDsrYWo773B8z/35wsUXU563P7TmzvlX9YneXHRwH
	6T3RL4WPp+6aB6X+aeQEaPNZAgnBt7/sfKQYB6snc/VuYi0hkCSRFEv2nj+KXVUg5Nvv
	FLRN+McjftVEYOIgcXhllBnt1M7+fWE2BSDi652Lqk8KBp+OAPIX1BFIHJtXJrDZWpiZ
	eGr9hfIG/JYahMryMo7bcIVzl3DHh1P0gQR6q3Xs6PqBpAGD49zyjI/pDvbsOne0/1tQ
	MDqN+ksU6wOvrml75GxCHSMMn+zXlfzfHCHynPYshMvNU26JcjQa1E8Pn9ch57IeITuJ
	bAyQ==
X-Gm-Message-State: ALoCoQk2HG3UMB+winUDCTymSQ+L+U+2IDHt75Qvb3Csf8JUQdKE/CC4Su0v/1vkRIE7YOkCzxl7
X-Received: by 10.52.98.131 with SMTP id ei3mr33282837vdb.4.1379540440941;
	Wed, 18 Sep 2013 14:40:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 18 Sep 2013 14:40:20 -0700 (PDT)
In-Reply-To: <1379538994.18603.63.camel@ted>
References: <1379522926-22817-1-git-send-email-ross.burton@intel.com>
	<20130918222803.39fdaaec@e6520eb> <1379538994.18603.63.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Sep 2013 22:40:20 +0100
Message-ID: <CAJTo0La4GC8SzVCoCrnQUf_NTJkSvR-zm4gdSv=QCsupwMb6Gg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] qemu: add option to disable X grabs
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
X-List-Received-Date: Wed, 18 Sep 2013 21:40:41 -0000
Content-Type: text/plain; charset=UTF-8

On 18 September 2013 22:16, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Thanks for the report. I looked into it and somehow the patch was
> corrupted. I've pushed a fix in.

There was a typo in my patch and instead of re-generating it I did the
transposition in emacs, which presumably decided to be "clever" and
re-write the patch headers incorrectly.  Thanks, emacs!

Sorry about that,
Ross

