Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 03E1A785E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 08:26:01 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id i14so687791pgv.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 00:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DF/8xslnxHg+N/kDp4eEGfYOxi3ENFGSNLOh/yf6pyI=;
	b=XdMulu6D5ZL3D4bwoxXmqtXA7zfq4qmoxqSLLqrYaD/YV2FWowo+6zFDb1/8sEIozZ
	PHUC5cVxQnfJ4pCOd7e4aLyudfiXqvcbGyrfJEihifops68/3gTkue2IdQiXI5aK6TJz
	1pv+whfzFBdWsguusfqPOwxDprRo+ifLu28Jy6aRt4x60Z0TJxodWSVz5h76BWromQMF
	RP0kMWR+LY78kd1vJsg1J7nKXkDGhLYA1APf/FslzGr+pbmh6AwectPtdjSBdbhuJRi9
	tOR9SnmdtA9gDEgGdBq3RHFudcgUNoSL0PPUrw31g1GqVWt5PgWWYaT1h7CiQzZXncRI
	L8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DF/8xslnxHg+N/kDp4eEGfYOxi3ENFGSNLOh/yf6pyI=;
	b=aaf8ReX5RJdcbksp8tTfqtrb+W2mkg5hg1jhBCVnahhsykp0kGZLDP9r/2/qw49m5o
	4PYz19N4r6jVwW2rtdT1YuwGqlx0lKP3Y6gjiI2R+qR+XfUJE09R1xFyLfatr5Yj95Fo
	uw8pVS5H0SDkEalKp/MxRY6ZNCtb9N+5YeP6ynm7gS6ZL/a+A9/UDpZLo35Hta+VRwNY
	Wgv/AcD4SndJC3IfbvFO7L0stJiQJsny4tyu3vpWHWzDwM22whQ7k4XkeyCVPg5/3b7L
	2k5inJvNHM6d4XcFry7vNF+mJkwMYDKFpqywsJ8mTujwQUnL4+/Wfv5pWolDUzFLH+CT
	wuNA==
X-Gm-Message-State: APf1xPDS6C1cTotSSAuJGZp1UlFqibQF/nyHq4JuMQ5VczNmFIgNQqri
	SbiyH2RJst5ExnCzWp0oOboxO+Qy1lgbr991Crc=
X-Google-Smtp-Source: AH8x225XA/64SNd8PjxwcqNF92T7g7TSexXaFbNFGdDQ5Qf+Y3AThypEWiT292+JBI0c7mQb0ZVtqZuSQt20SqRYhF0=
X-Received: by 10.98.18.70 with SMTP id a67mr16921749pfj.213.1519806362785;
	Wed, 28 Feb 2018 00:26:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.139.97 with HTTP; Wed, 28 Feb 2018 00:25:32 -0800 (PST)
In-Reply-To: <c3450d9b913dd74b47d5a6b68518d3d06802d7a8.1519797175.git.Qi.Chen@windriver.com>
References: <cover.1519797175.git.Qi.Chen@windriver.com>
	<c3450d9b913dd74b47d5a6b68518d3d06802d7a8.1519797175.git.Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Feb 2018 00:25:32 -0800
Message-ID: <CAMKF1sosH7NOrugAEOMyRd_p+nFa8Wpjc-cvWK2eSRX6T1bEWQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] meson.bbclass: fix to build for more projects
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
X-List-Received-Date: Wed, 28 Feb 2018 08:26:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 27, 2018 at 9:56 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> We should use the value of CC for the c compiler setting in cross
> compilation configuration file for meson. For example, if we only
> use ${HOST_PREFIX}gcc instead of ${CC}, we would meet the following
> do_compile failure for systemd.
>
>   cc1: fatal error: linux/capability.h: No such file or directory
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/meson.bbclass | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index 31d32a5..97dcf81 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -41,24 +41,19 @@ MESON_CROSS_FILE = ""
>  MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
>  MESON_CROSS_FILE_class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
>
> -CCOMPILER ?= "gcc"
> -CXXCOMPILER ?= "g++"
> -CCOMPILER_toolchain-clang = "clang"
> -CXXCOMPILER_toolchain-clang = "clang++"
> -
>  def meson_array(var, d):
>      return "', '".join(d.getVar(var).split()).join(("'", "'"))
>
>  addtask write_config before do_configure
> -do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS"
> +do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD"
>  do_write_config() {
>      # This needs to be Py to split the args into single-element lists
>      cat >${WORKDIR}/meson.cross <<EOF
>  [binaries]
> -c = '${HOST_PREFIX}${CCOMPILER}'
> -cpp = '${HOST_PREFIX}${CXXCOMPILER}'
> +c = [${@meson_array('CC', d)}]
> +cpp = [${@meson_array('CXX', d)}]
>  ar = '${HOST_PREFIX}ar'
> -ld = '${HOST_PREFIX}ld'
> +ld = [${@meson_array('LD', d)}]


we should do same for ar and nm atleast.


>  strip = '${HOST_PREFIX}strip'
>  readelf = '${HOST_PREFIX}readelf'
>  pkgconfig = 'pkg-config'
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

