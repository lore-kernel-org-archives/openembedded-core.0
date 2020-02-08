Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id CB91160F49
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 13:56:01 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id z3so2159583wru.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 05:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=UQE5UYTwMJgnCVBATgL8Rao7LXA8gUwnxkV2qVx3JOc=;
	b=EEWMGP8vWiD20lJAYOKa/w2VJMNRUktCgibJnUnknb717I/c0feKcsbiKtq/M26QvD
	+WsrETQ0snkX18iKg1TSdltIU+Hq7VQ+wP94iCKp37pGAx+3dsYJX/HccR2LCpCsYkYV
	YL7jH2dJFRsslnihDT2f53sOUvPpc+GpNTmP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=UQE5UYTwMJgnCVBATgL8Rao7LXA8gUwnxkV2qVx3JOc=;
	b=WrIc0hmJYjdwW1Tz7iacY3cgg12CyC57/VvIRpaRl2GlDKtWFx2ESpfl3mhrKmG+t9
	LziPy449nYWOoNJdXs2k6RhaNSXamkt8BE6g1aMFkB4rRVbsGozF6fOmB3SpWTUVJMMk
	06WujGw/YFdGLQEJizCyQuCXek+z7tD9r9YnbPuODwDbGIgDpF/2HUDjfIMQ/MIuq4QH
	Hrc7n4aVBKH7dWCLY9ucVYF74V8PsP5ctXu6IjP7420HsmMU3a5Eufk+LQ5DHjA7hyQc
	hzmp2x0+Iq1CmgAi4wwUvBF2oORQ31a2Fpb0/bgqd6PwCRMDJvbNhy89EIdBNecB7Tkf
	8BzA==
X-Gm-Message-State: APjAAAWBq6lTeAO9/y0utLBcK1/2+8AHOxeZelnp+hO6tY1Cq9OLUABC
	paSX1gLu9lc8fbLxkSJ3DmjiCnUZW1o=
X-Google-Smtp-Source: APXvYqymMx6UMEUsHp1W6ohP276mKUufXdUqj4opvibYE3zossJK8Ex8uVjzae2zX0LtJ8dqil2OBg==
X-Received: by 2002:adf:e692:: with SMTP id r18mr5569388wrm.413.1581170162042; 
	Sat, 08 Feb 2020 05:56:02 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s22sm7189361wmh.4.2020.02.08.05.56.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 08 Feb 2020 05:56:01 -0800 (PST)
Message-ID: <6207024170e32fe8ef7262433124efc64d614132.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 08 Feb 2020 13:56:00 +0000
In-Reply-To: <836aaccb82a2781c00e26249ab896d7ef0e25a27.camel@linuxfoundation.org>
References: <836aaccb82a2781c00e26249ab896d7ef0e25a27.camel@linuxfoundation.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: Reproducible Build Status (and implications for zeus 3.0.2)
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
X-List-Received-Date: Sat, 08 Feb 2020 13:56:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-07 at 14:23 +0000, Richard Purdie wrote:
> I think we're now down to:
> 
> sudo path issues (Ross is poking)
> ncurses-doc issue (assigned to JPEW)
> perl host compiler flags issue 
> sysvinit missing group problem (assigned to Mingli Yu at present)

We're now down to:

A gstreamer issue with libcap:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13786

and some potential perl host compiler flags leaking in
(no bug for that, we've not seen it in the last build and I'm not 100%
sure if we fixed it or not yet)

I've queued up the recent fixes into zeus-next as I think they're
stable material.

I'm seriously considering letting 3.0.2 wait a little to include those
fixes in an rc2 and abandon rc1. If we do that, we may want to get the
bitbake hashequiv+multiconfig fixes in master-next sorted too.

Cheers,

Richard




