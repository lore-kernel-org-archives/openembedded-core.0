Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 31B497D1A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 19:04:29 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1h9wV5-0006Bf-CF; Fri, 29 Mar 2019 19:45:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1AFK8lDVslhW6SQn9pMAtExM5eC9cYwfscS5fuxkhC4=;
	b=BblERnHeUiCBgs5HG3xGPFnWIg
	HXeunGAXAkqCoo4+PgdpMhjnl22ZBpTM5Ry6fdcoT/Tq5gAycg+MFVPxR5KjXVh8+a4KY2snjIFdO
	ch2FC3k7Vf1xNFiFWLXftlEe1+L5hkEocL8Xqityftr5IWR40p3KKfNZKz3EgQ5mMfHitRRQupWSY
	tD5xxYWzq/Sg/SkWh4srYGTdixoRst84lAbI5uVTlin7XU5K6IRyDiaC5YLkl9i8sqsxPWFroAFuZ
	akrdFalVvApIhtXKFSGQkF6faVoakAZsRWCZpTpgZ4lL8C4gINW7ShbI80BtFvWzjZ7OV2Pz+Oi0y
	oRYeF76Q==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1h9wV1-0005Gj-C6; Fri, 29 Mar 2019 19:45:09 +0100
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20190325234413.12652-1-ross.burton@intel.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <81187d94-e706-91ed-c23b-b3bba5122152@pr.hu>
Date: Fri, 29 Mar 2019 19:45:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190325234413.12652-1-ross.burton@intel.com>
X-Spam-Score: -1.4 (-)
X-Scan-Signature: 7a6493e989a703e6709937009417634f
X-Spam-Tracer: backend.mail.pr.hu -1.4 20190329184509Z
Subject: Re: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Fri, 29 Mar 2019 19:04:29 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2019. 03. 26. 0:44 keltezéssel, Ross Burton írta:
> This isn't a git snapshot recipe but a release that is fetched over it.  For
> clarity, put the PV in the filename.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-devtools/libcomps/{libcomps_git.bb => libcomps_0.1.10.bb} | 1 -
>   1 file changed, 1 deletion(-)
>   rename meta/recipes-devtools/libcomps/{libcomps_git.bb => libcomps_0.1.10.bb} (98%)
> 
> diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.10.bb
> similarity index 98%
> rename from meta/recipes-devtools/libcomps/libcomps_git.bb
> rename to meta/recipes-devtools/libcomps/libcomps_0.1.10.bb
> index ff6820851fe..1c4f3bde65e 100644
> --- a/meta/recipes-devtools/libcomps/libcomps_git.bb
> +++ b/meta/recipes-devtools/libcomps/libcomps_0.1.10.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
>              file://0001-Add-crc32.c-to-sources-list.patch \
>              "
>   
> -PV = "0.1.10"

# opkg compare-version git "<=" 0.1.10 ; echo $?
1
# opkg compare-version git "<=" 1:0.1.10 ; echo $?
0

You need to increase PE to be able to upgrade the new recipe
in case you publish this package in a repository.

Best regards,
Zoltán Böszörményi

>   SRCREV = "86a82fcd155c27092340d15a34f5c75c4da88243"
>   
>   S = "${WORKDIR}/git"
> 


