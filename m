Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id B964C6AC9D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 11:22:33 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s75BMVlH029035
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Aug 2014 13:22:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1407237753;
	bh=gStX2ng7RlZZdoCfii8owuBZM37Ze923maG2Gq2IA5o=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=cBork+6SHEtYTibk6tcnW/jncihREnlG8TNhpPEnc7q6QTH21mqZjQJIx+GKT5PBi
	jAgxCnS2Ps4L/cZpVK3A4ks3Y2b+zZHeMx7ScOLmVfZsfoyvPKJT1OEAEfOsCNguy1
	ldGnARTsMAhP9GORR04f0smRIHNtNq4YwOGHw8D4=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s75BMPDh008281
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Aug 2014 13:22:27 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1XEcoz-0001R6-Q3
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Aug 2014 13:22:25 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1407160628-30775-1-git-send-email-sujith.h@gmail.com>
	<lyoaw09sj2.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CADyYWLkmXS4O=nRNmTzXPwxX+y_cWY0NM1OeFsrHS=LeYj7f3A@mail.gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 05 Aug 2014 13:22:25 +0200
In-Reply-To: <CADyYWLkmXS4O=nRNmTzXPwxX+y_cWY0NM1OeFsrHS=LeYj7f3A@mail.gmail.com>
	(sujith h.'s message of "Mon, 4 Aug 2014 21:20:27 +0530")
Message-ID: <lywqancham.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: Re: [PATCH] image.bbclass: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Tue, 05 Aug 2014 11:22:50 -0000
Content-Type: text/plain

sujith h <sujith.h-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Is it ok to read from /etc/hostname and then have that in the /etc/hosts
> file, rather than using ${MACHINE}?
> ...
> +         echo 127.0.1.1 "       "${MACHINE} >> ${IMAGE_ROOTFS}${sysconfdir}/hosts

I do not see how this can be done while building the image or the
packages.  Both the hostname and the ip address can be configured at
runtime.  As this can happen dynamically e.g. by DHCP and can change
at every boot or even at runtime, there is no generic way (e.g. by
firstboot mechanisms) to add such entries.


Enrico

