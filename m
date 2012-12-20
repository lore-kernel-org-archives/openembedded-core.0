Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlhWz-0003n7-RT
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 15:55:33 +0100
Received: from mail-qa0-f70.google.com ([209.85.216.70])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 06:40:41 -0800
Received: by mail-qa0-f70.google.com with SMTP id hg5so6174573qab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 06:40:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=iF9aQoq3/x21B7fhremYg7C9jESrjX5ICpsDyUFgPq8=;
	b=S8ayJdElR3bkqhougjRhvV4lcHLfpMnSri7Hs5irPFETlyULgTBFDviKq2vOUJ7Ptd
	5m0ojnW6rKJT6DVQxELlyGjFEF5YqW0tWlxuHgh2rJ3NIYDhqlHnL41vuXSjxXdqgXYy
	xPc3AUYLOrot9r+caQHt/r0lGE49UBAb7JMuc3jJHRt5ymokxlklJEyQFwc/TsSqM7b7
	OlqHkmqKWp1LBpviU70dfmw7wKhHUEkYIB+78+JvINudEhC6b2noVg3UN26N35gKvF44
	QYfHaIQ2R/KpTG+5Aqj6tdzj0inC25l/miiaW4I/Vro2pCv1ildJmfkgxFPF+kJbBv/0
	6JdA==
X-Received: by 10.58.221.130 with SMTP id qe2mr15339246vec.14.1356014440629;
	Thu, 20 Dec 2012 06:40:40 -0800 (PST)
Received: by 10.58.221.130 with SMTP id qe2mr15339243vec.14.1356014440575;
	Thu, 20 Dec 2012 06:40:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Thu, 20 Dec 2012 06:40:20 -0800 (PST)
In-Reply-To: <1356009340-15874-4-git-send-email-laurentiu.palcu@intel.com>
References: <1356009340-15874-1-git-send-email-laurentiu.palcu@intel.com>
	<1356009340-15874-4-git-send-email-laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2012 14:40:20 +0000
Message-ID: <CAJTo0LaRT2du=YsOddTV14tJgL7+E8mSbO8jAkrzFwq7Jx9seQ@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQlryZxwnZ8smhcgSu6038/XISTFQ8RtWnDU6B5a9BA0YDZRTaK+D/qLgndWSGcGljMBTBvN4KCj7PeUsRIyQtuR9uvcRqBInSG9vsLeF2pyOg3GW+pSLdmqWXlyHRmCPs1T2jlZeaUpI/xt3hLY7N9N+KU6TVlYQLu4OhmsS76LjQuyfpGe1sUGnX85YDUO+Dp61FgK
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/3] matchbox-keyboard: use the gtk-immodules-cache.bbclass
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
X-List-Received-Date: Thu, 20 Dec 2012 14:55:38 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 13:15, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Since the class was already present, use it. Also, this will have the
> postinstalls run on host, at do_rootfs time.

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross


