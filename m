Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 544E6608C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 10:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id A46C13144293;
	Thu, 11 Jul 2013 12:59:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id JJyd6rMq-ehy; Thu, 11 Jul 2013 12:59:38 +0200 (CEST)
Received: from [172.22.22.61] (unknown [212.255.18.206])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id AFBD4314428A;
	Thu, 11 Jul 2013 12:59:38 +0200 (CEST)
Message-ID: <51DE901A.6090900@opendreambox.org>
Date: Thu, 11 Jul 2013 12:59:38 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1373504197-9550-1-git-send-email-obi@opendreambox.org>
	<1373504197-9550-2-git-send-email-obi@opendreambox.org>
	<CAJTo0LZoTFBJ2LmbhxhNxPBd=FjhG6-BVYRw3L4mqNbemfz3og@mail.gmail.com>
In-Reply-To: <CAJTo0LZoTFBJ2LmbhxhNxPBd=FjhG6-BVYRw3L4mqNbemfz3og@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] cogl-1.0: make building cogl-pango optional
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
X-List-Received-Date: Thu, 11 Jul 2013 10:59:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2013 10:56, Burton, Ross wrote:
> On 11 July 2013 01:56, Andreas Oberritter <obi@opendreambox.org> wrote:
>> Add a 'cogl-pango' PACKAGECONFIG option and enable it by default.
> 
> Really picky, but can we call this just "pango"?

I prefer cogl-pango, because I think it's more useful to derive the name
from the configure option rather than from the dependency. This way it
won't conflict with a future option --enable-pango or
--enable-something-else-which-depends-on-pango. If you look at
--enable-gles2 vs. --enable-cogl-gles2, this just seems to be the right
thing to do.

Regards,
Andreas


