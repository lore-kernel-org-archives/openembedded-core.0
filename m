Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id 08B37608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 14:44:36 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id q14so3216472vbe.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 07:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8z3UNMi3Mh+gT/2FNbX0WNeZxhk+yBpV1gyag5UAacs=;
	b=oF8xjP3/sE2TM0nbc/xoDFG72HKaJYbfzOFeXNSIOz3xnMu2i8KLRKg0cIMU2mXpZ+
	Wt71zlAumTq8TzxiFSvlSn1xaAxvIKFNI5r3tKQIMD0fli7BznprZvhJNbsM09ndRKpZ
	/F8b/jp9Bq1/IxhtlSzMJi2TSrDAOPoW7li3m6Ae/MX/neuQI3gKTy5zoL/lA6sRgy37
	ot7D9WJJnspeKW1qER8xZsj3zvszdRWHFSW/9i5bLx/8nCT4wmWfsB4Gvlddm+CjBwOt
	TmlkLv6LfbeXPniQgWKo15RWnVOj/w/dMaBSNWN/o8apZ2R5LsXnTLl/6ZLoXb6rL386
	aGKw==
X-Gm-Message-State: ALoCoQnCoWESvycdhfn9BFbQV26m7VqEnDiTwlohDB+4PGNjfkbuu2/e302JNXs743GHMn7IUiCt
X-Received: by 10.58.171.4 with SMTP id aq4mr3295152vec.26.1375973076726; Thu,
	08 Aug 2013 07:44:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 8 Aug 2013 07:44:15 -0700 (PDT)
In-Reply-To: <5203AE2F.6070106@mlbassoc.com>
References: <1375971269-9758-1-git-send-email-ross.burton@intel.com>
	<5203AE2F.6070106@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Aug 2013 15:44:15 +0100
Message-ID: <CAJTo0LbO1SRJQW-nNmSrUxc7doFL1ztXXOUXe0v4eELt7tUqvg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oe-setup-builddir: substitute ##OEROOT## when using templates
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
X-List-Received-Date: Thu, 08 Aug 2013 14:44:37 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2013 15:41, Gary Thomas <gary@mlbassoc.com> wrote:
> Should these be here?

No, that would be emacs being "clever".

Ross

