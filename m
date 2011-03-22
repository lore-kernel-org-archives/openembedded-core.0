Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2649-00030m-N7
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 19:12:34 +0100
Received: by iwn10 with SMTP id 10so7997326iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2011 11:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=7fhyd6xKshKLHx/umM04LWb+72vndIRetgrEW82EaQ8=;
	b=uqMfle5xd1v21ibAZPHgotLqSg3YDQpGZApdAMuEBXrmq8emDVLia38fIcrCB5htLY
	LFmfVMxzgjzSv/ipyok3Gi/043wsuGt/I3/2w3SW9BuotIscyUxASCDiwH4cSfuoqals
	cv8x2VLUNFkaa+JMhcmQm2aXhyt7KZxiKWsa8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=kpVXYN8Oyyg1sOQSasAS8REaCb0Zc/U+a74w7Ci9+rc/PUYtRFd4CnU2HHpOoSCELF
	XcA1rETSDugaJQibO2USmCqt/e6tvGVkOfCDMuZVY1KNdXfwUE/XcST60IRLRhkPZHXI
	7KRijZRRKcaoZ8jvy+gtUouH2TG3R7ijC10CU=
Received: by 10.42.138.4 with SMTP id a4mr6631408icu.258.1300817433758;
	Tue, 22 Mar 2011 11:10:33 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s1sm1802085iba.24.2011.03.22.11.10.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 11:10:32 -0700 (PDT)
Date: Tue, 22 Mar 2011 11:10:37 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110322181037.GA26336@sakrah.homelinux.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: MIPS rootfs creation failure
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
X-List-Received-Date: Tue, 22 Mar 2011 18:12:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I did an update of oe-core yesterday and now mips is failing with this
error. It was not there 2 days back.

| Configuring sysvinit.
| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for task-base:
|  *    kernel-misc *
|  * opkg_install_cmd: Cannot install package task-base.
NOTE: package console-image-1.0-r0: task do_rootfs: Failed

I have not bisected but if anyone else is seeing it I would like to know

Thanks

-- 
-Khem


