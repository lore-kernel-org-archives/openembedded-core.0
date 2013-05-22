Return-Path: <net147@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id BB78B60810
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 23:32:41 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc17so2242579pbc.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 16:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=QWsV1wLf7sTZkxTQE1S9792PaAXyvHGyLvehQK55530=;
	b=PB23bIkn1LC5Zu28FJ9iSuz5S30taYvYpircsJkA+PMs7K/AA/puCTnLYOgvXZvKVL
	6fZHco3kV2RImLn3gaJJCQunqvFPCxarzK3MM/rQgIbDE+9tfQ+OX8ff3TtnXrC4dy9L
	wvcSuud8Vpcd5JVCyfzRvudq8ylipKqDVgrpucfESOunWo+29AdVl6sxGU+x03n6j6x/
	ik5vHAsEOXvDANlAHkX6WPOZo/DLvN7hJYHoVJ03feM6W1MTOZS3KhsiUhBgyJltKIIG
	YVSYMGu4mQfnV8d0+qx0SMvmH3Gs6tiOtosN4UxmhXQKTGfp6MEKMRFt02ylln+g/sJo
	fBQA==
X-Received: by 10.67.4.129 with SMTP id ce1mr10544919pad.107.1369265563052;
	Wed, 22 May 2013 16:32:43 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id if5sm9005040pbb.31.2013.05.22.16.32.40
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 May 2013 16:32:42 -0700 (PDT)
Message-ID: <519D547A.2010204@gmail.com>
Date: Thu, 23 May 2013 09:27:54 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1369265988-32215-1-git-send-email-net147@gmail.com>
In-Reply-To: <1369265988-32215-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] systemd: update to 204
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
X-List-Received-Date: Wed, 22 May 2013 23:32:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2013 9:39 AM, Jonathan Liu wrote:
> Removed patches integrated upstream.
> Added backport of fix for utmp not running at shutdown.
> Updated serial-getty service.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   .../systemd-serialgetty/serial-getty@.service      |  16 +-
>   ...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch |  41 ---
>   ...ystemd-update-utmp-shutdown.service-into-.patch | 367 +++++++++++++++++++++
>   .../0002-readahead-chunk-on-spinning-media.patch   | 142 --------
>   .../systemd/systemd/0003-readahead-cleanups.patch  |  86 -----
>   ...ctl-Handle-missing-etc-sysctl.conf-proper.patch |  33 --
>   .../systemd/systemd/199-firmware.patch             |  98 ------
>   .../systemd/{systemd_199.bb => systemd_204.bb}     |  11 +-
>   8 files changed, 380 insertions(+), 414 deletions(-)
>   delete mode 100644 meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/199-firmware.patch
>   rename meta/recipes-core/systemd/{systemd_199.bb => systemd_204.bb} (95%)
This can now be applied independently of "base-files: add /run directory 
from FHS 3 draft specification" which I will submit an updated patch for 
later.

Regards,
Jonathan

