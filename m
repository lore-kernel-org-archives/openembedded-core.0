Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id B8B897E730
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 15:54:39 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id v19so10975503pfm.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 07:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=82D3OswSBEdgqbVHNSf1kd23j+2/BjgZcIork1IMgWs=;
	b=hwmakTcDfyZfXAqANrFHi0zhSm3C7vxXswRMx+vmmwxsvooqrUY8IpL3ph6KBFKF0r
	SKN3RYhVCWH+ajjYAHtHByFiwPgNFqHpVrOpndvJ74+di5U4wSskUdZCjb64pNdAl243
	4eoaFPSlCwW0lyykcxXwO3d4AO2CjjCk0Hklh6WxU+zN7H1OUB5uuZaHy9C1AbcpDvEy
	k3k/+/ZHy/8myTh49tkUfr7flgVrJzvaveHd11UYZFWi/cx6hBq6xzJOgl1SYjWQ8Hei
	RwECKbPoPTempIyoyVlwBDvPam3pYYCEv+Hy+fZWHFRJNG84AEzeUPa8U3cuM6J37Are
	IiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=82D3OswSBEdgqbVHNSf1kd23j+2/BjgZcIork1IMgWs=;
	b=Gp/HQ7YCczZrLtAgZkkuazxMNfxx0pCW0QfwJNnZTqP6OUvwktDvHvds20s7He7WcS
	mnoKaFz1947wEllreiwXh3IU74PQhN1ueJLiSY/RcPqaiZGm/qQX/R1q8qV3EcQF+ynU
	QAHDlm0Rme8cH1PHnIU7CVvIcfDhbxTnAnTPsJnp4fowrlgaPMdU1PXTlB3wet4tgTqx
	hLiwUHqtk8QaTP+2GWQV2ZYsgCIolpjeZ0Xwuj0BMpP/KnO+1NWA3DKmDkn2rX9n5sDR
	gsNxaOZ8QsM1YknIBe6FPZcUaE+1kFEa2m3+Yf1vhntiZrgonzUc7jotdgInDH1gzBRw
	3jog==
X-Gm-Message-State: APjAAAVoKrU9799FWz+lFmMD/N/Rq8MzubsszDJ2EnOeLwm21sT/5r6s
	ovg78fWOKN+lw+3j3xXMe6k=
X-Google-Smtp-Source: APXvYqwtDacDW7oku4Kpx4LrAkz9nlM9AkUkmeZG5RHI1RcoEUUOHUne4EMeUzdeYX/h2ItFfoNzeg==
X-Received: by 2002:a62:7b0e:: with SMTP id w14mr25601463pfc.177.1573487680300;
	Mon, 11 Nov 2019 07:54:40 -0800 (PST)
Received: from apollo ([2601:646:8500:1c20::a99e])
	by smtp.gmail.com with ESMTPSA id
	b1sm13238390pjw.19.2019.11.11.07.54.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 07:54:39 -0800 (PST)
Message-ID: <455f1e8afcbfac40259ee8942d1a67ca5ce23264.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Adrian Bunk <bunk@stusta.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Date: Mon, 11 Nov 2019 07:54:34 -0800
In-Reply-To: <20191111141416.GF28797@localhost>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
	<ec8a8c61-25a0-7e87-efee-b76e6c954d07@gmail.com>
	<717e1439a3c155fc1f506d7a2933b968ee38f9a8.camel@linuxfoundation.org>
	<be45a323-4379-8a13-71c6-21f98e3a0af4@gmail.com>
	<afa8eed45a5acefa38a89e82e5a833f387963a8f.camel@linuxfoundation.org>
	<20191111104209.GB28797@localhost>
	<63e30a3a07cd78e89c54637ad9893e8a1aec9f84.camel@linuxfoundation.org>
	<20191111141416.GF28797@localhost>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC CFH][sumo 00/47] CVE check backport
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
X-List-Received-Date: Mon, 11 Nov 2019 15:54:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-11-11 at 16:14 +0200, Adrian Bunk wrote:
> On Mon, Nov 11, 2019 at 01:12:47PM +0000, Richard Purdie wrote:
> > On Mon, 2019-11-11 at 12:42 +0200, Adrian Bunk wrote:
> > > On Thu, Nov 07, 2019 at 04:32:35PM +0000, Richard Purdie wrote:
> > > > On Thu, 2019-11-07 at 07:55 -0800, akuster808 wrote:
> > > > ...
> > > > > Are you taking the other patches also submitted for sumo ?
> > > > 
> > > > I am worried about what the bigger picture for this looks like
> > > > but
> > > > we
> > > > could try testing them. I think the TSC needs to discuss this.
> > > 
> > > How were community supported branches supposed to work?
> > > 
> > > All branches from 2.1 (sic) are documented as supported in the
> > > wiki.
> > 
> > That was changed recently
> 
> What was changed recently was that the pre-2.1 branches were marked
> EOL:
> https://wiki.yoctoproject.org/wiki/index.php?title=Releases&diff=62334&oldid=62324
> 
> Non-stable branches are documented as community-supported since 2014:
> https://wiki.yoctoproject.org/wiki/index.php?title=Releases&diff=12747&oldid=12743
> 
> > and I kind of wish we'd waited until we'd
> > followed through with a consistent plan which covers the spectrum
> > of
> > EOL/community/stable/LTS.
> > 
> > As I've said in a few places, the TSC really needs to figure this
> > out
> > and its complicated by the LTS discussions. Those discussions are
> > happening but aren't simple.
> 
> Past releases and future releases might be separate topics.
> 
> Please keep in mind that many people already have to support products
> on existing stable branches, working under the assumption that
> patches 
> submitted by the community will be accepted.
> 
> Closing future non-LTS branches early might be OK if this is part of
> a 
> clearly communicated EOL schedule for future LTS and non-LTS
> releases, 
> like it is clear when Ubuntu releases will be released and for how
> long 
> they are supported.
> 
> But this visibility on upstream support is needed before deciding on
> a Yocto release for a product. Future LTS releases are irrelevant
> for 
> existing products that cannot move to a different stable branch.
> 

current and prior two releases are actively maintained. So that should
have been the consideration when selecting a release for production in
past. see

https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance


> > Cheers,
> > 
> > Richard
> 
> cu
> Adrian
> 
> -- 
> 
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
> 


