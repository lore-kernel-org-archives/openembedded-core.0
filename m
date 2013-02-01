Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U1MQJ-0006z9-Pn
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 20:37:20 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Feb 2013 11:21:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,579,1355126400"; d="scan'208";a="281746333"
Received: from unknown (HELO [10.255.12.100]) ([10.255.12.100])
	by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2013 11:21:21 -0800
Message-ID: <510C15B1.3050103@linux.intel.com>
Date: Fri, 01 Feb 2013 11:21:21 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "yanjun.zhu" <yanjun.zhu@windriver.com>
References: <3826> <1359701137-15892-1-git-send-email-yanjun.zhu@windriver.com>
In-Reply-To: <1359701137-15892-1-git-send-email-yanjun.zhu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio_2.1: when do_compile, pulseaudio needs fftw3.h header file. In order to provide fftw3.h, the dependence of fftw is added.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 19:37:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/31/2013 10:45 PM, yanjun.zhu wrote:
> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
>
> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> ---
>   meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> index a576368..5110cca 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> @@ -1,8 +1,8 @@
>   require pulseaudio.inc
>
> -PR = "r15"
> +PR = "r16"
>
> -DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
> +DEPENDS += "libjson gdbm speex libxml-parser-perl-native fftw"
>
This looks like a possibly host contamination issue, since oe-core 
itself does not provide fftw, you could instead add --without-fftw.

This will ensure that fftw is not picked up from the host.

Thanks
	Sau!

>   inherit gettext perlnative
>
>


