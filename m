Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBhyM-0004US-HQ
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 10:06:58 +0200
Received: by eaad12 with SMTP id d12so592983eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 00:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sNyfkIxw+GdModYrIOuvldrNijtLqFcNWabl7mJgj3U=;
	b=RUTKjXqVV+AHyrEvbNT3u6zt8eMvU2wwD84zRwPRljfJXJIHJ6Hp/Aqn4JjFt+jJpz
	iSfQaXM4yt8Kijoj737ZSNFwC/bqOOohmux/5eKvIbl4l0kaic34cttuDtVG3wwZfbq8
	ve3C+AAjIkfmIoXg2QlsZHYF6QGw0Stdxrqgw7JJTCylIlzKc6IxNZCCoQtDAYnr0WmH
	VurHw2onyfWjp4bncKkAilC9sIyXBo5GEQMn4kVEsX9m6CkcSkvEe8Exuo+YQzVh4wJq
	YtBi809rateXBDTOvti+ddS3PJ4v0DZmXw6E94V0qEnuzK/3wS1moIvJ1vbIZTpxDqEj
	BaqA==
Received: by 10.14.204.72 with SMTP id g48mr29541183eeo.45.1347436466942; Wed,
	12 Sep 2012 00:54:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 12 Sep 2012 00:53:56 -0700 (PDT)
In-Reply-To: <1347431877.29443.95.camel@x121e.pbcl.net>
References: <1347429555-32159-1-git-send-email-raj.khem@gmail.com>
	<1347429555-32159-3-git-send-email-raj.khem@gmail.com>
	<1347431877.29443.95.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Sep 2012 00:53:56 -0700
Message-ID: <CAMKF1so6rNE5sDSASafjYRRx08U+bHDpSwQrrHA7KGa=HGYYKQ@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] uclibc: Revert systemd regressing patch from upsteam uclibc
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
X-List-Received-Date: Wed, 12 Sep 2012 08:06:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 11, 2012 at 11:37 PM, Phil Blundell <philb@gnu.org> wrote:
> Why are you changing SRCREV as well?

Well I forgot to mention is in commit about SRCREV bump. I have tested
the revert on top of the proposed SRCREV

I will send a V2 with more details in commit log


