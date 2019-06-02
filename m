Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8A8A56B073
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Jun 2019 10:36:52 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n4so6291352wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Jun 2019 03:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ki3CGCU8gj8YQagnVJEFK3Xv3R/m8PaTzSeVaRseOOI=;
	b=LlNI/8hS1QMJUcXPz2j2NcZqXrUIaLw8dz5MpyhKKqpO35lHCdE83mpI6XR+HdUFnO
	2VlBImXnUa3v/37cJjtvK2JEf8CA8Kah9sPhusT35KnyDbSlerv6lJ3KEA9yWssDA8JM
	j0k5szVaMWd1/2tTyWxXAGIYbEpifElJcvQUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ki3CGCU8gj8YQagnVJEFK3Xv3R/m8PaTzSeVaRseOOI=;
	b=AwTJNIR8BLsFaE97eWL4GfE6T+zzn3Qatu0j7AE2tlF+XrBnp8Im4yWNNc+3LWB3Rm
	429gRK5HM5IET+TYH3XIX8DERsMe7n96gsVLl9B4KByq16V5bawc3SzrIMgFp6Yebnu5
	cdiT/zkcT0BEZjpopJcdRKqQBfrYV7vp4r2yA5w0JQV3f/DDLXD2plQi3Z2E4cn4tiBx
	NJMCQIx63r3AGJAuDJr3bWgfjZi75Yr6I6zkFkaz2JNeTHsYp9AWoJggP3UQCZVCSLSl
	6YEDRXGHvJkdEXYyahd5xgr+If1Wh4cJDYnK6mUpvR8QePyue0Buzxc+WuEbupc77EMi
	EhSg==
X-Gm-Message-State: APjAAAWg310hxmuLLbYWb1qKPScdl1TlJC+1xj+9ZhG1cUat3B7FOaOe
	cqndU2k8Q9OYhEVYntjrPXHNChGPSCY=
X-Google-Smtp-Source: APXvYqzlWR/B7e+IjA+v98jDp8kc29wUzvs1me1Y3qvejczI4ajx2BkaF3XUFfvnt948UEGfrEvUWA==
X-Received: by 2002:a05:6000:146:: with SMTP id
	r6mr12413615wrx.237.1559471813281; 
	Sun, 02 Jun 2019 03:36:53 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f2sm233102wru.31.2019.06.02.03.36.52
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 02 Jun 2019 03:36:52 -0700 (PDT)
Message-ID: <b5dc94a76d15d78512ad20639c09c4ff4b12ecde.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Sun, 02 Jun 2019 11:36:51 +0100
In-Reply-To: <20190601215825.24862-1-bunk@stusta.de>
References: <20190601215825.24862-1-bunk@stusta.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] lrzsz: Add implicit declaration fixes from Debian
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
X-List-Received-Date: Sun, 02 Jun 2019 10:36:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-06-02 at 00:58 +0300, Adrian Bunk wrote:
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../lrzsz/lrzsz-0.12.20/include.patch         | 23
> +++++++++++++++++++
>  meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  1 +
>  2 files changed, 24 insertions(+)
>  create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-
> 0.12.20/include.patch
> 
> diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch
> b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch
> new file mode 100644
> index 0000000000..3925fc8c86
> --- /dev/null
> +++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch
> @@ -0,0 +1,23 @@
> +Signed-off-by: Adrian Bunk <bunk@stusta.de>
> +Upstream-Status: Inappropriate [upstream is dead]

Could you put at least something in the patch header to say what the
patch does please?

Cheers,

Richard


