Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzC37-0003J9-Vv
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 18:59:22 +0100
Received: by fxm19 with SMTP id 19so3092759fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2011 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=voKU12Y8WrRH10zKKtPH8irotfRpRAMrr+CKGarUCOs=;
	b=hBVjdDPG+u74cghKdidos9D+pMtCfeipWFJ4SWkAnEyZy3NexbMrQ1PtQXMH52U0WP
	vx7dIAbDoWyFo6woEVdphPtnGkkP59eoPAqGqoiXdammOYrAkdiX9v06XCDGyIQT7jTa
	4E9sfMvwSeM4vSIoNx/dAxRfRqSWVbbTJkwlA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=KYrfUkSAEgKsQ7HJDGEVZKMJArsRfxoAWEBihb+yqG0aMyUulwLNoOLj1Cwl+TSoCL
	yBZC5Zff9cqoBs/JE0vAiqlhASElb5N0G9DpDRc1eGk+lnGPuS+OQ6lrrht4oETSvhDw
	awDfPWjsIBPWx73q/DmpHrC3mdN5s+xTgqOrQ=
Received: by 10.223.15.141 with SMTP id k13mr2382877faa.30.1300125452039; Mon,
	14 Mar 2011 10:57:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.41.89 with HTTP; Mon, 14 Mar 2011 10:54:13 -0700 (PDT)
In-Reply-To: <629947F1-FA71-48CF-91BF-CBA98C302DFF@dominion.thruhere.net>
References: <629947F1-FA71-48CF-91BF-CBA98C302DFF@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Mar 2011 10:54:13 -0700
Message-ID: <AANLkTikrQ8X5A5k24U9cPqVK8CjbgAf=X=hrehDVmY5U@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC] Make GNU_HASH failures fatal
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
X-List-Received-Date: Mon, 14 Mar 2011 17:59:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 14, 2011 at 8:35 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Hi,
>
> GNU_HASH QA failures are nearly gone in .dev, but still rampant in oe-core. I would like to propose making them fatal so they get fixed. The most worrysome offenders currently are gcc-runtime and perl.
>


Yes I would say we fix the existing ones and  then make it fatal.

> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


