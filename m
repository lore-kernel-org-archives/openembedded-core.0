Received: from mail-vc0-f182.google.com ([209.85.220.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQfBb-0003i5-16
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 16:42:43 +0200
Received: by mail-vc0-f182.google.com with SMTP id ht10so2251568vcb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 07:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=/yq/IDvBgQx6VinghY6iTso3qhQUsk6ZYs32CGkU7tI=;
	b=R259K+NcbgOi4SNodzZWuQTR9XL8kSXzF4Q5EE6l3Hy+TyHnQuzuBQC0eL2a5acyXh
	r18Z1bH8qiBmZX72m2l7R/ZvqHK/xNWwYFwPCzq8FPaiq2nM8aGre72IrQtuJcFZq5Ww
	QB4K+FVTdDNYP+63l8/Hej3DVLwS/M3iO4/PJ+xvzkAZTcEh9o65yhn/b2jl/akszzcZ
	xl955s5Uo5QCktV7SlF0nwVbCKC50hxo4sghDdKzrpxY6Sberse9lrWgxi+BVmoPLhe0
	Arghl876+E4/fO3Fl/fCCG1O1maTGn+xw7PqcqEzniKqDqRjybZ5cSoqUmr0EbK8l/Wm
	Ucxg==
X-Received: by 10.52.28.139 with SMTP id b11mr7330623vdh.4.1365776718036; Fri,
	12 Apr 2013 07:25:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 12 Apr 2013 07:24:57 -0700 (PDT)
In-Reply-To: <20130412142015.GP2477@jama>
References: <20130412142015.GP2477@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Apr 2013 15:24:57 +0100
Message-ID: <CAJTo0LayWKMpxzsX4t67LepAg3AjhJXWtQvoU8-NVG5Qi5eTpA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmPdoKafQYruAe8MGPxs6a0L0jIAAXOaq5xd7asFSBMRq1T/adqAAgd4EB0Ln1lhG5xOItZ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: wpa-supplicant postinsts failing without sysvinit in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Apr 2013 14:42:45 -0000
Content-Type: text/plain; charset=UTF-8

On 12 April 2013 15:20, Martin Jansa <martin.jansa@gmail.com> wrote:
> oe-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
>
> defines pkg_postinst_wpa-supplicant
> with:
>         if [ "x$DBUSPID" != "x" ]; then
>                 /etc/init.d/dbus-1 reload || true
>         fi
>
> and /etc/init.d/dbus-1 is missing without sysvinit in DISTRO_FEATURES
>
> Thanks to "true" it doesn't fail completely, but if the goal is no
> warnings in images then errors should be fixed too :)

We're going to see stuff like this a lot - clearly we need some
abstraction over this.  One-off for dbus, or a general-purpose small
abstraction over invoking systemctl or init scripts?

Ross


