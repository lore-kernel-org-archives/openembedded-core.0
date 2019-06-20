Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id D280E7E7DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 13:37:16 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id t8so1922430qkt.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 06:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kvvK2OQFVpf6dGbD3K9vSR8RblJiJ/QqIcpM+fmzbQc=;
	b=rbXaxpXtncXBCKmeJWcZdBQJrzns1VFFVyDFFy8vsfhUHUUHFEr9SN2nZH63IRFZLD
	OIjDmYCQVMjEzlmBOv/24ElJ4gp7xEG/2BnKhklr7qIyWyc5PNzq5Xhk4adrnSHxJ97V
	T98Mlm12xmnIrwuMLmna53D43jIuu7CtR2vbuY8P0IIjElXprEbPMXH/EvYXLhqVECXn
	oioU3rNWalcFB4jOBcNxzzAAVZb0YH3VVyCdK7vaoRzDohfqR/mGiam+LU+nhdiLcsj/
	U+Ierz8mAQwDU2g7DysqHUlOcH18zq4755AWEDHAvu3LYHtjo/sSsi/q1ofzhEMOo2/H
	MHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kvvK2OQFVpf6dGbD3K9vSR8RblJiJ/QqIcpM+fmzbQc=;
	b=O2Z6aC1hSMAStBB3FB+3TYok+8N81G9jpeex2X8oqecVGL0vwVgPBH4q0UY/U5Rojk
	DR1MR1VgyyenB63y1IUNaMwtoDpqzl6Vj4cDHMcU3YTkc1z8DLohd3SR3781NogMo0aZ
	OebdBIJnvJRXCKP9+Rf3Hw9fODKm6dCop9x9rw9hzxlm7gP/9lUZ1jk+EMQ4HQEvk2Ub
	PhEUjSHP7zWx3as58+JRCjx5DcU0nuWH6S45QlzhtlMpuBlzrF0O1JJ44OZoZ2GkwHDS
	Gm5T2UlJiVHEz/zy6bBqhP7s+37zlh1PSTMk0NzcbchL4r/WDY6+9M9dFZ+re9+zq7pe
	UeLA==
X-Gm-Message-State: APjAAAUo7yAuwSxQFskEcH6pG2MLQiCypO19pX+4fUkAfYx//g8XRVAg
	05RIZdgxY+B+enR2RjpIRs6CXFGZg1cIGu8pSY+3u7u/Qtw=
X-Google-Smtp-Source: APXvYqydQAAiJRPREvPOKD/eGrq7Antt0RVyeABzlDrdx++2UIeCtXQ9DZCYROEkGmVWiECvF/pmdif0n28JITzoIrU=
X-Received: by 2002:ae9:f101:: with SMTP id k1mr6608373qkg.337.1561037837404; 
	Thu, 20 Jun 2019 06:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<0f5adba2f96da9396faa1e70f9eed84118cf735e.1559950879.git.timothy.t.orling@linux.intel.com>
In-Reply-To: <0f5adba2f96da9396faa1e70f9eed84118cf735e.1559950879.git.timothy.t.orling@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jun 2019 07:36:51 -0600
Message-ID: <CAMKF1sq5aOZ+6CSP+G88+JCYd4zMb6ZSe5MP5KWSSofPRbe4Ow@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] scons.bbclass: use python3-scons
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
X-List-Received-Date: Thu, 20 Jun 2019 13:37:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 7, 2019 at 5:50 PM Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
>
> SCons has supported python3 since 3.0.0 release, use it.
>
> [YOCTO #13381]
>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  meta/classes/scons.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
> index 9ee7d1587d..a8ddae35f7 100644
> --- a/meta/classes/scons.bbclass
> +++ b/meta/classes/scons.bbclass
> @@ -1,4 +1,4 @@
> -DEPENDS += "python-scons-native"
> +DEPENDS += "python3-scons-native"
>

some packages haven't upgraded to py3 but use scons see
https://errors.yoctoproject.org/Errors/Details/249271/

>  EXTRA_OESCONS ?= ""
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

