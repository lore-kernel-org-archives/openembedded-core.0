Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD4B71FC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 15:35:19 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id eu11so1618002pac.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 07:35:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=kz4XeJLdL0Vg84QiP+gSiv/DnByXqKj84AA9/vGvJzw=;
	b=R1v/fc7PUjlElXwNpwKsukmGLWfBLj962zm740k/ytmgZ1cTjViQZ34hlpaV0LAIxu
	Hev8eVkcHdYkYWynX/48NGL9jJTyePd9gPquxcXlTPv9GbvIHp03fskXRmYgDP6e1ShW
	FLzIaXB8M2wGk7GCcA+jATU2xFGHOapbx5ZtN8HJG3Pgu17MCKwJSgYrm0QJVjEV5GxM
	jZ/FS8+3aC9Wykrna7KcecocAy5OeLv9mIT4qzWRCuNsz+LHRNJ7Sgpcrc261OvqSLpo
	IdH/MmQ/62JTd4r0k0vfWo4M6F2uBZSCTK7hLnyBielH7gLMMghzosplG/8xq5KywZeZ
	QFaA==
X-Gm-Message-State: ALoCoQnmVzPFcvl5EdSdc8wIvai/Ru2q+Tp14PPXPhd/PgFj2LUsY/YvyMHVqlMPadVxOnJmAz3k
X-Received: by 10.66.234.133 with SMTP id ue5mr1358642pac.27.1416238520003;
	Mon, 17 Nov 2014 07:35:20 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:c00e:30e7:fd8c:8f96?
	([2601:c:9380:601:c00e:30e7:fd8c:8f96])
	by mx.google.com with ESMTPSA id
	yk3sm35335841pbb.60.2014.11.17.07.35.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Nov 2014 07:35:19 -0800 (PST)
Message-ID: <546A15B5.9030205@mvista.com>
Date: Mon, 17 Nov 2014 07:35:17 -0800
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: wenzong.fan@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1416213365.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1416213365.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 0/1] uprev serf: 1.3.6 -> 1.3.8
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
X-List-Received-Date: Mon, 17 Nov 2014 15:35:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Please add to the 1.3.7 the security fix

- CVE-2014-3504: (Closes: #757965)

On 11/17/2014 12:38 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Release changes:
>
> Serf 1.3.8 [2014-10-20, from /tags/1.3.8, rxxxx]
>    Fix issue #152: CRC calculation error for gzipped http reponses > 4GB.
>    Fix issue #153: SSPI CredHandle not freed when APR pool is destroyed.
>    Fix issue #154: Disable SSLv2 and SSLv3 as both or broken.
>
> Serf 1.3.7 [2014-08-11, from /tags/1.3.7, r2411]
>    Handle NUL bytes in fields of an X.509 certificate. (r2393, r2399)
>
> The following changes since commit edaeb8940813b620090a0797ad3b6a076897512d:
>
>    bitbake: cooker.py: fix loginfo op being set to an invalid value (2014-11-12 17:04:50 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/serf
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/serf
>
> Wenzong Fan (1):
>    serf: 1.3.6 -> 1.3.8
>
>   .../serf/{serf_1.3.6.bb => serf_1.3.8.bb}          |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-support/serf/{serf_1.3.6.bb => serf_1.3.8.bb} (74%)
>

