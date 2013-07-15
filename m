Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id A900A619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 17:02:09 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id x14so3275475vbb.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 10:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=2p32pnkYA/tKr276YL+fNtpxd16LelKfH9WFaK/q8sQ=;
	b=J8Pzar2I+sW1jlDhZEBZlhdYT7hu2jPrBY8P/9r/t8dbjSRpno3XtBQzoHKn/Kg7Yu
	zGJE9ckdFbZdLT9VqGhRntO6IOG/W5SFI/setXhKWyej+JA4oWUJ0LGZ3wxVnqy8vC7h
	TEKa7+zQ/eK17BGhs7O/Xjy9q2TUBVaT9UfNp6NwRDdNKqksV7S1uCc9RXcSE9+YLNuW
	vLXhOMAmhiLPZrPpaE2VlvS5QtWS1KO6cXwdyaCF0/ja/KJ0/SBQGO0N0mcxObtJjnVb
	wuaaWpj1EMJ2eNemCNQqap4L37kcHcb95mSwXWdQSIypQeTl1Tt+t+pgG/xVV+m7EYkW
	hhqA==
X-Received: by 10.52.163.46 with SMTP id yf14mr2741984vdb.58.1373907730113;
	Mon, 15 Jul 2013 10:02:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 15 Jul 2013 10:01:50 -0700 (PDT)
In-Reply-To: <1373905894.2651.41.camel@phil-desktop.brightsign>
References: <1373895869-25256-1-git-send-email-cristian.iorga@intel.com>
	<1373895869-25256-2-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LYHNwSaBE+mHq=YzUvwq9JywXQ7ii=xXeopL_CmWh6qaA@mail.gmail.com>
	<1373905894.2651.41.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jul 2013 18:01:50 +0100
Message-ID: <CAJTo0LZfSt0AwKyHRqG1XWOpsseDkCcLLSsfgo_isPqqLXg86Q@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQmuHHGQk5e+kG0q0K6HNlQ19sK9lSBgaO0zFgzJ0mMN5fCcpfWu57A365fV9IBhewMf85DC
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/2] bluez5: new package for v5.7
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
X-List-Received-Date: Mon, 15 Jul 2013 17:02:09 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2013 17:31, Phil Blundell <pb@pbcl.net> wrote:
> Didn't Saul have some patches to enable/disable PIE globally through
> an .inc file of some sort?  I'm not sure that having random recipes
> turning it on haphazardly is all that desirable.

bluez for some reason has a configure flag for it, but yes, Saul's
security_flags does PIE and more.

Ross

