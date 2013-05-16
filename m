Received: from mail-bk0-f45.google.com ([209.85.214.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1UczBp-0001S1-EP
	for Openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 16:29:58 +0200
Received: by mail-bk0-f45.google.com with SMTP id je9so1692735bkc.4
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:reply-to:organization:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=5UCXHq/2KQzYbu9KaZEDJZgdBICIJNxeNfqF6L2g0MY=;
	b=LvT7UskOOEUv3AttPJZsiH23I8Ihk/vbOUKq0diGFa3kP/4FIDmipyCvVPct7z7TM+
	MZ+CLmZ9HoE1C3u+RDsn9u51+lxdP9bOMI6oqGJaOCgRRWYcu5BUQIBO6HgHpUMxMP3e
	dFhquGK1kkDfeRh9jHfwpAV5zOEIFiW5+r9sLe2Vksc0S1tn7X1rmhGPP2FgT3yX/42a
	4JmwMP9v7ximz3M0m9b6Ps3WO0DRTB19iHul9Cw53qzc1JYUMa4qUuKJ7PMlqZqpdjwH
	fHmQw/eMWTFwmTXvg8khzNi0rXiYtj8Py2aqjYbY97e744ctCPOdZoyYEmE6ecwb77Xk
	+b9w==
X-Received: by 10.204.246.194 with SMTP id lz2mr13111287bkb.98.1368713499096; 
	Thu, 16 May 2013 07:11:39 -0700 (PDT)
Received: from [192.168.0.5]
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPSA id v6sm2087758bko.3.2013.05.16.07.11.35
	for <Openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 May 2013 07:11:37 -0700 (PDT)
Message-ID: <5194E914.5010701@gmail.com>
Date: Thu, 16 May 2013 16:11:32 +0200
From: Marco <koansoftware@gmail.com>
Organization: MC
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Openembedded-core@lists.openembedded.org
References: <5194DFF9.5080103@gmail.com>
In-Reply-To: <5194DFF9.5080103@gmail.com>
Subject: Re: Problem with QTcreator and meta-toolchain-qte
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: koansoftware@gmail.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 14:30:02 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Il 16/05/2013 15:32, Marco ha scritto:
> Host development machine
> - Ubuntu 12.04 (native and into In WmWare virtual machine)
>
> OE/Yocto version
> - Yocto Dylan 1.4 (and master)
>
> Machine
> - imx53-qsb (and at91sam9263)
>
> After setting /opt/poky/1.4/environment-setup-arm......
> I can successfully make the Qt/e app in console mode, but...
>
> 1. Launching compilation into QTcreator I get this final message
>
>   http://pastebin.com/NVWCb4yq
>

This happens only in Debug build mode and is only a warning because the 
binary is generated.

TIA
-- 
Marco


