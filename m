Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id DF0356FBB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 22:27:23 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 200so2033190ykr.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 15:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=gHLMMLQRNt5bHmVku3KevHtD4pfNJR7+/YZdlC0zY24=;
	b=QI49pcYtECxpfp9uCh6gV9xILRqNrKPFDyl1BZ6BMwSPeLDdp1ZddOsFKBNMHbXNQV
	JlKM9OTVxlBJj4KmZo2uqGwtpLaoEUmh3c3DttD4UOJGa8RtNogCHvZMhxqSovRGlKyZ
	pBpnTuoNDNCebbDfIyd0vvA6fKtvQP13b3weKKfHS8p/egAbmkF+zVDUVsHEqWNzK8/O
	EG81raSPUggm+dSsO1DKLFqIfJlrvGAUTqIMIhOSyyrE28lFzL0GFJ3JAUPIolJQZ9pj
	GqM6AHITmVrfJ8zQSzdL9iVhFHx5VmNcLeqYY6g1a/dNspgSLHI8zQdYRENyKZSmvG1K
	LzYQ==
MIME-Version: 1.0
X-Received: by 10.236.30.198 with SMTP id k46mr12187336yha.72.1412980044611;
	Fri, 10 Oct 2014 15:27:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.70 with HTTP; Fri, 10 Oct 2014 15:27:24 -0700 (PDT)
In-Reply-To: <1412965751-9778-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1412965751-9778-1-git-send-email-alejandro.hernandez@linux.intel.com>
Date: Fri, 10 Oct 2014 19:27:24 -0300
X-Google-Sender-Auth: SDYdNPKk1K4eMSceHBgRCc6EBKo
Message-ID: <CAP9ODKqXsBNFWkdmnMtHYFO=CmJFhnCii=aLOqFpZXKhfVQ62w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildinfo: Added buildinfo recipe
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
X-List-Received-Date: Fri, 10 Oct 2014 22:27:32 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 10, 2014 at 3:29 PM, Alejandro Hernandez
<alejandro.hernandez@linux.intel.com> wrote:
> Writes build information to target filesystem to help developers
>
> [YOCTO #6770]
>
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  meta/recipes-extended/buildinfo/buildinfo_0.1.bb | 34 ++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta/recipes-extended/buildinfo/buildinfo_0.1.bb
>
> diff --git a/meta/recipes-extended/buildinfo/buildinfo_0.1.bb b/meta/recipes-extended/buildinfo/buildinfo_0.1.bb
> new file mode 100644
> index 0000000..b299efb
> --- /dev/null
> +++ b/meta/recipes-extended/buildinfo/buildinfo_0.1.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION = "Writing build information on target filesystem"
> +SECTION = "MISC"

MISC? I'd use base.

> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +PR = "r0"

Don't set PR please.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

