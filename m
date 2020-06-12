Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14707.1591945900654213251
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 00:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0B20240C37;
	Fri, 12 Jun 2020 07:11:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ilR805UZlgQZ; Fri, 12 Jun 2020 07:11:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7D1AE40AB5;
	Fri, 12 Jun 2020 07:11:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CCDB7173217; Fri, 12 Jun 2020 03:11:35 -0400 (EDT)
Date: Fri, 12 Jun 2020 03:11:35 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Pankaj Vinadrao Joshi <pankaj.vj@exaleapsemi.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Error while building image for 5.4.y on RPI4
Message-ID: <20200612071135.GP17660@denix.org>
References: <Y4nb.1591945376060563369.5YNj@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <Y4nb.1591945376060563369.5YNj@lists.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I don't mean to be insensitive, but can this be sent to the proper mailing 
list, as there's no linux-raspberrypi in OE-Core. Mostly because this list is 
already high traffic and a bit of a structure would be appreciated. Thanks.

-- 
Denys


On Fri, Jun 12, 2020 at 12:02:56AM -0700, Pankaj  Vinadrao Joshi wrote:
> Hi,
> i am trying to build an image for RPI4 for 5.4.y kernel but i am getting following error , i
> 
> Initialising tasks: 100% |###################################################################################################################################################################| Time: 0:00:04
> Sstate summary: Wanted 1094 Found 0 Missed 1094 Current 1154 (0% match, 51% complete)
> NOTE: Executing Tasks
> WARNING: libfm-extra-1.3.1-r0 do_fetch: Failed to fetch URL https://downloads.sourceforge.net/pcmanfm/libfm-1.3.1.tar.xz, attempting MIRRORS if available
> *WARNING: linux-raspberrypi-1_5.4.40+gitAUTOINC+97badb4bae-r0 do_fetch: Failed to fetch URL git://github.com/raspberrypi/linux.git;branch=rpi-5.4.y, attempting MIRRORS if available*
> *ERROR: linux-raspberrypi-1_5.4.40+gitAUTOINC+97badb4bae-r0 do_fetch: Fetcher failure: Unable to find revision 97badb4baeb8999263a9bc2fa85c3060ffff344b in branch rpi-5.4.y even from upstream*
> *ERROR: linux-raspberrypi-1_5.4.40+gitAUTOINC+97badb4bae-r0 do_fetch: Fetcher failure for URL: 'git://github.com/raspberrypi/linux.git;branch=rpi-5.4.y'. Unable to fetch URL from any source.*
> *ERROR: Logfile of failure stored in: /home/pankaj/Oe-Raspberrypi4/tmp-glibc/work/raspberrypi4-oe-linux-gnueabi/linux-raspberrypi/1_5.4.40+gitAUTOINC+97badb4bae-r0/temp/log.do_fetch.10175*
> ERROR: Task (/home/pankaj/meta-raspberry/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bb:do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2294 tasks of which 1551 didn't need to be rerun and 1 failed.
> 
> This my linux-raspberrypi_5.4.bb file
> 
> LINUX_VERSION ?= "5.4.40"
> LINUX_RPI_BRANCH ?= "rpi-5.4.y"
> 
> SRCREV = "97badb4baeb8999263a9bc2fa85c3060ffff344b"
> 
> require linux-raspberrypi_5.4.inc
> 
> SRC_URI += "file://0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch \
> file://0001-Revert-selftests-bpf-Skip-perf-hw-events-test-if-the.patch \
> file://0002-Revert-selftests-bpf-Fix-perf_buffer-test-on-systems.patch \
> file://0001-selftest-bpf-Use-CHECK-macro-instead-of-RET_IF.patch \
> file://powersave.cfg \
> "
> 
> pankaj@exaleap-Inspiron-3584:~/Oe-Raspberrypi4$ bitbake -e | grep ^PREFERRED_VERSION_linux-raspberrypi
> PREFERRED_VERSION_linux-raspberrypi="5.4.%"
> 
> am i missing anything,why i am getting this error can someone help??

> 

