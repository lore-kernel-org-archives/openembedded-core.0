Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 529736004D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 23:05:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47JJFx5Q79z4J;
	Thu, 21 Nov 2019 00:05:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574291158;
	bh=byHn4i8SM4LDr0BZ/Zl5k8gD5wzZqJplKOhUpEwkHA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DE0qmdJWaPBfXlPk8NalQXJIkyH/SpQpbyeTSzkYqdU0rF4VPYQd/95DmMEHS/ZMo
	nFDf2Hbia/E88aGC6jsgM8gtYsSHGttnqN0eCTrD3ZEawbcxUUlj+UR5NfK68VMjdD
	m3ti5IxDovJCqzehXN66WUWqpt4Tm4JrxUm9KSVD7WVKnI+UgC5maWyOGSxJNPcsUU
	Je6RREYIEZjHrMAnMREy3HSyHL2OFX3m/LiJfzPQbZJoVtEyaulpVw+cMd7OOhEPB+
	MrlWO5l4AEVWGPl5n+rf7FbpHB02rOxKeMRfVhPcoQrJEmJjeROQ9ic3vVjGRn77MG
	CTYnIfa44Qoakqe4hDfUvL1IDMrTNtWDg2FFDUUQrE+25x7BtfVF8WFDNovoxP8QQ7
	BtlwYSvjmh/vOJjDi34VxpSmVlyQlpaBot9F9sGiKh3EWLxF9ONrx6iTDz+8bANCgY
	31R+xukDo9cvpPoRHhytUA/7YkkQDvkcmFkQCrhDkwh7jhURxflfWtIQRorruDrHSu
	V6n3rduadbLxo3xx1F+osQJPTN0v2C61ELbsdu/+HtDap7fdGegqx7o2IinKTv1tQY
	DgSmqC0jK2gY5FxqDR+1yWzVnTQpUIHCUMN11Xf6ceJTFlNazchWQRUiMvHurgWLU8
	f7RpvL+CwVJs5h3e2+tIxQjA=
Date: Thu, 21 Nov 2019 01:05:55 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Mikko.Rapeli@bmw.de
Message-ID: <20191120230555.GA3962@localhost>
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<20191120213951.GA3527@hiutale>
MIME-Version: 1.0
In-Reply-To: <20191120213951.GA3527@hiutale>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to backport openssl to Sumo
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
X-List-Received-Date: Wed, 20 Nov 2019 23:05:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 20, 2019 at 09:39:51PM +0000, Mikko.Rapeli@bmw.de wrote:
>...
> I could submit these too if someone wants to setup a communit maintenance branch for sumo.

I would not consider this appropriate for a stable branch. With such 
invasive changes it would no longer be reasonably safe for users to 
follow the branch to receive security updates for other recipes.

In Ubuntu 18.04 security support for OpenSSL 1.0.2 is provided until at 
least April 2023. Similar schedules exist for other LTS distributions.
This provides sources for piggy-backing security support for a few years
after upstream support ends.

> Cheers,
> 
> -Mikko

cu
Adrian

