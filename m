Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4yeY-0002UY-Fm
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 20:30:42 +0200
Received: by eaad12 with SMTP id d12so530839eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 11:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zLBOVMAsKOyAyK9WCiK9ePZITlTIE1MpcH3+8TdQuxs=;
	b=tMrP3w2blXf65bVevBU21D1ozTMATfshs8xMFF5yhRAdPWnIf+AD+7fmuGgcZGAMi3
	+gI0nGOZLYMmOKKF3fyLXvdK+2qkHbQRclTrBFbAP2mLXUuvI8mT40GAGWlg0nttqvpF
	rBWJKmJ56sySOjBOmQTp7QeBTSm9gBnrb7UzTVBjpS5kTuXtaKyf+rYHsmGVciIOzq8R
	is6gFgQxxKesE9GXgIvq/ze2QakxcDG44IiXgkhJ8YxLw5eHLyQ4DFKX1w2+R4fAOhJR
	5/RgJvNuGQ3auU7NNDyZ0VVHBMO7kx1krsV7N7IVscnhHyruwpXFobK6QqZQztjJ4S7/
	1Y4g==
Received: by 10.14.5.67 with SMTP id 43mr8633700eek.15.1345832314604; Fri, 24
	Aug 2012 11:18:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 24 Aug 2012 11:18:04 -0700 (PDT)
In-Reply-To: <1345827969.14369.87.camel@ted>
References: <1345781608-2198-1-git-send-email-raj.khem@gmail.com>
	<50370A1F.40401@linux.intel.com>
	<CAMKF1srHBKHSLHpDw6oC5CEKCusXa3AbFDRUHRon_s4D15c9EA@mail.gmail.com>
	<1345827969.14369.87.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2012 11:18:04 -0700
Message-ID: <CAMKF1soBbjBe6pKieJVM=+ZaGzU+yNk=o_phkMnb=gZwxPsomA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] iputils: Fix postinst to run on cross rootfs generation
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
X-List-Received-Date: Fri, 24 Aug 2012 18:30:42 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 24, 2012 at 10:06 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-08-24 at 09:55 -0700, Khem Raj wrote:
>> On Thu, Aug 23, 2012 at 9:59 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> >>
>> > Richard pointed out that with Pseudo the pkg_postinsts are un-needed, so I
>> > offered a different patch to that effect.
>>
>> yes I see
>>
>> http://git.openembedded.org/openembedded-core/commit/?id=a2bc81032c85548f7c72dc76e6020ab4df9af6de
>>
>> how does it work on device installs isnt clear to me though
>>
>> with existing patch atleast I understood that with Online Package
>> management the postinst would run
>
> The file has the right permissions in the package file now. This means
> we don't need any postinst.
>
> We used to have problems preserving permissions/owners in packages but
> with pseudo, we don't, that is its big win.
>
> So this was leftover stuff from a previous age :)
>

hmmm interesting. There are more cases of postinst I see.
may be we should look through all of them

> Cheers,
>
> Richard
>


