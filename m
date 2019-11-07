Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C3CF87F1BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 09:30:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 477ynD5N3Xz3r;
	Thu,  7 Nov 2019 10:30:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573119041;
	bh=8hkuM/sLlko+cdjuagZBDFtsLPHgWxzr69Vba43/Gug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=El1PYyzpFLBpYCPWBHI4ks2MOM3Ap9v1D7AyT9LaVLSPUiA460MxHjWbUZZbEQIQN
	6OuM0gdoeJm9Xt828TaQcPeV2RwBWZnFtgCZ20ulIKC2czKXqrKNhCf6VCC6X2j9ht
	XhvMDCiOt8eAOBeF49qAavR9bwzk5tTt5cwQsNLo+DVJWWfmfvaQ0gKpnryCSwpFOZ
	9XsJmKzpKPb4X3bCnaYWjKq5Cje/GuBEFe5JbW/BbHXuINuRGF90yo7tyN1y0j7BdT
	Pg2JYPiwJo01Ptc5d1GSikDI+cTOCvKfsP3zQkAXcrDHzBDNqd5fKfyQznhTZ7/wCL
	F3KlxZO6CejcDwV60y/q4AReSPsLRzNIpx0m71j9SX6XugMCv/NaCXhUV7hyx4lgml
	JrWcrZv0n05vDGFxJaLee38A7LEJinnMjGxXvl77SqwLt7Vu7fujAXPCgKvuqhf/8T
	n+TWY56VBrIKBz9q8/qeR7NcV77ObnQkNz25ozzPANbP4p+pJAzoPj9zc2GgqcerTR
	oVKxM+S8j+pZlcaNM+O+es/HVUSQMVIxRUbJZ4JXgZnUwoauosRJ8hv+DDcVacX6Zu
	RWuoBR9+YxyJlT8O62jnJ++LY1AtT/mziZGcVsLzPB0Z7jR3hjHgXkpyAzUFjdQVYH
	eSA1BXmPF1A62rR7GTQhinsY=
Date: Thu, 7 Nov 2019 11:30:38 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191107093038.GA15395@localhost>
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<20191106221250.GD14721@localhost>
	<e37b5da9acc8a0f7562a9dacf649bc28e6a41f9d.camel@wdc.com>
	<CAMKF1soRzN+thjSsMsz2F0_cxTGkS+cpKAYwiAYs4d3YFhjh7g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soRzN+thjSsMsz2F0_cxTGkS+cpKAYwiAYs4d3YFhjh7g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] tune-riscv: Add support for hard and soft float
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
X-List-Received-Date: Thu, 07 Nov 2019 09:30:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Nov 06, 2019 at 04:55:05PM -0800, Khem Raj wrote:
> On Wed, Nov 6, 2019 at 4:48 PM Alistair Francis <Alistair.Francis@wdc.com>
> wrote:
>...
> > -march is another can of worms that I was trying to avoid. I don't have
> > a good way of handling the ISA strings at the moment without some crazy
> > number of tune options.
> 
> We need to handle that but I think that should be in meta-riscv since I
> think for Linux we should just stick to rv64gc ABI and something cross
> distro agreed upon abi for riscv32 and bare metal is another story that’s
> where probably we need to address the ABIs

We have the same problem even worse on arm64,
with billions of combinations available.

A solution is needed in both cases.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


