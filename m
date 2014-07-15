Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5F3397064A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:51:46 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id j15so4826227qaq.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AsHyMBmgupxZiHIoCGOLoVnuuBLbZPr1TkSviLHPkJ0=;
	b=A4Nu3owr8uMkIg/vTS0OXiH4onNdF0Tadjw6qoaSVcw+6IYR9SLM7yjSKFfnh+IwTm
	42w637G0kOHNtgalHwODnPi18LZ+0Dc7dc9n5kLWymDrKEb4NPX294cSvEYPbMYgG8a7
	4tkLDykaAgx8fbzf0GRqyFyVMh+lZXXqh1t002wdtzkuBOJfQyR2G3UEkWaVnXPoKKfW
	8TwPRzYwEYPhe8INKC+17tZbaxMrNWZGn4LTRMxw9SLM8aZAjH/hO6qQ8b1Xkm2Y5vSL
	+IG/t5xru/IK6bmfehyitZNTbchldGfYvJg2l87PSl2aDfyKMmweGj4tF6+qm/ZIL46c
	Tnsg==
X-Gm-Message-State: ALoCoQlbM9GVMb4wt0jkGkiUR/hcmRmt/foWFEe+da1g+fSYxsYVUpvcYpM8QQ5eZfQ60pJTesUO
X-Received: by 10.140.89.197 with SMTP id v63mr34961210qgd.71.1405439507723;
	Tue, 15 Jul 2014 08:51:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Tue, 15 Jul 2014 08:51:27 -0700 (PDT)
In-Reply-To: <53C5477D.3030501@linux.intel.com>
References: <alpine.LFD.2.11.1407150923000.13777@localhost>
	<53C5477D.3030501@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Jul 2014 16:51:27 +0100
Message-ID: <CAJTo0La_uMvwmqZSX-8uaRk3ZcZDY=54+3A1X+oNNtf9-fydaQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: curious about why bitbake.conf setting of FILES_${PN}-bin
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
X-List-Received-Date: Tue, 15 Jul 2014 15:51:48 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2014 16:23, Saul Wold <sgw@linux.intel.com> wrote:
> Blame me for that patch!  Looking back at the commit message from about 2
> years ago I think this got mid-way through a change, with the plan to
> actually remove lib_package completely since all it contained was the
> setting of PACKAGE_BEFORE_PN, therefore having FILES${PN}-bin. Not sure why
> we did not end up completing that.
>
> So another option is to remove the inherits and replace it with
> PACKAGE_BEFORE_PNs, Which would finish off the orignal plan!

Wouldn't that change the packaging by putting all binaries into a
PN-bin package?

Ross

