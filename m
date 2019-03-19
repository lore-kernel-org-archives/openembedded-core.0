Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B08279980
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 10:45:40 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j9so6290971wrn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=cHHMvRy3AWYtZxXgulqUSwNuZw7b2u9XN2UvEPV3ucw=;
	b=FRej0y2KHCHryh7EeN9f1QTFhMX5pS/RzADc+Zj0R/BfYRksYNor99R77juKbDsFEX
	0c2RREHtYi8MZGkyBuWkZE951moUKDKItdJm5gEeJyANPowttm9+jvKRH07WW4VWP3W6
	9H4ekuoPmr7mU+zvUe7JyT3IfODJK4h0T17cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cHHMvRy3AWYtZxXgulqUSwNuZw7b2u9XN2UvEPV3ucw=;
	b=LCDgf+38lSd4++43zTqPCEZzyTrS2DDM0tL+ORudTy9mb1ulIFpMAsCKjoXY2zaxeU
	eKWxFkjrl2LuqRgbc8xR9vYaRINXiEv6fIfSj7IYhkOo02sNnxKzdDxij+/UOS67tS2s
	4A8nDBlALbbnQUI3SXiNdR0euSdiXt5pdBtAOJnfheFICtaHbMGZDvZH+eZcUCLQxhMR
	T/z6UDtl7QRsb4/4Ndg08QjJet479bq7EAIH8Ys46t7rvaePTVJeZ8X1cGb9pk3Zqgo1
	QqZh4OYWp6ti6QkIlEljycA6r/J6T49uHWXzzZfsJrnC10YjRXUtwAumU5YNQbVY3s29
	RtRQ==
X-Gm-Message-State: APjAAAWGaX2R2TdWjhSs14J2YurELmutsQgNA5egespcFJZbsBPoknjt
	SBWIcsIxyiAf/FLIfreb1YIwO2eZYLccqQ==
X-Google-Smtp-Source: APXvYqxVnGwuFgSHWrk1tcpSNuOFQkLhuVrPMvm98i8mWcbaivfLOGRxAaRlvg4dV9Ba58xloXbKHg==
X-Received: by 2002:a5d:4d42:: with SMTP id a2mr6535630wru.130.1552992340905; 
	Tue, 19 Mar 2019 03:45:40 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c126sm3093948wma.0.2019.03.19.03.45.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Mar 2019 03:45:40 -0700 (PDT)
Message-ID: <3e1d61b2effb3a55dfefbf65447e10f794f65432.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jiang Lu <lu.jiang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2019 10:45:39 +0000
In-Reply-To: <20190319075451.18823-3-lu.jiang@windriver.com>
References: <20190319075451.18823-1-lu.jiang@windriver.com>
	<20190319075451.18823-3-lu.jiang@windriver.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [oe-core 2/2] glib-networking:enable glib-networking complie as native package
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
X-List-Received-Date: Tue, 19 Mar 2019 10:45:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-03-19 at 15:54 +0800, Jiang Lu wrote:
> Enable glib-networking compile as a native package, for it is
> depended by
> libsoup.
> 
> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> ---
>  .../glib-networking/glib-networking_2.58.0.bb | 31
> +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/meta/recipes-core/glib-networking/glib-
> networking_2.58.0.bb b/meta/recipes-core/glib-networking/glib-
> networking_2.58.0.bb
> index f3190e1cae..35b4a3fa76 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
> @@ -29,3 +29,34 @@ FILES_${PN} += "\
>                  "
>  FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
>  FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
> +
> +# Make sure we compile with ca-certificates support enabled.
> +PACKAGECONFIG_append = " ca-certificates"
> +
> +DEPENDS += "ca-certificates"
> +RDEPENDS_${PN} += "ca-certificates"
> +
> +# We need native version for ostree-/flatpak-native.
> +BBCLASSEXTEND = "native"
> +# OE-core's relocatable.bbclass assumes that every package which
> +# ends up creating a ${libdir}/pkgconfig directory in its sysroot
> +# will always also install .pc-files there and tries to uncondi-
> +# tionally update paths in those files using globbing that fails
> +# if no such files are present. This presumption is not true for
> +# glib-networking which happens to create a directory by
> dereferencing
> +# a GIO pkgconfig variable which in turn is defined relative to
> +# the pkgconfig directory (${pcfiledir}/../...), causing pkgconfig
> +# to get created.
> +#
> +# Could be worked around in the upatream recipe but since that
> +# does not provide/create native versions of the package and since
> +# this problem is related to native packages, we work around it
> here.
> +#
> +do_install_append_class-native () {
> +    for _pc in ${D}${libdir}/pkgconfig/*.pc; do
> +        case $_pc in
> +            *'*.pc') rm -fr ${D}${libdir}/pkgconfig;;
> +            *.pc)    break;;
> +        esac
> +    done
> +}

This reads as if there is a bbappend in some layer which is now being
dumped verbatim into the upstream recipe with no thought as to what
makes sense.

We don't do PACKAGECONFIG_append in recipes and we don't hack .pc files
like this. The dependencies suggest we should also fix the
PACKAGECONFIG DEPENDS/RDEPENDS too.

This needs more work.

Also, for the first patch, its unclear why we need/want the patch
present there and the commit shortlog doesn't really describe the
multiple things the patch is doing.

Cheers,

Richard



