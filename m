Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB1678866
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 16:05:32 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id q84so10275056iod.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 09:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6ysHtVw5krZCNUW+Q0SypgVwuTOhcq/XvlAxvLNGeA4=;
	b=yJnNIOGMAy6L86UThVMi0LCtYL3fOWDrp29DTIFdK+yRTyi/zP2swgI4oyS0yL0JAV
	zJ4Ioa7uEbcpy6PSJ6q/RluzEo/P7kTAvJ2Cq9Eppf8iTT0NmYgi24aq5plFZSrguf+y
	paHkCXjzRq74kkZk0lgbyhSYGGvUU3GCVBUOq5Ja5RmoHRoPet7xiCTk0Vj3qcjgDqp6
	RC1+Y2yP3GdEp9vxhGg/mNunDT3d0jEgvXGzZTKf0ZCjE53S5hEzeqUWEWMDfVABsuwH
	A/B67VyJVEK1epcgpVvVFSYE6jN9NDQ0lbCEBGssVS4PqfYKs0Gl+GN6ZTGRTsgVWLit
	vudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6ysHtVw5krZCNUW+Q0SypgVwuTOhcq/XvlAxvLNGeA4=;
	b=hZ4goPI2tgHZHXFQ/SDWryLhndJ0Qt8Et5EYBo+2ZnAini8FkyqsQrug76wn5kmkSx
	Rf/HPhZ0+PA1uf09jky/U2r5gQW6Nux8loum9rMPAImxFEKXDFvvlnwSXJY0xh+o4Hsd
	dtpgwWNiWvSiJbcOMXY7w3MKaaOwT/KAwnsw/lZrOQVM7hFL5uEwF+kOIxIPWluql+cn
	vkO68hZF4Ay2NaAbBujwdXbEpg1NOJfGRbHJoO+UmutPWBu3ZDZfZuwGE0uZjPa3MwUz
	b+eGjs4W3JVP2xP9Pi6vzvN9ZnUu4lF2JreNDXB9jclE0RRF2oJy6XNMORk7yEwd5E4T
	LS9g==
X-Gm-Message-State: AElRT7GXVFjc4g6lpATYvHu8UNpUy0+xmi32VDigqOl7VaUyWGqbg1FG
	/ZjLKiatInllC4OLI4coMgzgXKGS2dQM/It2vYCI0lOa
X-Google-Smtp-Source: AIpwx4+a5ekH3nVrMeTANiojMFtrr94cf/CBd+5ArgqR2n6PcaRpc7nUUWQ+BOOqC1sFdC6LpJOS98s9ZmydUf110YE=
X-Received: by 10.107.201.135 with SMTP id z129mr7585539iof.20.1521821134196; 
	Fri, 23 Mar 2018 09:05:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Fri, 23 Mar 2018 09:05:13 -0700 (PDT)
In-Reply-To: <lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Mar 2018 16:05:13 +0000
Message-ID: <CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2018 16:05:33 -0000
Content-Type: text/plain; charset="UTF-8"

> Enrico Scholz
> <enrico.scholz-wttK6gPy29v+Hn7q9Vec/7NAH6kLmebB@public.gmane.org>
> writes:
>
>> in some packages (e.g. ncurses or glibc) I get package-qa warnings due
>> to host user contamination; e.g.
>
> can be reproduced by
>
> ---
> LICENSE = "closed"
>
> do_compile() {
>         echo foo > bar
> }
>
> do_install() {
>         install -D -p -m 0644 bar ${D}/bin/bar
>         install -d -m 0755 ${D}/usr/bin
>         mv ${D}/bin/bar ${D}/usr/bin/bar
>         ln -s /usr/bin/bar ${D}/bin/bar
> }
>
> FILES_${PN} = "/bin/* /usr/bin/*"
> ---
>
> WARNING: foo-1.0-r0 do_package_qa: QA Issue: foo: /foo/usr/bin/bar is owned by uid 505, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

Works for me: install correctly changes owner to root:root as it should.

$ dpkg -c foo_1.0-r0_corei7-64.ipk
drwxrwxrwx root/root         0 2018-03-23 16:02 ./
drwxr-xr-x root/root         0 2018-03-23 16:02 ./bin/
lrwxrwxrwx root/root         0 2018-03-23 16:02 ./bin/bar -> /usr/bin/bar
drwxr-xr-x root/root         0 2018-03-23 16:02 ./usr/
drwxr-xr-x root/root         0 2018-03-23 16:02 ./usr/bin/
-rw-r--r-- root/root         4 2018-03-23 16:02 ./usr/bin/bar

Obviously the install/mv pair is pointless, and it's not conventional
to pass -p to preserve timestamps, but none of that should matter.

Ross

