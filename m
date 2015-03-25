Return-Path: <janne.karhunen@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id B9D3D72B1E
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 17:39:33 +0000 (UTC)
Received: by pagj7 with SMTP id j7so35782798pag.2
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 10:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=oqkX1+ao2a2kKMcAYt7SefJWPpNYaYwcH2VWKBMrbTg=;
	b=Ty4Emx6QZQh4XePXoQEHghPZPGl5jw3AW2kxHE/N1LU4Qmrot2SsTwoBdjdsYnQV/o
	SjAPJGXxmpHzlrSHJEXNfwBSf+izuhQRTCIBKa9Q+x4Vst6DH2ObQ13zRiowQP3zKzHD
	/KGL0UEx2IA/wXoUG6uEojmhIMRay1Nq059LHzSPHi3luAKOKRRxzVItxr/FMnbajYSv
	DXW1I5yd9isw7HRyg/qVB+5YPPZYtqONtohl+JWtfpz+KBHl4VeondFAIOECMoM43+V2
	qB6mSEoJbk9pb8wLmUSolh+P8d5b7UfwJp3rJuumThBsjfzP8oWbMVJGF60Hu//wZpek
	KjKw==
MIME-Version: 1.0
X-Received: by 10.66.167.106 with SMTP id zn10mr12405870pab.126.1427305174112; 
	Wed, 25 Mar 2015 10:39:34 -0700 (PDT)
Received: by 10.70.103.39 with HTTP; Wed, 25 Mar 2015 10:39:34 -0700 (PDT)
Date: Wed, 25 Mar 2015 10:39:34 -0700
Message-ID: <CAE=NcrZ-ODzj8LYcrGO0-a0Wvzb3YcyAqS44-NOwMumU9NVuAw@mail.gmail.com>
From: Janne Karhunen <janne.karhunen@gmail.com>
To: Openembedded-core@lists.openembedded.org
Subject: pam related dependency processing bug?
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
X-List-Received-Date: Wed, 25 Mar 2015 17:39:35 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Wonder if you guys can share some insights on how to debug this case.
I have a legacy PAM module recipe that says:

DEPENDS_${PN} = "libpam"

'pam' is listed in DISTRO_FEATURES and is working fine. However, for
that pam module libpam dependency is silently dropped during the
build. If PAM happens to be compiled before that module, everything is
fine, but if not, build fails on missing pam headers.

To make this interesting, 'bitbake -g -u depexp <module>' shows the
libpam dependency in place - yet it clearly is not there during the
build. Results are the same for both dizzy and daisy and host OS
doesn't seem to make a difference either.


--
Janne

