Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SKTTv-0008PB-R2
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 13:55:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id C292F315B377
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 13:46:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id KtgGQr4RNcza
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 13:45:55 +0200 (CEST)
Received: from [10.200.6.10] (unknown [82.149.226.166])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 8791C315B36E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 13:45:55 +0200 (CEST)
Message-ID: <4F8EA972.1090304@opendreambox.org>
Date: Wed, 18 Apr 2012 13:45:54 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F847380.6000401@windriver.com>
	<4F8489DE.1050905@opendreambox.org>
	<4F8C24CB.3080607@opendreambox.org> <1334587325.616.4.camel@ted>
	<4F8C379A.3070903@opendreambox.org> <4F8C3B19.40400@windriver.com>
	<4F8EA5CC.6010101@opendreambox.org> <1334749226.24091.67.camel@ted>
In-Reply-To: <1334749226.24091.67.camel@ted>
Subject: Re: MIPS vs MIPS32 tunings -- summary and questions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 11:55:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 18.04.2012 13:40, Richard Purdie wrote:
> On Wed, 2012-04-18 at 13:30 +0200, Andreas Oberritter wrote:
>> now, after having repacked all binary tarballs that had mipsel or
>> mipsel-nf in their name and contents, and after having changed all
>> occurrences of mipsel and mipsel-nf in my local recipes (where
>> appropriate), and after having rebuilt everything from scratch again, it
>> came to my attention that "mipsel" in PACKAGE_EXTRA_ARCHS breaks opkg,
>> because no mipsel packages are being generated. That's what I told
>> before, right?
> 
> How is this breaking opkg? We often have architectures listed in there
> for which there are no packages generated (all, noarch and any spring to
> mind)?

Downloading http://10.0.0.1/mipsel/Packages.gz.
wget: server returned error: HTTP/1.1 404 Not Found
Collected errors:
 * opkg_download: Failed to download http://10.0.0.1/mipsel/Packages.gz, wget returned 1.

Regards,
Andreas


