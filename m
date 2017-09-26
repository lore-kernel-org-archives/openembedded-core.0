Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id D24667806D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 19:30:06 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id t127so7821501ywg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 12:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=oMLVe8yNQOpCKU4OEOgl6UcPAor6ZjWFsau7/VinAZY=;
	b=AeEtG9KQlnAA75IfC9VV1shU4K+amwyfLq1QGp9scznRZJT5RfbOjlez/vLxOAYFqV
	MG2Ys7NZ3VGHIMUQRfruU/oMNuHYcAWzx9+PkYHNniIFQy+qu2Q/YiR/G65dEHOJIxQV
	qGxeUtCTvuzs6rUHgVwXfXLNw0bBXc7TQvmYGG1foMTKp9sBIKyBTAik8DExSBpkIZPH
	MuWJxnyHE9NFUndpgLFhUc229+Y0jvLeGaelJPqXRkfyTTcEeLaJwUE00rJsrR/dmR2o
	E/rQ6vRhBM2KXwHE8xBLpvB0h2eDfBnnVrETFSItHvUjYLxz8t0zhLPF4/Jl4J+76+9h
	fqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=oMLVe8yNQOpCKU4OEOgl6UcPAor6ZjWFsau7/VinAZY=;
	b=GbMgYIsQc3giAwSh3ubtdb8AZnyoP3PGX6IwPKiVU5bzDYCTztd9fIfBzSZIdIo6aH
	ah/ZK8XeBUcq1OK0FAcE7UFJgm5YMc9KVx2Y/uUruddO5mbJMao9+TmjUsMM/khszUU3
	6vqpukq2NPokgladWjI8dzphYnLAljPekcZB9a+DTkld9S+fmYLucgti3FjgCxiakr0l
	v1eUQpSvKcFr9orsKsCnTz7CML9zN8jlxDROhIIlE353aDRsxNEKTMf76GpPQa5bmphS
	vVC7SlihkKtbYgxCK+05uN31zNlDINWkR/VqCsk7inedJ4XDPNTeK0MO/FU52pmQU4Gd
	gKyw==
X-Gm-Message-State: AHPjjUgJdYL2Xv0xOvin1xwkwNzMo3E1Xog37uCvLMftzhugxzWggtQO
	H1PpGYFZgD0KHODM7TkjbyC782iv
X-Received: by 10.37.110.67 with SMTP id j64mr7219653ybc.5.1506454207466;
	Tue, 26 Sep 2017 12:30:07 -0700 (PDT)
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com.
	[209.85.218.47]) by smtp.gmail.com with ESMTPSA id
	a14sm3984078ywh.47.2017.09.26.12.30.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Sep 2017 12:30:06 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f47.google.com with SMTP id w65so13497255oia.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 12:30:06 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA/7KmBiRzZuoFLLklSeimAnOA5eyAwAxsYcK8KcZdiLtkuh0ZzLDp01iSN45W9tGoMYeZvWFpgOQ5AceDJGkI=
X-Received: by 10.202.172.67 with SMTP id v64mr11895225oie.93.1506454205720;
	Tue, 26 Sep 2017 12:30:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Tue, 26 Sep 2017 12:30:05 -0700 (PDT)
In-Reply-To: <CAJTo0LbzUwTeLro_gQ9-sNq3qVJjq9xk=vf1BWyW5krM6=T1Hg@mail.gmail.com>
References: <20170922110243.10454-1-fabien.lahoudere@collabora.co.uk>
	<20170922110243.10454-2-fabien.lahoudere@collabora.co.uk>
	<CAJTo0LYMQ9NAvK+zNegmtbPQnPao1rx6wQM1q48TRP6FDUopHg@mail.gmail.com>
	<CAP9ODKp6tsZd34jS1QzDnEpi=0ALSs8GaHFPC9iVO-5wjkUD7A@mail.gmail.com>
	<CAJTo0La3fRSYaQAgWZt-qWB-noNsqvgO8Q2G4wYgqj62qB8Mug@mail.gmail.com>
	<CAP9ODKpM8_5_AdiO=g-FbcZEH7EVby5nKniQ0m2XhVRdbG593Q@mail.gmail.com>
	<CAJTo0LbzUwTeLro_gQ9-sNq3qVJjq9xk=vf1BWyW5krM6=T1Hg@mail.gmail.com>
Date: Tue, 26 Sep 2017 16:30:05 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpEd9YcAisoF6KFU+SC3oK8yDKCXAA9CsRfEoim0-GU7Q@mail.gmail.com>
Message-ID: <CAP9ODKpEd9YcAisoF6KFU+SC3oK8yDKCXAA9CsRfEoim0-GU7Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/4] wayland-protocols: Fix installation patch issue
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
X-List-Received-Date: Tue, 26 Sep 2017 19:30:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 26, 2017 at 4:22 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 26 September 2017 at 20:19, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> Are you using pkgconfig or pkgconf?
>
> pkg-config.

Does it have the depends?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

