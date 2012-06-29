Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkUUq-0005dQ-Hc
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 08:16:00 +0200
Received: by eekd49 with SMTP id d49so1146440eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 23:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hZOOyiKlMHD1gONejEDHRru+Nf2cu0MDSGX1WXoEsWE=;
	b=TTBwPak6WmaWRpnTbCTUQUblpJ+o3csAevETr8CyV16HfTflC2clfGzalw7UVwEiXG
	ULUnwbnngrAUDntmQoVmekubP+gq9zAHw7YlYcm3k4UfGCuvyWStmWQUOXsRNPJ5D9uh
	Xph91B7ZqodLerkICW0eXLji9mjj/cvQMx2Z0H3LnW07ditW2ckj0LXDNkdtqRGed+OS
	r8h99MAXGopIA1QrHU82bSTkRY3IRWiko+IklT1YemlvbgjrhaTshRe329Ut9Cg7Ouey
	OjVZ6uZuRXc5Jk2AcD5FrBrXBkQDW57T89P0gn+PocRAs2koLggeSSCZ5wY4fvnXABuC
	UpZA==
Received: by 10.14.97.16 with SMTP id s16mr160125eef.117.1340949905136; Thu,
	28 Jun 2012 23:05:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Thu, 28 Jun 2012 23:04:34 -0700 (PDT)
In-Reply-To: <4FED4226.30700@linux.intel.com>
References: <cover.1340942930.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340942930.git.dvhart@linux.intel.com>
	<5b45f71fee3c593e5420a5a9b36ba947c429a397.1340942930.git.dvhart@linux.intel.com>
	<CAMKF1sopV66-Rohk5HYMygcSamkcxDgOM8bfruF7VWR0ZAXpnQ@mail.gmail.com>
	<4FED4226.30700@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jun 2012 23:04:34 -0700
Message-ID: <CAMKF1sojfidUA9mne_RfXz+tE8d3pRboHbGxJL-dLD5wkeKVRw@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] kernel: Add kernel-headers package for target module build
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
X-List-Received-Date: Fri, 29 Jun 2012 06:16:00 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 28, 2012 at 10:50 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>
> However, I don't have a strong opinion here, I'll happily call it
> kernel-devel if that is strongly preferred by some.

in oe terminology it will be -dev


