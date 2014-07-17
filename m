Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 61BD37067D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:34:07 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id l6so2109776qcy.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 07:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iS+qyjBXuo60UfkWrnfFMTeprFGFcUu3GYjoL+fXDFE=;
	b=GKF5uMKIs6SWMhvYy5eh9Q5Ke7VQBF6/ssiefZdXUme9b1MyJzjOuRUFbrKVZJhqCZ
	hU5FNtJZrIaXUZQObYGugxi4UDvzD5LIy1U7a2dg24a0vBMBlV0w+kOoNGsCX6j/W2Ns
	b4eOkiaym5SdagUWvZBempy6mQ3QIYRO6xpQwy96itQ4rzNUK3bABcuEGq7E79+No3Rp
	xra30d7xdqBbhyjSrRzYR1l2e61phax2psHrspUuBWGSQArD30AHD1ZM0Y8h/cxyx2vc
	5iIt1uN8S2HDpl0wHyMI4lcvva6k8G8oIkR+x3MlAPUsNGHwlzOHAMXrQceFnOFJ+Cgs
	qtLg==
X-Gm-Message-State: ALoCoQlv3hmaNvZdIEUkVboJgybnLShaCaIY6o7BUxHryGadXIWaSOW9SYTN1U1WVfZWI/HrYFFJ
X-Received: by 10.140.35.232 with SMTP id n95mr56050939qgn.82.1405607648654;
	Thu, 17 Jul 2014 07:34:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Thu, 17 Jul 2014 07:33:48 -0700 (PDT)
In-Reply-To: <1405598932-28766-1-git-send-email-daniel.bornaz@enea.com>
References: <1405598932-28766-1-git-send-email-daniel.bornaz@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Jul 2014 15:33:48 +0100
Message-ID: <CAJTo0La+Fn5Oz9+F-Li_VosV7BADxa0z1oKyyyCpAUEf3_JfLA@mail.gmail.com>
To: Daniel BORNAZ <daniel.bornaz@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus: dbus update to 1.8.6
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
X-List-Received-Date: Thu, 17 Jul 2014 14:34:08 -0000
Content-Type: text/plain; charset=UTF-8

On 17 July 2014 13:08, Daniel BORNAZ <daniel.bornaz@enea.com> wrote:
>         renamed:    meta/recipes-core/dbus/dbus-glib-0.100.2/no-examples.patch -> meta/recipes-core/dbus/dbus-glib-0.102/no-examples.patch

If there's just a single version of the recipe, please don't version
the directory.

>         renamed:    meta/recipes-core/dbus/dbus-glib-0.100.2/obsolete_automake_macros.patch -> meta/recipes-core/dbus/dbus-glib-0.102/obsolete_automake_macros.patch
>         renamed:    meta/recipes-core/dbus/dbus-glib-0.100.2/test-install-makefile.patch -> meta/recipes-core/dbus/dbus-glib-0.102/test-install-makefile.patch

Your upgraded dbus-glib has a SRC_URI assignment in the .bb which
overrides the assignment in the .inc, so these two patches are not
being used.  The obsolete automake macros patch appears to have been
merged upstream but it appears that by not
applying-test-install-makefile you've disabled the dbus-glib-tests
package.

> deleted file mode 100644
> index c1bb06a..0000000
> --- a/meta/recipes-core/dbus/dbus-glib_0.100.2.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require dbus-glib.inc
> -
> -
> -SRC_URI[md5sum] = "ad0920c7e3aad669163bb59171cf138e"
> -SRC_URI[sha256sum] = "a5bb42da921f51c28161e0e54a5a8241d94a1c0499a14007150e9ce743da6ac5"
> diff --git a/meta/recipes-core/dbus/dbus-glib_0.102.bb b/meta/recipes-core/dbus/dbus-glib_0.102.bb
> new file mode 100644
> index 0000000..28e8a72
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus-glib_0.102.bb
> @@ -0,0 +1,8 @@
> +require dbus-glib.inc
> +
> +SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
> +           file://no-examples.patch \
> +"
> +
> +SRC_URI[md5sum] = "f76b8558fd575d0106c3a556eaa49184"
> +SRC_URI[sha256sum] = "6964ed585bb8149a14ab744b5ded5e77cf71ec5446e6dcc5fcf5eebcc52df29c"

Please use -M so renames are expressed as a change, instead of a
delete and a creation.

Ross

