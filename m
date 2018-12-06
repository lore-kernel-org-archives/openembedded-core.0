Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id DD2DA793E9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 19:34:25 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id g76so3266457itg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2018 11:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=3iEAwoNKd5cRyAsCuEjhjbgcla4/ZkSPRe4vemhjvxU=;
	b=EExreLVg01vbTPug4MgFtlsHsmTWO4k5WsVppg9TxwpDqZpKsKuhQbFO85SDJE3I3w
	OUPz0WwRR0JhIAVcX2siuDoUnOIy+6ExXdMi1Qvqqji3ksqxK8lZUcp/EtmJZtl6wEcS
	OenVQvWR2v7KPM+kwCOyZK2hF6VMfzVNJoqARe6LYrp0FwvG/oWGJ5EHfm5xPIuOj3xZ
	GgbtlDXpb4RtmHSOB0YJzokCVV1yattWWdzUATqWxY9QNiNMlIb8edIHxcV1VwS4ZgGX
	0VsDgVLbjrygYoOTgGTsNek+FIsW6j2FJnA5SiP9XvoYq5zxgaJF/42fSDniRmqJg7yF
	ONdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=3iEAwoNKd5cRyAsCuEjhjbgcla4/ZkSPRe4vemhjvxU=;
	b=ADt6iRUEvADSc3OC1ipdv8f1yAAcdZeY7k2jcAxWbvK94eUiqgXT7bnsJo/Jz53A1D
	EyzoBndMXqty3Jg2gH5yD3NmmabNBwt6eEJ9sEOjBSVZ67kFHy5wsj598Z7nfXBqq3CY
	knsQsQI30Ab9wNjLAUmOZc2IZXfguUPdoKCTD0uiM8sXlCBWniTyzGzWwFgBJDkmQrNj
	LfoU/SKlhuzy8aZ6fHvXYIIbjdwixvwigV4BrvAVN6SRYdGqPy68RwK+ihk8xjBJnNx8
	s6722rQFlH6KAn3eS/cA63MwI8s4uGNikLXfTY0OCt0Z7sRDhDwlKz57O/WWDYiaJG/Z
	MU+Q==
X-Gm-Message-State: AA+aEWY+sY3qs/7aQaILLf0MpQNofZV17I1vB1gwdxAx1A4a9agMaabg
	NpMgeFA+apSNP7gHN9g2t0fsUT4S
X-Google-Smtp-Source: AFSGD/UKeTbdhm64wuw8XVuy+bDX1/0i55gAMG5rL1EtChFZlXdpFIblpuFp1Bb5/k/gaNzRpKF0jA==
X-Received: by 2002:a24:ba0b:: with SMTP id p11mr20059752itf.113.1544124866545;
	Thu, 06 Dec 2018 11:34:26 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	b140sm12124796itc.4.2018.12.06.11.34.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 06 Dec 2018 11:34:25 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <f7a0fee3dc06e3b02c14c3b14e7d69c7487a5bf8.camel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 06 Dec 2018 13:34:25 -0600
In-Reply-To: <20181102024513.6977-1-JPEWhacker@gmail.com>
References: <20181102024513.6977-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.30.1 (3.30.1-1.fc29) 
Mime-Version: 1.0
Subject: Re: [PATCH] pkgconfig: export variables
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
X-List-Received-Date: Thu, 06 Dec 2018 19:34:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Armin,

Would you mind backporting this to thud?

Thanks.

On Thu, 2018-11-01 at 21:45 -0500, Joshua Watt wrote:
> Export the PKG_CONFIG_PATH and PKG_CONFIG_LIBDIR variables in case
> the
> parent shell hasn't done so.
> ---
>  .../recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-
> native.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-
> native.in
> index 5e44bb435c3..a9324de4cf3 100644
> --- a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
> +++ b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
> @@ -1,7 +1,7 @@
>  #! /bin/sh
>  
> -PKG_CONFIG_PATH="@PATH_NATIVE@"
> -PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
> +export PKG_CONFIG_PATH="@PATH_NATIVE@"
> +export PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
>  unset PKG_CONFIG_SYSROOT_DIR
>  
>  pkg-config "$@"
-- 
Joshua Watt <JPEWhacker@gmail.com>


