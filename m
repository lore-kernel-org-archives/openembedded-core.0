Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id A52586DC16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 13:03:34 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id kq14so1870665pab.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 05:03:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:content-type;
	bh=fYzoWm83DOP5iAQgNAy10YY7uOl92hZruXN2LkRgvLk=;
	b=fSB/du8PuKhQnIP97O1eaX7nfYISdz+xIYgiAflY8vJzFl5GNNr0i/+BvecLB30u+0
	2AWR+v1O4rJwXWBJjIjN4DO3W7ZdZWT8ftGwsst1PpUyM5Nt9kjjHSAK4DxtPdu6WKNl
	obJ0wyGXbdnpIhNaNxd8NYJHknJamppFESiLfNyztSsX0CG46Zpnz+/rbTTHyNVwS92z
	pO5DvJfQDlNncZfgyTOayePZGd0W9nOPVyO2xkGnTJLUc6518Rmfb0G5hRCBmFUZryXt
	etPhO4vfS8KgdL9fuIYOH+JTdEjbIfWz8v/ntq/w9w5hFqGcRTX66GgfLACahGCyewo0
	1Ejw==
X-Gm-Message-State: ALoCoQmob2tAgasekhvTPGtsVfhwApnZ3xpi5VmdsxoDSlo9HLDPpvGw5MgI0z9Ukc5IAKtI2Ra2
MIME-Version: 1.0
X-Received: by 10.68.0.99 with SMTP id 3mr1948656pbd.68.1392901415277; Thu, 20
	Feb 2014 05:03:35 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.21.228 with HTTP; Thu, 20 Feb 2014 05:03:35 -0800 (PST)
Date: Thu, 20 Feb 2014 13:03:35 +0000
X-Google-Sender-Auth: GAPezB2XflWeA6wsBjp4ZZG73Ss
Message-ID: <CAOMwXhP68XUd-6ZSa3+t_OBMgr=mim0_9-yz0q1sNf1i90hgvA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Removal of poky-feed-config-opkg_1.0.bb
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
X-List-Received-Date: Thu, 20 Feb 2014 13:03:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I had a quick discussion on IRC with Ross. Is there a reason against
removing it?

../meta/recipes-devtools/opkg/opkg-config-base_1.0.bb seems to be
already doing the job. Is there any compatibility to be kept?

Cheers, L.

