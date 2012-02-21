Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rzono-0000QA-Ic
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 13:26:40 +0100
Received: by werc1 with SMTP id c1so3963973wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 04:18:21 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.134.134 as permitted sender)
	client-ip=10.216.134.134; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.134.134 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.134.134])
	by 10.216.134.134 with SMTP id s6mr6382063wei.27.1329826701694
	(num_hops = 1); Tue, 21 Feb 2012 04:18:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=gamma;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer:x-gm-message-state;
	bh=N5vdhfCC1WUatLdrfgIvAXyj+9TO80ssqXQZOFkGCqA=;
	b=FehVGJJpXX/kVtEuOAOZcPR4BVcWzjpzi9kQrI8nt0084kUza6kYLZDXOs1NHXiVWW
	gax6AmJWFle7hV7wazOuIswv35rNc/imFCmH1I8M/Fx6JLCtbRr7VFyjAec4wcTje0nv
	/lgEKOYKe/oegus1C0KLmeHCixAhEGTmcBdeY=
Received: by 10.216.134.134 with SMTP id s6mr5291292wei.27.1329826701622;
	Tue, 21 Feb 2012 04:18:21 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id hs6sm20565649wib.2.2012.02.21.04.18.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 04:18:20 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 21 Feb 2012 13:18:24 +0100
Message-Id: <A3766F63-815A-4152-8E80-A9D8D742C947@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1257)
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk14OL1uxKNUIabp0/imsU/5lefT/Ugh11MdvCzfIZH61mBk3rnauwzJ9mTJa+LjCyh+urb
Subject: fri2-noemgd build breakage with extra layers enabled
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
X-List-Received-Date: Tue, 21 Feb 2012 12:26:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

[posting this to oe-core since it involves a ton of non-'yocto' layers]

Hi,

I tried to build systemd-image for fri2-noemgd yesterday and the build =
failed in kexectools-klibc:

NOTE: package kexec-tools-klibc-2.0.2-r4.0: task do_fetch: Started
ERROR: Function failed: Fetcher failure for URL: =
'file://pass-ld-options-through-gcc.patch'. Unable to fetch URL from any =
source.
ERROR: Logfile of failure stored in: =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/core2-angstrom-linux/ke=
xec-tools-klibc-2.0.2-r4.0/temp/log.do_fetch.30663
Log data follows:| DEBUG: Trying PREMIRRORS
| DEBUG: Trying Upstream
| ERROR: Function failed: Fetcher failure for URL: =
'file://pass-ld-options-through-gcc.patch'. Unable to fetch URL from any =
source.
NOTE: package kexec-tools-klibc-2.0.2-r4.0: task do_fetch: Failed
ERROR: Task 2253 =
(/OE/tentacle/sources/meta-nslu2/recipes-kernel/kexec-tools/kexec-tools-kl=
ibc_2.0.2.bb, do_fetch) failed with exit code '1'

removing meta-nslu2 fixed it. Rerunning the build made it fail in a =
recipe from meta-handhelds. Removing that layer got the build going =
again. Does anyone have a clue why those layers would break fri2-noemgd =
builds? The oe-core qemu and meta-ti machines build fine.

regards,

Koen=


