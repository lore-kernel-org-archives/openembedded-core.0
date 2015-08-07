Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 30251766E5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 03:05:44 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so24007438igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 20:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=k/B78rmTyWXue41fjTGN3Lg05FL3o00m3sfvyt/dBls=;
	b=ZSN7qQqhuL7p+VgF117eCH1XMQrhzo3EfIAW74cHOMKNpILu+CXeLhlkJQbRLbzhde
	z1oqQZi5AI1fDa/1Yv4+iweLSvZFrBWsU7cA13chfsyEISYFV+XURprrpyv9woKVeeI/
	IXIDuH7lV8sUk1tJNv9ow37jn2O5npEsgHJIvAnubZwJat5NPakVQiNX1CZPKgwxWkPk
	UtfP6oUFe8pekPc+Gt9RmQOITeRlpDKxsVNgGOYES+obxXenTNk2wDOh518oBPeLLuI2
	txr9mzG3hHDPup55rHX0l1GzgrbclH8EWAl1t6Qm1Wc9M/Xf3ZIl1jsz5yEUznVqFo1V
	QX5w==
X-Received: by 10.50.30.105 with SMTP id r9mr684127igh.11.1438916744612; Thu,
	06 Aug 2015 20:05:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 6 Aug 2015 20:05:15 -0700 (PDT)
In-Reply-To: <1438858133-27768-1-git-send-email-topi.kuutela@intel.com>
References: <1438858133-27768-1-git-send-email-topi.kuutela@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Aug 2015 20:05:15 -0700
Message-ID: <CAMKF1soZZCMjwGOrKC7N1tN2ujWwTu2ukL5_iOao0ks6cGt=Cw@mail.gmail.com>
To: Topi Kuutela <topi.kuutela@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3: security: disable -pie and -fpie from Python3 compilation.
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
X-List-Received-Date: Fri, 07 Aug 2015 03:05:50 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 6, 2015 at 3:48 AM, Topi Kuutela <topi.kuutela@intel.com> wrote:
> If security_flags.inc is 'required' to the image, -pie and -fpie options
> are added to CFLAGS. These are not compatible with -shared GCC option but
> cause linker errors which are not reported by bitbake.

what error do you run into ? can you also add that here

>
> Signed-off-by: Topi Kuutela <topi.kuutela@intel.com>
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

