Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 07E196078D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 07:59:56 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id q124so100153558itd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Nov 2016 23:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=rgB4y9BkpS4oOHtmzwxcFPoTwhoLqFoOyH94R4B/DuY=;
	b=gPpvrl8ofFfVBGjn2047GA06dJsj2ruGD6bFU5q3+uZN9SEeB2CRDSoc0tmHZu15Vc
	RsSFX9hOyRK7+c6rMwmlz8S/bPJ3eIc4TVE/k/deVCwxrv1do4yftfhTvrTzy8X4jyFf
	kGBTejaARZfPadkBSgdLq33V5dBLX4Cboyjj+zD1910ppyz3HHvuKDueZXm3TnNunTk8
	x4a9MhMzCcwxWr2fBR2/qQ0pLr+AvQC2rgN4CVH9b9I8ZhzZjHqUtsl/QSqyYc+cC9eW
	ryLZVf4isX/eBVYFmyA62p3C587B7I38hPl/bqWIOSYlEMWAYW302Yda5UaegNSkDso5
	a27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=rgB4y9BkpS4oOHtmzwxcFPoTwhoLqFoOyH94R4B/DuY=;
	b=EL48lvt3BiUfEFMDgB6RaxxALgHEZnY7iM3A87+xb6NNpSkcQme6cv0mitdO9umLTr
	qJRslAAjGm9OWdsvLdjwtJWHGMD9U565QfyCn4XxnzE0LB/39TkXN0utyjjmrVLieBbW
	3rkaJ605lqsGROtf0/c0fSuRpY5CBc925dFlyYVL5y1xKoWZeg718rpDnZUbJ4VxcHrc
	WBfgLBrz5RveWhYLjAtcc+H9uVQdGR7hKZoJsH+IAYX375ryMcvMYsWWrbAixd2lMWjg
	U1wR8T4NpwUhTpeyfwZoRAmgNXJqzSBxQO9Hg+wOoBCiTsnmVENRPivU68Sfb6trBt7a
	p0DA==
X-Gm-Message-State: ABUngvcuvYRp8yl2C8uH3UKTYRLxXgAHTuDWB4PWz9RQ02sw5pGZAS9IbG3rtzw3bk/JqOES
X-Received: by 10.107.48.134 with SMTP id w128mr29934046iow.226.1479110397704; 
	Sun, 13 Nov 2016 23:59:57 -0800 (PST)
Received: from pohly-mobl1 (p5DE8FC67.dip0.t-ipconnect.de. [93.232.252.103])
	by smtp.gmail.com with ESMTPSA id
	g96sm8898236iod.10.2016.11.13.23.59.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Nov 2016 23:59:56 -0800 (PST)
Message-ID: <1479110393.3240.3.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 14 Nov 2016 08:59:53 +0100
In-Reply-To: <20161111193902.3e34bf60@nuc.betafive.co.uk>
References: <1477161480-20271-1-git-send-email-paul@paulbarker.me.uk>
	<20161105101438.1ef1f627@nuc.betafive.co.uk>
	<CAJTo0LbB0eGStoFbyinDYP0zzEJ27BL0eDyGKFkjdh=AaWBPVA@mail.gmail.com>
	<CADkTA4OaRgUJwFwT=S_h41EW4OO_Koa+QQr=t3t+X+6pszrzBQ@mail.gmail.com>
	<CAJTo0LZxGYzpjUetPspX6mKktoL_XnDqfncyHFWN5Kzfij8-UQ@mail.gmail.com>
	<CADkTA4NmhstuGn7cZLD-MGB1OdNbAFLkiOKrf20Bri0KSEsuQA@mail.gmail.com>
	<20161109180854.130d6804@nuc.betafive.co.uk>
	<CAJ86T=XNd_ypY_aBc+eVGpJ4ntUUecT7Umdg37hUrNqZNAw_6g@mail.gmail.com>
	<20161111193902.3e34bf60@nuc.betafive.co.uk>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OpenEmbedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Allow ${S} to be overridden
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
X-List-Received-Date: Mon, 14 Nov 2016 08:00:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-11-11 at 19:39 +0000, Paul Barker wrote:
> On Wed, 9 Nov 2016 15:42:29 -0800
> Andre McCurdy <armccurdy@gmail.com> wrote:
> 
> > The solution I use (learned the hard way) is to ensure that "S = ..."
> > comes after "inherit kernel" in the kernel recipe.
> > 
> 
> Ok, yea, this works for me.
> 
> Is this expected? S is set to ${STAGING_KERNEL_DIR} at the start of
> kernel.bbclass. The base_do_unpack_append() function is defined later
> in kernel.bbclass. If S is set to ${WORKDIR}/${BP} only after
> kernel.bbclass is inherited, then that's after base_do_unpack_append()
> has been parsed.

Parsing itself does not expand variable references (*), so it is
possible to use a variable that gets changed later on and use the value
that the variable eventually ends up having.

(*) There's one exception - the := assignment expands based on the
currently defined variables at the time of parsing the assignment.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




