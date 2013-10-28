Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 330AE6D2B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:49:52 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id c14so3795734vea.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 10:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/gQK4rOsbYDEhLMZo889afXX70ttdrCUN/LLsBhYfsY=;
	b=JLWenlU34DfaXlSphBE24nt8EICnmQoSej7/w02NCE/K6s1iVX3mLd1sUgVk/ZbIAJ
	HkKyfLJyzzcvLQG60jBlnr1GWJUDKiRDmg8oHzgQXrXZrYZzRBuSfzO009K1jXUNg5Ra
	BgduUolVcB9X8cPbwKRic++ahbjTyYFqS/2GoqeP+I2jESVwlzNDCJSj6uKCFSL+cUqI
	Os1NBgzhimAYiatlWy/pBSfu4YvaT0KDMfI+EMUYhUL6RyTBf0oFA8pPETxMlLOyKQLn
	xgC0SDRwXLo3cGWz2l8uOwowLbljCYboGDpf+sBwAINJlC0dxUhsuTHjKPmwPqyKMRXu
	k82g==
X-Gm-Message-State: ALoCoQn9iVPeAKKd0txqjiBwP5trNzZFO171mtKpF0sJt0zicwS30ljTDA1/9PsgDmMHSOp6mpIa
X-Received: by 10.58.161.231 with SMTP id xv7mr14412044veb.2.1382982593872;
	Mon, 28 Oct 2013 10:49:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 28 Oct 2013 10:49:33 -0700 (PDT)
In-Reply-To: <526E9F31.2040305@communistcode.co.uk>
References: <1382345775-1338-1-git-send-email-ml@communistcode.co.uk>
	<5266E3C2.6040502@linux.intel.com>
	<526E9F31.2040305@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Oct 2013 17:49:33 +0000
Message-ID: <CAJTo0LZDRJH8HHe9TZ1+LTBoo9rq6V42HQ0ghVagi5kg--oJ_Q@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: Jack Mitchell <jmitchell@cbnl.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][PATCHv2] libjson: update to 0.11 and rename to json-c
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Oct 2013 17:49:52 -0000
Content-Type: text/plain; charset=UTF-8

On 28 October 2013 17:30, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> Not sure what's going on yet, but I found a configure failure, see the
>> attached log file.
>
> I have rebuilt this package multiple times now and have still not
> managed to break it. I believe it will just be a dirty build directory,
> but that shouldn't be an excuse for it not building.
>
> Does anyone have any suggestions on how to overcome this?

Just had a look at that configure log and that's normally the error
you get when moving from B==S to B!=S.  Unless Saul can replicate it
I'd say that warning was spurious/expected and can be ignored.

Not entirely sure why this happened as the patch also updates
separatebuilddir.inc, but without the actual tmp directory and all
logs that's not going to be easy to work out...

Ross

