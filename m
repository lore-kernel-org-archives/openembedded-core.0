Return-Path: <erik.boto@pelagicore.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9C178271
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 09:01:46 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id e127so13580124wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 02:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=/msTwu38OSxycTH4j1LfFo1xypZxckA4YTX0jDkQW4Q=;
	b=yOBGxGmq2Cnkzd8optISkspenKX89TyeQAyGw5is7ImcP+s/mxtkVJNb/yh6RGoOtc
	feevYbc5XSR6fp8nqKNEuDeYWQuSJcPNv7kX8BBb05YCNIUq6quPmdAVgaPzqAMkYRz8
	NVNAQuANpLRyfqbsFVYwmkZ+TpAfg2EcmQZT5Z0m1FTBp1YcpgzRrt3BYyUidBulSe+B
	DthtaZc9VMUdmIBIuMdrg7PWT+Dxe7pWaL0sfBrwUyD50O0D/wDQj0xpjUWLS/O+XEx9
	nFCJjCI/rl5xIAJ5U31cTvwg0VhmkZZgqzaaN5v4+gmSopDpBBOaoV4czfclRETAc6FB
	75Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=/msTwu38OSxycTH4j1LfFo1xypZxckA4YTX0jDkQW4Q=;
	b=LJ5ATCY5nSRVR+uV4kzXz1zzr8u9Ietj/K+QI3U8n/DxrDdBuex430RGXVtbW5QIzL
	NfNbQ49ZKdnSY6We+5EDizhq3QQPJLQ1kljh9oJGAhcstMtJuNomBlrgtZCaOxBnBshe
	OGkGqijnesrUiU2xX6S6UtiUYxSyASyMT4yz9UW0pkw5uZ1yXziL918OXsfhIEp9y2S2
	FmDpwTCGfa6XJ2XDPdrpcFzwKl+05AEcV4AAXXJod0V65gzUZpgAV926QXaBovcmBtyA
	aEnthpv7jG7rRWdOTb5VF5yawqTuhKMYm5zLHiZ1eoJ4vWYTneppJva8faHuoRowEfaG
	o6iQ==
X-Gm-Message-State: AODbwcBY+Z33+zfEx2od3RKt2KVOHoxq9ozFmuACuunTuscY1r7w9EJF
	wslNdj1PPnPo86pZ5d0n/Q==
X-Received: by 10.28.48.21 with SMTP id w21mr12031565wmw.44.1495789306851;
	Fri, 26 May 2017 02:01:46 -0700 (PDT)
Received: from [172.31.173.74] ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	p76sm1271618wma.15.2017.05.26.02.01.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 May 2017 02:01:45 -0700 (PDT)
To: =?UTF-8?Q?Erik_Bot=c3=b6?= <erik.boto@pelagicore.com>,
	openembedded-core@lists.openembedded.org
References: <20170519142004.32682-1-erik.boto@pelagicore.com>
From: =?UTF-8?Q?Erik_Bot=c3=b6?= <erik.boto@pelagicore.com>
Message-ID: <b41949aa-b992-6403-4b27-c54d22c15279@pelagicore.com>
Date: Fri, 26 May 2017 11:01:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170519142004.32682-1-erik.boto@pelagicore.com>
Subject: Re: [PATCH 1/4] masterimage.py: fix issue with calling reboot on masterimage/DUT
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
X-List-Received-Date: Fri, 26 May 2017 09:01:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I guess an introduction should have been added to this patchset, so here 
it comes a bit late:

These patches are what I needed to do in order to get automated runtime 
tests on target using the systemd-boot target working. There is an open 
bug in the bugzilla for this as well: 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=11524.

Cheers,
Erik


On 05/19/2017 04:20 PM, Erik Botö wrote:
> On systemd systems calling reboot over an ssh connection doesn't
> return as expected causing an exception, therefore wrap the call
> to reboot in order to avoid this issue.
>
> Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
> ---
>   meta/lib/oeqa/controllers/masterimage.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
> index 07418fcda1..6cdcfa3068 100644
> --- a/meta/lib/oeqa/controllers/masterimage.py
> +++ b/meta/lib/oeqa/controllers/masterimage.py
> @@ -108,7 +108,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
>               time.sleep(10)
>               self.power_ctl("cycle")
>           else:
> -            status, output = conn.run("reboot")
> +            status, output = conn.run("{ sleep 1; reboot; } > /dev/null &")
>               if status != 0:
>                   bb.error("Failed rebooting target and no power control command defined. You need to manually reset the device.\n%s" % output)
>   


