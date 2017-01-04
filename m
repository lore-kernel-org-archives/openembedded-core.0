Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 73A0660269
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 10:10:31 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id k132so10701950ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 02:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=R9Lr/BbKmv+wJROl+2tCYygFiJCwAPfOrlkfgU35ZbM=;
	b=r4X9dFc2a2up8oSp+UmuQuaVgKlAbCLncF5eFoeHuBpGSTBUb+YZleCQOG+D54FWNF
	IEivoZbK2IyF6q/OTZT+kdj+jaZ68yuBAZ40a4GhqWit9dIoq8e36KKHGeH+kidzUFjI
	00y/Wkq4OGQU5131efXtvgYbWJXaUIr/iJoy0nKLQs3dq9FIx0oLE79HBo+/40gdxQJz
	cc9vJS5h83vNWf9B1QrSgmbjZ7eSs94+2MCyUdW7OnawLVasKAAj8CwoMXhM80x01BRb
	3Tw3LPTdJbdARuJ2YbBs+Iqm2Cl1v3a3sJfn8LycN4m28PQjFXAD1oWHYXWKZ3gDKY6j
	T9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=R9Lr/BbKmv+wJROl+2tCYygFiJCwAPfOrlkfgU35ZbM=;
	b=eRFgVnocPZzKv/AetlJ2Y3TWI+zrNN30S4hm9ZLnAWjlnmJbvMPxLfeXcB8REYn7jN
	rYCU1e3h1Ub4ABNw31CLALEjaSOsx7UM6myKkADkTQhtiHJDMoLPg+9ERySUM7MzLAp3
	XVCgx4Rp0ydfIz9XB/Hp8EsbZaDbfUfMG2ObmC84uQ4FxX/vhuMrWBCLMHL+L7U0GsmP
	tYyF5LlLWABGYGT9Jh8ML7u/iE4OSMviNpaU090zIR5DNoVuAX9dZKk9YDUBy/MlEhbN
	h+ZePUE15+GtCkvW1NNm+VCUdabzZqtrb4Lrfc5/dM6f0v62w+7Bopo9vuCfcAoRyzqI
	oJ+A==
X-Gm-Message-State: AIkVDXKX7dyy+nQrufV2YlzRdp6vXZW8BogfhFdRIn/W5GlUUNr1umaa3DLanVcqOJkyDNGl
X-Received: by 10.36.200.68 with SMTP id w65mr54222269itf.85.1483524631599;
	Wed, 04 Jan 2017 02:10:31 -0800 (PST)
Received: from pohly-mobl1 (p57A56308.dip0.t-ipconnect.de. [87.165.99.8])
	by smtp.gmail.com with ESMTPSA id
	g186sm29789311itb.4.2017.01.04.02.10.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jan 2017 02:10:30 -0800 (PST)
Message-ID: <1483524628.28169.41.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Wed, 04 Jan 2017 11:10:28 +0100
In-Reply-To: <1482965680.106950.67.camel@ranerica-desktop>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<12e72d8f27d856bcc2007ca5226a693a68fe2ae0.1482324587.git.patrick.ohly@intel.com>
	<1482965680.106950.67.camel@ranerica-desktop>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/9] ovmf_git.bb: enable Secure Boot
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
X-List-Received-Date: Wed, 04 Jan 2017 10:10:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-28 at 14:54 -0800, Ricardo Neri wrote:
> On Wed, 2016-12-21 at 14:11 +0100, Patrick Ohly wrote:
> > The recipe now compiles OVMF twice, once without Secure Boot, once
> > with. This is the same approach as in
> > https://src.fedoraproject.org/cgit/rpms/edk2.git/tree/edk2.spec
> 
> Besides the fact that Fedora does it, is there a particular reason to
> build twice?

The ${build_dir}/FV/OVMF.fd file changes depending on the configuration.
There's only one such file after a build.

>  On my side, I am able to build with secure boot with a
> single build. Also, the Ubuntu documentation does not mention that two
> builds are needed [1].

Can you build with and without secure boot in a single build? I wasn't
sure how to achieve that, so I just copied what Fedora does.

> Also, I think it would be nice if we could choose between to not have
> secure boot at all for OVMF. Maybe this could be achieved by having a
> common ovmf.inc and two ovmf_git.bb and ovmf_sb_git.bb with the
> different the specific things to support secure boot or not. Maybe all
> that is needed in the secure boot recipe are the extra variables for
> OpenSSL and a prepend to do_compile_class-target with the OpenSSL
> patching. Something to ponder.

I think I would prefer to have a single recipe with a PACKAGECONFIG for
secure boot. Having different recipes doesn't scale when adding more
such options. If you agree, then I'll add that.

> > +    ( cd ${S}/CryptoPkg/Library/OpensslLib/ && ./Install.sh )
> > +    ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER} ${OVMF_SECURE_BOOT_FLAGS}
> > +    ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/OVMF.secboot.fd
> 
> At this point both ${WORKDIR}/ovmf/OVMF.secboot.fd and
> ${WORKDIR}/ovmf/OVMF.fd will be linked to the same OVMF.fd with secure
> boot support. Maybe this could be fixed by copying the files rather than
> creating a symbolic link.

This is intentionally a hardlink, not a symbolic link, exactly because
of the problem you mentioned ;-)

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




