Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1SA80O-0003DD-PM
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 23:58:16 +0100
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 20 Mar 2012 15:49:22 -0700
Received: by pbcuo15 with SMTP id uo15so1528543pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 15:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=DBKBp5yeNpy2EDHX1B6qMefy5wEBwiaK7lLqx4k/hZg=;
	b=FqJJkiTZfRw8RFSUjXhsaFHXQynuUjYY+YDlNYcjg/3OLjcvd/O0izn8OXfVPR6oM4
	FSWmK6kT7B3/QKy3baUPFo/DZrT6ZFcmnk/DZQPK2sIqoFB0yHjQKHFbeSYqP4KtB+bd
	p5gj4epmYd+v/W1M66Ymrz8CLIGtkAl1RY0TV+J3Xkk8RHGX2rtuvvHlT/Pp4Keu5sjC
	fpHu0vL0u0wf90fa6jV3U2Obt1T8Lf0DktUEsXi3RsGhFkeZ3E6nQ3hKDydoNbHCuMbX
	I+o9VlQ0pQ/fiKTHa9m/JZYS7JqIG/eLWRbZNWWhpptZNckWg/XlU9t/D2LiPPlyzcW1
	jp1g==
Received: by 10.68.230.99 with SMTP id sx3mr5298157pbc.55.1332283762231;
	Tue, 20 Mar 2012 15:49:22 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id f6sm2211213pbt.4.2012.03.20.15.49.20
	(version=SSLv3 cipher=OTHER); Tue, 20 Mar 2012 15:49:21 -0700 (PDT)
Message-ID: <4F69096F.8050604@intel.com>
Date: Tue, 20 Mar 2012 15:49:19 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332179433.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1332179433.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQmNmhOz4iwEptu72K2txSug4E29tV6szgGJlmrnYrlVwjicmToEXIs/Hd/hyUdWdIV1FRtm
Subject: Re: [PATCH 0/1] lttng-2.0: fix compiliation error
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
X-List-Received-Date: Tue, 20 Mar 2012 22:58:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/19/2012 10:53 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here's a fix for the recent lttng-2.0 modules build error that
> was reported. The recent -stable update created a collision with
> is_compat_task() that was already being defined as a fallback
> within lttng 2.0.
>
> I've made a patch fix, versus updating lttng-2.0 .. since churning
> this package would be a good idea right now.
>
> Cheers,
>
> Bruce
>
> The following changes since commit a9873f12e5ba11e1307440901d07e9642e9f53bf:
>
>    pigz: Ensure DEPENDS on zlib exists for native and target versions (2012-03-19 14:37:46 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>   compliation error with 3.2.x -stable kernels
>
>   ...ls-protect-is_compat_task-from-redefiniti.patch |   41 ++++++++++++++++++++
>   .../lttng-2.0/lttng-modules_2.0.pre11.bb           |    3 +-
>   2 files changed, 43 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
>
Merged into OE-Core

Thanks
	Sau!



