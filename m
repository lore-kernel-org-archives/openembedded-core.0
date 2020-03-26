Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.36411.1585228308706604060
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 06:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=MoV6dTB8;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=rbqv=5l=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48p53h4YG4z3Q;
	Thu, 26 Mar 2020 14:11:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1585228306;
	bh=aUMMVG4FHhTlnOpOWMVQaB9KgeRa9lwyHaL7+zesuvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MoV6dTB8NqiN4K0YmpP/e2xWfKOpgr4cYhXuhNHZtZJ0HFFQ5zcL4NPU+VsUpmNYy
	 aDeiSC5i2nr0Fi0oQSuPBrGMJAuhp1U+50YUS7UcV8fF+86p7OW/UJTEEKH1FNgz2P
	 JTtHH6dheE7Xxy9fqU4I5wOL7o7zNe8J6D3GG/+fDZ3cOskjzZpOOalgFjKQfcd6mG
	 v5952XLL1+w4ZQiMcytWj3HbA2EZ06zYOH5ydw9QCjKa3emRudqQt8auRRpEu0ZdFv
	 QKullpo5C45DkcctQ6xuFTN/if7LkqRzCsCyC55TK7lLgkouzpB5EA4DRNHJyFscez
	 Y5uW7Qnw9ZGNt7D+PEeoL87QLOxecMU0jvMgfsnhI890uM9bccQZI5JUxDpOQfgEVr
	 rO10A4OnBQKaMzzQHTefk/eA8/DL0naw+VBKfDN6C2EvZd9oxJavNpLTXEJ9tmdfrr
	 cXt5erUAqp2VbJONsfuchNBuxGdfqPmy/zpI2PHuDmMFbOGC/SJVyn4zF4dYvDYWoH
	 MuYxTb13HiecflxpPnEiD7N5UOV2mSDYWeWsU2Eso6ZXXmpTKRQFi/tn8SpinJSlMI
	 rMPO2b+leuMADLzg8hzoeXS78ssZLY2vbks6LdkXlsa7NJPuhl9M/G0+/A5aJN6m8l
	 23gwtj/bCNBOA3af1L8uWWjQ=
Date: Thu, 26 Mar 2020 15:11:41 +0200
From: "Adrian Bunk" <bunk@stusta.de>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Denys Dmytriyenko <denis@denix.org>,
	"Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] mesa-gl: The purpose of mesa-gl is to provide for X11 usage
Message-ID: <20200326131141.GB17705@localhost>
References: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
 <20200325182129.GD1578@denix.org>
 <11151.149.199.62.130.1585161676.squirrel@gate.crashing.org>
 <CANNYZj_s6yG2qRnEMv_PrFc6ut2mOfJFNFpBd4EzdhUHe8Xxyw@mail.gmail.com>
 <10720.149.199.62.130.1585164457.squirrel@gate.crashing.org>
MIME-Version: 1.0
In-Reply-To: <10720.149.199.62.130.1585164457.squirrel@gate.crashing.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Mar 25, 2020 at 02:27:37PM -0500, Mark Hatle wrote:
> > To be honest, I would just take the entire recipe out. It's causing
> > trouble
> > during updates, isn't being tested neither for builds nor at runtime, and
> > is supposed to provide some specific configuration which as this
> > discussion
> > makes clear, nobody seems to quite understand.
> 
> With the abomination that is libmali (and similar), it is still needed. 
> It's the only way to support GL on a primarily GLES compatible system.
> 
> The problem is the way they do this seems to be a custom version of
> libdrm, which then conflicts with the mesa version.  Thus the issues.
> 
> I'm happy to continue testing my particular needs now and the future (thus
> the patch against master.)
>...

Stupid question:

Is
  PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
  PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
equivalent to
  PACKAGECONFIG_pn-mesa = "opengl dri x11"
?

> --Mark

cu
Adrian
