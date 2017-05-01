Return-Path: <andrei@gherzan.ro>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id CCD7371DED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 10:03:29 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id x188so69437789itb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 May 2017 03:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fA8p77R4eOVMCvnSTcfJ7nU3xXTY+z013uTl5NkiRuA=;
	b=rdALd8d6J55vAdQFDBSPEmuiupXMbmo2+ve6WycI7TWp9UdOFpBOhYXh2STbW+7JcP
	+xUcMF6p3Qu3UkWtui+hhND6GvdR5wlLO/FW+yXgtoxs4fXTpQSgGSdrzDpqquxsY8pm
	BRXYpfm79w8frQWgpuSy/DctWTm/8EGcxbPGMLsxqQRx/TGi+Rxs0goSc/hwJmN6hhh6
	V0EZ+HhmiY1qf0TVu/cqdn8Xv9WWatw1uiUkF2TR61ca5xN9e68w4J2GYejmhpcu0t0y
	y+YIVSzL4Ga7OPYRpqOBSm76nYxiUaMLlyNYXjmfvuqiuC5MHUXw5pFlx2IzLwQGrH8d
	I6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fA8p77R4eOVMCvnSTcfJ7nU3xXTY+z013uTl5NkiRuA=;
	b=Qx8Z7UsKxxfsQPR7+6dLq92rsn8ZTqCmXAZUwKlzI/6sVcUpp7ThE3CJPiAtlBdVeP
	2Mxd4CJyukoQfAp3Kpn1pX8BfWuvsaX0aJMgQYNrCcqStBToNKKt5CuLAYDv5wYMOgfs
	8FHr7bNTh+XSLs2WlLHA7T/2P6eaY3cRonMsMV9JJYm1nwADLcXoM2FEJMo1EGO77z0T
	KAPBk5CO0qNESI4RmaNk2O6F7gSTA7PcyxeeGTIrgai5yShJbIMyy4MhnJCD1EAHCMZ9
	ar8nB0QaExIAmkae62xkYsfUWBeg5ihyS4BhhMZtbAkrqIyAJcdhWc3zlZ6iDouk1vkd
	2RnQ==
X-Gm-Message-State: AN3rC/4iDCwxaowf3KMOkfa5LSOTq4CITRbawsB8eUS0A+oLtmIv+j1X
	l1kIoOdbv5Z9TqpqvPJB2HkZcHIjOw==
X-Received: by 10.36.66.67 with SMTP id i64mr4694589itb.22.1493633010739; Mon,
	01 May 2017 03:03:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.27.207 with HTTP; Mon, 1 May 2017 03:02:50 -0700 (PDT)
X-Originating-IP: [31.52.113.35]
In-Reply-To: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 1 May 2017 11:02:50 +0100
Message-ID: <CAK18fxHF1dPOAXSwFwtS0s_vaMo5--t4QS2dq8pBwbDPdFDmbw@mail.gmail.com>
To: Sean Hudson <sean_hudson@mentor.com>
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OpenEmbedded 2017 General Meeting
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
X-List-Received-Date: Mon, 01 May 2017 10:03:31 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 19, 2017 at 9:48 PM, Sean Hudson <sean_hudson@mentor.com> wrote:
> The board would like to hold a general meeting with all members.  Under
> the new by-laws of the OpenEmbedded organization, we can meet
> electronically.  This will also fulfill the requirement for an annual,
> general meeting.
>
> Planned Date/Time:
> Wednesday, May 3rd, at 8am US-CDT(UTC-06:00)/3pm CET(UTC+01:00)
>
> Wiki page with full details, including teleconference information here:
> http://www.openembedded.org/wiki/2017_General_Meeting

It seems like there is not Edit button for me to add my username to
the attendee list.

--
Andrei Gherzan

