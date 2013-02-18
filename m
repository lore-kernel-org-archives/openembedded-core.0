Received: from mail-ia0-f174.google.com ([209.85.210.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7QoO-0008Sn-3l
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 14:31:19 +0100
Received: by mail-ia0-f174.google.com with SMTP id u20so979743iag.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 05:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=YMFKWSsDg9hehHqQFHyE1kpdTdYWvStlTHdm6sVBetg=;
	b=WsIfMqZTlgmYIUjPIkr3Lqwlo8hnAm7kRmbnYx2WM4Z7gfVQe9LQCDMhuszUqULc7x
	wwMrBmubObacIVSVGzHSyVf28qYRuJ6TraCmxQ53KeR5jfi990jkfDUXqeh8AxmnSPI9
	k5NTT/1JTdt8Sv3K0lnPBZ8WvOp5H7/1UdgGMmOyrJyMYCrjiFIOcvT7OAlbSE806VfZ
	DJvLErLRl0QDWv/PY2qX0JglEMT/78HgGLKi7/X/Qd9twVhBIMBVHc/BWnX0XSOJvBwy
	fbAgk4m3qh94NYq9eoN+tl6psyrffPmgNvlOjux/cj3ih4hBaLWE1tzs+QCLcqag3UAu
	Ebew==
X-Received: by 10.50.196.132 with SMTP id im4mr6582494igc.58.1361193307651;
	Mon, 18 Feb 2013 05:15:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Mon, 18 Feb 2013 05:14:47 -0800 (PST)
In-Reply-To: <CAJTo0LbOcDd5N6Be=sYrEEJdPoPtX5Cw+tnze=0DAhjp53M7hg@mail.gmail.com>
References: <20130218102402.GA15710@xiaoyu.lan>
	<CAJTo0LbOcDd5N6Be=sYrEEJdPoPtX5Cw+tnze=0DAhjp53M7hg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Feb 2013 13:14:47 +0000
Message-ID: <CAJTo0LZ5iGazfVfmu225HShMJ7AeLWSixtkkGmEwKU0XYMQhKA@mail.gmail.com>
To: Holger Hans Peter Freyther <holger@moiji-mobile.com>
X-Gm-Message-State: ALoCoQmMLQZBdca+AAD87wrItDd4TfzFmQ0RXpgGnFLIX0KMYs2sx0JEARxq3b6vX98yJnONrpjF
Cc: openembedded-core@lists.openembedded.org
Subject: Re: State of systemd from an integrator point of view
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
X-List-Received-Date: Mon, 18 Feb 2013 13:31:19 -0000
Content-Type: text/plain; charset=UTF-8

On 18 February 2013 13:10, Burton, Ross <ross.burton@intel.com> wrote:
>> * systemd's journald is not suitable for small devices. I think the default
>> should be to disable the journald and do not disable the busybox log
>> application in the systemd-compat units package. journald is dominated by
>> memory allocations and reading procfs over and over again.
>
> Agreed, although it would be good if the journal could be tuned.  IMHO
> it's technically great, just young.
>
> I wonder if we can split out the bulk of the journal binaries into a
> separate package, so by default it's disabled and then installing
> systemd-journal would enable it.

Just noticed that the disabling of syslog isn't working for me, it
disables syslog-busybox but there's a syslog symlink to it, which is
being started. :)

Ross


