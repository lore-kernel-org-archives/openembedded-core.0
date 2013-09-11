Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id 08EE66B05F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 09:15:52 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id q14so5968330vbe.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 02:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=m3ld8w0GRozLLs1GkQA2w2pw7Ug+EU1gWk1F5BkH28Q=;
	b=SLzliCe1GRalXX3zsqRaLCJrUkfi+NS1YUFj0lv1wULvP4AheCdYfBzrPPqWF4XRfp
	gWnn5GtOrSbe+7Wb2nOJDJpOXserh8jmh+VBi9GaarcpRfEXrAH26ShHRN48nqzsg6pv
	m1Gf/gfHmPrmZ7ncdJJ4XCAUw+oxhH972P1aXB7z39SZMPWOOzu9EAiaW9D9yf0HqtVS
	RRYZlyJLvzMot1UXs+DjL6fWh4XTz15ufwecOWg6H2/YHq7WeG6hcusVcEL8a+LWhvlS
	733v7y/BVr9DuvJZwLbQkrma7hXgG0jXpZ54iYEIevR1t/e32r+2bzFOexgd4whKYSnF
	Gi/A==
X-Gm-Message-State: ALoCoQntQ+yIL/Q1/oGYzh1UrGdytTVFVufC+iI60195Ciiac5iJkibF2gSJBtJwNt8Bxp9tYU5K
X-Received: by 10.58.152.3 with SMTP id uu3mr308134veb.16.1378890954064; Wed,
	11 Sep 2013 02:15:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 11 Sep 2013 02:15:34 -0700 (PDT)
In-Reply-To: <14d6fca8bde7511b5ee32e26b3ece70a93345f99.1378875647.git.Qi.Chen@windriver.com>
References: <cover.1378875647.git.Qi.Chen@windriver.com>
	<14d6fca8bde7511b5ee32e26b3ece70a93345f99.1378875647.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Sep 2013 10:15:34 +0100
Message-ID: <CAJTo0LZP4K8o6y_bADGh0=2nVQTwOcY-U6Xgbznmi2SxZVASCw@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] init-live.sh: distinguish between a read-only image and a read-write image
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
X-List-Received-Date: Wed, 11 Sep 2013 09:15:53 -0000
Content-Type: text/plain; charset=UTF-8

On 11 September 2013 06:01,  <Qi.Chen@windriver.com> wrote:
> The iso and hddimg share a common concept of 'live image', and they
> use the same initramfs and thus the same init. However, that init
> script in initramfs made a wrong assumption that the rootfs image
> was read-only by itself. This is apparently not true for hddimg.

Works for me, thanks.

Acked-By: Ross Burton <ross.burton@intel.com>

Ross

