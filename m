Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SeRnO-0008Vx-QF
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 16:10:10 +0200
Received: by eaal1 with SMTP id l1so2381487eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 06:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=3FfciL0tC6hlp5wvhZ5SCrXgtzMNqLflmyNbTKReVkw=;
	b=LTsxgL76icSYR9Sjxs9MGBYz126U8tpOKW8+kfe7HiIBAWLva3ZT9ErV+K+UE3mB3j
	pJ3PqJemobadXHDv7bT3nxRG+5fE2l0ZR7EkosAdLbonbHMUCqroLgILNaVKTcSiypXe
	XEz+TrXUKCvt3XU8bjAhj6PmpNaN92wrTTW1+KdrJYLnnd5If9tFZjT3rWku3tKLCO6l
	bjSNTVfnVR+ds92GKHDYFvYF+Jqep/wqLfSADjqptuMJmL1UPrOPvYrqPA7r/fIcnv6V
	Bl/fYI09kQYRTxVQxydrj3pIb9BXdYU3VxiEem0B4pmEbKZIO9LuQhwuLtibZnvcUit5
	YPuw==
Received: by 10.14.94.201 with SMTP id n49mr6890589eef.158.1339509575344; Tue,
	12 Jun 2012 06:59:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Tue, 12 Jun 2012 06:59:05 -0700 (PDT)
In-Reply-To: <1339487948-30612-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1339487948-30612-1-git-send-email-bogdan.a.marinescu@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jun 2012 06:59:05 -0700
Message-ID: <CAMKF1so7Y_ccRi_RcfjRzzbska1WRbY7N8w=VuN=aFp-U5oYSw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] strace: update to 4.7
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
X-List-Received-Date: Tue, 12 Jun 2012 14:10:10 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 12, 2012 at 12:59 AM, Bogdan Marinescu
<bogdan.a.marinescu@intel.com> wrote:
> new version doesn't seem to use sigmask anymore.

You have to build it on uclibc to see if you can drop this patch or not.


