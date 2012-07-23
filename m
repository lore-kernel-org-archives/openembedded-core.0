Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1StPdD-0002F0-2F
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 22:53:37 +0200
Received: by wgbdr1 with SMTP id dr1so5784986wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 13:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XTe7mGDk6GIn+U5G3kIw50EzYpC+6qS+LCRX/O8vf5I=;
	b=0L/gBa0dbD/nqdmZzpQR4Iyfa/S3KepvWGL0/GOehppnlvW9pCH8crjegBxOQHdDtQ
	A2HpmwbtuulTNzO3PA4peLwV0hh30sjhe+JimTGWKidhNSgrWJC7ll648tLCAK3NnK/Y
	wo+vwPuWeS4EM8jN2XxVHBA52ua/y8350IwIiHjYuvSghJ0s9zVX6kBwPxeFoQ5gtOKA
	WTN1mVDpg3XpTM2Jt3OXbaCG7yTkG5yoOtqKQ/epAQoDpN71FolRGPkJ0i01cCpxLgTU
	cBlGwt8zfHsgtjhdwMdZGIFGJpvQPaWoqq0ck1aNfvHLR5T/LMX8fhFLJocq0dTMMSTG
	pCqQ==
Received: by 10.180.96.3 with SMTP id do3mr803051wib.5.1343076122441; Mon, 23
	Jul 2012 13:42:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.18.98 with HTTP; Mon, 23 Jul 2012 13:41:32 -0700 (PDT)
In-Reply-To: <500DA392.2070104@linux.intel.com>
References: <1342826543-23508-1-git-send-email-raj.khem@gmail.com>
	<1342826543-23508-2-git-send-email-raj.khem@gmail.com>
	<500DA392.2070104@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Jul 2012 13:41:32 -0700
Message-ID: <CAMKF1srdV_AY8mGeG-ZV-8Qa4AWciaicNUAgmdDKPJFJxr_x+A@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/2] kernel bbclass: Recreate uImage only when KEEPUIMAGE != "yes"
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
X-List-Received-Date: Mon, 23 Jul 2012 20:53:47 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 23, 2012 at 12:18 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> +KEEPUIMAGE ?? = "yes"
>>
> this really worked? (note the space between ?? = )

No it did not once I switched the testing branch to really what I
wanted to test. Thanks I will send out a v3 soon


