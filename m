Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1StNRd-0005vu-Es
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 20:33:25 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 23 Jul 2012 11:21:56 -0700
Received: by yhpp61 with SMTP id p61so5264418yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 11:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=3UgHhqoH44LcQMmuzbalg58UtZLOIeAB/NbFDRr2CvQ=;
	b=ksnh/Y8FQB3K/YQff9HHNnPPg/YCvG8Adt1mv0K2fZnxsFp5I4HAaL7Pv6Fv8GYKkV
	uoxkcbYHpobdjycpQ6lITn2jvpzhdVXAIntUXkx47yGStaLDg0smMqtSZ3WvKn+z2QSV
	SgVqW/IQRKV4kJCGol6oUWm+wTGf9hz6QEhAPM1L5X/75qrwrOSbG+Eit/s2vzjVEKKR
	WAS1OtVce1wtm7LoRCndmWk5N5WXXIiN6S71x3BjufTxsNLw/I8bQc6WJJ2vQtUqUCte
	C+WCA270df1xTdPpTGIerkNvdb8hZ45Mx6Zc/4IkIgKpVF1w24h/ctouU4MG6DQlGwBz
	3ISQ==
Received: by 10.50.191.163 with SMTP id gz3mr5820323igc.30.1343067715077; Mon,
	23 Jul 2012 11:21:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Mon, 23 Jul 2012 11:21:34 -0700 (PDT)
In-Reply-To: <20120720231539.GB3576@jama.jama.net>
References: <20120718133146.0C2B910217@opal>
	<20120720231539.GB3576@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jul 2012 19:21:34 +0100
Message-ID: <CAJTo0LYSPa3EiW6_6J9G9WLcYSh6x3C5tOB+eWcA=ZB3sHV1iA@mail.gmail.com>
To: martin.jansa@gmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlbwMQ8yO/8XZSviT+Yl/BU94M5OKADWBDwhcuZGGmh/yVErp3lw2+OnR+5ojH97Zd/DTOS
Subject: Re: [oe-commits] Ross Burton : webkit-gtk: remove no-parallel bodge
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
X-List-Received-Date: Mon, 23 Jul 2012 18:33:25 -0000
Content-Type: text/plain; charset=UTF-8

On 21 July 2012 00:15, Martin Jansa <martin.jansa@gmail.com> wrote:
> I've built it without PARALLEL_MAKE about 8 times already and this is
> first time it failed.. so the race condition is probably still there.

Disabling parallel makes really does make webkit take a long time to
build.  My preferred option at the moment is to make webkit-gtk depend
on make-native-replacement, and package 3.81.  I'd like to see that
dependency only kick in it we detect that the host has 3.82, but
that's pretty evil...

I've also pinged the bug-make mailing list about this problem as there
have been a bug and two patches in their bug tracker for two years now
with no comment.

Ross


