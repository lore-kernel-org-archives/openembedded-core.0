Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 04CEA8FFE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 19:39:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46YVfq72Yqz56;
	Wed, 18 Sep 2019 21:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568835572;
	bh=v+D1OVlP9JqvczpCYXwIrmibgzU7NzNIgi/GqOtJrgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSbdtJwgLwg0/nAjN52YXv79oS2GqjTdij8ZP+hwraxUBxAkxaZO/mn8kQgGt5mi5
	E42OM8LGQCSFnw9HKdd8iJZQmgbbhZxFpBHug5J3w7DKpD0lWmxKZsWrqVyfb0JaWh
	4Qjc8dbwDaC6pS3EiWRF/kJg9SPJhMf55PDj8atp6+Kmw1kmDCrQjDg2GDr8exOkmz
	9AJu+xrvDj80BEKHcawApz42Oa7N8WYI7U+hzSYnk66zW0yPivO4zJ6Uor5GU9qEyA
	KNhWlpJGq+mZG0EfLToQ3e1bGFHtkbvWl0fEfqrwBQ12xDOyWiM3YAwL6ftoxdIEP2
	4cRYBognwlohYRcU7kECS/boe6lhokx2xAw35uSeIVfeirQkCzc3o9nvxSh/E4pBgk
	496g8qfSMdt3vSiE8s0q4mq9iIattoUpcETGS8ZUGU/nQiJ1uCPIsgE3DLn0yrecwI
	FB5m5VcWr7ZjgujEVHKqVWB8eqxNRb/OvpPV8WhRpLP6Y4PoBGck0njLr8DBOFYoft
	vmAwPCmFy2aBRuwWSw1K7EaaG4vSOgtWhm1NCnSbFaPZ9+kanYWoLMbOSd7uWK8+hF
	kvBTJODUysSLyk7IqVXFl7pArbOoLfwkke/SoUtuk7fm8zwF0mV8phAPpdZfKVy3Ki
	5XU01PuCoVAMtidPZSCrxDWw=
Date: Wed, 18 Sep 2019 22:39:30 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190918193929.GA31517@localhost>
References: <20190918182803.29170-5-bunk@stusta.de>
	<4482de89-631e-bcf7-2b7c-2699a9070e9f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4482de89-631e-bcf7-2b7c-2699a9070e9f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libmpc: Remove dead UPSTREAM_CHECK_URI
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
X-List-Received-Date: Wed, 18 Sep 2019 19:39:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Sep 18, 2019 at 12:00:28PM -0700, akuster808 wrote:
> 
> 
> On 9/18/19 11:28 AM, Adrian Bunk wrote:
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  meta/recipes-support/libmpc/libmpc_1.1.0.bb | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/meta/recipes-support/libmpc/libmpc_1.1.0.bb b/meta/recipes-support/libmpc/libmpc_1.1.0.bb
> > index 1e48c576d4..bbc673ff38 100644
> > --- a/meta/recipes-support/libmpc/libmpc_1.1.0.bb
> > +++ b/meta/recipes-support/libmpc/libmpc_1.1.0.bb
> > @@ -8,8 +8,6 @@ SRC_URI = "${GNU_MIRROR}/mpc/mpc-${PV}.tar.gz"
> >  SRC_URI[md5sum] = "4125404e41e482ec68282a2e687f6c73"
> >  SRC_URI[sha256sum] = "6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e"
> >  
> > -UPSTREAM_CHECK_URI = "http://www.multiprecision.org/mpc/download.html"
> > -
> Does the updating check still work in devtool or AUH?
>...

What "still work"? The website no longer exists.

SRC_URI is GNU_MIRROR, that check does actually start working after the
UPSTREAM_CHECK_URI removal.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


