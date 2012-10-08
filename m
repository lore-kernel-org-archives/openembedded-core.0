Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel@fooishbar.org>) id 1TL8xb-0000cL-Im
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 10:45:11 +0200
Received: by mail-vc0-f175.google.com with SMTP id p1so4069719vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2012 01:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=TqAS0KcRe4TEgEHhaz3gHLJF7Cuw5hWRvO9tCN/bM4Y=;
	b=I4zU8Kf7Y0HLU8Rx8JdhXsTxqx15yQoOQLrSxgkzVmpkp6QUc289+l9Ee/GyzEzBCa
	7PyK4gUdVz6e/lZOZ1h8qYyC2SWfd7uOwsS2W5gFrah+WkYQNSzT9gBCQt2YQi26P3Hi
	vQUjt/92rfnQ3N8EwnbQwHY8TGtN0S4YmIEIHtKEdtN1LamsE/W54mO/7A4pQKUczTVa
	OwD3G4OOUTFjkoseZLfUNT7DkNEQxVfnDguFPOQpVUirr5X8QEToMZLZj6CI3cJAxA4x
	dttv7ksvpZm82flX98CjcCOcxOxtB7vIcRGdCayiM9YNwKdD2uw0SwDlsNXSw7uGd4+R
	MXkw==
MIME-Version: 1.0
Received: by 10.221.11.71 with SMTP id pd7mr9431333vcb.45.1349685125097; Mon,
	08 Oct 2012 01:32:05 -0700 (PDT)
Received: by 10.58.161.231 with HTTP; Mon, 8 Oct 2012 01:32:05 -0700 (PDT)
X-Originating-IP: [115.64.155.100]
In-Reply-To: <1349683286.15658.91.camel@ted>
References: <1349437649.15658.20.camel@ted>
	<CAPj87rO=rnyWBjnoMnx=2QCZ3BoMqfiq1w+Vf8qZAmMLyJg-sg@mail.gmail.com>
	<CAPj87rM0BH_eU+6j66Gq7+mrPs2JbrwDZdu58gqwJ_34vNeKmg@mail.gmail.com>
	<1349683286.15658.91.camel@ted>
Date: Mon, 8 Oct 2012 19:32:05 +1100
Message-ID: <CAPj87rNGezr_kJevYaykFK6hf-o+gfd2Wji=813BJqseWYKzBA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQmSUzyOk6G6FKH7u01R7Xsc+HaHAo8eI38ltkFqxMZymNMRVCl4/sEFvb3IPDDOme7jf2H6
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Explicitly disable the cairo dependency
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
X-List-Received-Date: Mon, 08 Oct 2012 08:45:11 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 8 October 2012 19:01, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2012-10-08 at 16:44 +1100, Daniel Stone wrote:
>> > which has already been submitted upstream:
>> > http://lists.freedesktop.org/archives/dri-devel/2012-October/028514.html
>
> Thanks for that, sending something upstream was on my todo list but I
> needed to fix the breaking builds more urgently.

Understandable - happily the patch has already merged.  There's a
patchset in git://git.collabora.com/~daniels/poky which reverts your
original patch, adds a new patch for 2.4.39 with the backport of the
upstream patch, and bumps the git SRCREV to one with this patch
already merged.  Should I submit this to the Yocto list? (I'm told
that submitting Poky patches to oe-core is the worst kind of error.)

Cheers,
Daniel


