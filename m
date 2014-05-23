Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (unknown [209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB706A9C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 16:33:43 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id l6so8359650qcy.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 09:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=avJ6lj4IBmdh1MW8Ox47PNRlpt61UOoKv+T0cMwKMYY=;
	b=V0nDlnat3NXz/ZyeQTzmpTEV+mcq8d6KpWaYuaeK1NaSzUTtBrPA/w0OcaJpTFGLz7
	vGz6Xp96TJAP3LF7NWtXKrLG9Z7eSaaWgbhwCDjQxMI2NDMuAuShMn3Tkr5FSlJVzGDu
	d6TmhLPOSshBJoh/RN6arLupJIcJoyJG+nUbNZTrsVAqotrLJblC9igUqaWLOUVk/mun
	Rw6CrnhcFAr7b+xkO8t+o0QeS1e9QD/gdVmtd1LVHYoHdH/4HWDdfbigMwezY4dw9kOG
	i96i9LEACHrxe2h1g8gHhldUwx+1xjckrQ0KpjvyjQCDpNY0hm6WqVCgzMD9y3KmKPvl
	9Gwg==
X-Gm-Message-State: ALoCoQnP7wIuLPE3FYiOBEKnG4NeduCXr97TCwzHE+KcNQDgZ6UMsPteaGLXLXQu8kdaM9R1ObmX
X-Received: by 10.224.43.211 with SMTP id x19mr8058434qae.17.1400862824347;
	Fri, 23 May 2014 09:33:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 23 May 2014 09:33:24 -0700 (PDT)
In-Reply-To: <CAJTo0LbMGfDFMre2dNJXZ73R2NNzjtHyso_4orZT4yv0oc_OpA@mail.gmail.com>
References: <1400825337-3955-1-git-send-email-b40527@freescale.com>
	<CAJTo0LbMGfDFMre2dNJXZ73R2NNzjtHyso_4orZT4yv0oc_OpA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 May 2014 17:33:24 +0100
Message-ID: <CAJTo0Laqj7cauEEEor5Us3TonSfeiPkOC=f3V5PvS2dEMCrW2g@mail.gmail.com>
To: "b40527@freescale.com" <b40527@freescale.com>
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2][v2] doxygen-native: add recipe
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
X-List-Received-Date: Fri, 23 May 2014 16:33:46 -0000
Content-Type: text/plain; charset=UTF-8

On 23 May 2014 14:49, Burton, Ross <ross.burton@intel.com> wrote:
> Whilst this recipe works, I wonder if it would be more useful if it
> were cross-compilable and used BBCLASSEXTEND to become native.

"That can't be too hard" I thought.  "Surely something as common as
doxygen has a reasonable build system" I thought.

When scratching an itch I discovered that Qt had written another build
system (I make that three so far), but this branch appears to be able
to build both target and native doxygen binaries:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/doxy

Apart from the TODO in the recipe that needs to be resolved, it's
entirely untested on both host and target.

Ross

