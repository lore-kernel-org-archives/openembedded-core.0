Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7FA31739BE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 10:31:06 +0000 (UTC)
Received: by wicgj17 with SMTP id gj17so16505787wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 03:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CAmy/9Gz9nMDhgJHWKsdaD3K76ML6341+9hW/ZMdR+A=;
	b=jpGfIag1g3830VzF1TjUfuLphiOmsw34D7eYAJrsSb42+++bDoaleysnrlH7MZBHct
	K2BX70wvQeqeeI53g7mu5zU4OycCsoGkoDdhyoRg5pZtzX2vSXbA24ph6r0/sju1tl2j
	vYVIr4cfLtf3dyH3g34qeZqkiCVfaPQDBw0r2YoihbykLLhWRxUaV+0uvyw/09Dm+GNK
	0MdJ5+14AxXKZBMplpEsQ1Sfm+aPScVv9MKlcvDR6tNryfQVC8/Evzrq/gpR8siWXYdF
	ZxM4YJ0RfDGcJdHE2MtNqJgo/Uj96nIzgQ1/cYhoqbQE63IILJiBSDDDv74ObyoLDDnD
	M3Qg==
X-Gm-Message-State: ALoCoQlu1kfqqE7tXzTxn31jtSXG7o+IhwicK1UJnoO44QltXZ5arvKNC9ftHTU3iE5QDKRomX2Y
X-Received: by 10.194.20.196 with SMTP id p4mr1960652wje.86.1438857066666;
	Thu, 06 Aug 2015 03:31:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.87.1 with HTTP; Thu, 6 Aug 2015 03:30:37 -0700 (PDT)
In-Reply-To: <1438854871-24599-1-git-send-email-topi.kuutela@intel.com>
References: <1438854871-24599-1-git-send-email-topi.kuutela@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 6 Aug 2015 13:30:37 +0300
Message-ID: <CAHiDW_FpxxeLm+UeHeb24015XhW8xV4R+_OBVg1wx2qN2V0aaA@mail.gmail.com>
To: Topi Kuutela <topi.kuutela@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: security: disable -pie -fpie from Python3 compilation CFLAGS when security_flags is inherited.
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
X-List-Received-Date: Thu, 06 Aug 2015 10:31:12 -0000
Content-Type: text/plain; charset=UTF-8

On 6 August 2015 at 12:54, Topi Kuutela <topi.kuutela@intel.com> wrote:
> Signed-off-by: Topi Kuutela <topi.kuutela@intel.com>

Could you add an explanation why this change is done? Also, maybe cut
the the subject line length to something more reasonable if you're
re-submitting.

Jussi

> ---
>  meta/conf/distro/include/security_flags.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index 3724972..ff600fa 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -82,6 +82,7 @@ SECURITY_CFLAGS_pn-python-imaging = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-python-pycurl = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-python-smartpm = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-python-numpy = "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-python3 = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-tcl = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-tiff = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-valgrind = "${SECURITY_NO_PIE_CFLAGS}"
> --
> 2.4.3
>
> ---------------------------------------------------------------------
> Intel Finland Oy
> Registered Address: PL 281, 00181 Helsinki
> Business Identity Code: 0357606 - 4
> Domiciled in Helsinki
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

