Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id C796F71C3D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 14:06:41 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1eihPu-0005Za-0R; Mon, 05 Feb 2018 15:06:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mBD7whQIBJJJ4CaeByyPypF+mc4l4/QPT4AauSxrJuc=;
	b=RI9vUulI33FNU4WbIKaVZ7ojgr
	/IeuUaciKmwH0d+bbCIjAWfhxlzW+rG42cRtWJZqe8uuMBX4rm67KmVKNs6KUIDx179hGjpjuhVsJ
	oL1/5CyOMF6DOBHfwMm1jAsWlvvdCNoC2zOrlYIRZQCdOAlNv+aGnDTiEu0EAwJh8o5UOvj/xBsHx
	M0nrL047uU8tHt3wgY45jr+P8sPGGkSI5vp0dqTy47ymV5wN3RWy492hY42+5DuT5bVPnTZNoIiqm
	Q4qaXw+ewZGu8O4zeadWTPuXAlEg1lzE/ZPsDShurr/FYqqiqZcW2Z9ltOCQlpaYsNOEWtDdMrpqN
	lO2v+9Dw==;
Received: from host-87-242-32-111.prtelecom.hu ([87.242.32.111]
	helo=s002.sicom.com)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1eihPp-00045p-9K; Mon, 05 Feb 2018 15:06:39 +0100
To: mpvader <mvader@victronenergy.com>,
	openembedded-core@lists.openembedded.org
References: <1517782997-32315-1-git-send-email-mvader@victronenergy.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <575bced0-3a91-cea6-ba14-fc2346907620@pr.hu>
Date: Mon, 5 Feb 2018 15:06:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517782997-32315-1-git-send-email-mvader@victronenergy.com>
X-Spam-Score: 0.5 (/)
X-Scan-Signature: eb3d9b7f1f3400e9adcc1170d01d5e4d
X-Spam-Tracer: backend.mail.pr.hu 0.5 20180205140639Z
Subject: Re: [PATCH] classes/npm: replace cache clear with cache clean --force
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
X-List-Received-Date: Mon, 05 Feb 2018 14:06:42 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

I have already sent this patch (although a little extended) last week:
http://lists.openembedded.org/pipermail/openembedded-core/2018-February/147071.html

2018-02-04 23:23 keltezéssel, mpvader írta:
> npm now requires --force to clean the cache, see [1]. Also, use
> clean instead of clear since the latter is an alias.
> 
> [1] https://github.com/npm/npm/commit/34f24c8381235790945208d25ac193bc97a21b79
> 
> Signed-off-by: mpvader <mvader@victronenergy.com>
> ---
>   meta/classes/npm.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index a69bedb..43aed36 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -31,7 +31,7 @@ npm_do_compile() {
>   	fi
>   	npm set cache ${WORKDIR}/npm_cache
>   	# clear cache before every build
> -	npm cache clear
> +	npm cache clean --force
>   	# Install pkg into ${S} without going to the registry
>   	if [  "${NPM_INSTALL_DEV}" = "1" ]; then
>   		npm --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --no-registry install
> 


