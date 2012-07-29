Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SvaO6-0006qG-Ab
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 22:46:54 +0200
Received: by eekb57 with SMTP id b57so848798eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 13:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=QNldGTC+AOywt5VAQE1rDDDaILWp6bOvT5Kdzw1h3/w=;
	b=g7FP+6P17bKdC/DzceibdKNLwhtvg9583BfpLu/JLDqdIXg0szM7wbsVfyK+8cJQCn
	9WRe0ydYfpeAVIRzGEUPyqDvNEEGQlC/sX6ux9BR74+ZjIWXccZkHeZnctE2cwhXm46P
	pQvRbkIbOQWO7nCMP7nWnVsXh8JsYg60KpsWdn4OHxmIRhBRp04uyAXlIqImv0EH+u4i
	KjRR6G8O6rcSGnkJrFwrFGz5CXkJpnoa0jyo2kHsYifbav9jjWOHlv5fsYGUY1f74Zm2
	WLDHPlXwLnYoPYCyW6QsjotKKzCCcMEUNaz9l2g9DyxLZLaXHNMmynFQCDW7Hg9GKRPj
	RJFQ==
Received: by 10.14.194.198 with SMTP id m46mr1962733een.13.1343594119618; Sun,
	29 Jul 2012 13:35:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Sun, 29 Jul 2012 13:34:49 -0700 (PDT)
In-Reply-To: <CAMKF1srV+21Gm_rTCuaGdJuC3aLjYwwQtVm3sXQWpGA2CwEo9w@mail.gmail.com>
References: <1343328564-3644-1-git-send-email-sgw@linux.intel.com>
	<1343329086.4470.56.camel@x121e.pbcl.net>
	<CAMKF1so+OJTjN+fRP8DJK2zCNKUyTFYJ==zUMkRm1+-6FkYCvg@mail.gmail.com>
	<1343335085.9574.32.camel@ted>
	<1343335989.4470.75.camel@x121e.pbcl.net>
	<CAMKF1srcDNx6cL42Lu9vyig8nHB14xp2+fapoCxd4kTh9dVGCw@mail.gmail.com>
	<5011BAF4.7090301@windriver.com>
	<CAMKF1srV+21Gm_rTCuaGdJuC3aLjYwwQtVm3sXQWpGA2CwEo9w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Jul 2012 13:34:49 -0700
Message-ID: <CAMKF1sphKEz+moFWq0oQ8-D5VkUDnfPvbH7LP9Rwu863MmPDzg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: Let pn be eglibc for eglibc-locale
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
X-List-Received-Date: Sun, 29 Jul 2012 20:46:54 -0000
Content-Type: text/plain; charset=UTF-8

>
>
> After RPs fix and Paul's root file system rework I am still seeing
>
> temp/run.do_rootfs.25593: 932: local: locale-base-en-gb: bad variable name
>

OK I think my fault is that I am dash'ing and not bash'ing and
meta/classes/package_rpm.bbclass is full of bashism


