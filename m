Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1RqA85-0003wA-GA
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 22:11:41 +0100
Received: by qcha6 with SMTP id a6so1018053qch.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 13:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=6zwaAkZ+R6CrNe44g7ITghjgL6o3Gl1ia+g+1vnSNe8=;
	b=Ja1g4zqqIE5HKqTKOziSLrsUMv7Zwcm+v6DrNhPsupQDQw1i2T96AKIZr1sibsrYUK
	sxCUgoAeClU+EGLS3w3K3dcSeUjlvIO5CxiqoOz0uvnTV7nT+wPbri61UhgDD2e2RK/r
	b7o+4Eh3UdpXW5UWdo1BrbipaRPqx/qC/fskE=
Received: by 10.229.77.78 with SMTP id f14mr4329856qck.67.1327525434114;
	Wed, 25 Jan 2012 13:03:54 -0800 (PST)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id eb4sm3971688qab.4.2012.01.25.13.03.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 13:03:53 -0800 (PST)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Wed, 25 Jan 2012 16:04:00 -0500
From: Marc Ferland <ferlandm@sonatest.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1327519635.git.sgw@linux.intel.com>
	<ae108b14ac3903401a784251e370aef987c99e25.1327519635.git.sgw@linux.intel.com>
	<1327523312.2716.26.camel@x121e.pbcl.net>
Date: Wed, 25 Jan 2012 16:04:00 -0500
In-Reply-To: <1327523312.2716.26.camel@x121e.pbcl.net> (Phil Blundell's
	message of "Wed, 25 Jan 2012 20:28:32 +0000")
Message-ID: <8762fzo5of.fsf@sonatest.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] pm-utils: Add grep to RDEPENDS to avoid command failures.
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
X-List-Received-Date: Wed, 25 Jan 2012 21:11:41 -0000
Content-Type: text/plain; charset=us-ascii

Phil Blundell <philb@gnu.org> writes:

> On Wed, 2012-01-25 at 11:29 -0800, Saul Wold wrote:
>> +RDEPENDS = "grep"
>
> Don't you get a QA error for that?
>

I didn't see any QA warnings when building with yocto (edison
branch). I'll resend the patch with some corrections.

Here's bitbake output on my machine (with RDEPENDS = "grep"):

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 630 of 703 (ID: 4, /home/marc/yocto/poky/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb, do_fetch)
NOTE: package pm-utils-1.4.1-r1: task do_fetch: Started
NOTE: package pm-utils-1.4.1-r1: task do_fetch: Succeeded
NOTE: Running task 693 of 703 (ID: 0, /home/marc/yocto/poky/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb, do_unpack)
NOTE: package pm-utils-1.4.1-r1: task do_unpack: Started
NOTE: package pm-utils-1.4.1-r1: task do_unpack: Succeeded
NOTE: Running task 694 of 703 (ID: 1, /home/marc/yocto/poky/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb, do_patch)
NOTE: package pm-utils-1.4.1-r1: task do_patch: Started
NOTE: package pm-utils-1.4.1-r1: task do_patch: Succeeded
NOTE: Running task 695 of 703 (ID: 6, /home/marc/yocto/poky/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb, do_configure)
NOTE: Running task 696 of 703 (ID: 10, /home/marc/yocto/poky/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb, do_populate_lic)
NOTE: package pm-utils-1.4.1-r1: task do_configure: Started
NOTE: package pm-utils-1.4.1-r1: task do_populate_lic: Started
NOTE: package pm-utils-1.4.1-r1: task do_populate_lic: Succeeded
NOTE: package pm-utils-1.4.1-r1: task do_configure: Succeeded
NOTE: Running task 697 of 703 (ID: 7, /home/marc/yocto/poky/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb, do_compile)
NOTE: package pm-utils-1.4.1-r1: task do_compile: Started
NOTE: package pm-utils-1.4.1-r1: task do_compile: Succeeded
NOTE: Running task 698 of 703 (ID: 2, /home/marc/yocto/poky/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb, do_install)
NOTE: package pm-utils-1.4.1-r1: task do_install: Started
NOTE: package pm-utils-1.4.1-r1: task do_install: Succeeded
NOTE: Running task 699 of 703 (ID: 9, /home/marc/yocto/poky/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb, do_package)
NOTE: Running task 700 of 703 (ID: 3, /home/marc/yocto/poky/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb, do_populate_sysroot)
NOTE: package pm-utils-1.4.1-r1: task do_populate_sysroot: Started
NOTE: package pm-utils-1.4.1-r1: task do_package: Started
NOTE: package pm-utils-1.4.1-r1: task do_populate_sysroot: Succeeded
NOTE: package pm-utils-1.4.1-r1: task do_package: Succeeded
NOTE: Running task 701 of 703 (ID: 11, /home/marc/yocto/poky/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb, do_package_write_rpm)
NOTE: package pm-utils-1.4.1-r1: task do_package_write_rpm: Started
NOTE: package pm-utils-1.4.1-r1: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 702 of 703 (ID: 8, /home/marc/yocto/poky/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb, do_package_write)
NOTE: Running noexec task 703 of 703 (ID: 5, /home/marc/yocto/poky/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb, do_build)
NOTE: Tasks Summary: Attempted 703 tasks of which 691 didn't need to be
rerun and 0 failed.

Marc


