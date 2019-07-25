Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1553C7F0F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 22:29:36 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id x4so52288841wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 15:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=M2m1iAYp6UBrtXwGaZaSD0xfQ46OKES3IQZpVtGGSvo=;
	b=GBbwXOCj+rgpd+nxvHhGSoz9hQqrO6BHoQCK/LnKwy6/203ptvFj2WcFo71CjOUeeL
	bqiGON+t0zzMeKH9nn+TECHdS2rYTGjOdDBZjmJheDaZvCNezE8gWGcDIKkzEJyiPvZx
	Co+pASmBXtUFv6ssHl/OQZ2807I7loOR9eNEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=M2m1iAYp6UBrtXwGaZaSD0xfQ46OKES3IQZpVtGGSvo=;
	b=WzWgNkyJGymTLUuSthvPhDu6xD702ncroLF5MG2iuEAAflXywCXoADg0OophDPopcJ
	4uOBUnpk27V5x72gdaIi3F0/Cjk6HiWF3urum2QvDFIwaON6D8BwfiYMKfzn6y931/aI
	erwobkYZCCHM2d/E1Q5wVntzsMhczrdlWAxM/30Eeyo0OhhL73eMLyBzcLBVc1DHCgcd
	4amK7X7In6pOXxgneVpWtVtBgZhSHPDigLYF7sm3kMJXjcOh0mStbiMic0+p4qL6rXcl
	pjR4VelBLL4bTIhKIaWoQHmYgE2nU/8QDnAlueBLlQwTtqeyIiu55/fhjCXeV1v/sxFA
	xW3w==
X-Gm-Message-State: APjAAAVb2IvchVSej9Sfhij4U87BzINJB00aLLt/v/VQBDv7aADYwiLZ
	5gX0oJqohCoSoeNINiThP/aGfg==
X-Google-Smtp-Source: APXvYqypB8XApzHYW67PTmtJy/WAuRkO34klq78D8UpzbW8RE/bdJpqBaicPcDbNv8tAdG5p23t3nQ==
X-Received: by 2002:adf:91c2:: with SMTP id 60mr40674673wri.334.1564093776769; 
	Thu, 25 Jul 2019 15:29:36 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n3sm44881646wrt.31.2019.07.25.15.29.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 25 Jul 2019 15:29:36 -0700 (PDT)
Message-ID: <e14fe2b9f2fa5009794676e3e7e4b1837e80cb79.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jens Rehsack <sno@netbsd.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>,  Tim Orling <ticotimo@gmail.com>, Khem Raj
	<raj.khem@gmail.com>, Alberto =?UTF-8?Q?Sim=C3=B5es_=F0=9F=90=AA?=
	<ambs@zbr.pt>, Leon Timmermans <fawaka@gmail.com>
Date: Thu, 25 Jul 2019 23:29:34 +0100
In-Reply-To: <A3D1BC0A-704E-4F87-9D63-86C8DBCBA1E7@netbsd.org>
References: <A3D1BC0A-704E-4F87-9D63-86C8DBCBA1E7@netbsd.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Ingmar Gebhardt <ige@ivu.de>, openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Perl5 build issues (meta-cpan only?)
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
X-List-Received-Date: Thu, 25 Jul 2019 22:29:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-07-25 at 14:52 +0200, Jens Rehsack wrote:
> Maybe one or the other has already seen the following message in
> connection with modules::Build-based Perl modules:
> ERROR: hash-fieldhash-perl-0.15-r0 do_package_qa: QA Issue: No
> GNU_HASH in the ELF binary /home/sno/gpw-community-bsp/gpw-yocto-
> platform/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/hash-fieldhash-
> perl/0.15-r0/packages-split/hash-fieldhash-
> perl/usr/lib/perl5/vendor_perl/5.30.0/arm-
> linux/auto/Hash/FieldHash/FieldHash.so, didn't pass LDFLAGS?
> [ldflags]
> ERROR: hash-fieldhash-perl-0.15-r0 do_package_qa: QA run found fatal
> errors. Please consider fixing them.
> ERROR: hash-fieldhash-perl-0.15-r0 do_package_qa:
> ERROR: hash-fieldhash-perl-0.15-r0 do_package_qa: Function failed:
> do_package_qa
> ERROR: Logfile of failure stored in: /home/sno/gpw-community-bsp/gpw-
> yocto-platform/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/hash-
> fieldhash-perl/0.15-r0/temp/log.do_package_qa.12168
> ERROR: Task (/home/sno/gpw-community-bsp/sources/meta-cpan/recipes-
> devel/hash-fieldhash-perl/hash-fieldhash-perl_0.15.bb:do_package_qa)
> failed with exit code '1'
> 
> I think the reason is in 
> https://metacpan.org/source/AMBS/ExtUtils-CBuilder-0.280231/lib/ExtUtils/CBuilder/Base.pm#L319
> where the arguments from ldflags are thrown away.

That seems very likely, yes.

> When those issues came up somewhere else than in meta-cpan, please
> let me know (only open-source ^^). We should develop a fix like 
> https://github.com/meta-cpan/meta-cpan/commit/52ded0759daa3bff909bf5fac6d31c6bc52d713e
> then ...
> 
> For now - I think Alberto should receive a patch to use ldflags, too.
> 
> I cannot decide how critic and important that is to make it into
> perl-5.30.1 ...
> When ExtUtils::CBuilder is properly fixed, no changed are required to
> cpan_build.bbclass, aren't they?

I'm not sure I understand exactly what you're asking. I think that if
the question is whether we should fix this in the perl recipe itself
with a patch, so we don't have to add workarounds all over the
metadata, I think the answer is yes, we should.

It would obviously be ideal if such a change were a backported on which
was accepted upstream so we don't have to carry the patch forever! :)

Cheers,

Richard


