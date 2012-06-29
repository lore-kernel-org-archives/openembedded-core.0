Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkP6Z-0002cD-M5
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 02:30:35 +0200
Received: by wgbds1 with SMTP id ds1so586249wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 17:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=o2doaY9N/y51SRc8YGmO9UKfvw6rDqQIx2r+eOZ43wo=;
	b=f1FawPFPbM3oGzaCs7yelAnq3edKSwJZHs1X7/EaHTLe9vXwnHldKYGqdz0a3CZgMT
	aqxWAzLqYZ3jL0hCyZSLngKyIjYfmVG3GT9qw7lJpQ6JYoKItphYlTqreSpxpmx60CzE
	Gak06K3ZRJjUQGfUCpyVSg0UNp4o+CyHvmDOgZk+SHoESNOsGm7WIsszPQ+4Ww6hzhCO
	Y+/kKt1VhpXVEUuz/tUl9qM/x85FCaIvL6OpJ+Trwvrx/sYBN5lrVcqTPbgQpcr+miWk
	cxCUWXjHHMAxEwc6/YHCsbyWDmaPmNMofhdgs/+L9xChE6PWpU2ix3KvdAQc/9IgYzRh
	VLvA==
Received: by 10.216.220.89 with SMTP id n67mr2433985wep.73.1340929174140; Thu,
	28 Jun 2012 17:19:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.30.34 with HTTP; Thu, 28 Jun 2012 17:18:59 -0700 (PDT)
In-Reply-To: <4FECABED.9010401@windriver.com>
References: <4FECABED.9010401@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jun 2012 17:18:59 -0700
Message-ID: <CAMKF1srP2cs3GV0ZXZ06CDn6PLa2zAUbJ+MfyVaJNhGQvMrRzg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Slater, Joseph" <joe.slater@windriver.com>
Subject: Re: python-native and autotools
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
X-List-Received-Date: Fri, 29 Jun 2012 00:30:35 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 28, 2012 at 12:09 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> A solution might be to have autoconf and automake and python inherit a
> version of autotools that does not add a python-native dependency, say
> autotools-no-python, and then modify the "real" autotools class to
> add the python dependency.

why is python depending on autotools that seems wrong to me.


