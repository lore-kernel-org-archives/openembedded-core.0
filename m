Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm1IC-0007yl-QF
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 13:01:33 +0100
Received: from mail-gh0-f197.google.com ([209.85.160.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 03:45:48 -0800
Received: by mail-gh0-f197.google.com with SMTP id f15so2452381ghb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 03:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=btm4Czx72aOfo5jXcJQ6GO5otIw4DBhcPRrsAk2EkC4=;
	b=VOlz5kPppCqz0AW1GH6tCF46aZtkg7Wynpx+Y3ndchTgA66m05rzFTXVFdHu8HlETk
	aC7cC/9jFjKjydpvwVG/Ey84PciXyIQo645xnCUpggmF/SfIinCZ2is+RXOypSawaGwa
	dIXcxGuLgb0huwJiio1CE1TDl5VZmceujDwxp16vdLP3xyeOxLSmNl6eoSEuKCiASnRd
	IUmvwr4IBaKeVY0G1ykLPQq7CErSxuRvHu9wiIZy48F702KI0rQK+AQaVvzMw1e+73Hk
	R3gn82PCz4isVzHnFmAHGnlqEll/XLBOzPYnXEq9X7Erqz5F00q+emtS9mMrtjlPuraG
	gueQ==
X-Received: by 10.52.37.9 with SMTP id u9mr16985738vdj.83.1356090401264;
	Fri, 21 Dec 2012 03:46:41 -0800 (PST)
Received: by 10.52.37.9 with SMTP id u9mr16985731vdj.83.1356090401172; Fri, 21
	Dec 2012 03:46:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Fri, 21 Dec 2012 03:46:21 -0800 (PST)
In-Reply-To: <bf4c63b763ceb045df5b4b27136ab6cf3f8f5ca5.1356089735.git.alexandru.damian@intel.com>
References: <cover.1356089735.git.alexandru.damian@intel.com>
	<bf4c63b763ceb045df5b4b27136ab6cf3f8f5ca5.1356089735.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Dec 2012 11:46:21 +0000
Message-ID: <CAJTo0LZaLtqfkmxgk6RwdTxEbZHUw5LCWu9yv=tqj26vPqfzzg@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQkVN9sWmkJVMo7RJKLniNbX3SLoZ2JCNQJASI7WU0rdzinpNa0XDuj+jtKDPm7NnfgWn2KZg6quLeUlrv3oXo6Dym3IJQaHYmLPjzoBIgiuzCBYyjpZ+TERCr2ZoefCY5Jn4539cY/zYmKtCy/zp7bnUaT/LMjTjU/TBitlGsK9SdrhbmVVI1efx3TPXgQljdAmoxyo
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] Wayland userspace library initial 1.0.3
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
X-List-Received-Date: Fri, 21 Dec 2012 12:01:33 -0000
Content-Type: text/plain; charset=UTF-8

On 21 December 2012 11:38, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> Wayland is a new protocol a protocol for a client application to
> display user interface windows through the use of a compositing
> window manager. This package include the specific set of server-side
> and client-side C libraries that implement the protocol.

The ordering of the fields is a bit unusual,
http://www.openembedded.org/wiki/Styleguide has a rough preferred
order that's great to follow.

Also, no need to introduce PR with new recipes in oe-core.

Ross


