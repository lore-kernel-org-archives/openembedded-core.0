Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0094E6FF6B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 19:13:12 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id y89so85715555qge.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 11:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fm3K2WdBnaMlv022zXshMu8E9TBgALLAd9B3LOUNnuw=;
	b=vLQb9hJ8gABjY9HIRQcModh6424xr1p2Nz+t+qZU4IEfCLcmniZsEvl2Lt298baIwI
	8/UJ00domCQpJ9LAAUz4zNWnxGmO4dBUQcTdr/4rVWdvPK6mPCE/GO6+Tj6ZrOA0ZQz0
	Ck4ukwExTj0VVuITFCjnOEtRKgjfZHOYNLWmEbeUctD3Lxp3SYdMSIedOeI7e0xpIgiJ
	dXtgxezch9NMr+TY7rsb9yT6+MTOSravfADed8wqhQ61fshjNwsnwLkMkrm7wYD3hhzD
	95/V3epHer2r/abiD8o5B6F3Qpeiix5NxUUxO0jMWkJRztTkFdLs09MUsz3Hi41aQFgH
	rdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fm3K2WdBnaMlv022zXshMu8E9TBgALLAd9B3LOUNnuw=;
	b=Ze6hELwgcoJ+g4ibooVHDruHiL6pNziY/XaKP66yvm+b1HEyZTyXVidWKYlan117JK
	c1lRP+A0VnfiZOywl0MFPhG7+6fhbI3tovirc6sHKwpkkNKAm1mIXTIyOHhWFxa0SM4I
	7stL9vsuAMO3xeCWPREgPa9DoioYINzo6xMd5X705+FakU5givr1ww9OdshB2DcO8FUq
	Jf18GV4w94x8xy52PJmo97Qx4MI0Yq/AXA/ESvO0Y6BtirCnaRuOoXNyuUXPVvtxEc+o
	qmwaGZrAQxrcRnOg2VhKCg1w992W57DcQCCKvZTTZk+BB2jXF4kswPDlqUp4k7v/Tasr
	oXBg==
X-Gm-Message-State: AG10YOTLjfUgLxz/NZ1VRBlsR/GFUN9VIYARJVdJ8la9lsB7dOvfFw4ftSJw/DmP5IcgGDPTZqn0udb7Fkt0nQ==
X-Received: by 10.140.234.16 with SMTP id f16mr25227268qhc.41.1455995593202;
	Sat, 20 Feb 2016 11:13:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sat, 20 Feb 2016 11:12:43 -0800 (PST)
In-Reply-To: <1455932242-852-2-git-send-email-juro.bystricky@intel.com>
References: <1455932242-852-1-git-send-email-juro.bystricky@intel.com>
	<1455932242-852-2-git-send-email-juro.bystricky@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Feb 2016 11:12:43 -0800
Message-ID: <CAMKF1spv9JiMA4CZnnFE=3TAxF_e_dOAAnntVYH5E9V+GFQ0qA@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildstats.bbclass: Don't assume /proc/<pid>/io present
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
X-List-Received-Date: Sat, 20 Feb 2016 19:13:13 -0000
Content-Type: text/plain; charset=UTF-8

Juro

On Fri, Feb 19, 2016 at 5:37 PM, Juro Bystricky
<juro.bystricky@intel.com> wrote:
> It is not guaranteed Linux kernel was configured with process I/O
> statistics enabled. If process I/O statistcs are not present, issue
> a one time warning and do not attempt to read the non-existing stats
> counters.
>
> [YOCTO#9025]
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/classes/buildstats.bbclass | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
> index e58d37b..72a3dd9 100644
> --- a/meta/classes/buildstats.bbclass
> +++ b/meta/classes/buildstats.bbclass
> @@ -25,13 +25,14 @@ def get_process_cputime(pid):
>          'cstime' : fields[16],
>      }
>      iostats = {}
> -    with open("/proc/%d/io" % pid, "r") as f:
> -        while True:
> -            i = f.readline().strip()
> -            if not i:
> -                break
> -            i = i.split(": ")
> -            iostats[i[0]] = i[1]
> +    if os.path.isfile("/proc/%d/io" % pid):
> +        with open("/proc/%d/io" % pid, "r") as f:
> +            while True:
> +                i = f.readline().strip()
> +                if not i:
> +                    break
> +                i = i.split(": ")
> +                iostats[i[0]] = i[1]
>      resources = resource.getrusage(resource.RUSAGE_SELF)
>      childres = resource.getrusage(resource.RUSAGE_CHILDREN)
>      return stats, iostats, resources, childres
> @@ -111,7 +112,14 @@ python run_buildstats () {
>
>      if isinstance(e, bb.event.BuildStarted):
>          ########################################################################
> -        # at first pass make the buildstats heriarchy and then
> +        # If the kernel was not configured to provide I/O statistics, issue
> +        # a one time warning.
> +        ########################################################################
> +        if not os.path.isfile("/proc/%d/io" % os.getpid()):
> +            bb.warn("The Linux kernel was not configured to provide process I/O statistics. (CONFIG_TASK_IO_ACCOUNTING is not set)")
> +

It would be nicer if we also clarified its not the kernel that they
will build but the kernel on their build host. So something like
'Linux kernel on your build host ...."

> +        ########################################################################
> +        # at first pass make the buildstats hierarchy and then
>          # set the buildname
>          ########################################################################
>          bb.utils.mkdirhier(bsdir)
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

