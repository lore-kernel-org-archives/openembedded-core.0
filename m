Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 205417E8E7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 13:22:32 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a15so3256670wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 06:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=H/bzrxNMQvF/EIn9eJDhzfwarMUI5yg1IVRGKrkRBPA=;
	b=Emp02N8ZEddezdLDMvbMN/9FRvoizgGpVIE6Qtl61gkT8GBvSRVk0W8LNoSWsD1By5
	gr01jFth0a1L5DmA9oAJ+D0V44YsHUeX/f3bEICsjzwv8u97wyCWNmlf97SMzR0IDrK0
	wTMQw7F6U3+uiyuRS6CmZ2+v2PqPBTxoFodR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=H/bzrxNMQvF/EIn9eJDhzfwarMUI5yg1IVRGKrkRBPA=;
	b=dYzCFjP5EUoeTX2r/e8jhvNCocMmky8FY9E2AV7pFOU2vgKytNAnxOCJbqzYHsqjB5
	dPMxn8Wf3NwtI3xtsEHqZ4Bv9HekUgxpGk7hoJpxENcBy2NOpPiGe+0iZwvfX9CKp774
	SvdNWZYOJ7hrO5HQgsVSVbWRa1KEsWW6xdSai5I56fCkzi+Nxu3RGb5D/oXrNRcSwfn7
	L/ji6Q9vrMa5nJ84q8SWk8Vj2+ouSlDBOVOlVJ4IvVQPH0h/o1cewUFZa57TkfCNLHJL
	jYHKaoW/5eHk1pUD7kuie0Bd+3y2ujGZbdg+BYBTPdCz/H/NSX/i41R1M2SzRTN7zyuG
	h9fQ==
X-Gm-Message-State: APjAAAXeFqJtcPFqS/+0JmmLB4XnUWnIneUBE+81ZqMULaQPwbqWSubU
	0htb8gjUNJ4GYUfSMr8F1ZQVrNNMfew=
X-Google-Smtp-Source: APXvYqxqVQGJHV7lmSvnJPCs//9m7R6uIfJ3DgP0bAVLwbbacKYlqjHTEM8857sSqOJqYtFZu/9IKQ==
X-Received: by 2002:a1c:5f09:: with SMTP id t9mr3917966wmb.112.1560864153601; 
	Tue, 18 Jun 2019 06:22:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r12sm21712001wrt.95.2019.06.18.06.22.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 06:22:32 -0700 (PDT)
Message-ID: <37c9cc258cd2b9b257607a5bfa4d783496430e35.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 14:22:31 +0100
In-Reply-To: <bb0334d27a1ec6cb25e6eb5b994a89c56f311c7d.camel@linuxfoundation.org>
References: <20190618061128.17422-1-bunk@stusta.de>
	<bb0334d27a1ec6cb25e6eb5b994a89c56f311c7d.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] wireless-regdb: Add recipe
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
X-List-Received-Date: Tue, 18 Jun 2019 13:22:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-06-18 at 13:34 +0100, Richard Purdie wrote:
> On Tue, 2019-06-18 at 09:11 +0300, Adrian Bunk wrote:
> > Since wpa-supplicant is provided,
> > the database of permitted frequencies should also be provided.
> > 
> > wireless-regdb-static should be used with kernel >= 4.15.
> > wireless-regdb can be used with older kernels and is mostly
> > irrelevant here, but keeping it in meta-networking would
> > create needless recipe duplication.
> > 
> > This package was previously in meta-networking.
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |  1 +
> >  .../packagegroups/packagegroup-base.bb        |  1 +
> >  .../wireless-regdb_2019.06.03.bb              | 44
> > +++++++++++++++++++
> >  3 files changed, 46 insertions(+)
> >  create mode 100644 meta/recipes-kernel/wireless-regdb/wireless-
> > regdb_2019.06.03.bb
> 
> This seems to break deb rootfs construction:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/712

opkg as well:

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/716

basically nothing provides wireless-regdb but wireless-regdb depends on
it.

Cheers,

Richard


