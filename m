Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QF7X2-0002A2-3t
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 18:24:04 +0200
Received: by ewy5 with SMTP id 5so578386ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2011 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=JS4yrsbcANvb7YkMdFAJHkcCst55vy40H5J9thZ7aO0=;
	b=C8wU3WzWTp6R5VzsITerN07Ic9sCwqL9JuM5tDID38yO0c0MsF5fPb+tlkgE055FPl
	U6IOtlN8aNJHAikyqQJdNFVwZunz1bV4ss3CyisKHBJq3UcP+PkanYvMqYL14L4ji0GG
	f00jKF9CusKGgWauQCDIX7IN95DMpRTA1hIKo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=e1LbMTA7MzycrD7YH9KMCY+DUZJEv/OszgVqAhM7Oplp+bsRUsWRTca+K8BP07POjT
	m+R4x05OD2tqqsVXYWLl3kNBIDemac/GQqxktpMCtkmviXU/czu+DaDWPZFtKFEmeUFj
	gcsDA1SJPKjBYXAvtxll+BKbSMSFyy/lO58bc=
Received: by 10.14.4.32 with SMTP id 32mr1039336eei.141.1303921293199; Wed, 27
	Apr 2011 09:21:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Wed, 27 Apr 2011 09:21:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Apr 2011 09:21:03 -0700
Message-ID: <BANLkTimY=T0BNMLWm+Ez9N1ug+_XOdaGpg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: eglibc 2.13 upgrade
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
X-List-Received-Date: Wed, 27 Apr 2011 16:24:04 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I have eglibc 2.13 upgrade done locally and has been building fine for
all architectures. I have added 2.13 recipes and not
deleted the 2.12, This works ok except when setting the SRCREV. Since
we have a single file called
conf/distro/include/poky-default-revisions.inc to store this
information there can not be two SRCREV for two versions of same
package unless we move them to
recipes which is under work but not yet done. Thats one reason to hold
these patches. I can propose them if we are ok with
removing 2.12 recipes then it becomes straight forward

Opinions ?

-Khem


