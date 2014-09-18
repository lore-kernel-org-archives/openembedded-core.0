Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6F14B65E2B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 07:30:07 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id g10so846363pdj.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 00:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=fdyILav2XkjQmmtGBoN5ROiwIrnCpe+3llYrZa08nQ8=;
	b=AZ2OLSqMw+Yg2OLB6QNkcFpECI1szf3krnRnJwPGSHfW1HxwSyLVHFqgRQ80KAGuxW
	OP5ogasUWUvi/0clTqY1g3Zu3gB1l6fWGcMsCI6hMhiEzIuxV8XbsPylH58Kt4RVjYyy
	BwAhD952XEFcBcSnojY3qhp4CHv6DIHFYv85ljHPJaYD1nXN/nnwXQ8PzbVHRGkrn/U5
	DwfNBssGbuGG5ntpeAX6ZLLigha5Hj5fOZjdu6dcef8hqDsO2UY4e/OgQMOvTri+oAXm
	wO6pUGe+IVnQY/H3XQ4rb2BhHqKKHugi0BiEuogce74AoS3aNAi8vYb4686L0CX5XStx
	I2dw==
X-Received: by 10.66.145.133 with SMTP id su5mr3127411pab.11.1411025409076;
	Thu, 18 Sep 2014 00:30:09 -0700 (PDT)
Received: from CACSVMO-14452.local (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id x13sm3887087pdk.22.2014.09.18.00.30.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Sep 2014 00:30:08 -0700 (PDT)
Message-ID: <541A89FE.9070509@gmail.com>
Date: Thu, 18 Sep 2014 00:30:06 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1409764769.git.chris_larson@mentor.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
Subject: Re: [PATCH 0/8] Various fixes to obey LDFLAGS
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
X-List-Received-Date: Thu, 18 Sep 2014 07:30:11 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



On 9/3/14 10:27 AM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> This patch series fixes 8 recipes to obey LDFLAGS. These issues are easy to
> miss, now that the internal toolchain defaults to passing the correct
> GNU_HASH, so GNU_HASH warnings when LDFLAGS isn't obeyed are only seen when
> using an external toolchain. These were kept in meta-sourcery or meta-mentor,
> but given these are general correctness fixes, regardless of the lack of
> warnings for most users, I think they're appropriate for upstream inclusion.

may be they should be sent to respective component upstreams first

> 
> The following changes since commit e72aac2ae9e5fce1715fa04b7e94034fd06892d9:
> 
>   alsa-lib: libasound should runtime depends on alsa-conf (2014-09-03 11:30:11 +0100)
> 
> are available in the git repository at:
> 
>   git@github.com:kergoth/openembedded-core ldflags-fixes
>   https://github.com/kergoth/openembedded-core ldflags-fixes
> 
> for you to fetch changes up to 2cddd349eb9cafbbaf5257fb61beb9dc249df85c:
> 
>   python: obey LDFLAGS (2014-09-03 10:18:37 -0700)
> 
> ----------------------------------------------------------------
> Christopher Larson (8):
>       zlib: obey LDFLAGS for tests
>       gdbm-1.8.3: obey LDFLAGS
>       ossp-uuid: obey LDFLAGS
>       setserial: obey LDFLAGS
>       hostap-utils: obey LDFLAGS
>       blktrace: obey LDFLAGS for btrecord
>       irda-utils: obey LDFLAGS
>       python: obey LDFLAGS
> 
>  .../hostap/hostap-utils-0.4.7/ldflags.patch        | 27 ++++++++
>  meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb      |  1 +
>  meta/recipes-bsp/setserial/setserial/ldflags.patch | 23 +++++++
>  meta/recipes-bsp/setserial/setserial_2.17.bb       |  1 +
>  .../irda-utils/irda-utils-0.9.18/ldflags.patch     | 79 ++++++++++++++++++++++
>  .../irda-utils/irda-utils_0.9.18.bb                | 18 +++--
>  .../zlib/zlib-1.2.8/ldflags-tests.patch            | 45 ++++++++++++
>  meta/recipes-core/zlib/zlib_1.2.8.bb               |  1 +
>  .../ossp-uuid/ossp-uuid/ldflags.patch              | 23 +++++++
>  meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |  1 +
>  meta/recipes-devtools/python/python_2.7.3.bb       |  3 +-
>  .../recipes-kernel/blktrace/blktrace/ldflags.patch |  8 ++-
>  meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch | 22 ++++++
>  meta/recipes-support/gdbm/gdbm_1.8.3.bb            |  3 +-
>  14 files changed, 245 insertions(+), 10 deletions(-)
>  create mode 100644 meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
>  create mode 100644 meta/recipes-bsp/setserial/setserial/ldflags.patch
>  create mode 100644 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
>  create mode 100644 meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch
>  create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
>  create mode 100644 meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch
> 

- -- 
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlQaif4ACgkQuwUzVZGdMxSgGACdGG6xSxCtB+8Fe71rw7Uscd/H
LA4AmgNOrOnTSCYUFDTjPPMXsgmnMejp
=IrqW
-----END PGP SIGNATURE-----

