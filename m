Received: from mail-ve0-f182.google.com ([209.85.128.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UBRzy-0007SY-Rt
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 16:36:41 +0100
Received: by mail-ve0-f182.google.com with SMTP id ox1so2984489veb.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 07:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=jRN+Gcm3Y/EV925yN+3Gda4Pi6LtdkAALvoQpb4deOI=;
	b=m0YPXvM0f8lck689/1+PQmw39Nm8GMXPHMg1BP3UqA/9ggRQ+6rkn1pGH3c6GC/4MF
	3Y5q5ehtn2dTz1CZCgVoEauW/v78VQFwoyohfxDnSF6z6HUqZdcphf/1kWVGhFteh27q
	14ljTAz+0doQaXQw5oI5oTDfCoKbCFx7WZ8uNlUdI61rG4mnHGASiqxHSPtwYluiouln
	R3g7o6b2ZradDvVwSKZOdiDo6KqqQGYic/d4I86jMWCz60r0rGEDEQqQ7RIrXBkBwlkq
	BvhjIoHWcTtgvenDuRJTrlVabTaJ82eonFaOYz/MtL9npQdkx2gH0ATpwYX4UdBlbPdm
	QkFw==
X-Received: by 10.52.92.225 with SMTP id cp1mr3645333vdb.41.1362151166980;
	Fri, 01 Mar 2013 07:19:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Fri, 1 Mar 2013 07:19:06 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Mar 2013 15:19:06 +0000
Message-ID: <CAJTo0LZFXKWqZ055_P317-fKA_6Rqf+n6DiWy5TKzv678sf-hQ@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnSXLrwfGWzr6YFOW/YpH+tKcbqeejhnUTW54XJzTas9Z7TfiuLSxy5ls1IUGOBzgU92Ooo
Subject: Last minute 1.3.1 series
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
X-List-Received-Date: Fri, 01 Mar 2013 15:36:48 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

The branch openembedded-core-contrib:ross/danny-next contains the
following series for danny:

d961e42 install: Look for grub2 files on the initramfs, not rootfs
f8d4458 tcp-wrappers: add socklen_t.patch
c98fd66 tcp-wrappers: remove size_t.patch
d8204a2 alsa-tools: fix compilation error
7912f3a base-passwd.preinst:fix creating passwd and group error
77fed2c tzdata: Simplify code removing not used cases
9e7980a tzdata: We shouldn't override the localtime if it is valid
5296971 base-files: fix 'dash' expanding '\n'
b479983 perl: fix security issue
11544f5 Python: Fix for CVE-2012-2135
00d0e1a scripts/bitbake: Remove all instances of paths to a layer's
scripts directory.

Please merge to danny and push to poky.

Cheers,
Ross


