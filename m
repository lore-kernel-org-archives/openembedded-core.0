Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TJLdO-0003CV-2I
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 11:52:54 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 03 Oct 2012 02:39:53 -0700
Received: by oagh1 with SMTP id h1so6805944oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 02:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=oIGqCFni89tIjbBlhf3kEp8V+VMSRcuRlmABml0GSd8=;
	b=kVpZt4NbPVQgDz3J8F6Ji/HvTdak5CYNy6qTMcWd9GDF9LhP1nn5p/KQorGCjHX3C0
	QCygU6tbANKyuTsyOr48+PGp39BwRCGjj79q8D5XkN+dD8KI5/CVUQ6+jo7NB+4cEk36
	bdZ7X4dfvfSiiooeXkOTVfZmUKsANmepw8NmR5YUWSAN8qR306j0ahA3FguI3c5y3Ohx
	AHbhIFAndNvir19ixpSovfCNg3R/PpJ+uJVoesoJi6QgEg5yAFUIQJkb4iovu64OnxLI
	1OMG5wsBvaR7v+fXKue6NxpE7Gwx0vQyF3LVmM++fQF7gMeImqvi094sNIGzxSE2m/33
	eoOw==
Received: by 10.182.174.100 with SMTP id br4mr1025516obc.62.1349257191979;
	Wed, 03 Oct 2012 02:39:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.70.6 with HTTP; Wed, 3 Oct 2012 02:39:31 -0700 (PDT)
In-Reply-To: <1349255253.18301.23.camel@ted>
References: <1349086731-2818-1-git-send-email-ross.burton@intel.com>
	<1349255253.18301.23.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Oct 2012 10:39:31 +0100
Message-ID: <CAJTo0LbGDt_dKSgL+Ms0M9QAB7d+nBVCuV0-WuNKuGDy-t19fQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQkr1q1zcpr3Id00FW1iC2/LwOSyYyNXqZhYd4YEL4W8CWJV766Gt9JLJAscHpwHfC4N0HLA
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xf86-video-intel: drop libxvmc dependency
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
X-List-Received-Date: Wed, 03 Oct 2012 09:52:54 -0000
Content-Type: text/plain; charset=UTF-8

On 3 October 2012 10:07, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2012-10-01 at 11:18 +0100, Ross Burton wrote:
>> xvmc is explicitly disabled, so remove the dependency.
>
> and also add some new dependencies. I'm left wondering if that was
> intentional?

No, that's fallout from cherry-picking.  I'll re-send.

Ross


