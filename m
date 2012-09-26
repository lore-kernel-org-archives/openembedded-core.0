Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TGsyg-0003LJ-4g
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 16:52:42 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 26 Sep 2012 07:39:35 -0700
Received: by oagh1 with SMTP id h1so63594oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 07:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=IfhvXG28C+fx432Bms9eDvsOTG/b6uo8o7cLeJFknOU=;
	b=IPANMYnfCPVILM0qV6lsV5p+9c0fBH78s2OAlPMTCkbU8neIrpSQ14wbmoj7L6QmNY
	8wCJE3uesihH1k9TKEOw+cZgPHW64wYEgF5qM7JLCosGLvBCiZasWmUIHyQtwDwHMwQm
	HMvQZcb2ttQnvxeb0YGHchOct9VnwNH783JOheKg3K22h/RhC2l9M7n1EV/scE3OXpnJ
	l7vfNDV5PfD0FR7Gl11NOijkRHwc08GVO0cE9ScZmlB0z1Dc2KqC3UlK1feSd4h+h71R
	O+ByTu4rt+yIhPaxrNkCtAgGzVa9q+3qWcQLHEq3f/0A6eWm0PlFcuZ+Lx60YTcq6/xM
	RCbg==
Received: by 10.60.12.106 with SMTP id x10mr546386oeb.103.1348670389524; Wed,
	26 Sep 2012 07:39:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 26 Sep 2012 07:39:29 -0700 (PDT)
In-Reply-To: <1348669724.31293.117.camel@phil-desktop>
References: <1348663741.31293.114.camel@phil-desktop>
	<CAJTo0La28g_t84Ku+LbLKLVfwyRL-KuCpq3GuYWxLbnu4-NYkg@mail.gmail.com>
	<1348669724.31293.117.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Sep 2012 15:39:29 +0100
Message-ID: <CAJTo0LZonQKrz+cR_qAE8p8qhaL17o9fmqOyw5+1fzuFnO_e0A@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-Gm-Message-State: ALoCoQk2p+0N8Qakse29/It1L0VUpmxMBhStgxGlpDIvsaGgX4ofsBBtf0gv/F7KgUCjPaCtL/ns
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] glib-2.0: Update to 2.34.0
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
X-List-Received-Date: Wed, 26 Sep 2012 14:52:42 -0000
Content-Type: text/plain; charset=UTF-8

On 26 September 2012 15:28, Phil Blundell <philb@gnu.org> wrote:
> Which patches were you thinking of specifically?  I don't think there
> are many that we apply which are actually related to cross-compiling.

no-libelf and no-dbus.

Looking at the patches we are carrying, it's quite comic.  Two patches
which are carried with no understanding of why...

Ross


