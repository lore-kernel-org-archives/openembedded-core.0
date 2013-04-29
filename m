Received: from mail-ve0-f179.google.com ([209.85.128.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UWm4B-0002Kq-Cu
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 13:16:21 +0200
Received: by mail-ve0-f179.google.com with SMTP id oz10so2876399veb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2013 03:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=OTsgxdkyextUYtAoD6YErNmATG3Msbj12xLYE9C9EUM=;
	b=bAiT376Luf5T3KlL9epE1Q/Ri57Zl1b+Q8ZUUVVkj6OqxdAUA+MIbVfqQc9+yTm9ow
	sXrLtaoNTJZZYD1rHojPWp/MYqnauW/5dp+oIsFiyqpMneRFjfmncTcAIwp269XqmKqw
	OxAY7mGvtkjk7JtTmzBixMSjBCVIYwZN18fP4CavagofOJzdmBBPAeWOq/ux8eJohfPW
	Mmfo10tgeUIRWwFXzi1oleBGroSxhC0vQ2FlGcJtsEa+LuEH82Ynmw4AsgVqbLXf7h04
	MFc9PzRN7XQ2pwrXAJCGdWQ3LHvLgnDHb53ktakPHc/p2/KEzsBkpmdyBC0o9ET5j8eE
	wmDw==
X-Received: by 10.52.18.206 with SMTP id y14mr16932874vdd.29.1367233110062;
	Mon, 29 Apr 2013 03:58:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Mon, 29 Apr 2013 03:58:09 -0700 (PDT)
In-Reply-To: <517E501F.1030809@gmail.com>
References: <517E501F.1030809@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Apr 2013 11:58:09 +0100
Message-ID: <CAJTo0LZd+2h65+MHwTPMo_cyM=Xhjc719TB-3hbX+GiyL0ggOw@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQlATvHSUerdu750HyKCOP11S9LyRYtX5zzck7VnaQjQ+MhHgKE6t6RF71x2BCGQQkRJWFWX
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] guile: Update to 2.0.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Apr 2013 11:16:26 -0000
Content-Type: text/plain; charset=UTF-8

On 29 April 2013 11:49, Jonathan Liu <net147@gmail.com> wrote:
> fix_parallel_build_issue.patch is now part of upstream.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  .../guile/files/fix_parallel_build_issue.patch     |  20 ----
>  meta/recipes-devtools/guile/guile_2.0.7.bb         | 103
> ---------------------
>  2 files changed, 123 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/guile/files/fix_parallel_build_issue.patch
>  delete mode 100644 meta/recipes-devtools/guile/guile_2.0.7.bb

I don't see anything adding 2.0.9...

Ross


