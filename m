Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SsMRM-00048u-Kw
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 01:16:56 +0200
Received: by wgbdr1 with SMTP id dr1so3858045wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=ruSkklDgbe3z0K55cQsYDZULQ7vee4uTXsTBtRf8Xyc=;
	b=MiauaeS4e8NovTva9eqZ6pNTlwI5kK0KrDzHoCSovnHZZMjDLyq3/1I8C0hWJJF3fG
	a/KToGrMJnN3wUcDTPfbqG9QmNnEaUF4wEwiwMW4rclMfZfiGTAKFHy7VUw6IcGaS8w6
	VMDKdNnSaveL82yR4/sc5Rfs/tnufXmYWrGBcDwj8ajiHNyQ+b+LTHu8rZV29ZJOI8vy
	RMIB0beIyiC14/iFAKEL0lMaAb+82igLPQIPb2Rp7cE55FFQMsbaDu15JQKvkhkJ/u9H
	YiOQk+4e3bPnzlyqvyyAhUboGvxAomlDl4DM4gArU9eK8cfnNtAb7eEdpa8TGLkCePF+
	B5eQ==
Received: by 10.180.100.37 with SMTP id ev5mr10787318wib.5.1342825533025; Fri,
	20 Jul 2012 16:05:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.18.98 with HTTP; Fri, 20 Jul 2012 16:05:02 -0700 (PDT)
In-Reply-To: <50090910.9000308@linux.intel.com>
References: <1341940070-27715-1-git-send-email-raj.khem@gmail.com>
	<1341940070-27715-2-git-send-email-raj.khem@gmail.com>
	<1342002640.7934.5.camel@ted>
	<CAMKF1sqkxxrxKU-XO4HezbfsapTDXhz-TZNx_tNGq=rsNgB=wQ@mail.gmail.com>
	<1342018098.11939.16.camel@ted> <50090910.9000308@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Jul 2012 16:05:02 -0700
Message-ID: <CAMKF1so4fZTU70nN8HAA2ccW_smZtcndg0kGBVXwXZ8Ft9TxVw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel.bbclass: Make tree available for cross building external modules
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
X-List-Received-Date: Fri, 20 Jul 2012 23:16:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 20, 2012 at 12:30 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> Khem, I take it we still have something left to do here in addition to
> the bounds.h patch you sent a short while ago?
>
> If so, this sounds like a big enough effort that a bug is warranted.
> Would you consider writing up exactly what you're trying to accomplish
> and opening a bug?

my problem is bigger. I am trying to provide a (enough) prebuilt kernel tree
so that external modules ( outside of build OE tree) can be built using SDK
in cross environment but "make -C $kerneldir _mrproper_scripts" has
bit me in the rear side since now it deletes considerable portion of kernel
bits that the resulting tree is unusable for building without modifying the
tree by running "make scripts" or so.

bounds.h was for syncing with OE-Core, since I am in process of getting rid
of copy of kernel.bbclass in meta-oe


