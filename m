Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1TdoFm-0003oJ-QC
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 21:29:06 +0100
Received: from mail-gh0-f197.google.com ([209.85.160.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 28 Nov 2012 12:14:50 -0800
Received: by mail-gh0-f197.google.com with SMTP id f15so13700360ghb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 12:14:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=3Yck4B/6lCFR+1SPq2d7DLmbYrqxBNrwoaq1aWxqeiA=;
	b=jGZOYJVxP5kMpXsyFvWuXfu3sxJHug0eEGwEZzq74+J6PxBrM1HSoFvGU2Bth0RA2A
	KV+i11qcYErdxB6jCumNWvi6Aa2GJEcbJ+rrueDFRE5xxuvD94UgcE14T5vlQoEqj6dz
	m7KH2g4+CeMfqEka0slo+aA8bOusGf6s7SZSivvhXDLDB9dO+gaq+KN3nfHLYe1RD1Rf
	gXUmV7MsUbXssTgo13b9ZDpNJcXTA4xh33kEbLX3bx9MbnoWB7af0he9wiFj8mOhhAAy
	BuYInIErAJ41LTkUfty1vn7C6aaRb1l/Z7LA1y9wNJoBpLsBooDWwfX9avWo/fCwdmBf
	zD8A==
Received: by 10.229.197.147 with SMTP id ek19mr5180596qcb.34.1354133689737;
	Wed, 28 Nov 2012 12:14:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.197.147 with SMTP id ek19mr5180591qcb.34.1354133689411;
	Wed, 28 Nov 2012 12:14:49 -0800 (PST)
Received: by 10.49.12.136 with HTTP; Wed, 28 Nov 2012 12:14:49 -0800 (PST)
In-Reply-To: <CAP9ODKo1RqiYCgUgt+Xd6Hf7PyPw+mPsCwxRxt=NpAyAYy0PXg@mail.gmail.com>
References: <CAPhnLPAx0bgPRk-YT3uWLfETOhE9ECu0Akxv5i8UGDU+L3-hKg@mail.gmail.com>
	<CAP9ODKo1RqiYCgUgt+Xd6Hf7PyPw+mPsCwxRxt=NpAyAYy0PXg@mail.gmail.com>
Date: Wed, 28 Nov 2012 12:14:49 -0800
Message-ID: <CAPhnLPC_BuZ5ThNVjWBBkM+1hDt7GEtxiWtcyajaAWADVHUQSQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQk1wLvW96m4BdyORIoSAAyLUqi2aojbNfbBgkZjqrATkilh+LRGWV4BS8UhWIvqAyWL7og/Fjuiykc7e4Op4NRcrtMQqANcmSQheW9bfIOMfv9tiqRRlHEiEIxflestlRpeK8ZigcujnEnI6xPAfMYVYspiRLY26CjQ1tkKk7e695UZHlmQIwi5bWg3Ve5XMWgTFTBR
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] license.bbclass: Collect LICENSE level packages
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
X-List-Received-Date: Wed, 28 Nov 2012 20:29:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 21, 2012 at 3:26 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, Nov 20, 2012 at 7:49 PM, Flanagan, Elizabeth
> <elizabeth.flanagan@intel.com> wrote:
>> Some bad logic in license.bbclass misses certain package level
>> LICENSEs.
>>
>> Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
>
> Does it also affects Danny?
>

Yes, this patch should also be pulled into danny.

> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


