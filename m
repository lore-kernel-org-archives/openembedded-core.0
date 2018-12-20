Return-Path: <ross.burton@intel.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id EC10C6C0DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 12:16:57 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id t18-v6so1353573ljd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 04:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7GVlWN+bMPPmHcVuPeIsLvcfcLvw9J9pVX6YghYdRT4=;
	b=dBii3EUef0MhIOoGcEV7knS1B1JD4Ng443rUu/6/IdJlL7iz0unNB4Exal7E+wowyv
	h92QYnUW9UwRQAa1CVJmd+PeYPJ8FMwc5nWbG9+LnAL0xoxeuF+K8p5o6UZTvSORb1mS
	zuPPydNiLb/AbobM6NjR36w0MpA+XLYANL4sOuv/3A+TuhYlM+P2yC7K+4Bd6wolBNwP
	rXEaQPMhArygWY/Y8ym7ZXJ/83TvQ+GkHZ9wVAFQRzxaXPyMgo5qHj1qgpYrbZQ5+qBc
	XHulpng3X+K16YyZ7cqZROJuFPus7CXTzMfkk55wFDHbrHOK+RzbgjiLfT7BRf80DILm
	fZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7GVlWN+bMPPmHcVuPeIsLvcfcLvw9J9pVX6YghYdRT4=;
	b=VVguARMfW9fxEeE1HQuMJCkdQ/5siKmz/VPzFGfez1hjv6js9vWyrduRHrYcZ2BsJO
	vWNats7Sb0IAGeZ4OzlkepO0ao0GGGJumLJIJNh0Ov+FwaWbovgYxyZYCMdl2atZkIDX
	qcHYrHb5Mh1qdchl7LqNKQKIMP6OwGuonIGnXvgEL4qGpi7uRZeVargSEcy+IMd0oS1i
	1BQ9XOoT8O4386cUzTO1vQmx/IFa10m6ecJF30SVsH58hbjrixZIcuDFNwDJ0KcIM/Fk
	ZpC2QFSnayk+7D+cX2Zl2reDlzBuCNuLRe+mAIm6SnCxROVL1I3GwHvxBo5An15l0NhZ
	MDYw==
X-Gm-Message-State: AA+aEWYHHxuhEVQbqE1oqWLPxPGMOPMmfwpJ4xGk7N/9pWtQ9TRlyA1z
	94Mx7D8RESnq6ck/qOouwhOlPzgWurI8LIqFEAPlB/q4CLo=
X-Google-Smtp-Source: AFSGD/VMJwjldHMMl+KFUuOESU0pBhO3/2GCe/ibsZx3PRsMKMkcQGLuKn6eZr8PXNo7CT0dxZODV5dDMylYVb/L+LM=
X-Received: by 2002:a2e:6503:: with SMTP id
	z3-v6mr14682549ljb.153.1545308218511; 
	Thu, 20 Dec 2018 04:16:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1545202218.git.liezhi.yang@windriver.com>
	<f8c21c17d3ad2ca31c4b26b23b74ab0bdefd2c77.1545202218.git.liezhi.yang@windriver.com>
	<CAJTo0LZOd5hFgFWqvYL2ucusTLCNymf9Jo__yf5Hd1SGeCytrA@mail.gmail.com>
	<9bc35e55-7246-76eb-8726-bb717ad5979c@windriver.com>
In-Reply-To: <9bc35e55-7246-76eb-8726-bb717ad5979c@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 12:16:45 +0000
Message-ID: <CAJTo0La6Cbc1ANFPkYoDXQEs-LOCHgZpESt1pL=7=M=2-t7E4w@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] cmake-native: Set --parallel for configure
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
X-List-Received-Date: Thu, 20 Dec 2018 12:16:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Dec 2018 at 06:46, Robert Yang <liezhi.yang@windriver.com> wrote:
> +               --parallel="${@oe.utils.parallel_make_argument(d, '%d')}" \

Tweaked when merging to mut to be:

+       ${S}/configure --verbose --prefix=${prefix} \
+               ${@oe.utils.parallel_make_argument(d, '--parallel=%d')} \
+               -- ${CMAKE_EXTRACONF}

I see similar wins here, walltime for cmake-native's build goes from
five minutes to one minute.

(!!!)

Ross

