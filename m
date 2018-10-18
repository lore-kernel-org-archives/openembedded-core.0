Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1902F79C3B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 10:22:16 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id v2so22087381otk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 03:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EsWbya3Gb5p39u7GtTm/N7dO94MdTQMiXTTPW3c6/U0=;
	b=jNKGbJmq94PH6Y6/3bc7jr7V0pvYHcMi0aQ1eutvmzcDuVz0++Quw10ScGRSCz4UIi
	kZXOMWUC4f+FsyfUtT+w9uRB5nt2m8ZUMJteK5CSdAesB6yRvs1CsV4rIjd4PL/YyTR2
	51LMkXJq4rzicCyn2iNKoOQVZoJ07/DTnNHl7/X9SaBn9+PPRPYALXkmfhkghShR1Hht
	K+OTW3Mm0BIJKBXdDkNsuspdBfz1OlxDErADp1dcuHTpJ2Gyx+jrDQOkE+SXchyGqXtW
	5KnNq7+hSyfwBkxqagRhABbT5fAvd7IXsRo+18XSqwfCspgEwh2zmssW/9YeSLPG7KW2
	ngMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EsWbya3Gb5p39u7GtTm/N7dO94MdTQMiXTTPW3c6/U0=;
	b=IwoUfMdqN6BYNyNsRqJtt+jEQEcORSdkqSQpfqXK1+1obR96fYSKEzGCXGNFmqKri3
	42qpvvjkiAF8OlvjQjQIbE5In1j0tSv9nWhUKJ1hH/gU/wu25wHr8sBmMHWHPuk2t471
	3yxh0O/EHG/1Z3TIkQ+ew8nyXEyK+6vy3gYg3plgCEzLDbGic+8O+kDjH40dpMWYs4OP
	0uW3TIKyyD2SbuLAQlu40OxrtftUEwJ/2m2XlMN+4ny/iiYE1kW5CWJq1Q926HyFWMy6
	w4AtCskWIGV5+rL8oWFhua93Egnao3mh9boVhaPZ72Zyv4u336OL2THMKrstIwuDQuW/
	V9Qg==
X-Gm-Message-State: ABuFfoiLut9LuXGc1F6NPa7c0azKP6EgNv0rI8NTVMsVXJMPulI4/G1j
	5Esqjt6GszR1Ae+xPZd6cuGajVqLcnFsCqP63185+A==
X-Google-Smtp-Source: ACcGV60vRNZVfp4v2BTIKnHmMbVBgyos27bM8i31pi2aI4s1/wzaxbQu38szdGy+R3/eg54WO5Cmv1CUhtIs9RfvMd4=
X-Received: by 2002:a9d:44ca:: with SMTP id p10mr18081970otg.291.1539858138085;
	Thu, 18 Oct 2018 03:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20181017212235.8453-1-danismostlikely@gmail.com>
In-Reply-To: <20181017212235.8453-1-danismostlikely@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Oct 2018 11:22:06 +0100
Message-ID: <CAJTo0LZ=OnvDjJjuDii-2JJTq9FV0YzKxDV3cVCSqJQWy1XcuQ@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] util-linux: alternatify cal, rev, and ionice
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
X-List-Received-Date: Thu, 18 Oct 2018 10:22:17 -0000
Content-Type: text/plain; charset="UTF-8"

Can you rebase this on master?  There's been a lot of changes here recently.

Ross
On Wed, 17 Oct 2018 at 22:22, Dan McGregor <danismostlikely@gmail.com> wrote:
>
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> These are also provided by toybox in its default configuration,
> and can be turned on in busybox.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 60ac9c20064..35c67a8bd53 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -93,7 +93,7 @@ FILES_util-linux-findfs = "${sbindir}/findfs"
>  FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
>  FILES_util-linux-runuser = "${sbindir}/runuser"
>  FILES_util-linux-prlimit = "${bindir}/prlimit"
> -FILES_util-linux-ionice = "${bindir}/ionice"
> +FILES_util-linux-ionice = "${bindir}/ionice.${BPN}"
>  FILES_util-linux-su = "${bindir}/su.util-linux ${sysconfdir}/pam.d/su-l"
>  CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
>
> @@ -209,7 +209,7 @@ ALTERNATIVE_${PN}  = " \
>      dmesg kill more mkswap blockdev pivot_root switch_root \
>      hexdump last lastb logger mesg renice wall \
>      setsid chrt flock utmpdump eject nologin taskset fallocate \
> -    fsfreeze nsenter \
> +    fsfreeze nsenter cal rev \
>  "
>
>  ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
> @@ -219,8 +219,10 @@ ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
>  ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
>  ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
>  ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
> +ALTERNATIVE_LINK_NAME[cal] = "${bindir}/cal"
>  ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
>  ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
> +ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
>  ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
>  ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
>
> @@ -294,6 +296,9 @@ ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
>  ALTERNATIVE_util-linux-unshare = "unshare"
>  ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
>
> +ALTERNATIVE_util-linux-ionice = "ionice"
> +ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
> +
>  BBCLASSEXTEND = "native nativesdk"
>
>  python do_package_prepend () {
> --
> 2.19.0-dev
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

