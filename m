Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3794E7C71F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 09:57:42 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id i16so1411806wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 01:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=g6L3Hrvv6+mNWdKuM5J3StNamIKCrb+7CN9i5syMB9s=;
	b=WlEOF7TAoy3PpDahd80SAwQWOXte0jGUvWx8UrstaA8//nelLmHgRLu+ikLvQeab6p
	8lltuOFthA/FFWs81A53+4UhkxiePIkHja/d+Ar4THwAUhpAs2sPAeQDY5UKL0WU4L/L
	3mg6Z3B6Cdb1AkTWwkSqlEnKmnrKz9Rq+fdEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=g6L3Hrvv6+mNWdKuM5J3StNamIKCrb+7CN9i5syMB9s=;
	b=O8IvgJyGM7HtOoc7szdSUSdmaLrw99CWaq/OPWmhNxFs+Y6JCyvmMGxQiRr9d61O7u
	9mccSWxsx5tkxoI3B53qSg8yl2yCUoWtirf09FH2xeTj68SuwN25lTh9AwSZ0iMDHdtC
	K11R+M5rn3UdrS6aYVeFYSBGGuGwSeFakg/DBkJh7xbEX6cub4EDa4e7VEZUfKmWfMDJ
	b3FRAWJLi+nGclPZaxfavUT2hMX0HBMG+ORQ+G9Fia1yqdiSX31XBpWdZuKEWqkszifj
	g07R4lFiz0utUiA3gn5pBiionJLByPGYbemS7sitvZhC28pAg1LIUGqH7A64OJTcJ4LH
	BB9w==
X-Gm-Message-State: AHQUAub88cNMoxOZ6vpkCU8B43uczgB4aGnYTS/GfWCJlrJZlzECWnHG
	DT71ZXrjSfUJ4kDIUFjsu8sv4N+jFX0=
X-Google-Smtp-Source: AHgI3IaHOFCkOWT3dpTMMFAbrAEre+VDWYvbnjw9578e+gExtiHVQ1opjD3+iHB+cPvgfHWxpMQOhA==
X-Received: by 2002:adf:f845:: with SMTP id d5mr6574103wrq.113.1550224662861; 
	Fri, 15 Feb 2019 01:57:42 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s4sm2665235wmc.21.2019.02.15.01.57.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 15 Feb 2019 01:57:42 -0800 (PST)
Message-ID: <b82ae00685d2a9a7c6dc2710391e6e0b78a85527.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com
Date: Fri, 15 Feb 2019 09:57:41 +0000
In-Reply-To: <4367f854b1ff23bc2972294715d3837725ee7c43.1550195817.git.kai.kang@windriver.com>
References: <cover.1550195817.git.kai.kang@windriver.com>
	<4367f854b1ff23bc2972294715d3837725ee7c43.1550195817.git.kai.kang@windriver.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] libidn2: fix buildpaths qa warning
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
X-List-Received-Date: Fri, 15 Feb 2019 09:57:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-14 at 21:06 -0500, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Fix buildpaths qa warning of libidn2:
> 
> > WARNING: libidn2-2.0.5-r0 do_package_qa: QA Issue: File
> > /work/core2-64-poky-linux/libidn2/2.0.5-r0/packages-split/libidn2-
> > dev/usr/lib/pkgconfig/libidn2.pc
> > in package contained reference to tmpdir [buildpaths]
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-extended/libidn/libidn2_2.0.5.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> index 0daf7a6877..da77c4402d 100644
> --- a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> +++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> @@ -26,4 +26,8 @@ EXTRA_OECONF += "--disable-rpath \
>  LICENSE_${PN} = "(GPLv2+ | LGPLv3)"
>  LICENSE_${PN}-bin = "GPLv3+"
>  
> +do_install_append () {
> +    sed -i 's#${RECIPE_SYSROOT}##'
> ${D}${libdir}/pkgconfig/libidn2.pc
> +}
> +
>  BBCLASSEXTEND = "native nativesdk"

I have a strong dislike for editing .pc files after the fact. Part of
the concern is sed expressions like this bitrot badly, its hard to tell
if they still work as intended.

Is there not a way we can generate a correct .pc file in the first
place even if that means a patch?

Cheers,

Richard



