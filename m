Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sy6Q4-0003c3-DN
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 21:23:20 +0200
Received: by eaad12 with SMTP id d12so639955eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=7goTWtTXIFX3QRjj7TNRDmw/6aJGM508RLzDh8Chcbk=;
	b=N/KdghM/ozY4ubBDfDW50gtW6r+jHVDhB8QaB7fMtqQX6+mBsqxnILZbdjIcAtrRb0
	SZ6k4/07DUMJwhzM1w90wHGwgyZqkk2KwUSB9zTVpRatw7LHfPR9x9hssxArLdjRvUMK
	/RLeCyE7JR5uLtUJIoSspO/vAwpSJI1n/gVvRTHWd0jWP15a+BcpViXosxGfEwTIfA/a
	euR5ysGKWLfR+elPshio8GhDro9HTZnny4dFFNuz3cug9RyPo5kFZgilHz1prH/RXDK9
	V7ssdO+jzS3joCssv+JUu6BfYUJQr0wFWCPNOlXZ81oaFK18fy4B8BYWzUJUr7wMWFu9
	GmqQ==
Received: by 10.14.219.198 with SMTP id m46mr9887873eep.18.1344193896971; Sun,
	05 Aug 2012 12:11:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Sun, 5 Aug 2012 12:11:06 -0700 (PDT)
In-Reply-To: <A35353F6-FFAE-481C-9C36-F38CE110284F@dominion.thruhere.net>
References: <1343942157-15997-1-git-send-email-yao.zhao@windriver.com>
	<501D7090.2040500@gmail.com>
	<EB05DE7F-A81E-4CF6-BD49-F93604EA1EDF@dominion.thruhere.net>
	<501E9EF3.2020208@gmail.com>
	<A35353F6-FFAE-481C-9C36-F38CE110284F@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Aug 2012 12:11:06 -0700
Message-ID: <CAMKF1sq_mpVRj+EH5cEdXRhy6h=Dy32u5o_Q8h3qXTzEJ208fw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer: gst-ffmpeg: fix build issues for libav
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2012 19:23:20 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 5, 2012 at 10:31 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> It's been in meta-oe for ages. I guess we should move gst-ffmpeg (which is called gst-libav nowadays) into meta-multimedia together with libav.

+1


