Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2B53D6012A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 13:49:49 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id hb3so77636427igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 05:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=FD+bVmW1VUCj0gdsaJgn/rVD9FC8NjBwaGVlmRCgkhA=;
	b=vGiF2ygbvHf5Rmn6NyJ9aNZqjbJEJPAETHMPoZfhYJHAm8bTgt4Ic1sxPxH0BAH5+j
	avc6eU7mXmnUTCt+uWpVVqOdat3rjC2e/kE2epdsj9VUeiQQVSg/CnDHfZel2eYP7Uj4
	1HbGVEthOt4u1H116/AnQJ+iQb0AL9N3NZa68nhNbmlKJFFhP+6eYqQeTZgXwBlA5tDZ
	hGZJG+BSVAYCvEVfRvHTllmBKR3ui1RQfduCsD0bkq+HDUY2Y5UP3lpju/4hgo/FC2JK
	O+JDkmU3GqSXc6pENzl+06dqCqlcf42TqluBVqzrhVIVWX27TWI0/wUKIii21GzwNalM
	0CSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=FD+bVmW1VUCj0gdsaJgn/rVD9FC8NjBwaGVlmRCgkhA=;
	b=j9cMcDb/aqCxgJNfECUxDtAucXGlhRp0ywRxFzjqbQdFRZBxXSL3ukhtQusnRVX1c2
	0SwL0DfvbRm+QfE5YJrp5LuUxy9eGR0XpagO89zVclxmDIBi1Nr0TFh+0iolP7TXNouv
	TxjgLEy19dmzA+qAtg2HG0WSB0uhxfR5DJb1a6/jHLc4hM3mAHlFPobzKiFXho0AWXe+
	GTu1hoG0H6+Uh49IMgAKEY3cpg0vlNC8fCizM///v5VsuKOhs3waJ1JnLJoanW4yaC18
	A6Ha+0l8ugb1mS5QFTT2HZNi0IYs0IUZ5KSYVD1D/afr/tdC5K+diyUCAMyMdzKhwAgh
	htng==
X-Gm-Message-State: AG10YOQqi8YNjgr0JxkNLMY6LB58C7AG7I6sgq5w2JEVOBPERtbGIHsRCOQ9u68wTqXZbwCR
X-Received: by 10.50.78.1 with SMTP id x1mr4512543igw.66.1455025790538;
	Tue, 09 Feb 2016 05:49:50 -0800 (PST)
Received: from pohly-mobl1 (p57A57CC2.dip0.t-ipconnect.de. [87.165.124.194])
	by smtp.gmail.com with ESMTPSA id a8sm2387899ioj.14.2016.02.09.05.49.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Feb 2016 05:49:49 -0800 (PST)
Message-ID: <1455025787.32190.12.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 09 Feb 2016 14:49:47 +0100
In-Reply-To: <1455009772.17004.4.camel@intel.com>
References: <1454944449-11435-1-git-send-email-patrick.ohly@intel.com>
	<1455009772.17004.4.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH] meta/conf/layer.conf: adapt to more flexible initramfs-framework RDEPENDS
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
X-List-Received-Date: Tue, 09 Feb 2016 13:49:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-09 at 10:22 +0100, Patrick Ohly wrote:
> On Mon, 2016-02-08 at 16:14 +0100, Patrick Ohly wrote:
> > initramfs-framework now RDEPENDS on ${VIRTUAL-RUNTIME_base-utils},
> > which can be busybox or some alternative like toybox. Making the
> > SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS exception flexible, too, ensures that
> > distros using toybox still pass the selftests.
> > 
> > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> > ---
> >  meta/conf/layer.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> > index 7100ed7..baa4fd4 100644
> > --- a/meta/conf/layer.conf
> > +++ b/meta/conf/layer.conf
> > @@ -46,7 +46,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
> >    ppp-dialin->ppp \
> >    resolvconf->bash \
> >    docbook-xsl-stylesheets->perl \
> > -  initramfs-framework->busybox \
> > +  initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
> >    initramfs-framework->systemd \
> >    initramfs-framework->udev \
> >    liberation-fonts->fontconfig \
> 
> Was VIRTUAL-RUNTIME_base-utils meant to be a single word?

Apparently it was, for the sake of consistency with other
VIRTUAL-RUNTIME variables.

> I just noticed that toybox does not provide a /bin/sh out-of-the-box,
> and even when enabled the resulting sh is not complete enough to execute
> initramfs-framework scripts.
> 
> That means that VIRTUAL-RUNTIME_base-utils = "toybox" leads to an
> unusable initramfs when replacing "busybox" with
> ${VIRTUAL-RUNTIME_base-utils} in initramfs-framwork.

A better fix is probably to make toybox a full replacement (eventually)
or make it RDEPEND on the missing pieces (current solution, for those
who want it as busybox replacement).

> This could be fixed by setting
>   VIRTUAL-RUNTIME_base-utils = "toybox dash"
> but then the patch above needs to be fixed.

No, let's keep the patch as it is.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




