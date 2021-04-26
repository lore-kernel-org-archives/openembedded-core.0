Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web09.4200.1619426355568530110
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 01:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FTJGR2B5mz5tlL;
	Mon, 26 Apr 2021 10:39:07 +0200 (CEST)
Date: Mon, 26 Apr 2021 10:39:06 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: docs@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [docs] [PATCH] dev-manual/common-tasks.rst: correct the documentation for debuginfod
Message-ID: <20210426083906.4rsmmjryx5mso5bv@qschulz>
References: <20210423174024.705459-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210423174024.705459-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Fri, Apr 23, 2021 at 07:40:24PM +0200, Alexander Kanavin wrote:
> Particularly,
> - correctly describe the use of DEBUGINFOD_URLS; drop it from bitbake variables
> - all necessary component tweaks are enabled by default via DISTRO_FEATURES
> - provide on-target examples of what to look for when things work properly
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 40 ++++++++++++++---------
>  documentation/ref-manual/variables.rst    |  6 ----
>  2 files changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index dcd3a11c3e..e3b9dcef18 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -9705,39 +9705,47 @@ methods you can use: running a debuginfod server and using gdbserver.
>  Using the debuginfod server method
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> -"debuginfod" from "elfutils" is a way to distribute "debuginfo" files.
> -Running a "debuginfod" server makes debug symbols readily available,
> +``debuginfod`` from ``elfutils`` is a way to distribute ``debuginfo`` files.
> +Running a ``debuginfod`` server makes debug symbols readily available,
>  which means you don't need to download debugging information
>  and the binaries of the process being debugged. You can just fetch
>  debug symbols from the server.
>  
> -To run a debuginfod server, you need to do the following:
> +To run a ``debuginfod`` server, you need to do the following:
>  
> --  Ensure that this variable is set in your ``local.conf`` file::
> +-  Ensure that ``debuginfod`` is present in :term:`DISTRO_FEATURES`
> +   (it already is in ``OpenEmbedded-core`` defaults and ``poky`` reference distribution).
> +   If not, set::

I would add where this is supposed to be set (in a distro conf file or
in local.conf if I'm not mistaken?), since it was an information that
was there initially.

For the rest:
Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks,
Quentin
