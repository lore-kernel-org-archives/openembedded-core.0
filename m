Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 89F7177F4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 15:28:32 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id j85so6465797wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 08:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=U4gpzu4KqHHv2wBBMIG2T8brW9DPuAAHoK/4Pb7cRa4=;
	b=InR0D4zuFqjYI30HEgKvI5U/zwX2MhlqBjKeknK71xLESyEnClgc2WH6xvgGqO/7l3
	14TfgBUydVkaOrhL9D1fF1/kX9dC9uPE6OQe2jXNjQujnsN1PlNqIBMMnX5pf4S54q0c
	nPomXYNKnYe6OOyUXEWtuhMUr2/uaZziUQAf2vBZZfgzsuYCY2dvgOKhCwdKFd+GrIQP
	gsrNrmboVMJXq+p+60gEq8XNU6YC1J403vPxOwu9O8LKvSh4pvyza9qzzwtAPGYNOTc+
	yHM6nReZNgYPd/JcqOXNDTi3TiIBLZGz+hOK3TFhtcajH0z4Ye6xSYqp+ImlvlwjG288
	sC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=U4gpzu4KqHHv2wBBMIG2T8brW9DPuAAHoK/4Pb7cRa4=;
	b=flR5OCWnOI7+vkzZDz9dn0IKQmbEKLj0JkXBeqqFR87KdgWIEdX6/Urmxs/gVdTdam
	SOkj9DKTXFJXe/bp57ujZH9s7YZrvt3O9znO+ioELpQ0HoeuRF1AnDyR9ItCdiYvu8Md
	4oj8H+eXl412nwgifysdaagHk9muW74IFVIu1LujeBPFAst5t5iDhrkbSi2jEELkwRQs
	Fj+501lxV+JbCH28ecowg3Opbvze0rXjbuTnCctctQeI0R4uBlR570bIW8Tx5z0OvhOt
	Qb3cUtuEQNdtRRtsfhVA90VMses2+Q9PhMsfKexQf5KUpPsV6nJ7IpF+rzeYKw7mnAZY
	nR1w==
X-Gm-Message-State: AKS2vOzQ03b4QOePbg/VMDk6z7ESULnD8uPzGPX1XxfLPTGRihWXWIFO
	y4uOCM31JaE//7Ad/1g=
X-Received: by 10.28.50.70 with SMTP id y67mr4100310wmy.62.1498577313556;
	Tue, 27 Jun 2017 08:28:33 -0700 (PDT)
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com.
	[74.125.82.44]) by smtp.gmail.com with ESMTPSA id
	49sm19455056wrv.23.2017.06.27.08.28.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 08:28:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f44.google.com with SMTP id i127so30590850wma.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 08:28:32 -0700 (PDT)
X-Received: by 10.28.92.130 with SMTP id q124mr4029681wmb.21.1498577312357;
	Tue, 27 Jun 2017 08:28:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.176.5 with HTTP; Tue, 27 Jun 2017 08:28:31 -0700 (PDT)
In-Reply-To: <b4d0ec34dfa75c3b902c7c7eb0e7233756c95b3f.1498574121.git.maxime.roussinbelanger@gmail.com>
References: <cover.1498574121.git.maxime.roussinbelanger@gmail.com>
	<b4d0ec34dfa75c3b902c7c7eb0e7233756c95b3f.1498574121.git.maxime.roussinbelanger@gmail.com>
Date: Tue, 27 Jun 2017 12:28:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqjuik1A-UbrifFi4mGWafeJddFpB-PW0eThMEp-Ma-Nw@mail.gmail.com>
Message-ID: <CAP9ODKqjuik1A-UbrifFi4mGWafeJddFpB-PW0eThMEp-Ma-Nw@mail.gmail.com>
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] cmake: Use find_program if find_host_program is not available
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
X-List-Received-Date: Tue, 27 Jun 2017 15:28:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2017 at 11:47 AM, Maxime Roussin-B=C3=A9langer
<maxime.roussinbelanger@gmail.com> wrote:
> CMake does not define the `find_host_program` command we've
> been using in the cross-compiling code path.  It was
> provided by a widely used Android toolchain file.  For
> compatibility, continue to use `find_host_program` if
> available, but otherwise use just `find_program`.
>
> Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmail=
.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

