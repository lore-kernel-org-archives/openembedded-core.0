Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UAP13-0002v8-IQ
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 19:12:39 +0100
Received: by mail-pb0-f45.google.com with SMTP id ro8so2519915pbb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 09:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=aimNuSOF8pzqoxtuC/ZNK33ZIKSqs5gchYaT3yZlAFE=;
	b=ugUJBYkdW94sF+vNpNfkj2QqEh9wtANJARHH0tzZC5zpLDH62IK68tN8dhXfe4vkBj
	aoTwDv9TPVa/2IHhxgHOATfQFpYdHsnIvEAXQOvSHYjUdvdAj8iGtRotFTsJPT+5cflE
	3BHMHfCxXEzujE0d3Ov0wQfLD0wFxfrGX1H6zS1hI04372RagBigMAXmT6+ZqcYxDcvJ
	TGWG8gMj3nENscLYGlyKJcmisumKIJQilfr7NZduU6237ZgKJPZX4FWvj1/+HsByWCt4
	7Cv25DR7Pl/VaiKR4U1C8YNMiyzqti/FhzSVmFNBqPLIw+gDZ65QdIvTZjQXkWpFqqOZ
	uDaA==
X-Received: by 10.68.137.131 with SMTP id qi3mr24750982pbb.47.1361901377437;
	Tue, 26 Feb 2013 09:56:17 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id kb3sm1615900pbc.21.2013.02.26.09.56.16
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 09:56:16 -0800 (PST)
Date: Tue, 26 Feb 2013 09:56:09 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Anton Sergienko <anton.sergienko@gmail.com>
Message-ID: <20130226175608.GB13278@sakrah.homelinux.org>
Mail-Followup-To: Anton Sergienko <anton.sergienko@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <CAMEF+f=FAyLCaWwjzq+W=1QEZcEM3V1awR8-e5ogFdn923ndhg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMEF+f=FAyLCaWwjzq+W=1QEZcEM3V1awR8-e5ogFdn923ndhg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Tue, 26 Feb 2013 18:12:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (26/02/13 17:08), Anton Sergienko wrote:
> Hi!
> After the patch (commit c49f967384ccbfe131bbb33ee518014f3fc4b38f) to
> meta/classes/kernel-arch.bbclass kernel build fails for arm machine with
> hard floating point instruction set in CC (-mfloat-abi=hard).
> As I understand kernel should not be build with fpu specific floating point
> instructions(should not be any floating point operation at all), but CFLAGS
> from machine-tune are propagated to CC and it also include -mfloat-abi
> flag. Should not -mfloat-abi flag be filtered out in kernel-arch.bbclass ?

yes. I think this patch is creating more issues than its solving. I will
think about decoupling KERNEL_CC from CC once again.


