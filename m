Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id C1D5F6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 10:10:05 +0000 (UTC)
Received: by qcfy6 with SMTP id y6so46486192qcf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 03:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BuTKNIzSLgOFNxddZDf/g9ftG+PAkPRW5GoR1A22egk=;
	b=cdjC/Cyp6VVd9TV9QG5NmvPSvAQ2BBwLwcYQ3Kp4bKRYVCX75ifZ7caytwkIrbFNhs
	97j4ClvfVGMtNESHQriUyw6DX3hiLPf4Y24p1ogaxoCHAJGmgmTzxMFYK2regF8e3/lF
	rH0kswuKw1qXvZnE1ae1tMxgHjHYKnnavgtgwqgc1icQLmN9O50/oKHntElcJRl5GwIh
	UsEIVUALO7k6bz4feZ78v6i3ZyaoBtwlh4G4FX8N97whlwQqJSlk6nLTs8xcb2G6JTkm
	Jpk9rrEvRy5x19Mmj1iABnr/If98Yyun86+Zh3DyHeYUqSKyfNx1jULqIaZ3u9cyNJ0G
	8FPQ==
X-Gm-Message-State: ALoCoQm5mpjBQiQD+TKqU0LohcLbx5xVRHoeMMszAz2P7O1RMq4JJUzXL6MGRgPzRT4dqpNh8f+N
X-Received: by 10.55.53.21 with SMTP id c21mr16407727qka.40.1427710207190;
	Mon, 30 Mar 2015 03:10:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 30 Mar 2015 03:09:47 -0700 (PDT)
In-Reply-To: <20150329002843.GE2343@jama>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
	<1426930147.29168.104.camel@linuxfoundation.org>
	<20150321145504.GG4738@jama> <20150323222113.GD3904@jama>
	<CAJTo0LbTfKqs_se99op6w1eA0A4_QAM5VX9VVDYJYh6+1pnyzQ@mail.gmail.com>
	<20150325161208.GK3904@jama> <20150329002843.GE2343@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Mar 2015 11:09:47 +0100
Message-ID: <CAJTo0LZqbqThJ04OTmbrEhUQx1VaXT-9LGS-S6bosyKBmgGvFg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Mon, 30 Mar 2015 10:10:07 -0000
Content-Type: multipart/alternative; boundary=001a11490994be03a905127eaf9b

--001a11490994be03a905127eaf9b
Content-Type: text/plain; charset=UTF-8

On 29 March 2015 at 00:28, Martin Jansa <martin.jansa@gmail.com> wrote:

> WEBOS_FONTCONFIG_CACHE = "${datadir}/fontconfig/cache"
>

I'm sure there's a good reason why fontconfig caches are going in datadir
but I'm not sure I want to know it :)

Ross

--001a11490994be03a905127eaf9b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 March 2015 at 00:28, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":50w" class=
=3D"a3s" style=3D"overflow:hidden">WEBOS_FONTCONFIG_CACHE =3D &quot;${datad=
ir}/fontconfig/cache&quot;<br></div></blockquote></div><br>I&#39;m sure the=
re&#39;s a good reason why fontconfig caches are going in datadir but I&#39=
;m not sure I want to know it :)</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a11490994be03a905127eaf9b--
