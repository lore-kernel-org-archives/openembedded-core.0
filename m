Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 41DB672A78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 11:04:19 +0000 (UTC)
Received: by igui7 with SMTP id i7so9466854igu.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 04:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cOZfDTkNQ3BNGjfG1w3dKcYRHdDKpTq9l3qY9YoccZw=;
	b=U1w+wSexffU8kQXX7g84rqrPke+Tba3HTPmMGm6qrsc/AggK3aTOlPdGlWcopoStbI
	oU46sY+WrcD2550cQTYFJOwSL6WpKxXaWHWHA2fEqM6VLOvP5kZ8rU4Gt69rv869J8aG
	4IQcHzmZ2H3nFv5eH7D0Zm4K4W7h0bZVS7wTw23CMMs2LOLdXVwwNJiHGI3XcAcBvDJv
	BL/t+wXH2HV3d4EMdd8kmL0iDBXoldZlZXQhfiblFxGiCkARpRbUZw8xDwyugWvXNe8H
	Qj2cywKwLhRY/99ZMSOASsMRMbNBo5OYmGvkaXWBoOrf1nUkDLjhOq7TGugV8jxIWJVU
	HBIw==
MIME-Version: 1.0
X-Received: by 10.50.138.73 with SMTP id qo9mr1868560igb.64.1439550259861;
	Fri, 14 Aug 2015 04:04:19 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Fri, 14 Aug 2015 04:04:19 -0700 (PDT)
In-Reply-To: <1b0885ef5ddc0c9caa947f2a444dc83d55591d3c.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
	<1b0885ef5ddc0c9caa947f2a444dc83d55591d3c.1439549437.git.alexander.kanavin@linux.intel.com>
Date: Fri, 14 Aug 2015 13:04:19 +0200
Message-ID: <CALbNGRSbR5fzUUs7F+s_NqesaQa=XG5E8j4gEew845-tVpE3AA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 15/22] libwnck3: add a recipe from meta-gnome
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
X-List-Received-Date: Fri, 14 Aug 2015 11:04:20 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 14, 2015 at 12:55 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> libwnck is a dependency of epiphany
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
>
> diff --git a/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb b/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
> new file mode 100644
> index 0000000..6bc625a
> --- /dev/null
> +++ b/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Window navigation construction toolkit"
> +LICENSE = "LGPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
> +
> +BPN = "libwnck"
> +
> +SECTION = "x11/libs"
> +DEPENDS = "gobject-introspection-stub gtk+3 gdk-pixbuf-native libxres"
> +
> +PR = "r1"
^ Please skip

Andreas

