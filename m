Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id A76DE60DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 20:15:44 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id v1so3308874yhn.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 12:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=jJPzBg0jljyajsgBoyhMXNHEAfG7E5BGz2ikqHUqQZw=;
	b=qY0Ki3SFaM+XrGEt+FNrcdzj31zJB+OBRw5XvfEzJ7h/bkcxzGpY5OtOse962bgLVg
	RlawM4xuZYY1A/FSI4cKRqXehya1gPb2gvOOr4pxC84xm4EopouVlmlpVxGasizvXt00
	iyc91ZsJF4yPrZ7qaNIaoPVUaJ1wP1M0TgxEMzptBAr1Zog6K34NzoMjgIkrR5SDpo3C
	7fn2365sX8cTnrPCV1RWCO4RCHk4TmkI7dyVR5979joJ26HShEEpv6GqU3Jy9w2FNALn
	wiaAm8kis+NJmqAYSufiGIugdLJ6TycPMB5FoZCorYtm5LbMSJOE1LbYvi4UXgKJ4NQ6
	dbQA==
MIME-Version: 1.0
X-Received: by 10.236.66.143 with SMTP id h15mr17095364yhd.36.1393532145962;
	Thu, 27 Feb 2014 12:15:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Thu, 27 Feb 2014 12:15:45 -0800 (PST)
In-Reply-To: <CAJTo0LYoCqic_4OwwMHJdwMwwMDC-ARyu1e_5PdV0+HnqNxLzg@mail.gmail.com>
References: <1393524104.31769.148.camel@ted>
	<CAJTo0LaG9SeGd2Pi3-dksPd_FHH4TEWK2MGJU-d=2kte6aTg7Q@mail.gmail.com>
	<CAP9ODKrpyH-R4LYRt6kt0SiQEfAmaVUPHZq0XEzcYJxXY7BuRQ@mail.gmail.com>
	<CAJTo0LYoCqic_4OwwMHJdwMwwMDC-ARyu1e_5PdV0+HnqNxLzg@mail.gmail.com>
Date: Thu, 27 Feb 2014 17:15:45 -0300
X-Google-Sender-Auth: HRs2ydPeIe3kvP9oAcgkve_38ZM
Message-ID: <CAP9ODKoHexNY7nVrAVyTu5fBnfmWN-f9_D42SDAx89-ODE5PxQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools-brokensep: Mark recipes with broken separate build dir support
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
X-List-Received-Date: Thu, 27 Feb 2014 20:15:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 27, 2014 at 5:13 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 27 February 2014 20:06, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Thu, Feb 27, 2014 at 3:52 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 27 February 2014 18:01, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> +inherit autotools
>>>> +B = "${S}"
>>>
>>> Why is this preferable to directly setting B in the recipe, which
>>> seems more obvious to me.
>>
>> I see one benefit for it being easier to grep for; so we know this is
>> one recipe which ought to be fixed and that rely on autotools.
>
> I'm apprehensive of adding a class whose sole purpose is to set a
> variable that can be set in the recipe itself, and will be another
> class to explain/document for the future.  Grepping for an assignment
> to B is almost as simple too.

Indeed; I agree with you now.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

