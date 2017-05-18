Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 85AFB77F80
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 21:54:04 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d127so14126922wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 14:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0adwEGoDFTSZ6nwqCoTC6ziL3Dq5qdaYsxD4LThTqIY=;
	b=ebH5eUn0qk4Kn3X8YdYYpG1mqRClF6e51Qm02A8fPH/ksuGdjJiVvJEzdzmVpNcpMb
	h97uUXsRLt8cafyMd5dIUSd3gW68FYVv81Kp0QON+X9wURLMeCJrz5vsFg6pAv6+QfL0
	ku0fIDbDoBlQXf1S3iZfKSXxR8j4qliZfx9Fz6gWaAfAkTg3eWWa9HA6DWd2FEs0qvaV
	b3bOaGYCOkVOHftI2cUYAbCl+9MSALysoAMD/Ma/0+WqMj254GNKXV+QKJS+ukFXre+z
	nnTi0Vj9rLL+tgGfKloyMyS8LYWypUtM0JVY1svbinVgvSuI/iDxe+SMBh2WxUn6VTC8
	O2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0adwEGoDFTSZ6nwqCoTC6ziL3Dq5qdaYsxD4LThTqIY=;
	b=knsj8abr2YCL5sG5pogqT0rRx3eXPccj43asNC/InBVnnMnWs8MKIzABSo4+WCb9qP
	hJ/FkpctVAgWdoKr8Vp/scD9SQSuJWASITH40Q59Ces8hxteZs52cGIjkWKmaRiGDJWz
	4z482UMgM71Kulsz37euuetW1COl7EGfEQhtgTy0AN1uKhv1SPOP7A+A6EDZwmpkrjSc
	ddCom4UsaPcXskczjcPrBHRqc8Bx6H0h8XB0Xj8x34Dg+NagjFkRgTdnnRS2hY/80BpV
	ycJl3v4aXEeRN9QLO+qCssRzWgIHhF/ZUDBWXmnBOpNuU0P0+jIu5nqUKkD27x3GD983
	o1AQ==
X-Gm-Message-State: AODbwcCOuBGtMRK7WMSkrTgvKE3ifZAgKmK2C6oUMlGy5dK6XKrxHDjl
	1ko+dsnIgaVpKA==
X-Received: by 10.80.182.211 with SMTP id f19mr4757653ede.44.1495144445890;
	Thu, 18 May 2017 14:54:05 -0700 (PDT)
Received: from Saturn.local.all (138-14-48-195.pool.dsl-net.ch.
	[195.48.14.138]) by smtp.gmail.com with ESMTPSA id
	c47sm2480016ede.32.2017.05.18.14.54.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 May 2017 14:54:04 -0700 (PDT)
Message-ID: <1495144443.3001.1.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	openembedded-core@lists.openembedded.org, Max Krummenacher
	<max.krummenacher@toradex.com>
Date: Thu, 18 May 2017 23:54:03 +0200
In-Reply-To: <918cd582-010b-d732-3471-4858f4e2e836@linux.intel.com>
References: <20170517201652.27476-1-max.krummenacher@toradex.com>
	<918cd582-010b-d732-3471-4858f4e2e836@linux.intel.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: [PATCH] libsolv: don't pick up bundled db from host rpm
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
X-List-Received-Date: Thu, 18 May 2017 21:54:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Alex

Am Donnerstag, den 18.05.2017, 08:37 +0300 schrieb Alexander Kanavin:
> On 05/17/2017 11:16 PM, Max Krummenacher wrote:
> > With rpm v4 in openembedded but on a host with existing /usr/include/rpm/db.h
> > the build fails to compile.
> > +-  # check if rpm contains a bundled berkeley db
> > +-  CHECK_INCLUDE_FILE(rpm/db.h HAVE_RPM_DB_H)
> > ++  set(HAVE_RPM_DB_H 0)
> 
> The problem seems to be that CHECK_INCLUDE_FILE is incorrectly looking 
> for headers in host's /usr/include. Perhaps you could look into why that 
> is happening and if it can be fixed, rather than fix one specific 
> instance in libsolv where it is known to cause trouble?

Ok, will try to find a more generic solution.

Max

> 
> Alex
> 

