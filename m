Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TYwlx-0006Vf-GR
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 11:34:13 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 15 Nov 2012 02:20:13 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so5979722oag.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 02:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=UwkZwY83+rfRbTKtJ0F0zOtmR4je2x+xYvy9XQc06hk=;
	b=hDYhmOPTHORzZtYvxGvxKN4BCE/FadLAV3s4NkBMAetOjOGSe3tEyQ5tLs1c6UK4ug
	GPfNsZphSMsDx1ud64NLohzxYkTCCYSEok/0JwbrYZN+2kt9uhac6/sRbBRo8vTUMfJc
	LZxttmnj7C5oVaGpaBq6ZJ/j+IxdsDjW7nGPnQFCipkYmG9lNfjIr8ikIsgd0LN5dgMF
	W32E5KQxlh/N31QPcWwdyvnIeVAgOB1FBMKTxNpv2GnWPcGzC1sxNmPzaj+s9HdhgyzC
	5ekxfQjS/wIuuBdP2qG20Pr1uJXjaVgXTdHLH9ZVXz4ssjeIjjrhoU+4MP49xFrr1vX9
	muPg==
Received: by 10.60.10.201 with SMTP id k9mr451267oeb.105.1352974811249;
	Thu, 15 Nov 2012 02:20:11 -0800 (PST)
Received: by 10.60.10.201 with SMTP id k9mr451262oeb.105.1352974811179; Thu,
	15 Nov 2012 02:20:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Thu, 15 Nov 2012 02:19:51 -0800 (PST)
In-Reply-To: <50A3F364.1010509@intel.com>
References: <1352841144-31228-1-git-send-email-radu.moisan@intel.com>
	<50A2D2BD.9090703@linux.intel.com> <50A3F364.1010509@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Nov 2012 10:19:51 +0000
Message-ID: <CAJTo0LY8JXsCKPZyWQ2xMDWy57nXb3BL1Ur_+Lck7AitPU3=9Q@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQmgLwJD0/qMK+3/44JHQqWCEsz1YPjYleRtoBHVy2rOP63R999hJ45qP/+mY/don956y17csnZxkC7aR81KEnuhstfV3ErbkXYYdjK6/FSsS94AMmjnlP6N+T8gJUtlLmiySLYaX4R+k2LuUdNAC8VDfFhK0EiKaH2eRAh8md1c5nC59RjOUCfsPBfRcASnYULUFuzX
Cc: openembedded-core@lists.openembedded.org,
	Alexandru Damian <alexandru.damian@intel.com>
Subject: Re: [PATCH v2] initrd: add recovery feature
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
X-List-Received-Date: Thu, 15 Nov 2012 10:34:13 -0000
Content-Type: text/plain; charset=UTF-8

On 14 November 2012 19:39, Radu Moisan <radu.moisan@intel.com> wrote:
> Well, I didn't see any side effects. If there are side effects I'll remove
> the timeout but please point out to me some of those. Anyway, I thought
> about this more like a safety net because I've noticed "settle" has some
> history with hanging the system boot more that it should in some
> circumstances.

Your average Intel, qemu, or fast ARM test hardware can easily settle
in under three seconds.  The problem is when you have either slow
hardware, or hardware with lots of storage devices to enumerate.

Ross


