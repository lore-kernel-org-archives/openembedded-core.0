Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 121DA6FF9D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 23:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id B09CA315D345
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 00:56:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id WicY4K8TuMXR
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 00:56:13 +0100 (CET)
Received: from [172.22.22.61] (55d4747b.access.ecotel.net [85.212.116.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id AE0F1315D343
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 00:56:13 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <cover.1449075091.git.ross.burton@intel.com>
	<58ec5aaf4b7988eb0feda9961ab4b6f7bd8361c9.1449075091.git.ross.burton@intel.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <565F851D.4080502@opendreambox.org>
Date: Thu, 3 Dec 2015 00:56:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <58ec5aaf4b7988eb0feda9961ab4b6f7bd8361c9.1449075091.git.ross.burton@intel.com>
Subject: Re: [PATCH 2/2] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Wed, 02 Dec 2015 23:56:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Ross,

On 02.12.2015 17:55, Ross Burton wrote:
> +PACKAGECONFIG[directb] = "--enable-video-directfb, --disable-video-directfb, directfb"

s/directb/directfb/

Best regards,
Andreas


