Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TLZHX-0000eb-4U
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 14:51:31 +0200
Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 09 Oct 2012 05:38:01 -0700
Received: by mail-ie0-f175.google.com with SMTP id c13so11794341ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2012 05:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=d92XGmmHugkE3/4tu8VIdHPJPszUvID6oyfslIVkTHE=;
	b=NggRVeVZYDXG+7YdQhr79cSOaTEa5ApH9TNjhM3gNZpxdms6svvhLHJKqfjp+eDjqm
	f/OPFbvKEK86SxJE9Xt1tjUH9uoZixpYm7Xww9VLrjgjJHbDLV8WB1zbGT2fr/p3yF/K
	UOa1znXQS11NWYc2q6EuG3+M1fwZ8VACJg5JbM4Bhgr9s8CoKPXAsvyPd5cT2SdFKIXg
	CZ5KWlaRpphHUGLAP5CmXE46AWSJQ39gv1AcvjoTdcfsOpTfXdcH+xGPDG+6N8jFtAvC
	zy0mQWgxZBJKiTUx37SRObtb3n13pFH1lAi0rgD5Jo5C/pmsdF9s4cAAW6zaAhqDwVOp
	X8oQ==
Received: by 10.50.104.201 with SMTP id gg9mr1440004igb.67.1349786300479; Tue,
	09 Oct 2012 05:38:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.141.70 with HTTP; Tue, 9 Oct 2012 05:38:00 -0700 (PDT)
In-Reply-To: <2072868.bxk9nbbmYZ@helios>
References: <cover.1349689653.git.jackie.huang@windriver.com>
	<2072868.bxk9nbbmYZ@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Oct 2012 13:38:00 +0100
Message-ID: <CAJTo0LY9xi7=s0N1LX_zc9Hk3L1Wb15JRF4nN5sar8anjepJKA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQnPCqYco7MHd3oM6HF8+Jmek4TdV3pZpseH4ywc6BKOuC2P38jIOPyIZKfhOAmaj72HDeaX
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] ruby: Add from OE-Classic and update to 1.9.3-p194
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
X-List-Received-Date: Tue, 09 Oct 2012 12:51:31 -0000
Content-Type: text/plain; charset=UTF-8

On 9 October 2012 11:38, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> * I sent this months ago but was told that oe-core is not the right place,
>>   however, we think it makes sense to add ruby to complete the scripting
>>   language set of: python, perl, ruby, so I re-send it.
>
> I have to say, my opinion is the same now as it was then. Ruby support is
> certainly useful to have, and we have had requests for it; but unlike Perl and
> Python which are needed by many other things, nothing we have in OE-Core
> actually needs Ruby; thus it really belongs in another layer IMHO.

Agreed.  If we're completing the set of scripting languages there's
plenty left out.  A standalone meta-ruby layer that contains the
runtime and pretty much every useful library sounds like a much better
idea as the runtime and the libraries will be in a single place and
incompatible changes can be done in a single move without having to
co-ordinate multiple layers.

Ross


