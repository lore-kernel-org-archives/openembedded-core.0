Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qh6Q8-0005hJ-GH
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 22:52:37 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jul 2011 13:48:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,526,1304319600"; d="scan'208";a="27585904"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jul 2011 13:48:36 -0700
Message-ID: <4E1E04A4.2060304@linux.intel.com>
Date: Wed, 13 Jul 2011 13:48:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310583292.git.tom_rini@mentor.com>
	<da0990e947463da6c333254055750f36967565ba.1310583292.git.tom_rini@mentor.com>
In-Reply-To: <da0990e947463da6c333254055750f36967565ba.1310583292.git.tom_rini@mentor.com>
Subject: Re: [PATCH 1/4] libsamplerate0: Update checksums
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
X-List-Received-Date: Wed, 13 Jul 2011 20:52:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/13/2011 12:05 PM, Tom Rini wrote:
> Signed-off-by: Tom Rini<tom_rini@mentor.com>
> ---
>   .../libsamplerate/libsamplerate0_0.1.7.bb          |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
> index d08640f..194f885 100644
> --- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
> +++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
> @@ -9,8 +9,8 @@ PR = "r0"
>   SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
>              file://libsamplerate-0.1.7-macro-quoting.patch"
>
> -SRC_URI[md5sum] = "6731a81cb0c622c483b28c0d7f90867d"
> -SRC_URI[sha256sum] = "78ed5d9ff1bf162c4a078f6a3e7432a537dd2f22dc58872b081fb01156027fcc"
> +SRC_URI[md5sum] = "ad093e60ec44f0a60de8e29983ddbc0f"
> +SRC_URI[sha256sum] = "e0a646224a0323ac63f56ef009b2d7fee11452a7b8af139b19ae71d2890dbc9c"
>   S = "${WORKDIR}/libsamplerate-${PV}"
>
>   inherit autotools pkgconfig

Are you sure about this one?  Did you maybe get a bad download from 
someplace?  I just checked the upstream source and it's still the 673 
md5sum.

Sau!


