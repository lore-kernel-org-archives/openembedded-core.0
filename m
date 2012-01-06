Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RjDVE-0004Se-Ot
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 18:22:52 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RjDO6-0003wl-RE
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 18:15:30 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 17:15:29 +0000
In-Reply-To: <e0e076a614e96c92eb02758f77bfab293509be92.1325867350.git.tom.zanussi@intel.com>
References: <4c91ccffa882d1c01bd7abc18b662dce388192be.1325867350.git.tom.zanussi@intel.com>
	<e0e076a614e96c92eb02758f77bfab293509be92.1325867350.git.tom.zanussi@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325870130.12160.10.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 2/5] Add LICENSE_FLAGS to packages mentioned in COMMERCIAL_LICENSE
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
X-List-Received-Date: Fri, 06 Jan 2012 17:22:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 10:45 -0600, tom.zanussi@intel.com wrote:
> diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
> index 5975513..0a90f9c 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
> @@ -2,6 +2,7 @@ require gst-fluendo.inc
>  
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=98326cbb1723a5a97e9b1db62e9faa05"
> +LICENSE_FLAGS = "Commercial"

If I'm understanding the mechanism correctly then just setting all of
these to "Commercial" seems like a bit of a retrograde step.  Is there
an easy way in this new world for me to say that (for the sake of
argument) gst-fluendo-mp3 is acceptable for inclusion but libomixl
isn't?

It seems to me that, for this feature to be much use, the LICENSE_FLAGS
need to be a bit more explicit about spelling out what the requirements
really are for each package.  So, if the issue here is that you need to
pay the MP3 decoder licence on each unit you ship, let's say something
like LICENSE_FLAGS = "mp3-decoder-royalties" rather than just
"Commercial".

p.




