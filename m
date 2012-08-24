Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4ykm-0002kH-UU
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 20:37:09 +0200
Received: by eekb57 with SMTP id b57so681017eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 11:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xpvwozy9MXSAvyPJfVGHb8n5K2l5uQyL1AqMV4PhRZ4=;
	b=L+Pl3DrohTACC+RMRCoqeVMSXhTzbCyhgMWPLI+ODSqaC5c05G+coTp3EIUIqERoi1
	Rar5LfnA3ogwA+Rp/vmeXxo+8ZDB0Ez7dIwIfR0lvlgO6nxd6nhc9WOUUO7PEQ580zGc
	3laeyL7qkI5qUvImeq+7N8C4a8XdlzKI9V/ghTEtMWfO1idIlw/RNDQ2xF+J0i0P+k5I
	X5xvG0QrWJrnbXyk/At16JThzPbMvB9jlZo+rTp/ZbgAR3jAaQ/Z43PAGsJrYO0LeVjy
	gA8oKNGgj4MXFNOtDtx+mCICOMqmSgSK7Ouzd4vYubpVH7w+r6RuDIoeYNYBRqet6fqo
	4hAw==
Received: by 10.14.204.72 with SMTP id g48mr8659479eeo.45.1345832701345; Fri,
	24 Aug 2012 11:25:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 24 Aug 2012 11:24:31 -0700 (PDT)
In-Reply-To: <5037C622.3020503@linux.intel.com>
References: <1345522959-20853-1-git-send-email-raj.khem@gmail.com>
	<5037C622.3020503@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2012 11:24:31 -0700
Message-ID: <CAMKF1sq7Mk2rwh9anpQva_R3jSQbPYMgijNOpYSH+pF5DFSDUw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu-git: Move to tip of git
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
X-List-Received-Date: Fri, 24 Aug 2012 18:37:09 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 24, 2012 at 11:21 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>
> The patch forward porting needs to happen with this kind of change, it can't
> happen later.

we dont need the patches we apply for git recipe now at present since
this recipes is targeting qemu 0.14
So we have nothing to forward port whatever was needed has been
forwarded ported.


