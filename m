Received: from mail-ia0-f169.google.com ([209.85.210.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UAp6P-0000cf-Ft
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 23:03:55 +0100
Received: by mail-ia0-f169.google.com with SMTP id j5so934005iaf.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 13:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=iD3mJcSDqwCfJqqhUeK3EdmU6LCgso7V4GIjTcBHjyo=;
	b=zZsJpzs9PrmwrWoOVIBk88abfRBFbEEIG+kKReqx5mFpytpFnPsIYylFnSoG31qAvd
	MMw3bJBFz4MXp2jvRY3/7d6u9kpGnltHWaCsVb6H+Sjlx2sUAdqRWNsAVu0iLqbCiIz3
	AzQQn2WF5i0+4jXpXWA3rvKnP2p5kGTKphAfXhKw2idDvR4MVK3FQB0YN2ymUWA/MyNA
	aLqKZfa/oGVJx/spvSgWvFST3ZsEIaOEedDBeR/Ol1sjGu6w0G+ialc859kWTZYjXnMx
	kjd1pHEdvN9bkRF1NbW8NDjg3k0TKTg7VNKyJjN6HQUEVzauSzhk4q2nYtSjgrZ6RKMC
	Yexg==
X-Received: by 10.50.17.131 with SMTP id o3mr1899115igd.112.1362001651823;
	Wed, 27 Feb 2013 13:47:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Wed, 27 Feb 2013 13:47:00 -0800 (PST)
In-Reply-To: <1361987211-19783-1-git-send-email-Martin.Jansa@gmail.com>
References: <1361987211-19783-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Feb 2013 13:47:00 -0800
Message-ID: <CAMKF1so35E3SmehBRmPQkJqBfhZuFg7z7XLBD4Sb6w2L1LHW=w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd.bbclass: fix bb.error
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
X-List-Received-Date: Wed, 27 Feb 2013 22:03:55 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 27, 2013 at 9:46 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> NOTE: recipe avahi-ui-0.6.31-r7.0: task do_package: Started
> ERROR: %s does not appear in package list, please add it avahi-ui-daemon
> ERROR: %s does not appear in package list, please add it avahi-ui-dnsconfd
>

IIRC there already is a patch floating around on ml which fixes it.

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/systemd.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index 00865ed..564cd72 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -53,7 +53,7 @@ python systemd_populate_packages() {
>      def systemd_check_package(pkg_systemd):
>          packages = d.getVar('PACKAGES', True)
>          if not pkg_systemd in packages.split():
> -            bb.error('%s does not appear in package list, please add it', " " + pkg_systemd)
> +            bb.error('%s does not appear in package list, please add it' % pkg_systemd)
>
>
>      # Add a runtime dependency on systemd to pkg
> --
> 1.8.1.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


