Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S80uk-0004Fx-8H
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 03:59:42 +0100
Received: from mail-gy0-f180.google.com ([209.85.160.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 14 Mar 2012 19:50:54 -0700
Received: by ghbz12 with SMTP id z12so3598793ghb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 19:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=RIid69gMfqN6bTq8wga+AtWKzgXZHnhFKi/SIKQ43T0=;
	b=Ja7BygwugMu9RDgxAVZ5QrCLta99l2RZ2G8fBckcL/61npd5FG7e2jOHX0FMpP75p6
	lGUHyo4LVyj9b5scVSe+pwRmtIc58apn+Nv5YX3o21VCURP68+3jQAx0/RHSVKkYBM0r
	ETJMgsDXTnR1oJLEv5pBZjmQdXeuqAK31PYNt6ZlJXgZe3YAUjy2pboRcExxwoqauZBu
	WODldiBs0eCByi4E0vgX7NljscEBEIZd4KwcK1CnPIxct4LmZuP7VBEr2bYPsL8mAHhY
	vpGYTXShFPDWx+cNSlh34RWnlnjp8lS9XNLJaG/OmpFxgZkjymJR1ADRYbTaVYhHx/7D
	XRQw==
Received: by 10.68.72.70 with SMTP id b6mr1138366pbv.58.1331779853772;
	Wed, 14 Mar 2012 19:50:53 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id i3sm780398pbe.33.2012.03.14.19.50.51
	(version=SSLv3 cipher=OTHER); Wed, 14 Mar 2012 19:50:52 -0700 (PDT)
Message-ID: <4F615916.3070007@intel.com>
Date: Wed, 14 Mar 2012 19:51:02 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1331776831.git.nitin.a.kamble@intel.com>
	<bb41438db25e3bf0090107a59a533660052ccceb.1331776832.git.nitin.a.kamble@intel.com>
In-Reply-To: <bb41438db25e3bf0090107a59a533660052ccceb.1331776832.git.nitin.a.kamble@intel.com>
X-Gm-Message-State: ALoCoQl/ZOjA7JC5DdFdJMyjPy6o1oV4G0a03PGNO9Bt99XK03eyuANlGB7tz4RcXEdiUtgM6O9q
Subject: Re: [PATCH 4/8] ncurses: fix install error
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
X-List-Received-Date: Thu, 15 Mar 2012 02:59:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2012 07:02 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> Fix this issue:
> | rm: cannot remove `/srv/home/nitin/builds/build-multilib/tmp/work/x86_64-poky-linux/ncurses-5.9-r6.1/image/usr/lib64/terminfo': No such file or directory
> NOTE: package ncurses-5.9-r6.1: task do_install: Failed
>
> PR not bumped as there is no change in the packages output.
>
> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>

Thank you for catching this.

Acked-by: Scott Garman <scott.a.garman@intel.com>

> ---
>   meta/recipes-core/ncurses/ncurses.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index 3319949..4d64f5e 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -151,7 +151,7 @@ shell_do_install() {
>                   ln -sf xterm-color ${D}${sysconfdir}/terminfo/x/xterm
>           fi
>
> -        rm ${D}${libdir}/terminfo
> +        rm -f ${D}${libdir}/terminfo
>
>           if [ "${PN}" = "ncurses" ]; then
>                   mv ${D}${bindir}/clear ${D}${bindir}/clear.${PN}


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


