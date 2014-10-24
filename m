Return-Path: <paul.betafive@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 565E365D72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 10:50:38 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id f10so260130yha.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 03:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Flnd+IWUl8PumxjtAqfgy+uRzShB1cnFvRgmU/9/H6o=;
	b=ZDHb7bnpfRpug07gHPAu19JBSbgefsArhZIGBiGJ4BRPRe72P7jrrfqa7Nblo8Jc0t
	ixs0rlIailI0CPLaGzSk4jhZ0M0CP7QCxdAQ8zmgsoOKTEGUCKqRzZkxG5EFjLgMUuRF
	s1kHbw5yR+PMIuL4tWbgWI+VAgAgcj2856nUXBNl3nGhJdzB9+uSnA5R3MsOWbrLE1eJ
	4Me0O9tYz5dKahF19pMCsip2g4IhiA1SlsuZCr1B9D0NdyRohrZ8a1yPyG7BszjngE5i
	dP0vYLOZZ7z3TW8op0OOaSffDE2Z9OiMSxPN9YyyUPAd1da/mI/SUMJaj5vVmr+iC5qX
	u9lQ==
X-Received: by 10.170.189.216 with SMTP id g207mr5349167yke.45.1414147838168; 
	Fri, 24 Oct 2014 03:50:38 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Fri, 24 Oct 2014 03:49:57 -0700 (PDT)
In-Reply-To: <CAJTo0LaPRdCw5EatHYZ0TKd1EQvy17XsfPZorC+qVocyquyUeA@mail.gmail.com>
References: <543ef52e.0879c20a.1785.4076SMTPIN_ADDED_BROKEN@mx.google.com>
	<CANyK_8cVJEBpBWG2Nes705+1mdmT3W86izEnqYreiaCTD5yBdA@mail.gmail.com>
	<CAJTo0LaPRdCw5EatHYZ0TKd1EQvy17XsfPZorC+qVocyquyUeA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 24 Oct 2014 11:49:57 +0100
X-Google-Sender-Auth: 394alXKfB6fBPMRbWjqrfYAFvIw
Message-ID: <CANyK_8dA9inDGDhDhb6TcZ-AbTHD5NbCJ-zB6e8m-H+TW2XFHw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Peter Urbanec <openembedded-devel@urbanec.net>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] opkg: Call prerm and postrm scripts on package upgrade.
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
X-List-Received-Date: Fri, 24 Oct 2014 10:50:47 -0000
Content-Type: text/plain; charset=UTF-8

On 22 October 2014 23:54, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 21 October 2014 16:40, Paul Barker <paul@paulbarker.me.uk> wrote:
>>
>> Sorry Peter, it looks like this patch has been corrupted as well as
>> the one sent to the opkg-devel list. In this case I think it's mostly
>> lines like the above which have been incorrectly wrapped.
>>
>> Could you resend this using 'git send-email' if possible?
>
>
> Alternatively (and preferably for large numbers of patches), push your
> changes to a git repo somewhere.
>
> Ross

This patch can now be marked as a backport if it is resent.

I'd probably say it shouldn't be applied in oe-core until after the
1.7 branch now as it's so close to release and if any prerm/postrm
scripts don't check for an "upgrade" argument they may end up doing
the wrong thing.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

