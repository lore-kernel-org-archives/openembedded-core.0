Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TymFS-0006KF-TP
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 17:35:28 +0100
Received: from mail-ye0-f198.google.com ([209.85.213.198])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 25 Jan 2013 08:19:50 -0800
Received: by mail-ye0-f198.google.com with SMTP id l11so663861yen.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 08:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=IFjZ0RLy8mkTKhybLaIH02uOBql5upKIE2BuNoFl48g=;
	b=WtB+lartzd4WrUI2lMs/dHuKfw/IfhAbyY7XO7pmGfex7cLHSd/NdmS4T2WQkhuvIl
	9eAi3aF7EuDrTJknRLIOYqMHlktNrfsG1sUY9g0WfDurfHmrEJenXDNQXbZZYS2CIkhZ
	8kZhGbPwZysnCRJRZt8z9uCwCJGrD4QeKzNpsGtAs48tY5hk7xBC5qDGr+8BXafZeemU
	7cH7TfF3rJmgNNm0jmrokKm9fpiTXgQFXuow2gUq/6Vh7c4g+Q3KeaIsz/ZdmZH+NQeA
	hKcXvbGWkUZlxnq8Nb1EwiqLtc3Ns9Mg01J4UE9++0jl7DotQkIpA7xz1IWzTr+zT80c
	Frmw==
X-Received: by 10.52.76.7 with SMTP id g7mr5728719vdw.95.1359130789255;
	Fri, 25 Jan 2013 08:19:49 -0800 (PST)
X-Received: by 10.52.76.7 with SMTP id g7mr5728701vdw.95.1359130789087; Fri,
	25 Jan 2013 08:19:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Fri, 25 Jan 2013 08:19:28 -0800 (PST)
In-Reply-To: <1359130193-10991-1-git-send-email-jstashluk@dekaresearch.com>
References: <1359130193-10991-1-git-send-email-jstashluk@dekaresearch.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jan 2013 16:19:28 +0000
Message-ID: <CAJTo0LZbvfWsiVwu1OVtupabzvTbNWmM_XRG-A91UQ+5-1Qo3w@mail.gmail.com>
To: Jeremy Stashluk <stashluk@gmail.com>
X-Gm-Message-State: ALoCoQn5QdI6nCNBfG65U05dJTyDJSiyn7SVYa6oMvOLGcX/YAfSdjxiiV/jKv65j2wrS9pSA2bAxXjE//dRKBj0deaL6nmVV1GxiiJigmaEzb+nTHSEyrRJEole/SlDu4CzOwngohs868iLHILeJF2xU/qQSiUpKgSQOjNlnoW435jvOflj/CxO9JHppKkBE3PIWBB+4oDI
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] gst-plugins-gl: add package recipe
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
X-List-Received-Date: Fri, 25 Jan 2013 16:35:45 -0000
Content-Type: text/plain; charset=UTF-8

On 25 January 2013 16:09, Jeremy Stashluk <stashluk@gmail.com> wrote:
> ---
>  .../gstreamer/gst-plugins-gl_0.10.3.bb             |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
> new file mode 100644
> index 0000000..754efbe
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
> @@ -0,0 +1,12 @@
> +require recipes-multimedia/gstreamer/gst-plugins.inc
> +
> +LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
> +LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
> +
> +DEPENDS += "gst-plugins-base virtual/libgl"
> +
> +SRC_URI[md5sum] = "f066943621e9e18dc4b8e27e869a39cf8893aec9"

Actually tried it this time:

WARNING: Missing sha256 SRC_URI checksum for
/home/ross/Yocto/downloads/gst-plugins-gl-0.10.3.tar.bz2, consider
adding to the recipe:
SRC_URI[sha256sum] =
"48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342cdf2f941c429bf210"
WARNING: Checksum failure encountered with download of
http://gstreamer.freedesktop.org/src/gst-plugins-gl/gst-plugins-gl-0.10.3.tar.bz2
- will attempt other sources if available
ERROR: Fetcher failure for URL:
'http://gstreamer.freedesktop.org/src/gst-plugins-gl/gst-plugins-gl-0.10.3.tar.bz2'.
Checksum mismatch!
File: '/home/ross/Yocto/downloads/gst-plugins-gl-0.10.3.tar.bz2' has
md5 checksum ac70ede13f79978d56eaed8abaa3c938 when
f066943621e9e18dc4b8e27e869a39cf8893aec9 was expected
If this change is expected (e.g. you have upgraded to a new version
without updating the checksums) then you can use these lines within
the recipe:
SRC_URI[md5sum] = "ac70ede13f79978d56eaed8abaa3c938"
SRC_URI[sha256sum] =
"48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342cdf2f941c429bf210"

The corresponding .md5 file in the upstream downloads directory agrees
that ac70... is the correct md5sum, so for some reason your hashes are
stale.

Ross


