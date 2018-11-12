Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9E5D56C27B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 17:43:20 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id w204so14765685qka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 09:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=49ZjTtUd1f0pU2TL8BjpbZPcf4LiI+cKYGLyjUfSXbk=;
	b=P/qsIL3syXl/RibAW5iDmzdSK6/mkV8dAoSNfWFpnmqXL4oNuq2qYY0r/HkbyKeCnY
	Ge2RXlVqZjTha6iznj1IYNL1jbbQwNIF2kYECjE2UKhyRSMXJ0Mdw5pF0YWA0/ovLFuu
	qYaFMPGA2zRZlXv1CrYxYpbid97RyTAZH5tgr0dQEEMz+lDJEUx81pz2TRszh5xJcuq6
	8CGhLWfTDsEV4Gptdu4D3aBxZkk2IHA4+ztyeu8KfHHpGibb66ewrS0fVVW0WIIHP43o
	d/RMTfiQGImEu5Yg3u+5+KCZyTSN+2g6vVIfMNYhYn3ZEljGCUinOUncNoBfaBO2fSoW
	1pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=49ZjTtUd1f0pU2TL8BjpbZPcf4LiI+cKYGLyjUfSXbk=;
	b=uDPxzD58Iv7Do0PD7gRuj2pn3lQr5+onEHImLvIhEG7IVPw1HW0WXnw9ZDN+kjRZck
	pHgG0VUfFZrvbLvHTtmECrzf3dhXnsQVsAUe6Ssg48DCMDv3cK6EzC7mdV3GJu7f74Yk
	J7L13naYfKD+vPLxpl4xF1GEHGwMbo8YOhJ9T6gFxXn4P3OjvVnchXW64mDMICzAVpyc
	SH7JNBDED2KMcx0X9S0q4+l0VnSi9YbQQcBZd8vbBR3x08gRoVF7pIzkHtUafBrkA/VF
	KIaylgeF+gPnf/oPpbQMDDpgpq+gXQkz/XWRvQ1bJ7NQwqbIlbpH53lCXLwVGjPdDuxL
	xLTQ==
X-Gm-Message-State: AGRZ1gLIdolW3bs1dKhq4Gxg783aHyGm5xJ9kmbZAfFsCqinsrlVeXrf
	7uvOuQ/AgToUWaUbYuit6vqr8aRuvZju1aLsU/E=
X-Google-Smtp-Source: AJdET5fKMZ8pOVkWZFzbIWLa9x3RQogyFO3U69kMoN4u/D6qCs2Js6PV+MUU4lZOxCQBrsOxRaQ0u0FcQ/yYLX83rcg=
X-Received: by 2002:a37:d408:: with SMTP id l8mr1777781qki.315.1542044601210; 
	Mon, 12 Nov 2018 09:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20181112130938.7781-1-abrodkin@synopsys.com>
In-Reply-To: <20181112130938.7781-1-abrodkin@synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Nov 2018 09:42:54 -0800
Message-ID: <CAMKF1sp1hfayuo==2fJO_75ccN+rLzHAPSP2Q8g2SYkvuA6Xew@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-core-sdk: Disable SANITIZERS for ARC
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
X-List-Received-Date: Mon, 12 Nov 2018 17:43:20 -0000
Content-Type: text/plain; charset="UTF-8"

Looks ok to me
On Mon, Nov 12, 2018 at 5:09 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> Sanitizers are not yet supported on ARC.
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> index 45e8c13585..15d0989b76 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> @@ -27,6 +27,7 @@ RDEPENDS_packagegroup-core-sdk = "\
>      tcl"
>
>  SANITIZERS = "libasan-dev libubsan-dev"
> +SANITIZERS_arc = ""
>  SANITIZERS_microblaze = ""
>  SANITIZERS_mipsarch = ""
>  SANITIZERS_nios2 = ""
> --
> 2.16.2
>

