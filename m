Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Su78H-0000Ow-Vo
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 21:20:30 +0200
Received: by wgbdr1 with SMTP id dr1so967734wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 12:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=3aRJ/YMqRgG8L8A6qPsMAld7eDPkKLE0MCprWoJm+H8=;
	b=E4291RXrth++JAqXEyBaMbk3t6bPzbEz+IUMktFtGHqOZF9lC/37ae5AetcT9iCBZe
	Soy2eEFSqEQlUjM9QwDup2qj8y6u3mel8Jpk6mxybMU5pU65YwOtvmBGW006p/erPmhv
	9MucFxpIfETvhpQJ5nnzpVmaYkl5R8fkcAqXnWLzog32vP86vbxyGE8zWCnfgKZx5OlA
	U3bZzd+gkPNTcmYhfJuxQ1A4JORozTJxW323lVZbZ/9PsUcYwcDc54h//xXMBKaiOyXy
	YCrwRl+K4ioJH7+pIOVb6zbS4xaXDDeYVNvSqmXHbF9VHtXnBuDUnCUMFFeh52DOrvHh
	LY3g==
Received: by 10.216.45.211 with SMTP id p61mr4501937web.188.1343243340292;
	Wed, 25 Jul 2012 12:09:00 -0700 (PDT)
Received: from [172.20.3.201] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ck9sm6145432wib.2.2012.07.25.12.08.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 12:08:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1343241383.git.paul.eggleton@linux.intel.com>
Date: Wed, 25 Jul 2012 21:08:53 +0200
Message-Id: <3CF857B7-AE49-4B03-9535-B97EDC1F880E@dominion.thruhere.net>
References: <cover.1343241383.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlz9+HTnD31Sv1Rgi/CoGO2ee77b44Jml8ITCssXp5glI1oPtGsxlE8zyOpasnpGD2rkkw2
Subject: Re: [PATCH 0/7] rootfs generation improvements v3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2012 19:20:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 25 jul. 2012, om 20:42 heeft Paul Eggleton het volgende geschreven:

> Fix up handling of "complementary" package installation (dev, dbg, doc,
> etc.) and introduce a staticdev-pkgs IMAGE_FEATURES feature.
> 
> Changes since v2:
> 
> * Clear IMAGE_FEATURES in core-image-minimal so that it doesn't
>  have dev/dbg packages added (since the default value of IMAGE_FEATURES
>  contains dev-pkgs and dbg-pkgs and this will now apply to any image).

Wait, what?


