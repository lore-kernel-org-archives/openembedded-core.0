Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7216B6C6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Sep 2013 17:10:53 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so1803409ead.33
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Sep 2013 10:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=0rLOLEC+62O7aQgLwRGElY0hKEAkBq/6vNZTHYfH4PQ=;
	b=WXcQxYfz+vv2sQl5I5YLWaxwOxGUnYH23FLs/GZyoNgCRdbYunv8AsXZQ/9P5LOYbf
	/9xoq8Emi7vHLeGp0TmQWD48M44OYco1Jrz7xKyqqd41k4QqDGr5cHHKlM3Qxohdcp4r
	rSC8eJ9HRhIE5vbUaabHXGrO0pbhgv5th1io5UzErEpv895D3cHahmC4hq6WbOE7ovjC
	FNT21Zrb22GKjtCQWRKDit+j2RuXTCUVpUflwCW04kCvImoX/KUux3qimhXLZm3Ih3rz
	4l5uPgSLN17Wln87zAcSC4yv8pAJu8SW4fQ/9a14uOszSPWhEU/sAAUMiSro7bQHPUik
	tmqQ==
X-Gm-Message-State: ALoCoQkAOtrbvmDumbtKv41iABBwetro3/V4RJP4euO4y4Mwj/YzpjSyk11RtnlC+7bRRNP/eT9e
MIME-Version: 1.0
X-Received: by 10.14.103.69 with SMTP id e45mr5304610eeg.51.1380388254659;
	Sat, 28 Sep 2013 10:10:54 -0700 (PDT)
Received: by 10.14.117.67 with HTTP; Sat, 28 Sep 2013 10:10:54 -0700 (PDT)
In-Reply-To: <cover.1380234931.git.tom.zanussi@linux.intel.com>
References: <cover.1380234931.git.tom.zanussi@linux.intel.com>
Date: Sat, 28 Sep 2013 13:10:54 -0400
Message-ID: <CALmOhgmcxAgG2D3SNYiH_OK_nxMRKUmsWhLi9VAjqxO7kJH7MQ@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] 'wic'- OpenEmbedded Image Creator
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
X-List-Received-Date: Sat, 28 Sep 2013 17:10:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 26 September 2013 22:17, Tom Zanussi <tom.zanussi@linux.intel.com> wrote:
> This patchset implements a new command named 'wic' (for OpenEmbedded
> Image Creator).  Please see [YOCTO #3847] for extensive background on
> what's implemented here.

Wow Tom, this is really AWESOME work! And thanks for the excellent
detailed description of the current system which you documented in
[YOCTO #3847]!

One question comes to mind: if I have a package which installs files
to two (or more) different directories and I have decided (for
whatever reason) that those directories should be on separate
partitions, is this supported?

