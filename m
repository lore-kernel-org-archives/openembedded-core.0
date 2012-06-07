Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sce9j-0006cq-Ib
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 16:57:47 +0200
Received: from mail-qc0-f172.google.com ([209.85.216.172])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 07 Jun 2012 07:47:17 -0700
Received: by qcsq13 with SMTP id q13so455837qcs.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2012 07:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=q/j1M03yYIpGjZ0O0QZkifIHHROEFwvTqZuU6gWbKDU=;
	b=LK3BCgsiAjObwIeBQquDbEGpnqjTSCxzpE85fvBraw5f4rQwBtihZWN41q+lAiiOmO
	a7GvFs618tlWzjf9mXVz2qpGRcUGwrTWt6vF8dumwmHhhjh3TeP0HOsM+jpFmsxpoHxP
	3RP4KlJ9VwxlThOadxrOpT1W9ZSvLBfxv1dH5gUhauoKpxSrjTVSnJCvGMmXUZ37Js9O
	QFTMsnn+5ALgzty1/OWCznjO5O8rSGcqAsOEuixTZaXPm1L1P3b3Y+BXRGIANzReB4oL
	1EAjcyx3/8RVPhGyxzWZYzhXchEPIKHwGNzQ5LXDKjbv+U5pvIwl3NmV301sv+IC/1Ef
	O+Ig==
Received: by 10.224.201.136 with SMTP id fa8mr3053209qab.20.1339080435865;
	Thu, 07 Jun 2012 07:47:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.53.212 with HTTP; Thu, 7 Jun 2012 07:46:54 -0700 (PDT)
In-Reply-To: <20120607143221.GG3140@jama.jama.net>
References: <cover.1339078729.git.ross.burton@intel.com>
	<5afc9f367cc3224e82bbe59fe9bda14f504b45c0.1339078729.git.ross.burton@intel.com>
	<20120607143221.GG3140@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Jun 2012 15:46:54 +0100
Message-ID: <CAJTo0LaiApvc0oD4VKHPcsoWtEEBcSyPcza9sr=wOs78DNxPLg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm59YjfenVqZSotFNEgoN8rQhF8UMZytmBKL8bkE4rz7WyeJ7MJ/2opfKe33YXbdEAmjYOB
Subject: Re: [PATCH 1/3] connman: respect the 3g feature and enable/disable ofono support
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
X-List-Received-Date: Thu, 07 Jun 2012 14:57:47 -0000
Content-Type: text/plain; charset=UTF-8

On 7 June 2012 15:32, Martin Jansa <martin.jansa@gmail.com> wrote:
> Why not use PACKAGECONFIG for all those?

Because this is the first time I've encountered it.  :)  Is there any
documentation on it, or a comprehensive example?

Ross


