Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1SkIU4-0002L7-2X
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 19:26:24 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 28 Jun 2012 10:15:28 -0700
Received: by dano14 with SMTP id o14so3148072dan.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 10:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=/3CJwiMLcdnVE7kxgagBQjseQsOtmq7lwyjzIbGzJLs=;
	b=egfQjrM2ddwUW0Yk0F7cDD0KkS290MFU2cEq5m1JgvVGEMobjYxH8GLlHTfpf5Sooj
	ppCCITiAabG+5ZgS9s0YadbLahROLIzE+KucVrckgKLZ5YuYV3sFORR9nXYgY/qBY/e7
	UrbFTcooUcM9941NGTqPspc+b4tSPXxsMF6nP5r0mvWy0pxs/pQhZgheNQ/pS3syLSaZ
	XopKEk0XHpA8ug6rENuz8vcoQg3DGCulBFVxkDlYQFssEvXCQFGTyXp47RXzkK1594iO
	LjhV4AcQykBdpBsoSnAa/J039Z9ciEFExGhIy0Tg0lWuHOK11P/Rj//WjkK9PgB87QfV
	d3dA==
Received: by 10.68.225.9 with SMTP id rg9mr9202363pbc.137.1340903727668;
	Thu, 28 Jun 2012 10:15:27 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id nh8sm2642414pbc.60.2012.06.28.10.15.25
	(version=SSLv3 cipher=OTHER); Thu, 28 Jun 2012 10:15:26 -0700 (PDT)
Message-ID: <4FEC912C.5060308@intel.com>
Date: Thu, 28 Jun 2012 10:15:24 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340741590.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1340741590.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQl6TU3MO/8gbDLNlnFpGBkzpURK9dpgPNzDOz3r1Dv7/fFTaXCN3hERFa+pqK0NKneHzbTz
Subject: Re: [PATCH 0/1] linux-yocto/3.0: update BSP descriptions
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
X-List-Received-Date: Thu, 28 Jun 2012 17:26:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/27/2012 08:25 AM, Bruce Ashfield wrote:
> Saul,
>
> Here's the fix for the 3.0 mpc 8360 build issue on the autobuilder.
> A few boards were missed when updating the BSP descriptions to a new
> format. This completes the effort.
>
> On a related note, we'll bump this to 3.4 support shortly so the tweak
> to the meta data is the best short term fix.
>
> Cheers,
>
> Bruce
>
> The following changes since commit fae565d2bc9090cbb083d44ea5de6b2b80622118:
>
>    linux-yocto/3.4: -rt build fixes + configuration audit (part2) (2012-06-26 14:34:22 -0400)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/3.0-fix
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/3.0-fix
>
> Bruce Ashfield (1):
>    linux-yocto/3.0: update BSP descriptions to new kern-tools format
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


