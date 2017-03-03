Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 161EF77673
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 01:18:32 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id f54so98571308uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 17:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jMhuvMpkZlx13Xv+Kwn6x6AND1Fodfre2wXKHvIk9X4=;
	b=BUTpazoMD0mMDd96kQvxwrJYTFNLbaHNHLwXgAt8gqf1xGorWun4uLGGoUxPkelTdS
	U0U0zp2S8HVxmnSzNtP/Lv2AEz3jfat46fwYsmIxMHOYlGPUJ7qQ6OlatgysECHutN0v
	yapVYhxe89jW23bnCBfIvIq/MdpkdppLVB9GNclmPy1s2GJEFvMnyaTE3jJAfouskN4z
	x+dfRXvO5c1sRyeVHvwwEekroki/BIKHLo415mYnwktNbT/Ji+jLmPB3S2CuAiYxVtQl
	xJudAkyh7sUsGnmxR2Q9ThTgqeIw6+R6DB6b0F0yhO8TTWAgxE6nXdQY+vJdOir4Ly2y
	ZKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jMhuvMpkZlx13Xv+Kwn6x6AND1Fodfre2wXKHvIk9X4=;
	b=sC5fobIgvxSk65qPZ0cpvPNWOB+jm+ZYUl8oZLkDtUGtEst35MWod4J4/RrWh0M8PI
	1uRJsxXa3m6gL+tBrSh+nHvEGjfXz/ZQxuXk3gzTpIHei9BWVb+xzS163rnNEXDda19+
	yD8muGlSNfn7+1ttIsOchCdpn/ZOlht6X7JhI+da/n63zVoQ8tV7V/5HcSQrF6fb2n5b
	EQdmk1OdRIpih8i+XNmWRdJT/nzRF/+YqlWYGSsn1Bm89kbY7JwqHzWPLsNRh8ecyBWG
	WtyA8C5tLXxL6Re7Xg6YBfc8Ce51dLlNyx1nNC43/WKzYTRw2LE2Tbs6hSpI4gr/SYOK
	GkWw==
X-Gm-Message-State: AMke39k8s3ah9S3/hzLQxneZtf523yxFDzWdKs4b8IIIV4NX3iwhUyge9+cwA1mx8JFLiFn7ZE8mhCjHlBeeiQ==
X-Received: by 10.31.132.212 with SMTP id g203mr46153vkd.93.1488503913848;
	Thu, 02 Mar 2017 17:18:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Thu, 2 Mar 2017 17:18:03 -0800 (PST)
In-Reply-To: <12830a63c0c221f1a3a227173a69d55111359b8a.1488388550.git.anders@chargestorm.se>
References: <cover.1488388550.git.anders@chargestorm.se>
	<12830a63c0c221f1a3a227173a69d55111359b8a.1488388550.git.anders@chargestorm.se>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Mar 2017 17:18:03 -0800
Message-ID: <CAMKF1spaobz07gVftrY+ZKxUrXKfcXBvf0QUKLp=agh8fDWeug@mail.gmail.com>
To: Anders Darander <anders@chargestorm.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] create_npm.py: convert MIT/X11 to MIT
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
X-List-Received-Date: Fri, 03 Mar 2017 01:18:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 1, 2017 at 9:19 AM, Anders Darander <anders@chargestorm.se> wrote:
> Quite a few npm packages declare MIT/X11 as their license. This is equal to
> a pure MIT license.

it would be good if you could attach a link where this can be referred to.

>
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  scripts/lib/recipetool/create_npm.py | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
> index 11b2950..2816861 100644
> --- a/scripts/lib/recipetool/create_npm.py
> +++ b/scripts/lib/recipetool/create_npm.py
> @@ -45,6 +45,8 @@ class NpmRecipeHandler(RecipeHandler):
>              license = data['license']
>              if isinstance(license, dict):
>                  license = license.get('type', None)
> +            if 'MIT/X11' in license:
> +                license = 'MIT'
>          return license
>
>      def _shrinkwrap(self, srctree, localfilesdir, extravalues, lines_before):
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

