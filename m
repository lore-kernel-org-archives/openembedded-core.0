Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id E71E376A51
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 14:41:07 +0000 (UTC)
Received: by iody8 with SMTP id y8so91256520iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 06:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=MFBDcpI/aIKvfMSBS8lOc0zXyg+VV3nFDfcqV0kA2jQ=;
	b=m9cnvpqpwBt/uNiwprOLW0AcUksJb+C4K55pCLd03Iw5+BLPejw/kY/g263NoAJR90
	HPKj9RHRu9oRU/GWo1nG74WPtNuBbflMXWpnpoNj376h5zY5wvp0oGAOpGeujuy7JFds
	brus6sHbKMlNvmqQHbm7hYaSulk5lj6K2oM1hlboDEJXf38pJHibRjkeu49hAWaykpND
	O72IaA5miu8pBDcAQPxpgZkMl0CoK3c6j/M5nehZu9k7J1sHdkfqcKoU9rnSwMGoRBW+
	ycZ0loeWTSzQ0hRh/J4273NH89A6F72JP/CeN4TrzAgQ6f6pFJ/dQ60bSh3Avh8zEpOj
	cg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=MFBDcpI/aIKvfMSBS8lOc0zXyg+VV3nFDfcqV0kA2jQ=;
	b=IH/YuIw+X9DPU+6pIMmxSFjN+MUWpQ+ScTU+DNPxKiSEs4x9RnOz6hDfQr5AG17poX
	U2SSmpO76oyd6iJoZ4qwvwvbZUKb5G1TU3APLTMOD01VFjsW9y77uXG0kLs66ZIiboUn
	Nwagk3WWJPb//8UaUqKQKSttnMmUwSWB14rE9GsjpnUF9v/JSJKBXD13+PeRDsYRpKAT
	+0BBSwWqHI3OC9UyzaPYp3oPEtc0qrFBcJXDdw6T+fBwr25NDn3XyFv28AQj/vU7UelW
	iQcsl64whRtlW/UKCeMTOjewwczvCTW8p3oGySl8AW7NfqMSA2Yv3usWNtE3YJYT3MVU
	Zq0A==
X-Gm-Message-State: ALoCoQl+IZ9w6czW8PgDnDtWc0fLM/ABkLzhLhGukZA0ZVGvUdTDq2yBK9L7M2oCqx/zEMChP1Ec
X-Received: by 10.107.153.13 with SMTP id b13mr11223443ioe.143.1446734468189; 
	Thu, 05 Nov 2015 06:41:08 -0800 (PST)
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com.
	[209.85.223.181])
	by smtp.gmail.com with ESMTPSA id c23sm2997564iod.0.2015.11.05.06.41.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 06:41:07 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodd200 with SMTP id d200so91453423iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 06:41:06 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.17.160 with SMTP id 32mr161074ior.28.1446734466709; Thu,
	05 Nov 2015 06:41:06 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Thu, 5 Nov 2015 06:41:06 -0800 (PST)
In-Reply-To: <1446676702-26773-1-git-send-email-cyril.chemparathy@xilinx.com>
References: <1446676702-26773-1-git-send-email-cyril.chemparathy@xilinx.com>
Date: Thu, 5 Nov 2015 12:41:06 -0200
Message-ID: <CAP9ODKoWUzXCDwMcUd+_kuexTXgx0khwfy+riuQyXjWt4O812A@mail.gmail.com>
To: Cyril Chemparathy <cyril.chemparathy@xilinx.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: allow externalsrc u-boot builds
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
X-List-Received-Date: Thu, 05 Nov 2015 14:41:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 4, 2015 at 8:38 PM, Cyril Chemparathy
<cyril.chemparathy@xilinx.com> wrote:
> When building with EXTERNALSRC u-boot repositories, S != B, and
> therefore the following changes are required.
>
> Signed-off-by: Cyril Chemparathy <cyril.chemparathy@xilinx.com>

One simplification that can be done is to use ${B}/build when building
using UBOOT_MACHINE; this allow the removal of comparing of  S and B.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

