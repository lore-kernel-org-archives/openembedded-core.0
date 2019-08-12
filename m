Return-Path: <nick83ola@gmail.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id ECFD46C4D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 13:38:52 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id z17so9880387ljz.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=LbqPPfU2O062uAOGzCIYUPfi+r8EGbWNq3CqceTxg1A=;
	b=AUhr4Kg2yyzlXJOsUEdqMPqFIl7qtRrGo5m+KnUFuaFFLIiVVAuVUBlW1lyHHyXxd3
	I0d1Z71LlMlp9IhHege0R9QxAfZyhPYWYuhGhvQVfqnwGQXC2qY+xILBclpMpReuturt
	lz0G9042jy3zSwprV4ghpsO0ghIMOz1D+LoMHh7XaEty1F0L52u+y/WLlZuOfgBE7V+x
	l2o9yocgHFK0lsw4YVxk4K7i5ZAFwIK+q7pDd54+VqRbTRL0hkoWf17YqWWK8VpCA5sI
	XRP/OwFR1lONPgB+JNAB2wTgHldo+UkLLtxW5G1wmYeRqOZlNgo/dvNxXMfaGXvTj4Ij
	h3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=LbqPPfU2O062uAOGzCIYUPfi+r8EGbWNq3CqceTxg1A=;
	b=ha755D2yYq8XP3AZHiCdWoAZS7PbbdCgkNl/UnbtYIYemk2W6JxNVtT6wWshAGn4DH
	nFnBCF3GbTNE4IXPAtNmitAEfdF+K5xMXXq7zr5S5hLbRxqE6fKWCnn9CngWq7gSIYrT
	APIEsOTVJN2gfYienHlbpUrgt29ju/+fyEaZ5Wt0Y2+3grRjFFk//QhXSOVY5wjTwfYB
	auhTXXyGIo5XBdl7Jo1xXUM1JaC/QcxPwxHqkgma65Mn7Iy7BtUVRC4CyT47bIdbTSpy
	NFmd5ldyY8STyoxgGarMbGHOZGK2Krz5jz2yEdVtFFK8HiceOe0yDX8IO2HG3z9E2rxZ
	/xcA==
X-Gm-Message-State: APjAAAV+CUGlSREKWkcg9zaA9Gn2y8VUDaH4qUDbjajHkLI5rgMPhkeP
	ujkhc2E4XatfXXW6xYfXSP47nNBtHLOkO/h3NRk12OwC
X-Google-Smtp-Source: APXvYqweBsOugBbOnfs70Lfa2ShzhDLa3X/9DrsM5elvx7eZNoikpG3mh09FQP6rz7WxBkIInQ7r6xWQo0ZpJ71SIUA=
X-Received: by 2002:a05:651c:1041:: with SMTP id
	x1mr6768832ljm.187.1565617132930; 
	Mon, 12 Aug 2019 06:38:52 -0700 (PDT)
MIME-Version: 1.0
From: nick83ola <nick83ola@gmail.com>
Date: Mon, 12 Aug 2019 14:38:40 +0100
Message-ID: <CABPh3UMS8VN9BkeX5iVD5vEgnc4XrSbesE1zp8Z4ouXudSU3ew@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [BUG] patch linux-firmware: bump to 20190618 breaks package index
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
X-List-Received-Date: Mon, 12 Aug 2019 13:38:53 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all
after this patch I got a ton of errors regarding Package version went backwards

Cheers
Nicola Lunghi

ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-src went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-dbg went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-ralink-license went backwards which
would break package feeds from (1:0.0+git0+711d3297ba-r0 to
0:20190618-r0) [version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-ralink went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-mt7601u-license went backwards
which would break package feeds from (1:0.0+git0+711d3297ba-r0 to
0:20190618-r0) [version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-mt7601u went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-radeon-license went backwards which
would break package feeds from (1:0.0+git0+711d3297ba-r0 to
0:20190618-r0) [version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-radeon went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-marvell-license went backwards
which would break package feeds from (1:0.0+git0+711d3297ba-r0 to
0:20190618-r0) [version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-pcie8897 went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-pcie8997 went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-sd8686 went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-sd8688 went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-sd8787 went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-sd8797 went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-sd8801 went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-sd8887 went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-sd8897 went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-usb8997 went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-ti-connectivity-license went
backwards which would break package feeds from
(1:0.0+git0+711d3297ba-r0 to 0:20190618-r0) [version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-wlcommon went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-wl12xx went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-wl18xx went backwards which would
break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
[version-going-backwards]
ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
version for package linux-firmware-vt6656-license went backwards which
would break package feeds from (1:0.0+git0+711d3297ba-r0 to
0:20190618-r0) [version-going-backwards]

