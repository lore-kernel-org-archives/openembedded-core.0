Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF1C7DE88
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 21:41:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 455MDW58pLz3w;
	Fri, 17 May 2019 23:41:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558129276;
	bh=6yqsSbbnEtL5Sk0ggXinF5+KcoZkxa/mTvrSSrySU/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qwh+/gjSyJHnh57Im5IWujzHXwT7rm0SPZpL2yXqXHKblDV0imKipo43TOb5ldbt7
	tCsCYI0oQCXwLkPtvW+d+ZCkyyU10YkBmtqAAoFhED+Yk7iTyZVTLYHNDOG5+Y1ieH
	tVKz+B6fc8PBc30R1QQvV7iNCJfNLNDqtaQ9FcVOhEvmD+SNHG0Hqt6FLUlzRx0d49
	bTP0sd2/YbHyKuUo/T9HuoBcLycrzIS/tWuYqzuJkk2dRkyfGa+JykXJ2Xw/7+j0Gj
	gOK3vK3l/1BGGAOSWHK19ShzJ4zgPLFomz9VwOKRdv28nxtkBh1V+4gBYdycgppik8
	225wwOF5WUg8HzwYfKz6SJuAbOHRXCNb4jzsMXz+PtCxJxHfKO2/XjggEYoBx4RYD/
	UE25cItxCRvBR5sbaXGQPAoJSxDL6RZBRbHNHeEirGegFMQbuXB9eUmlPsOH59gbmN
	VH8SmmXZy6bn0qOGPpNeBCPbDvIc2lOsyve7EhuaYEAsFfsTHBhubohxniv1lVzNH2
	JzRSqSOH/vvbqIVSsHmyxAnbERJSiYjp36YhwTxudHGWAakZ2LUJ2rqX/Sm4odEDRC
	IAxI65Hry1DLttOeD3E8KM8p4XU+RG2BHGp025dAxLMcXTY9E71+o6Qzef/Rv4Ycji
	FHmQIrnlEvA9YzmZmSv11TG4=
Date: Sat, 18 May 2019 00:41:12 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190517214112.GA1047@localhost>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
	<20190517181151.44001-20-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190517181151.44001-20-alex.kanavin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 20/37] gnu-config: upgrade to latest revision
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
X-List-Received-Date: Fri, 17 May 2019 21:41:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 17, 2019 at 08:11:34PM +0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/gnu-config/gnu-config_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> index e597ebedbc1..f52597936db 100644
> --- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> +++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> @@ -8,7 +8,7 @@ DEPENDS_class-native = "hostperl-runtime-native"
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  
> -SRCREV = "058639be227bbe8f03cc39f79f7ce84918012143"
> +SRCREV = "b98424c249119b79d3f709e26eb86f2fd4d5e5f3"
>  PV = "20181128+git${SRCPV}"
>...

PV needs updating to 20190428.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


