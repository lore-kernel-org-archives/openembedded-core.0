Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id DC32E6D755
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 08:27:06 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id j5so4781036qga.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 00:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=r6UVLlJUSJ5b3imFyP2OeiweQdJAMVGrK5Yrhjubt3Q=;
	b=Sqj1PpnkGVHCPqp/+5foSnIrrP0jnnUcC17YucNd5xTbRqJDYbf35MA4osHOvT7/qV
	57J9PduUhsnQ/TxouKnRbT9ITgP+A+VhMt/D4OetOipWxYoJbD9+YYH+wOong9zcGZXK
	xFGnhZVOqPPP57zbmLYeFMKzG84p1sTKvF0hRe82RXDm7p0M69Iydw/A/RNwwoefSkOL
	hK2lunh3UzGpaiM0X2pjqxTrr9ghzb9oa/EqUW/0jz9d89S9el51D2VHME4N9pg6pNgv
	mhbEt2jnjnJHNhu6RaCxM0gaWajWy12xDnt9sJYEZtuLfcZEYcMUQf9EHps5dkZIVj9Y
	j29w==
X-Gm-Message-State: ALoCoQmm4Z/7Zb8K7qNYDIKPTzngZ2rba5G1kIPJ/Bp+2/eRp6qhCCy0uQoVrA3nYrYCYGwDe2yB
X-Received: by 10.140.98.203 with SMTP id o69mr5225093qge.102.1393489627325;
	Thu, 27 Feb 2014 00:27:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 27 Feb 2014 00:26:47 -0800 (PST)
In-Reply-To: <1393471408-29014-1-git-send-email-rongqing.li@windriver.com>
References: <1393471408-29014-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Feb 2014 08:26:47 +0000
Message-ID: <CAJTo0LYcdFjkgKH3fRdt8F3Tyfc2pxbAXMnP77pEc9CdnsMAgQ@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus: proper error handler should be given after send_negotiate_unix_fd failed
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
X-List-Received-Date: Thu, 27 Feb 2014 08:27:08 -0000
Content-Type: text/plain; charset=UTF-8

On 27 February 2014 03:23,  <rongqing.li@windriver.com> wrote:
> +Upstream-Status: Submitted

Please state where this was submitted so that it's possible to see in
the future if it was merged or rejected.

Ross

