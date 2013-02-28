Received: from mail-ie0-f181.google.com ([209.85.223.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UBABs-0004cV-Lt
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 21:35:01 +0100
Received: by mail-ie0-f181.google.com with SMTP id 17so2610900iea.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 12:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=NzjmYeWXkG/im7H71/jeKrDvr9UfFORbhZkZRfDxz7w=;
	b=Ce0LS54yHUUGKNFKSWDO0NLozZ8UIV8Q7F5ra7veOV4zKqpjXylnJdYRu77/jNISlu
	8j9/IbvZEwDQi/H60nskEmdrQpyhoDlkGPArvTWir4g/2e7AauRiXI0mNA+5t5XX9XBS
	zqc01J12riQXjdoyB5Vj+RwoyGHh5lRCZExq7Up230L6yn4SdStwkfrulqGPhWzbdwGj
	G+FOOEB5tItICufhKSUbUN+pLYX+r+BOTEl1vwSPoziw+21OnKIdnlBZnEyoh/i49L0W
	MMV3x1jl/m5qntr1E9IW5036+nV8s5TTC4+HsEC+3T4mKJhcthnkyCR2pIj6kcoasHhs
	Daaw==
X-Received: by 10.50.12.193 with SMTP id a1mr2048638igc.24.1362082713695; Thu,
	28 Feb 2013 12:18:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Thu, 28 Feb 2013 12:18:03 -0800 (PST)
In-Reply-To: <512FB8B3.2090500@communistcode.co.uk>
References: <1362034602-30163-1-git-send-email-raj.khem@gmail.com>
	<CAHUNapSbpFDttimPKO9czY3NiV4x7kTZ8ysDgq2TuifnosH0Xw@mail.gmail.com>
	<CAMKF1srnzum61DyhW95LgX14HmOJxaVwvcz_y2iGXNime6FZkg@mail.gmail.com>
	<512FB8B3.2090500@communistcode.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Feb 2013 12:18:03 -0800
Message-ID: <CAMKF1srqOXOJqNkXOUkq4bdUZSFyMTBkNC+qNScpdVwpkiPCsw@mail.gmail.com>
To: ml@communistcode.co.uk
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-4.7: Fix build with texinfo 5.0+
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
X-List-Received-Date: Thu, 28 Feb 2013 20:35:03 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 28, 2013 at 12:06 PM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> If this is the patch you posted in the other thread it didn't work, I have
> attached the log to this mail also.


yes I got that, I am now trying to reproduce it locally in order to
fix it right.
since upstream fix wont look same for gcc 4.7 it needs to be hand woven, I dont
have any system handy which uses new texinfo 5.0 I believe there will be more
damages then just gcc and binutils.


