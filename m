Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7696FF93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 10:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 27DA431422ED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 12:22:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id bf9EfWq7j8dM
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 12:22:50 +0200 (CEST)
Received: from [172.22.22.61] (55d405ae.access.ecotel.net [85.212.5.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 0EB1F3141B74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 12:22:50 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <cover.1462867278.git.liezhi.yang@windriver.com>
	<a3a4ecac5e2b86715220ca18e6fdffef9de2c151.1462867278.git.liezhi.yang@windriver.com>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <5731B679.30303@opendreambox.org>
Date: Tue, 10 May 2016 12:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <a3a4ecac5e2b86715220ca18e6fdffef9de2c151.1462867278.git.liezhi.yang@windriver.com>
Subject: Re: [RFC PATCH 1/8] qemu-boot.bbclass: add it for runqemu
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
X-List-Received-Date: Tue, 10 May 2016 10:22:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Robert,

On 10.05.2016 10:13, Robert Yang wrote:
> --- /dev/null
> +++ b/meta/classes/qemu-boot.bbclass
> @@ -0,0 +1,39 @@
> +QEMU_NAME ?= ""
> +QEMU_MAHINE_SUBTYPE ?= ""

typo: QEMU_MACHINE_SUBTYPE (here and in some of the .inc files).

Maybe you should use "??=", so "?=" may be used in the arch specific
.inc files, in order to let a machine override it more easily.

Regards,
Andreas


