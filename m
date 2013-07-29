Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5251760958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 09:42:23 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1V3jyA-00009R-GM from Muhammad_Shakeel@mentor.com ;
	Mon, 29 Jul 2013 02:42:22 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 29 Jul 2013 02:42:22 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Mon, 29 Jul 2013 10:42:19 +0100
Message-ID: <51F6392F.60004@mentor.com>
Date: Mon, 29 Jul 2013 14:43:11 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
References: <1374842117-24504-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1374842117-24504-2-git-send-email-jukka.rissanen@linux.intel.com>
In-Reply-To: <1374842117-24504-2-git-send-email-jukka.rissanen@linux.intel.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 29 Jul 2013 09:42:22.0254 (UTC)
	FILETIME=[ECB694E0:01CE8C3F]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] ofono: Add systemd support
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
X-List-Received-Date: Mon, 29 Jul 2013 09:42:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2013 05:35 PM, Jukka Rissanen wrote:
>   do_install_append() {
> -  install -d ${D}${sysconfdir}/init.d/
> -  install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
> +    if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
> +        install -d ${D}${sysconfdir}/init.d/
> +        install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
> +    fi
>   }
>   
>   PACKAGES =+ "${PN}-tests"
We won't need above 'sysvinit' check as we are trying to implement this 
for all packages through systemd class. Please see this: 
http://patches.openembedded.org/patch/54671/

Regards,
Shakeel

