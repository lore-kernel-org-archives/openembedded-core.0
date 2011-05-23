Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QORXG-0005CA-En for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 11:34:50 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QORUO-0001dC-M8
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 11:31:52 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <8f9e24ee754c1103f89afd9486c7bd4427b41f92.1306089781.git.sgw@linux.intel.com>
References: <cover.1306089781.git.sgw@linux.intel.com>
	<8f9e24ee754c1103f89afd9486c7bd4427b41f92.1306089781.git.sgw@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Mon, 23 May 2011 10:31:51 +0100
Message-ID: <1306143111.2525.36.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/9] gail: Add LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 23 May 2011 09:34:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-05-22 at 11:48 -0700, Saul Wold wrote:
> -LICENSE = "LGPL"
> -SECTION = "x11/libs"
> -PR = "r1"
>  DESCRIPTION = "GNOME Accessibility Implementation Library"
> +SECTION = "x11/libs"
> +
>  DEPENDS = "gtk+"
>  PROVIDES = "virtual/gail"
>  
> +LICENSE = "LGPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
> +
> +PR = "r1"
> +

If you're changing LICENSE then I think you probably want to bump PR as
well.

p.




