Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RQnIk-00035r-WE
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 22:45:51 +0100
Received: by faat2 with SMTP id t2so2180004faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 13:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=X56EUZGP08KGM2HhyeWKoJsE+SfYj1/k9KSxTS0TDRk=;
	b=rvH4xlJWvlqo/2UYw4y9ceXaWQe4A5s4MkN7FE/eSO/OEzYoo1rAKg6NAFJAGhNYsd
	biJXh82sFyMiYAtc1X/S0b+QVMlD4hcO2jWv6EKRrbbzwayO3Srvww3HCiDpKOGz9LOK
	Ld6fGU0OuVfR9jmpRo7yttZrNf5CUVv9YoDCs=
Received: by 10.152.112.10 with SMTP id im10mr21491425lab.2.1321479567087;
	Wed, 16 Nov 2011 13:39:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.12.36 with HTTP; Wed, 16 Nov 2011 13:38:55 -0800 (PST)
In-Reply-To: <4EAE0428.2020209@windriver.com>
References: <4EAE0428.2020209@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Nov 2011 13:38:55 -0800
Message-ID: <CAMKF1spV_BiCTo1YCoKL7XUTqRWtFJFYP4yB16FoyETjYzAuxg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Saul Wold <saul.wold@intel.com>
Subject: Re: What is the strategy to update eglibc?
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
X-List-Received-Date: Wed, 16 Nov 2011 21:45:51 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 30, 2011 at 7:12 PM, Kang Kai <Kai.Kang@windriver.com> wrote:
> Hi Saul,
>
> I just want to update eglibc but eglibc is using its 2.14 branch and use svn
> commit revision "15225" as current version. Of course it is behind the
> latest svn revision, but I don't quit sure about which is the right revision
> to update eglibc.

since release branches of eglibc only get bug fixes in ideal case it
should be good at any revision. However if we have bug
fixes that dont affect us immediately we do not tend to update
the revision. If you find that some bug fix thats applied upstream is
needed it certainly can be a reason to bump up srcrev given we do some
level of build and runtime testing
with new revision.

>
> Could you give me some guide? Thank you!
>
> Regards,
> Kai
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


