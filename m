Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f174.google.com (mail-it1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id 293BA605BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:08:07 +0000 (UTC)
Received: by mail-it1-f174.google.com with SMTP id w18so2581832ite.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i9cLLbceOSN4qNfG5vtfAHfhvAcEXwOSn3swakQxOlw=;
	b=1v+P/5mIkR+UGJzJRFUqb07lm/NfI4FCYFYNc+e3OUKxiSAanwryrrBHAatzVch4nr
	pK63CqPz5PkdRCGlbr4ceUuykDG5SSgCqt4fhDoMb23hZtZRAfVK4yjYFj8wKkgs5FuM
	nbfxGF32MQRH6pAQHGLQeCCbFrJkNpa4hJJsWE3ssuAgpTjF8gpDqLt+WhroegGNAjD6
	KuI8QsXUEMmWsr5Wd1+4m7BknsPubQYYM4Q3ngOo/Kr/Jc+Y3q1lwZd8xln+oY4PuW3a
	JqhVBZvwF9Cy3wiWFevGH7rpZEnNASnqpWBm73kinIzSvTKJ9nPVHH3VOqFLfh6UsGIO
	nuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i9cLLbceOSN4qNfG5vtfAHfhvAcEXwOSn3swakQxOlw=;
	b=sH8vSpPgO24GL5vl0BVpxw4u6MX7C6XyrAw9SGW78Y1eBC8Xk9zC4si71NHb18duK1
	JDzkpKIFtbSPRPum96lCx+g76m0yFFFWR03EUVIQXHAYjzJa9txb7laSn9Ovj3Tv/zA4
	+zHuCKvDDcQcFaPoU8RHnA+YzcZPSy/ue/ALs2yP35Pago7sXGlWn7RHibYGeI7A1QQM
	ANm5NYC+6Ozcv2DnR8P5YFJSF1XwLKf6EU8hgCUcTMqbgdrG5Z6VoHxVedlmBi49JWRe
	2FHuhwLciBYTMOj4nOynoTsjnejDLfbJnd7GfbYkhduf41wWJ5uCxFJIxMvh9URNgRDK
	FA6A==
X-Gm-Message-State: AJcUukcPmmrZYiXsWteAraSjUI0Drt32bDSSRb5/r57HYFZrcjR+ryDw
	spg5yXE2nr9ORTIaZnTksht3XMRI4hcJTOZK9yif5w==
X-Google-Smtp-Source: ALg8bN5ENVvuaK/Sq07ns5QO0Fe1w5v2QMwEkQEKOkuVR5y3mvKH309NsHQJO8M4m6Jv2mW3R9S5Oss3I0paZKaZwlI=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr4915407itj.62.1547640489095;
	Wed, 16 Jan 2019 04:08:09 -0800 (PST)
MIME-Version: 1.0
References: <1547631438-438973-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1547631438-438973-1-git-send-email-changqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Jan 2019 12:07:58 +0000
Message-ID: <CAJTo0LZbjMKrjDO-NgFkhv3FHPfoDxhXFCuBpiFnj8O+iAYpaw@mail.gmail.com>
To: changqing.li@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: add option of add other type of sdk
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
X-List-Received-Date: Wed, 16 Jan 2019 12:08:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Jan 2019 at 09:37, <changqing.li@windriver.com> wrote:
> +SDK_TAR_TYPE ?= "tar.xz"
> +SDK_TAR_DEPENDS ?= "xz-native"
> +SDK_TAR_CMD ?= "tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_TAR_TYPE}"

Don't call these SDK_TAR because they might not be generating a
tarball.  How about SDK_ARCHIVE_*

Using overrides or flags would let you put the zip logic into oe-core
too, because it is feasible that more than meta-mingw will want to use
zip archives.

Also, add a comment about the expected behaviour of the CMD,
specifically what the input variables are and where the output should
go.  Bonus points fo refactoring slightly so the command is passed an
absolute input directory, and absolute output filename.

Ross

