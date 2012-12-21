Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm61x-0002ws-D8
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 18:05:40 +0100
Received: from mail-gh0-f200.google.com ([209.85.160.200])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 08:50:03 -0800
Received: by mail-gh0-f200.google.com with SMTP id 10so2889536ghy.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 08:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=WbPCmaqz3//H//JGkwrkv7p0z+K1ZQpv5zQyVUriaT8=;
	b=GQLX2UhTs7Fy0U8/xbPNICaxd2SJ1wkS0RLo44asOxd86L5/DbZDz3NlhiI6iJTmNO
	WI9/y13fz5noRp/c2iPwVcXNFfeRbB/prq2HNdWgkzrm25gfosm4dL1KWIKbysHdXm8A
	W6Jwx85o6P+8QEIJ5iuIej/V+okC46GPbD87vjNV1UbX+vRfynAvTA0Bw0UjirNnussw
	glqOEsE2QPPAiqi5vZS4NWKDwuiYgY8fjJW5fL3BToe5JQD6feAdZJhqc1eGoukd8dr8
	8jczIUcvC/EMch/u7UMRI79PG3/EHY3QOOOVc1NT32QGVRuZNWQpzTPUEubKH6u+nrVT
	bT6g==
X-Received: by 10.52.34.19 with SMTP id v19mr18419328vdi.128.1356108602677;
	Fri, 21 Dec 2012 08:50:02 -0800 (PST)
Received: by 10.52.34.19 with SMTP id v19mr18419318vdi.128.1356108602594; Fri,
	21 Dec 2012 08:50:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Fri, 21 Dec 2012 08:49:42 -0800 (PST)
In-Reply-To: <f01341a575d045489ad0208e7638a8de87d0df10.1356094006.git.alexandru.damian@intel.com>
References: <cover.1356094006.git.alexandru.damian@intel.com>
	<f01341a575d045489ad0208e7638a8de87d0df10.1356094006.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Dec 2012 16:49:42 +0000
Message-ID: <CAJTo0LbQ+WeATtU919e4NWsETE08MEb6bZqXbf7b6hXhTatBBw@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQlTivx4FMWx1S7IsgpTqUmLa7k79VuMoXypm1NKovw0Nu1eGjl5c1yaRJG7nUyv6DHE5YnCj1RODYnJE6/5ReyZXpi9oNvH5yEaAt8+ro5JXVg2ZnqEsRXAkxqScnKwzplLkngrn49zXGihGdTYIuaQ60qkIXwyTbPPSfki8+PKqs3SQJf6OmS/qIZ281rEUsafTNR7
Cc: martin.jansa@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] Prepare mesa-dri for weston compatibility
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
X-List-Received-Date: Fri, 21 Dec 2012 17:05:41 -0000
Content-Type: text/plain; charset=UTF-8

On 21 December 2012 12:51, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> This patch enables mesa-git to build wayland-compatible
> packages for usage with weston.
>
> It adds wayland platform support, packs the wayland-egl
> files, and sets the -git version as preffered provider.

This and the other comments from my last review still stand.

Ross


