Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U611O-0002q8-RS
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 16:46:59 +0100
Received: by mail-vc0-f169.google.com with SMTP id n10so1569373vcn.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 07:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=khFVtKqveeKZwRARC6lDhYt6csaIwARsvHbUOYeJoJg=;
	b=D+XbUIJWu13RjWX0cs3ebzI++KowphDGB/BPkUSm/BE9z+fm2cy9+nkgV6odLiHdOK
	CJ7Meq6L17Ya9MdP1sjT0H9JBEgn0IM9qkF1y4IiMDCR5eZUg97QEl5rt0dKKnbTg749
	ocbY+U9awPwi92prsr7VWPnINKKIABO0B3vRvo9TEDzf2tPSry7q5nSedsa54s0xHw6i
	SoKBfz6J1HL8h/nyf2VxFZb8M1YtXxNNVd2VcvQD5XJbkTN6OBWjx4LMmScd6K2KrHKa
	SWdTnAMCF563Z8YetYRPIsx+ZAZ9IbC2opAttuhL6kNiSr7m/+J8S0olLmABl9m3aK2A
	+56w==
X-Received: by 10.220.39.69 with SMTP id f5mr36182663vce.45.1360855847687;
	Thu, 14 Feb 2013 07:30:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.221.10.202 with HTTP; Thu, 14 Feb 2013 07:30:27 -0800 (PST)
In-Reply-To: <511CD958.2010401@windriver.com>
References: <511BB265.8030505@windriver.com> <511CA4B2.1090307@intel.com>
	<511CA9E2.70700@windriver.com>
	<CAJTo0LYLtan2=YkzCN9Xvkj7k695LGba7T1QMHwYQ8EK46YvgQ@mail.gmail.com>
	<511CD958.2010401@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Feb 2013 15:30:27 +0000
Message-ID: <CAJTo0LY6v48uMfhTdAeWCLB=XYQ_DkwJdF6pqzYmYBRLqiC4pA@mail.gmail.com>
To: Florin Sarbu <florin.sarbu@windriver.com>
X-Gm-Message-State: ALoCoQlhKjEke1mrsZF3py4QyNSDN5gVQ+LAqyn5Hnw8BSG05CGK29Q856WdTa3VIuFsLSqr32Mv
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd services in the rootfs
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
X-List-Received-Date: Thu, 14 Feb 2013 15:47:00 -0000
Content-Type: text/plain; charset=UTF-8

On 14 February 2013 12:32, Florin Sarbu <florin.sarbu@windriver.com> wrote:
> So choosing, for example ${PN} to hold the systemd services, and also choose
> to use sysvinit as the init manager, then I'd end up with a rootfs
> containing useless systemd services.

That would be a packaging bug.

The systemd class only does work if the systemd feature is enabled.
When installing service files manually, respect the systemd feature.

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rmoisan/systemd-ross&id=d6a9fe2e980eb996c36712983b151b04774438df
is an example of systemd integration for dropbear that does the right
thing.

Ross


