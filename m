Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RI2vA-0006fb-Su
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 20:37:21 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 23 Oct 2011 11:31:23 -0700
Received: by ywm39 with SMTP id 39so7060191ywm.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2011 11:31:23 -0700 (PDT)
Received: by 10.68.12.138 with SMTP id y10mr42314413pbb.70.1319394682483;
	Sun, 23 Oct 2011 11:31:22 -0700 (PDT)
Received: from [192.168.0.34] ([96.24.77.242])
	by mx.google.com with ESMTPS id jm5sm58100542pbc.1.2011.10.23.11.31.20
	(version=SSLv3 cipher=OTHER); Sun, 23 Oct 2011 11:31:21 -0700 (PDT)
Message-ID: <4EA45D77.7000706@intel.com>
Date: Sun, 23 Oct 2011 11:31:19 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1319380267-29794-1-git-send-email-raj.khem@gmail.com>
	<1319380267-29794-2-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1319380267-29794-2-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH 2/2] pulseaudio: inherit perlnative
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
X-List-Received-Date: Sun, 23 Oct 2011 18:37:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2011 07:31 AM, Khem Raj wrote:
> manpage generatition uses xmltoman utility
> which inturn uses xml-parser. So we add
> libxml-parser-perl-native to DEPENDS and also
> inherit perlnative so it does not use the one
> from build host
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../pulseaudio/pulseaudio_0.9.23.bb                |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> index 33f5e15..9521ab0 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> @@ -1,10 +1,10 @@
>   require pulseaudio.inc
>
> -PR = "r5"
> +PR = "r6"
>
> -DEPENDS += "gdbm speex"
> +DEPENDS += "gdbm speex libxml-parser-perl-native"
>
> -inherit gettext
> +inherit gettext perlnative
>
>   SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.gz \
>     file://buildfix.patch \
This patch is already out there from Martin, I just submitted it in a 
CONSOLIDATED PULL.

Sau!



