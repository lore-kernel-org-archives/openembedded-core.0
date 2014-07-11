Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id CBFDE701C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 19:37:53 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id 63so1331369qgz.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 12:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9z9O4/IaboJSXYxh1G3vrZzRt4j8Rs+aapTNAKIBYGo=;
	b=bSIwVfP+uqayd4EcW2HmeSHSFcM2pu0YYT3wjk3Oq8D05etDbJip+4itmxlIG8e2wM
	7swTpVEfZxx0MhgQaYk6sp5MRo6lt2h8kvoVMZbQXBPNxCkxujNmbxjvlwY7YccmsXWt
	XmUqAR/3T0k3pkpyBanVyPHh0oDA9ta9y0kGptrMDussiGn0w5Y0fBB7NZBGCqUbhi2b
	mW81aCtRMcFWWZKW6B1id/vlFcpCr6FutAdJ9/4rB4O8iwhM3V6Pu5m043dylEwTJDOc
	ypc1Eine5n847Xux/uTvjpXFZvsozLBWj0nEwRgKUQO9Fvbo6hDbAac6+hNcUwsf28FD
	8RNQ==
X-Gm-Message-State: ALoCoQmxP8v0KEsPZq2D/zc3jMeOifBwcMFoj5CkF8p8tdJ9ubwS55IFURjwZD191H/DmrZCTpNC
X-Received: by 10.229.82.74 with SMTP id a10mr1656396qcl.21.1405107474533;
	Fri, 11 Jul 2014 12:37:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Fri, 11 Jul 2014 12:37:34 -0700 (PDT)
In-Reply-To: <1405084930.21289.7.camel@ted>
References: <1404936934.15985.48.camel@ted>
	<CAP9ODKpd5-KkRZg7QMbaMS-zn=f6uephJObn3X44RNoEK8y76A@mail.gmail.com>
	<1405067225.15985.89.camel@ted>
	<CAP9ODKrWDP4OR4W3xxuKgCKzW7iqDZo5uc3DBEm43syYP=EA5A@mail.gmail.com>
	<1405084930.21289.7.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Jul 2014 20:37:34 +0100
Message-ID: <CAJTo0LZ0BD76LshHyfBMwKU0tgqS+3_QT1LZpLxbX4n03ZCmWA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC 1/3] insane: Split do_package_qa into a separate task (from do_package)
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
X-List-Received-Date: Fri, 11 Jul 2014 19:37:54 -0000
Content-Type: text/plain; charset=UTF-8

On 11 July 2014 14:22, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The anonymous python fragment should be fine, it sets the data at the
> right level, the global recipe level rather than burying it in some
> task.

FWIW this broke the X drivers as they inject dependencies in
populate_packages_prepend().  It's probably worth reviewing all
instances of populate_packages_prepend() in oe-core at least as I
clearly copied using that hook from someone else...

Ross

