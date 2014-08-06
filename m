Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id E300865DAC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 13:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 6544A314D7F2;
	Wed,  6 Aug 2014 15:32:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id PxdC1ursIlcT; Wed,  6 Aug 2014 15:32:26 +0200 (CEST)
Received: from [172.22.22.61] (55d45c28.access.ecotel.net [85.212.92.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 55E3F314D7E3;
	Wed,  6 Aug 2014 15:32:26 +0200 (CEST)
Message-ID: <53E22E6A.5030204@opendreambox.org>
Date: Wed, 06 Aug 2014 15:32:26 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "Khan, Yasir" <Yasir_Khan@mentor.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1407267450-64536-1-git-send-email-yasir_khan@mentor.com>,
	<53E20FC8.8090300@opendreambox.org>
	<428317DA8188854B9B82598D29DA15E24E0D30A3@EU-MBX-02.mgc.mentorg.com>
In-Reply-To: <428317DA8188854B9B82598D29DA15E24E0D30A3@EU-MBX-02.mgc.mentorg.com>
Subject: Re: [PATCH v2] wpa-supplicant: use PACKAGECONFIG for ssl selection
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
X-List-Received-Date: Wed, 06 Aug 2014 13:32:36 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Yasir,

On 06.08.2014 14:51, Khan, Yasir wrote:
>>> +PACKAGECONFIG ??= "gnutls"
>>> +PACKAGECONFIG[gnutls] = ",,gnutls"
>> I think libgcrypt should be added here and removed above. At least it
>> doesn't appear to be a runtime dependency when building with openssl, so
>> I suppose it's a gnutls thing.
> 
> As per commit 1fe8f631f, gnutls doesn't depend on libgcrypt anymore but wpa-supplicant does. So I guess it should be in the DEPENDS. 

It does, if built with gnutls, but not with openssl. Look for -lgcrypt
in wpa_supplicant/Makefile, if you want to assure yourself.

> I've made other changes as you've pointed out. I will be sending another patch shortly.

Thanks,
Andreas

