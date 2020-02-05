Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2DA8960AF6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 03:46:21 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id v28so783336edw.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 19:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jp+5OQsF8JfnfocZIrlhEPZKpStAclVMhAeBxBKmCZM=;
	b=OXpzYlzCytN3gw7XcSywAXk7aGDHgnaoWUBnOq7u6S8qWZWYCP+LziQUuTdSISXGt5
	DtKq8g5Rk4oU5Y8rr3N5hkYpG5iDgVMIebC02LPegqWt8zCid2FMU7bknOliUrq4xGAS
	IIDvmG60j7BgALto2AVz0lqNNCkAMBoVcPfLnYRybpohCjhBPf7FoIu93HCW2OVA9mPN
	rABF0hhgve37pXkiC2JxVOSqBf/JS50+WbMNtXsz2GMfUvZCni777E6LgUL8W0G/1frF
	8p/c4JHtU/A/sFP7wNKzg4SKL78pcpAS3s+1YbP+Qs1+Q6hkO34QSg4SWx8UCnxlYatJ
	JcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jp+5OQsF8JfnfocZIrlhEPZKpStAclVMhAeBxBKmCZM=;
	b=R+b0lbbSR3FwUESQr9pafkUV6b+Wm3MpUZ2dvF9AeCs1vi3djUr+jNH2ydU/hHxg4m
	aizqQi9sSweNYYQi/vZThpbEIt/UJPKFjO4Seoz0HnmxMecyHcdKdIAWs9SNQc21NZnk
	m7SGP3DV4zNXAkBCCOttyJZOCUwYxso+0X99+d0bRJvWuPCpnVLl4f95WzwCp+Z1wji9
	BaokuLN6zbcdaktCTCWUJ5pU/oS3oreGqkRgtYGO5vjJwGwGYyTIt48GAP1EAkgwJpKU
	38hugNKtHBXhP1JrsF6ffUeTPK8TTdvy8JQlwIzhG/7gCoKsyPOdEQORTJWkZb4oDh1s
	sU1Q==
X-Gm-Message-State: APjAAAVHs6FeuLWiEZrilGeWZKJCZrLyrk/UPaz5cqot0KMbMOHQ9U9+
	MkLrhAxA34WSPrDgQEBGjFrZIlbJpLcO8qelGdA=
X-Google-Smtp-Source: APXvYqyQyvQ22hjcO8b0TJPr2unnF1t0PrUku9kUVrxNQYpPlHVhkZ5AQf1u1YdIjTK0m4THiK4ZDUrHVQ3A2bsgdik=
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr3081159edr.164.1580874381833; 
	Tue, 04 Feb 2020 19:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20200126053534.800346-1-gavinli@thegavinli.com>
In-Reply-To: <20200126053534.800346-1-gavinli@thegavinli.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 4 Feb 2020 22:46:10 -0500
Message-ID: <CADkTA4PonNg3jHe=GQkDmn4W3XjO_WEamodToFH4bB_K3wdQNA@mail.gmail.com>
To: gavinli@thegavinli.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: fix defconfig detection in find_sccs()
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
X-List-Received-Date: Wed, 05 Feb 2020 03:46:21 -0000
Content-Type: text/plain; charset="UTF-8"

I've staged this change and will send it along with my next pull request.

Bruce

On Sun, Jan 26, 2020 at 12:36 AM <gavinli@thegavinli.com> wrote:
>
> From: Gavin Li <gavinli@thegavinli.com>
>
> The current code would cause a file like "config.bin" to added to the
> config sources list. I am sure the intention was to add any files with
> defconfig in its name and not the other way around.
>
> Signed-off-by: Gavin Li <gavinli@thegavinli.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 87c681f1c3..32b32ac291 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -31,7 +31,7 @@ def find_sccs(d):
>          base, ext = os.path.splitext(os.path.basename(s))
>          if ext and ext in [".scc", ".cfg"]:
>              sources_list.append(s)
> -        elif base and base in 'defconfig':
> +        elif base and 'defconfig' in base:
>              sources_list.append(s)
>
>      return sources_list
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

