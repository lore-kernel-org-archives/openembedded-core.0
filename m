Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RxKKX-0000rE-5O
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 16:30:09 +0100
Received: by werc1 with SMTP id c1so42286wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2012 07:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=+PABUVN+/iVF56bjllNK8odnKG+JH8ckx64Ctl1xLek=;
	b=olERXbM54Rcs3LQ4+Pu33ggu/ghI/u2AK+o3wsLPzOCnxDqk7eHzur0IcrMfIVaJ4S
	cJmfFDhLxbqbIUs/YU69vt5qYcPE/L+CjhrYU71LEQhZ+2BHblp/mSG1+IKFsI9Af0FZ
	ub9PS/TqPXi7KILUPaUS4uVp3Hym0ELO5XQXQ=
MIME-Version: 1.0
Received: by 10.180.107.34 with SMTP id gz2mr30839424wib.21.1329232918021;
	Tue, 14 Feb 2012 07:21:58 -0800 (PST)
Received: by 10.223.89.135 with HTTP; Tue, 14 Feb 2012 07:21:57 -0800 (PST)
Date: Tue, 14 Feb 2012 16:21:57 +0100
Message-ID: <CAGiJk9fHCXEeFkRBi4OWL-0fbGtxPpHyGu5Qky+yJ_Ab-yVZ7A@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Eglibc related / libm issue
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
X-List-Received-Date: Tue, 14 Feb 2012 15:30:09 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
currently building dependency depencies of Plasma Active dependency
dependencies (this sentence may contain slight ironic content).

One of the libraries wants the maths.h library libm.
Libm existent in my rootfs under /lib/libm-2.12.2.so, /lib/libm.so.6
that points to it and the other link at /usr/lib/libm.so.
But for some reason configure can't find it and quits with this error:

ac_cv_header_math_h=yes
...
configure:14858: checking for ceil, floor and round in default libs
configure:14900: checking for ceil, floor and round with -lm
configure:14943: error: Could not find ceil, floor, round in default
libs or with -lm


Anyone knows what causes this, or how it could be resolved?
-- 
Regards
Samuel


