Return-Path: <ulfalizer@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id F049F6FFED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 23:08:28 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id g9so2506794vkg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 16:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9m7PoH0Tv4Kg0WcdWb7CzjcyoTYsg6zpbfG0kSeoqi4=;
	b=OX5ghrVx3A7G2k1s6Tb4Vrf9kzorz2KQZWDvV+2AQMM1mO0kzAGCQxxcAIE5aresdr
	TSU6X/jN68bkCwfeUWIegpbDVC8/yp2RvsjreqYQtXzi4I6PchqmHQlorYOu4jRQUUSx
	GpmDHLRTc6Kkjk/kFN6OLMODA6y2kqJPV+Y6KpRy7WSu5PCQJKQbhVrazBQ3TGAzf9wX
	jmIGI6aZ+2u8iDzZA+/Sf0L7+z0HOjPkhpK1v1arGCJJZTWTBnaprLO1J8hU8pjC4HEZ
	7xSc0hzJ0tt8v9yWN5/Giina3lod7/pCATPHvu7Yqn4XRj+Tw1nA4eeaXmkgjxHNK0Bt
	VnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9m7PoH0Tv4Kg0WcdWb7CzjcyoTYsg6zpbfG0kSeoqi4=;
	b=S6rhNzzKANp0n9N4ZkRofaZMsixXIaqgICHVNGFw2uzvBOb6LsUivbABLNVKhoXcvP
	KJy74FluSG6Tj09c6qFwFTmwQ5A2JJpRQUzWkHEAPcIwAlDONVd4CXcqsxA0nYa+8Ats
	cm8x1hqLa0glhrpDqFwWZOEV40TgkmErhi4KIzSmUV3l9tU5Wml2EJDb0vJKzCWEq4xL
	IFNwO8fciXC7tdAuRxnGzrrFkq6GWkYeFcJ3AcxegntbM2tIeowzg3dRv37I+kMRFlyf
	geZbyJiZLLWV9efAWzV/yaIO3G0a9zvV4cB2rgLIWCJzJdgVZM7jOcy/KMHsYcqZBEcl
	iYCA==
X-Gm-Message-State: AE9vXwPueD4rEzOgJN8OvM0EKkLuZZl6OO3fQJVpMqUSwqfCOxjBTZDwepD0Jx5yMhx20P1Z0xFi6ODGy1Z7mg==
X-Received: by 10.31.82.67 with SMTP id g64mr403557vkb.58.1473980908813; Thu,
	15 Sep 2016 16:08:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.48.146 with HTTP; Thu, 15 Sep 2016 16:08:28 -0700 (PDT)
In-Reply-To: <1473979659-120831-2-git-send-email-mark.hatle@windriver.com>
References: <1473979659-120831-1-git-send-email-mark.hatle@windriver.com>
	<1473979659-120831-2-git-send-email-mark.hatle@windriver.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Fri, 16 Sep 2016 01:08:28 +0200
Message-ID: <CAFkk2KTwb4AB4tu7G5uKVHpXWPXHmoM5yejP9AL6=SeqeExumA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] package_manager.py: Change diagnostic messages per IRC
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
X-List-Received-Date: Thu, 15 Sep 2016 23:08:29 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 16, 2016 at 12:47 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> Based on a discussion with IRC user: Ulfalizer
>
> It was suggested that removing the diagnostic list, and replacing it with a
> simple hint to what might be causing the problem was a better solution.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/lib/oe/package_manager.py | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index d609593..dc88f62 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -838,11 +838,13 @@ class RpmPM(PackageManager):
>                      new_pkg = self._search_pkg_name_in_feeds(subst, feed_archs)
>                      if not new_pkg:
>                          # Failed to translate, package not found!
> -                        err_msg = '%s not found in the %s feeds (%s).' % \
> -                                  (pkg, mlib, " ".join(feed_archs))
> +                        err_msg = '%s not found in the %s feeds (%s) in %s.' % \
> +                                  (pkg, mlib, " ".join(feed_archs), self.d.getVar('DEPLOY_DIR_RPM', True))
>                          if not attempt_only:
> -                            bb.error("List of available packages: " + " ".join(self.fullpkglist))
> -                            bb.fatal(err_msg)
> +                            bb.error(err_msg)
> +                            bb.fatal("This is often caused by an empty package declared " \
> +                                     "in a recipe's PACKAGES variable. (Empty packages are " \
> +                                     "not constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)")
>                          bb.warn(err_msg)
>                      else:
>                          new_pkgs.append(new_pkg)
> @@ -855,11 +857,13 @@ class RpmPM(PackageManager):
>                  default_archs = self.ml_prefix_list['default']
>                  new_pkg = self._search_pkg_name_in_feeds(pkg, default_archs)
>                  if not new_pkg:
> -                    err_msg = '%s not found in the feeds (%s).' % \
> -                              (pkg, ' '.join(default_archs))
> +                    err_msg = '%s not found in the feeds (%s) in %s.' % \
> +                                  (pkg, " ".join(default_archs), self.d.getVar('DEPLOY_DIR_RPM', True))
>                      if not attempt_only:
> -                        bb.error("List of available packages: " + " ".join(self.fullpkglist))
> -                        bb.fatal(err_msg)
> +                        bb.error(err_msg)
> +                        bb.fatal("This is often caused by an empty package declared " \
> +                                 "in a recipe's PACKAGES variable. (Empty packages are " \
> +                                 "not constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)")
>                      bb.warn(err_msg)
>                  else:
>                      new_pkgs.append(new_pkg)
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Looks good to me.

Maybe the hint could be stored in a variable to avoid repeating it, or
a helper function factored out. ALLOW_EMPTY_<pkg> = "1" instead of '1'
avoids encouraging random single quotes in files too.

Cheers,
Ulf

