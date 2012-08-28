Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1T6HM4-0007Ty-Fx
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 10:41:00 +0200
Received: by iaky10 with SMTP id y10so10384284iak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 01:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aePhx1RRevupcBJhJEzS4FatwsisSzimHRBGwQNErLM=;
	b=fwZn+Mj4dsru3DGU6zQUJ6XP030VbQBcv+a8Ufc7Hfb0QkZKEfjWiNtKYWAXCKUTkF
	Mh7wz2eB/uYsk5JhcdFK7zvETRdsfQdaC3nirRkxMF+nmI6VgJ0FzQ81PB640UQpQDNV
	5TgA1lYeovDo49+krA4SyxosrjhoWCnLfk6q+xbbuPzu1xCemOwhKtRmt1O5tZ8tuuSL
	hypOqNFJHxVvV9sHFELWfMlff0kHjS1xkyxtmcj+l8j9tkD5bCmMujVqZ/f4V0b+TnGg
	7MOeJOQKEjF2ebnAOAY1jXUYLOrsAg2RUlSAwoFle6kNqkT9axUsEBVVXnHtDnIwjd2V
	WQsQ==
MIME-Version: 1.0
Received: by 10.50.242.71 with SMTP id wo7mr12816109igc.55.1346142527547; Tue,
	28 Aug 2012 01:28:47 -0700 (PDT)
Received: by 10.64.49.45 with HTTP; Tue, 28 Aug 2012 01:28:47 -0700 (PDT)
In-Reply-To: <1485327.Nf27BjiNnc@helios>
References: <CAGiJk9dvZ=_eSZwcXRnsfwo+h0x9fWJnCapuSCVz_HftgJAw6g@mail.gmail.com>
	<1485327.Nf27BjiNnc@helios>
Date: Tue, 28 Aug 2012 10:28:47 +0200
Message-ID: <CAGiJk9dU3=Z+iTe0=v5rpQbFRsnBwQEJ_4Ywz0h+CaSR+xaZ=A@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Package re-order fallouts?
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
X-List-Received-Date: Tue, 28 Aug 2012 08:41:00 -0000
Content-Type: text/plain; charset=UTF-8

2012/8/28 Paul Eggleton <paul.eggleton@linux.intel.com>:
> On Tuesday 28 August 2012 09:37:53 Samuel Stirtzel wrote:
>> after switching from the Denzil branch to next it seems that the
>> package order has been changed.
>
> You say "next", do you mean denzil-next or master?
master

Meant the next branch of the setup-scripts:
https://github.com/Angstrom-distribution/setup-scripts/blob/next/sources/layers.txt


-- 
Regards
Samuel


