Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5F85E71ACB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 08:54:08 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id w124so1187507itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 01:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=eVV/rRo8F0vZd5pFFZr3QZ0pQMQP4m8bc4jV19UH6DM=;
	b=HCMfm1v7BvP3ze/S04XVHagt74kp7/JC4x78yw+wAhA0udfHtBlNkgZ6EEYugXiaJj
	Tr5CBfYTuaAl4Db+86yAH7miftB71g8SbqolrRWzHl+Lwe77T86m+1XSruEXYK9fTs26
	xgSAytcQ6xL4tcoKrRR13Z7shoKyS9ENuapHhsYAgaE4kKo5oSndHjm3o0chY0bm7GhE
	Sej7UazLzasK7KyEn6u2dhZ7sb7xgkMJMCGHBieNitm5+kF2AuExTTZZCxTC8wphtjcr
	z0jbHRcFZPEhCSDI196VsdJOA9eECPAvy4p9PWFteSiFOPMFtlmoa86PvTBtlmzegBRp
	kRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=eVV/rRo8F0vZd5pFFZr3QZ0pQMQP4m8bc4jV19UH6DM=;
	b=Kt2rCcieAOy+dA5ZeMZc1RVV+snjHGX3OpwXLmAMic0b/yYlIQU22I/wIWLugcwk2I
	6iGO1UlM4Jr0D7tq/Ds/TL+580YbHk9YiwUn01QnyFqqMFomdqR9asHyQXDQlLMTJEGr
	AZyngvhkZF4o4wGN5/MmYl2Yl7kj0kVMjol+vRcDrrWHg3BCRqlOjArpLqL5DIxiervP
	r9WowcwpPb9KGjCzV2WaYXQZfrQj7pyqQvoxV7LVW0GkZzSd7QRPgZ+6xTLzcOQWkOJ0
	ToS1myas1gVdBbi+nBiY/3DZtPsHjoHOPU54PAR68sa4S9TWrvqCG+Ovdtqpvdpd6d3/
	dSEw==
X-Gm-Message-State: AFeK/H2NODUf2zsoTGeao1utB+VI8mvm4zSfs+jZ7YLBf4w/zfGNWcBXQsFpyfZ5QCCZQLLd
X-Received: by 10.36.193.198 with SMTP id e189mr1611696itg.95.1490086449803;
	Tue, 21 Mar 2017 01:54:09 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D82C.dip0.t-ipconnect.de. [93.232.216.44])
	by smtp.gmail.com with ESMTPSA id
	b15sm9814639ioj.34.2017.03.21.01.54.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Mar 2017 01:54:08 -0700 (PDT)
Message-ID: <1490086445.6396.214.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Mar 2017 09:54:05 +0100
In-Reply-To: <1490043755.6396.211.camel@intel.com>
References: <cover.1489534345.git.raj.khem@gmail.com>
	<2a1cd614717f323afc788e24fae76337cffa8816.1489534345.git.raj.khem@gmail.com>
	<CAHiDW_EvTOKpqOACTS6M9Y2_wofaEQ6sL89ThNHem4cPrxLFmQ@mail.gmail.com>
	<CAMKF1sqY+nZsj2b9AOq0OUnKpGemjcvT+_wa0m5S7VoGv-r31g@mail.gmail.com>
	<1490043755.6396.211.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "Neri, Ricardo" <ricardo.neri@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: ovmf fails to build with musl (was: Re: [PATCH 5/6] musl: Update to latest)
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
X-List-Received-Date: Tue, 21 Mar 2017 08:54:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-03-20 at 22:02 +0100, Patrick Ohly wrote:
> However, TARGET_PREFIX is empty in ovmf-native. So instead of
> i586-poky-linux-musl-gcc or i586-poky-linux-musl-gcc-ar we end up
> building with gcc and gcc-ar from the host, which probably wasn't the
> intention.
> 
> Below a patch which compiles for me using the right tools. More testing
> has to wait until tomorrow.

I've cleaned up the patch a bit more and tested it successfully with
refkit on intel-corei7-64. Building for musl on qemux86 also worked,
using i586-poky-linux-musl-gcc.

I propose that we include the patch (will send as reply) in master-next
to check whether it also fixes the problem on the AB.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




