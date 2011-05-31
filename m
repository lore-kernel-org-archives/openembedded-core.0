Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1QRXkc-0007hw-BF; Wed, 01 Jun 2011 00:49:26 +0200
Received: by wwb17 with SMTP id 17so4631720wwb.24
	for <multiple recipients>; Tue, 31 May 2011 15:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=7sy2Nz3V2V4XJb2+I73hrjbfB+cJS1lyTlrNVt0kAgo=;
	b=VnTuQsIrAoRyWfUYwsXFLbeedKoS2m5uOH503dQ+jSqHyQ1t5D8GaSw3XcQYi3DO9Z
	2R9lPtr31q2uXbXpTPOufcByxbNLCAkoLbfhrDvmfvJr6nYhzKWW5zXQb0Y4E2a5HfWX
	0FhYpShas9BGvcPwDsFjtoyeJw3MxLh4intAU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=Ic9AKR608+YJC/cmIrfHTuAe4X7837iG21qwHUGk4jdBwdGP70y5w58cPMavR9dOyp
	wu9/j0Kqnm+mDt37TYiHLeKn+JDEDGTS+2rlePQkLivex1/xabMPP8fruaEmOOJwh65n
	ugE6byFyHVvd9lEebKjuQKr81wcgk12uOmopA=
Received: by 10.216.220.150 with SMTP id o22mr6576883wep.59.1306881976342;
	Tue, 31 May 2011 15:46:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.28.19 with HTTP; Tue, 31 May 2011 15:45:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 May 2011 15:45:46 -0700
Message-ID: <BANLkTi=mR7KKfXxiwiF1ZFA6epxx8hfaug@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Parsing errors
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
X-List-Received-Date: Tue, 31 May 2011 22:49:26 -0000
Content-Type: text/plain; charset=UTF-8

Hi

In slugos when I updated to today's snapshot of oe-core  and meta-oe
its giving me this

ERROR: Information not available for target 'all-linux'

                                                  | ETA:  00:00:37
ERROR: Error parsing
/home/kraj/work/slugos/meta-openembedded/meta-oe/recipes-core/systemd/systemd-compat-units.bb:
Failure expanding variable SITEINFO_ENDIANESS, expression was
${@siteinfo_get_endianess(d)} which triggered exception TypeError:
argument of type 'NoneType' is not iterable
ERROR: Command execution failed: Exited with 1
make: *** [slugos-image] Error 1


I wonder if it has to do with allarch.bbclass

Thanks

-Khem


