Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 51FF26041E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 05:24:46 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id s9so5949910iec.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 22:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=IIjxT6nh8/s/d6YaGy3+NryIVcg9ZJn6qDF0F8DG08A=;
	b=MV9gvW5qfIgjyAHxQ36MGKiDAr0+vUwJo21YG3ZoJn893tm4W+vZEyovBy/Hbgahtz
	TpMSZ0EV2sWuDFcXfQXaK0WFpviu33NUHW3ZLZmj0HDNYx/f7kIxwONLbLb6pSrtBFL9
	HE3x0aFUIx9j86guX2PrZEStewjJQsoTt+4aTEmkvWR3PjB/aDTvSl3ytBaEBhoyrAdz
	Vo8C0woX+mBwfr28Q9q51ZnoVErL/DqHNhJGzfcTbzcmh98qd6aC25cm7F7wHoTC4aBx
	6IZDU2s4ribNFdmFepw64lnPk4r+u4z2imvvjqkhFqlZVolQdU1s10cRD1+1N8NAXmI4
	d7tA==
X-Received: by 10.50.70.101 with SMTP id l5mr3984305igu.104.1371446687470;
	Sun, 16 Jun 2013 22:24:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.4.168 with HTTP; Sun, 16 Jun 2013 22:24:17 -0700 (PDT)
In-Reply-To: <1371428523-21377-1-git-send-email-paul@paulbarker.me.uk>
References: <1371428523-21377-1-git-send-email-paul@paulbarker.me.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Jun 2013 22:24:17 -0700
Message-ID: <CAMKF1sqnW_GsAX5paA2j7GeWQi7XbixidBtvSSQabH7DEHqUqQ@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] opkg: fix header installation for libopkg
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
X-List-Received-Date: Mon, 17 Jun 2013 05:24:46 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 16, 2013 at 5:22 PM, Paul Barker <paul@paulbarker.me.uk> wrote:
> When opkg is built outside the source directory, libopkg headers aren't all
> installed as the search path for headers only includes the directory that make
> is being ran in, not the source directory. So we fix this by adding
> $(srcdir)/*.h to the list of header files to install.

do we need to export all headers like that or just the ones that
contain interfaces e.g. opkg.h

