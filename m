Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sod8F-00044H-VD
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 18:17:48 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 10 Jul 2012 09:06:35 -0700
Received: by qcmv28 with SMTP id v28so129099qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 09:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Zh2PEMhNpgNAtRDFqhR/KNsaVzMytHy9egP12n08YyM=;
	b=gN8y+JzeBTyeelKLQHLg0zqyi1sTAlLnSyaWbogIXxZsdD8ygne48KoABqlcsb+BFD
	xCb7ETScT6JmHQcpYzoZ7YN8QRLdwqr8+yRqb+m+RVF+JBnjDtl0YNnH5UByVQJteTJv
	+aafEllXJrG77tLD1ve0Je6ovjLzsjpqpJB2GNqfmx0bT+el1EJpHuwHinI+AJk2h31E
	Gz9uXMu+FYGaKZ97wzaAebwIM7hk89+wDQopDy6AAq3TMm+BK6bTQGgMDgqLTOEVOoUF
	ElHO1EeJTbvL4wCv+YMV7JAVqFVQqkDie2TzsZHEME/UJEvGnpPKhi+b/feoLnCuBTc5
	L3rA==
Received: by 10.229.135.10 with SMTP id l10mr19946793qct.103.1341936394647;
	Tue, 10 Jul 2012 09:06:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.218.201 with HTTP; Tue, 10 Jul 2012 09:06:14 -0700 (PDT)
In-Reply-To: <1341935849.1294.2.camel@ted>
References: <1341927124.24837.8.camel@ted>
	<CAEsOVNf0SDnxATQog_8Li1oeK6wkqhVH+m=Bt=L0bBbR02B05Q@mail.gmail.com>
	<1341935849.1294.2.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Jul 2012 17:06:14 +0100
Message-ID: <CAJTo0LZwkTY87RHw9tBR3RHJdvSYHtczky2mxfbYXDSAR8S1kw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnjUm9Yp/aXWRASwy2xhnYDT4E8shXDU36lwO/7EDsRVscYigb3OQeq4847Ge4ct90CyAXM
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: bitbake.conf: Add git-native to ASSUME_PROVIDED
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
X-List-Received-Date: Tue, 10 Jul 2012 16:17:48 -0000
Content-Type: text/plain; charset=UTF-8

On 10 July 2012 16:57, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> What about testing the host system for presence of certain things?
>> Then one could
>>
>> 1) yum/apt/etc install the needed items
>>
>> or
>>
>> 2) Build it if it's not present
>
> Every time we put an if statement in like this, it basically means we
> should double the amount of QA, one for one path and one for the other.
>
> So whilst I've wondered about it, do we really need to do something like
> this?

Back in the day I used to massively set ASSUME_PROVIDED in local.conf
to reduce the amount of -native packages built.  When it works it's
wonderful, but then you start getting mysterious failures because it
turns out that your system's tool has different build options, or is
out of date as Poky updated and you didn't notice.

It turned out to be a false economy: by the time I'd installed and
verified the packages from Debian I could have had Poky build them for
me. :)

Ross


