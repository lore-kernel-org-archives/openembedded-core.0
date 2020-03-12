Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7BF4F61B02
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 12:49:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48dTD62nLvz4R;
	Thu, 12 Mar 2020 13:49:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584017351;
	bh=hnr9qjgpVUSQbD9h0ydP+a1+MK3KfjogAkkK6HFCwEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrP4OkYldo4b78+epmDDTbFUsAetcAF0f7YB4cf8uD4pSWQvHoe4YWaVywGOjiOiK
	oy8uokCe+dsSktEGJGTeuyamKi0tPOHtlclQLP8T9Th7pvILVI8ivUol3K6MdLFXrP
	HPvtmHA/H5FYhiJFQn1FBkIpLCxFM2wiswXzFA3PssNK6DuLZldWKBLiUIS4YQEv09
	X3lvP2ZzvTxzzkg+VGS2U6OsuA1ojUFJcxW2+VFesvGJingDc2B2LWafr1J8YASvKn
	TtxYsnKho/408eR1Ipu56TfNtzNz6VA1D4DduBBakF3pEFIBzzclqk9atabUaIwCGE
	//s3Paqoajv+S1sGP+5Oe1IC8CDl94qKsaEqJzjW5i6umPx0xNWD3qOLNhgLHT3U+/
	Ojx9ccjkelmzc4aEowaQcJOPK1yJHn+6Hox9wYqdGcVy5P81hGdyZ8gxTKknogT8rw
	+/NjK+UFMcXAZCN7Z6Lw4MWXkHBxNfoyM3ng95SKpE0qK6UVdpgSgrIQSzpcdgHWxv
	l/TEu3z3uUF8y7WdGORHZOMC0nmw6+mkIyxW9bkBGuws13JENeScng7uRK4zT9fXWD
	Lu9BP5xhnbQ+87LyrPpKF4G7d5goHMlnIKk2W6odJNfp8ryGQp256+nwr79Ajm7RL4
	DYHMlS9ILJ5d8PaipaepqgzY=
Date: Thu, 12 Mar 2020 14:49:08 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Mikko.Rapeli@bmw.de
Message-ID: <20200312124908.GA21921@localhost>
References: <20200312092322.28506-1-stefan.ghinea@windriver.com>
	<67257554ffe08ac11b8f1cf3da115ba5a7e35fbd.camel@intel.com>
	<20200312123418.GR104502@korppu>
MIME-Version: 1.0
In-Reply-To: <20200312123418.GR104502@korppu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [zeus] aspell: CVE-2019-20433
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
X-List-Received-Date: Thu, 12 Mar 2020 12:49:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 12, 2020 at 12:34:19PM +0000, Mikko.Rapeli@bmw.de wrote:
> On Thu, Mar 12, 2020 at 12:25:21PM +0000, Mittal, Anuj wrote:
> > It looks like this is changing the API. I wonder if this would need any
> > other change or break something elsewhere in OE-core, meta-oe?
> > 
> > http://aspell.net/buffer-overread-ucs.txt
> 
> Debian classified issues as minor and fixed only by updating
> to 0.60.8:
> 
> https://security-tracker.debian.org/tracker/CVE-2019-20433
> 
> https://metadata.ftp-master.debian.org/changelogs//main/a/aspell/aspell_0.60.8-1_changelog
> 
> Maybe whitelist for stable branches and update to new version on master?

master already has the new version.

IMHO whitelisting is wrong unless there would be a clear and documented 
policy what kind of vulnerabilities are getting whitelisted.

But even then "Base Score: 9.1 CRITICAL"[1] would make whitelisting 
unlikely in this case.

> Cheers,
> 
> -Mikko

cu
Adrian

[1] https://nvd.nist.gov/vuln/detail/CVE-2019-20433

