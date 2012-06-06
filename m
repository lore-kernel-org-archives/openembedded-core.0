Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ScDv2-0003Tu-PI
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 12:56:52 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 06 Jun 2012 03:46:24 -0700
Received: by qaeb19 with SMTP id b19so2650028qae.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2012 03:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=XBfBExNGhpNTLBFZscr4E/K18e8ekPsWTMscAei7QUw=;
	b=lQoeXZuu7mc8FagQpTBnsKAw7AvRHSzFnJhf9iJcrPqtl3ibf7O7w98Xh3hQR7wTLI
	4AjWVrzzlwbw0DPPEUTRmxOawW85FCGcfL98Vf8mMmoIWMjJ3b4z8k4LOWCl94neZC2H
	2INy52lELdF11cJkJC/9IBfRGuu8skXXObK1h7udqrZ3nOu1wN4QK6zoiV9UxN4J/RH3
	QIr3ZGcAA/tvVsvnGzyLNtKAuMOhPSQABWgf8jFilfdvYpYQB7ydg3FgFD0lM6KqrRI/
	lZiks5PP8HkQH6XYfcIuprLbvm2hisrvKPhW8v1RPBgHQANiz2Q4rHkr4/lxcQb3GvUr
	lYeg==
Received: by 10.224.174.138 with SMTP id t10mr21233323qaz.50.1338979583188;
	Wed, 06 Jun 2012 03:46:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.53.212 with HTTP; Wed, 6 Jun 2012 03:46:01 -0700 (PDT)
In-Reply-To: <1338960862-17401-1-git-send-email-sgw@linux.intel.com>
References: <1338960862-17401-1-git-send-email-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Jun 2012 11:46:01 +0100
Message-ID: <CAJTo0LY0QBDM5O8t9tvyMxnCnFWBSM3ct7AZZU8W4YZd7Ke-Pw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlTnQ21B95u+vjW00jY+ea7WNPdBOSlYRgyuXArKQLBHPncgvKPZbdIJiZ+2/MkzHC4hIbc
Subject: Re: [PATCH] gnomebase: add GNOME_COMPRESS_TYPE variable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jun 2012 10:56:53 -0000
Content-Type: text/plain; charset=UTF-8

On 6 June 2012 06:34, Saul Wold <sgw@linux.intel.com> wrote:
> Upstream Gnome projects are starting to migrate to the .xz compress format,
> so we need to add this to allow recipes to override the default of .bz2 as
> the upstreams make the transition.

Considering all future tarballs are going to be .xz, would it make
sense to default to .xz and fix the recipes where there isn't a .xz?

Ross


