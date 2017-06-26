Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0170B77DA3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 19:41:35 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id k67so148844356wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 12:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qOQ2+cjdWjzPNsfBv5OijPRuFWwxMxJ39c4WSvMGq0E=;
	b=iPJt/zP7SaGO5vnuolf5iymfjuLYHcDhgOFxPdpA8zLbGs1Fwng6lsV5GfXM1kEjBg
	3NpS8Iu5SxSFAyAGF9VlsC8xd9gsfUAXMrOw6qv7b5DI/l9gzaQDPdvJYKi8EEdQnMBi
	WuNLQSsbDbOu6QYMj7C/T3ffgxj9veIyTZUB+GVKbTlZPjIcpGDk8mB+C5qC5g+kbw9B
	c8XOvbPY2oO1Lxfdg1tzow1a3KprseXUHeJJenU4Kjz8FeMqhOuHAyT1m17AZ+V3QUZi
	EbYk7NpEwDtKN6vmWaXLy32vS4dOg8rlYEsL43q6ndqSrZoGnz2/vrpjs/DQWGd6DjEt
	a+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qOQ2+cjdWjzPNsfBv5OijPRuFWwxMxJ39c4WSvMGq0E=;
	b=gDij1+xQ2bn5eRop4O9/mrhkFf/4Cdoc06iNB8cA+4aWmSOOvSXf3nl8y4qSpoxaXS
	/ITrJyCARf018dILlizDPHHH/fX7TJKxEmfMVg7rSQ1PLE2z0ikVgM0fW0eeOPd6MHoq
	fQ6uhZzBi6DXtUue+NDhO2RXsQdC0OLU5/DZqfrsaZw7EzMTw+yTzAEfIdGuL+eYMIlq
	aHLGSu7oXL2/Pk9L1dvhz4tLBnKNi2f54VXiMTKERCeBQUzC5PxFWpDIL7qm4WhduP48
	7xnIidanUPLPyDFuTuzmhM9dQdTYHku3VqRQh8QKINLBV+wuFMYeKKTraqgKvGBnEK0J
	xovA==
X-Gm-Message-State: AKS2vOzG+KS4NaKefcDn9jgZQJSvcBarQjPPKsv+iMnfHQ0wF0z0EDFS
	CsjhUnPZdHpUVgdSjIc=
X-Received: by 10.223.154.41 with SMTP id z38mr14172012wrb.76.1498506096977;
	Mon, 26 Jun 2017 12:41:36 -0700 (PDT)
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com.
	[74.125.82.46]) by smtp.gmail.com with ESMTPSA id
	b192sm604953wmf.25.2017.06.26.12.41.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 12:41:35 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f46.google.com with SMTP id b184so7038070wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 12:41:35 -0700 (PDT)
X-Received: by 10.28.144.6 with SMTP id s6mr812607wmd.118.1498506095599; Mon,
	26 Jun 2017 12:41:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.176.5 with HTTP; Mon, 26 Jun 2017 12:41:34 -0700 (PDT)
In-Reply-To: <1498502034-13181-1-git-send-email-maxime.roussinbelanger@gmail.com>
References: <1498502034-13181-1-git-send-email-maxime.roussinbelanger@gmail.com>
Date: Mon, 26 Jun 2017 16:41:34 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp+-fKQSM97AcqDe5Tm9r256LFg_fgDdiuzCFnk5TB_Xw@mail.gmail.com>
Message-ID: <CAP9ODKp+-fKQSM97AcqDe5Tm9r256LFg_fgDdiuzCFnk5TB_Xw@mail.gmail.com>
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Use find_program if find_host_program is not available
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
X-List-Received-Date: Mon, 26 Jun 2017 19:41:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2017 at 3:33 PM, Maxime Roussin-B=C3=A9langer
<maxime.roussinbelanger@gmail.com> wrote:
> CMake does not define the `find_host_program` command we've
> been using in the cross-compiling code path.  It was
> provided by a widely used Android toolchain file.  For
> compatibility, continue to use `find_host_program` if
> available, but otherwise use just `find_program`.
>
> Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmail=
.com>

It sounds fine to me; the backward compatibility is maintained and it
fixes a real use-case so I see no reason to not apply EXCEPT:

- lack of Upstream-Status field
- lack of upstream bug about the issue, ideally the proposed patch
should be send to upstream so we can drop it in next releases

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

