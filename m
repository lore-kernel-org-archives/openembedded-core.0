Received: from mail-vb0-f51.google.com ([209.85.212.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UVfp7-0005N8-Sz
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 12:24:15 +0200
Received: by mail-vb0-f51.google.com with SMTP id x19so3500388vbf.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 03:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=gQsWtFUsWSFC4TqcuPcJAeXbnDVlmmyA5toZFO4oGyc=;
	b=NAnnT9ovFci5CIyJdYMkXfkx7p4XSRNCPT0MYXYsFm065EuX+U7Jve26Y/0cLBrBkC
	9j4ZovaOlXJL6VUWuJzTUF2gerF0FLyvyMDj0Oc8KtSxCGVtQcMfeELsemO1H7s2A9eD
	9DozmAlcCrueUoqBg3lIoYJbAf1ZMhE9racBQCQimDbSNHUN85DtJnFmiY2HU7DpsgSU
	+9SpWEIrVcPPAkSyYLjAvQ2W0BaxhxIaRAf3DYu/cPCoOq/f7M2FiGXepVxOjw/3yBN4
	VXiSuzpw4GkmF9sJfx8qAFTn0q80B+KIcKabea+webMQuD0/KNlEeRyf7wTWYiMc6xj1
	UcAA==
X-Received: by 10.220.146.82 with SMTP id g18mr20873957vcv.54.1366970788884;
	Fri, 26 Apr 2013 03:06:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 26 Apr 2013 03:06:07 -0700 (PDT)
In-Reply-To: <93E5E91C-DB0D-4057-82AE-4F3B97B7367F@dominion.thruhere.net>
References: <1366963623-13626-1-git-send-email-B40290@freescale.com>
	<517A49FE.5020702@communistcode.co.uk>
	<CAJTo0LZEd0ZDONxj5-_h6e13VYtDbQPTC+ipcj-=wzDavNUCHw@mail.gmail.com>
	<93E5E91C-DB0D-4057-82AE-4F3B97B7367F@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Apr 2013 11:06:07 +0100
Message-ID: <CAJTo0LbVtc9g_Ch-n_crSX+5c_n2xcjJKcgwsazXi=rAhxKZmA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn26/BCXbQY+LGmGJuvrmp3XTDwmsQclEb8WcaVXFyX/iNOaqgf9qEXrYdPPxbpuyTVkV7B
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: tist of connman do not support powerpc64
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
X-List-Received-Date: Fri, 26 Apr 2013 10:24:16 -0000
Content-Type: text/plain; charset=UTF-8

On 26 April 2013 10:46, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Making connman machine specific which means PRSERV will go insane.

Why would this cause prserv to go insane?  The only things build-time
depending on connman should be images so I don't see how it will cause
crazy rebuilds, so I must be missing something.

Ross


