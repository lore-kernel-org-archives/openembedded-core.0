Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50528.1795425904424148648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 01:25:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=EXzvbk+8;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=4dPM7ta/;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BACD67A061F
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 04:25:03 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 23 Nov 2026 04:25:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795425903;
	 x=1795512303; bh=X2D0mtIJC2pjMZ/u9NR5owxBSdwo64+xGbJv0205iLg=; b=
	EXzvbk+8SHfUZcbMBXaZBCNqa3oOuR9N9Ng24XdGhzgKI8kTZ0GbFpMpSAdRupTB
	+QgdFSTJ6hVl7fURBuFotP9M+MxrPckVKtPIDblH2J+lMxj0u7T/cqk627eGsgl/
	OVPnel+ok65Bs2xV4cYkYEIqszwB70lcJk1ItMgn4KqCTf/ukg0MVAmJa+csCUSE
	rxZPl4IoBveL4NYbareqMh19xlkFlGayvi5ynt0G6y7NWTA27guPbaxHtYRJRAwm
	71UbTtKTQimhH0QOy9i6CPFmTIqp8s3MfyPh4NYeIEWof7/rJC6s2k6xrYxvgiFM
	pzl6BLNIJRs6a4zMuDoOwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795425903; x=
	1795512303; bh=X2D0mtIJC2pjMZ/u9NR5owxBSdwo64+xGbJv0205iLg=; b=4
	dPM7ta/R1aJxRBLaLk8QAyU5YsvnA4Obk2cunmf/VUinGHzz1Nta5FjuC0uDlvWb
	tHOlJTwLJuukCXtZco+/g06ctPZj9rixmXEtYkX4kNdplZNKLdKBiubcR+Hdf9GB
	dS9wznNOwosk05DCNA6AGxN+SUtOEkwiaD2+Hn8zF2KCyqexIrI1jy3uMtjFAUnK
	w8vQAk283chOTMJ8L8BZP+TihXOS4aYnZyQRgZdYHXK/p2hWtq2p3fMSkYngRyER
	WTXwIBhfVjD/tebMIhmC48xWSvKJcF6NoB2Ju70jDB6Z5nJEfzdLVS2o+rtCe25G
	Bo5wUhqFt+q9KzgUnwXsg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795425903; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:CxdS0tGTrBoSiaM8mOLwqKYhNejaUyA41kx/6fDGkZrf3J0
	vwpHHQjRjA6nyyHjHbd60dRWBtIW/0W/gyljD6XJqV//tu99jNSwpqVmy0wZtOIy
	O0/5q+kh3QKuO06KPxCmYJBknWcwgwCSO39V2aC0tCV4MZ1ki0JaWE38DNLaCoqI
	HkECfmzeKghVonGqDheSTZNGc9VxYLBmykqAbdZ5T3eO2dFnMAc5Hs5hB4jv2TXr
	knvCjxv/2gwtIQptRKBZ9mTXNGWJUI6akixxOr4cEXVgMeLfFh5WSmrE+iKi8MvF
	++a3mRCv9kMSg2elC/F5f5BdSO2ZmZkkdq1GA1g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:bT9Cj2vDxcTxiXwn95Lwhz0h8p/QoPDSRxWUNOkpTeU=:BoHsIUHnUNR6EPBmftlZYNNpu9WIQK6fvbCMz2Y8oAA=;
X-ME-Sender: <xms:bwYEa89ick0M8iniZYuN2-ff6Awf76t5wJBzwJvg5tjawYc9L7gBnw>
    <xme:bwYEa8IDIAl2Ic5bKdYsZKqqoA8HRUuiDGdQRKdwoFEToEdIxjHXCpI7Ss-jSklll
    7deAIsgKiNUudYbZUEexMP10zkCoGXWfA3xl0LRUrIWM-uuwsCgqEI>
X-ME-Received: <xmr:bwYEa_btV40kk6y-8khirpclCbXuCDniCQgLCbYIxrG8Zw4irzHx5I5iOq6Um9WcHo06s5uxN1E9gnrt4Y4DA0CMIvQE>
X-ME-Proxy-Cause: dmFkZTGGZkQxyLLDdW7hvlW5BO0AXT/v6FnosbSvbNrfOY/SzPTxY3+4fiu9lZHawUNs7j
    ra1IV7/1fm6ajXCyHxSssmRFvXgy0KtVeFQnXAmVRz5Qx9mTuIjz8IqCU7IUU00BxTbb3j
    RYqmdx48+pc+3hDcUqLvlhh/vzGSYTs8bRgUd6pKQe97slOmgFM1h6+QNHCMlqSwJpsQBA
    1EwmCfB4wrYs3JXBbGUSUd8ItYMacX5ZlolKC6GPr2fEN7lydz73DK2tFrBIR537qYpjlc
    gswW9GzkKwAMPT82T8O6CYhaHaRM/zsYE0cIWk4qQderGJBAif8JHwhCb4RJ8y+yLYG4Cx
    REydlsR+BLSgrVrq8Hzs6/TXW3MVA4y/SaZYUDxyX8ftgGPXvPmgFTza2YDHGDxU8wuHX4
    fGxIkTPsdoLmdJrt5Yid+V64xl7ExNDt1Yej6/91szY+bCPps1X28Sr3LDUBzMwd2sMIU3
    e+A2w+P6I5wsBr0DCa+sex1AfH/UAbrWlVuMLHgLE/QEOr0wH+VYp1zLFhLt6hUyFTAnl6
    OHF1VcI1WCmjelO7xJZk6gLPUW3fgH4qrZwJN5d4eQIQm37li7sxZ4VUoKNYJZTnYNNNT4
    LlYEzfHZ/zPwARPpUtGg7YsnWSUH+IxB6HT5VMTKyzNpxpHAw5NltZCaPa0A
X-ME-Proxy: <xmx:bwYEa2LZzcla41emGhr5Nng8pCsmOKa-knRmIiq_VRe0xMiECeXiWg>
    <xmx:bwYEa1AWraqEa4vt1bA6EoyIjefFBAZp7I-NWpyDpTYtWOQfhu199w>
    <xmx:bwYEazrhDypQTxEp1s-4wPmiU3kxu4s5l47vSEFQAh3GAOPlaFaMfA>
    <xmx:bwYEa4gLaIhVH9ZlMrCYSY7yhyusavv76dCqXUSO7Syvmxtqm98-eA>
    <xmx:bwYEa4GpV2rZ6CnP5JG2emvfM264f5eWrHu7DQ4cEjmtQLZwquPDW9Eb>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 04:25:02 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 09:25:00 +0000
Message-Id: <DN2HD431V6TX.3GQ0CXC17IQLQ@pbarker.dev>
Subject: Re: [PATCH] oe-init-build-env: fix unbound variable errors under
 'set -u'
From: "Paul Barker" <paul@pbarker.dev>
To: "Babanpreet Singh" <bbnpreetsingh@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Cc: "Ross Burton" <ross.burton@arm.com>
X-Mailer: aerc 0.22.0
References: <20261111195604.7-1-bbnpreetsingh@gmail.com>
In-Reply-To: <20261111195604.7-1-bbnpreetsingh@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 09:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250890

On Wed Nov 11, 2026 at 7:56 PM GMT, Babanpreet Singh wrote:
> Sourcing oe-init-build-env from a shell running with 'set -u' fails:
>
>   ./oe-init-build-env: line 29: BBSERVER: unbound variable
>
> Give the variables that may be unset an explicit empty default, here
> and in oe-buildenv-internal.
>
> [YOCTO #15469]
>
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
>  oe-init-build-env            | 14 +++++++-------
>  scripts/oe-buildenv-internal | 22 +++++++++++-----------
>  2 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/oe-init-build-env b/oe-init-build-env
> index 5a2bd0f4d9..660c6ad02e 100755
> --- a/oe-init-build-env
> +++ b/oe-init-build-env
> @@ -14,9 +14,9 @@
>  # when being sourced.  To workaround the shell limitation use "set <buil=
ddir>"
>  # prior to sourcing this script.
>  #
> -if [ -n "$BASH_SOURCE" ]; then
> +if [ -n "${BASH_SOURCE:-}" ]; then
>      THIS_SCRIPT=3D$BASH_SOURCE
> -elif [ -n "$ZSH_NAME" ]; then
> +elif [ -n "${ZSH_NAME:-}" ]; then
>      THIS_SCRIPT=3D$0
>  else
>      THIS_SCRIPT=3D"$(pwd)/oe-init-build-env"
> @@ -26,16 +26,16 @@ else
>          exit 1
>      fi
>  fi
> -if [ -n "$BBSERVER" ]; then
> +if [ -n "${BBSERVER:-}" ]; then
>      unset BBSERVER
>  fi
> =20
> -if [ -z "$ZSH_NAME" ] && [ "$0" =3D "$THIS_SCRIPT" ]; then
> +if [ -z "${ZSH_NAME:-}" ] && [ "$0" =3D "$THIS_SCRIPT" ]; then
>      echo "Error: This script needs to be sourced. Please run as '. $THIS=
_SCRIPT'" >&2
>      exit 1
>  fi
> =20
> -if [ -z "$OEROOT" ]; then
> +if [ -z "${OEROOT:-}" ]; then
>      OEROOT=3D$(dirname "$THIS_SCRIPT")
>      OEROOT=3D$(readlink -f "$OEROOT")
>  fi
> @@ -43,12 +43,12 @@ unset THIS_SCRIPT
> =20
>  export OEROOT
>  . "$OEROOT"/scripts/oe-buildenv-internal &&
> -    TEMPLATECONF=3D"$TEMPLATECONF" "$OEROOT"/scripts/oe-setup-builddir |=
| {
> +    TEMPLATECONF=3D"${TEMPLATECONF:-}" "$OEROOT"/scripts/oe-setup-buildd=
ir || {
>      unset OEROOT
>      return 1
>  }
> =20
>  unset OEROOT
> =20
> -[ -z "$BUILDDIR" ] || cd "$BUILDDIR"
> +[ -z "${BUILDDIR:-}" ] || cd "$BUILDDIR"
> =20
> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index 2fdb19565a..6b2e4ea518 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -19,12 +19,12 @@ if ! $(return >/dev/null 2>&1) ; then
>  fi
> =20
>  # It is assumed OEROOT is already defined when this is called
> -if [ -z "$OEROOT" ]; then
> +if [ -z "${OEROOT:-}" ]; then
>      echo >&2 "Error: OEROOT is not defined!"
>      return 1
>  fi
> =20
> -if [ -z "$OE_SKIP_SDK_CHECK" ] && [ -n "$OECORE_SDK_VERSION" ]; then
> +if [ -z "${OE_SKIP_SDK_CHECK:-}" ] && [ -n "${OECORE_SDK_VERSION:-}" ]; =
then
>      echo >&2 "Error: The OE SDK/ADT was detected as already being presen=
t in this shell environment. Please use a clean shell when sourcing this en=
vironment script."
>      return 1
>  fi
> @@ -39,8 +39,8 @@ if [ "$py_v38_check" !=3D "True" ]; then
>  fi
>  unset py_v38_check
> =20
> -if [ -z "$BDIR" ]; then
> -    if [ -z "$1" ]; then
> +if [ -z "${BDIR:-}" ]; then
> +    if [ -z "${1:-}" ]; then
>          BDIR=3D"build"
>      else
>          BDIR=3D"$1"
> @@ -61,7 +61,7 @@ if [ -z "$BDIR" ]; then
>              return 1
>          fi
>      fi
> -    if [ -n "$2" ]; then
> +    if [ -n "${2:-}" ]; then
>          BITBAKEDIR=3D"$2"
>      fi
>  fi
> @@ -72,9 +72,9 @@ else
>  fi
>  unset BDIR
> =20
> -if [ -z "$BITBAKEDIR" ]; then
> -    BITBAKEDIR=3D"$OEROOT/bitbake$BBEXTRA"
> -    test -d "$BITBAKEDIR" || BITBAKEDIR=3D"$OEROOT/../bitbake$BBEXTRA"
> +if [ -z "${BITBAKEDIR:-}" ]; then
> +    BITBAKEDIR=3D"$OEROOT/bitbake${BBEXTRA:-}"
> +    test -d "$BITBAKEDIR" || BITBAKEDIR=3D"$OEROOT/../bitbake${BBEXTRA:-=
}"
>  fi
> =20
>  BITBAKEDIR=3D$(readlink -f "$BITBAKEDIR")
> @@ -89,11 +89,11 @@ if [ ! -d "$BITBAKEDIR" ]; then
>  fi
> =20
>  # Add BitBake's library to PYTHONPATH
> -PYTHONPATH=3D$BITBAKEDIR/lib:$PYTHONPATH
> +PYTHONPATH=3D$BITBAKEDIR/lib:${PYTHONPATH:-}
>  export PYTHONPATH
> =20
>  # Remove any paths added by sourcing this script before
> -[ -n "$OE_ADDED_PATHS" ] && PATH=3D$(echo $PATH | sed -e "s#$OE_ADDED_PA=
THS##") ||
> +[ -n "${OE_ADDED_PATHS:-}" ] && PATH=3D$(echo $PATH | sed -e "s#$OE_ADDE=
D_PATHS##") ||
>      PATH=3D$(echo $PATH | sed -e "s#$OEROOT/scripts:$BITBAKEDIR/bin:##")
> =20
>  # Make sure our paths are at the beginning of $PATH
> @@ -114,6 +114,6 @@ SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_M=
AKE GIT_PROXY_COMMAND \
>  SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA BB_SETSCENE_=
ENFORCE \
>  BB_LOGCONFIG"
> =20
> -BB_ENV_PASSTHROUGH_ADDITIONS=3D"$(echo $BB_ENV_PASSTHROUGH_ADDITIONS $BB=
_ENV_PASSTHROUGH_ADDITIONS_OE | tr ' ' '\n' | LC_ALL=3DC sort --unique | tr=
 '\n' ' ')"
> +BB_ENV_PASSTHROUGH_ADDITIONS=3D"$(echo ${BB_ENV_PASSTHROUGH_ADDITIONS:-}=
 $BB_ENV_PASSTHROUGH_ADDITIONS_OE | tr ' ' '\n' | LC_ALL=3DC sort --unique =
| tr '\n' ' ')"
> =20
>  export BB_ENV_PASSTHROUGH_ADDITIONS

Hi,

This change looks good to me, but it does suggest we need a test case
here for sourcing oe-init-build-env in a script using `set -u`. Are you
able to write a test case?

Best regards,

--=20
Paul Barker

