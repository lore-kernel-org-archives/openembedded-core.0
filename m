Received: from na3sys009aog101.obsmtp.com ([74.125.149.67])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1QmS5r-0002Op-TB
	for openembedded-core@openembedded.org; Thu, 28 Jul 2011 17:01:48 +0200
Received: from mail-vw0-f50.google.com ([209.85.212.50]) (using TLSv1) by
	na3sys009aob101.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTjF43aF9t1qg2yPY6qAsi58NlhRgjuRA@postini.com;
	Thu, 28 Jul 2011 07:57:34 PDT
Received: by vws14 with SMTP id 14so2274395vws.9
	for <openembedded-core@openembedded.org>;
	Thu, 28 Jul 2011 07:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=4tUOp+ad4lFLc18HyIAcUnLfgs8eJEgg1KjKV64es9s=;
	b=MZI4GBBpfKt4WeKtYdFGxBvnuoXku6qfI9sWZpet5n6q680RXOUiFonDcy1wT+jTgK
	dEG9dcb3MApAycz4TEVsvfjY5Q7t6YaohXXI1JqhgVL1Kc6xlg1ss08aufPToE1AyW2X
	RcXLoMh5iUSzZvbp6pZJs2pnd6ekpiwNhtxXE=
MIME-Version: 1.0
Received: by 10.52.22.49 with SMTP id a17mr95265vdf.170.1311863367273; Thu, 28
	Jul 2011 07:29:27 -0700 (PDT)
Received: by 10.52.165.200 with HTTP; Thu, 28 Jul 2011 07:29:27 -0700 (PDT)
In-Reply-To: <CACW_hTYaTBDZjfwHo=fYaZZ72KqEHVKS1DYaxDgeEVOkArmjEw@mail.gmail.com>
References: <1311824295-13464-1-git-send-email-bengardiner@nanometrics.ca>
	<CACW_hTZEgveniP0x3R6Q1mNb9+T0kYP=TsOF4A2SwHKJeAqUjA@mail.gmail.com>
	<CAPcSpE+ZKH=o7RsotsiCmo3ss5zHo=wH9-z6htc7zVWDo7YSOQ@mail.gmail.com>
	<CACW_hTaR-BfLXDpUyrCcL+Ns2KOOSiT+kH9fJ07HGJwOZ51a4w@mail.gmail.com>
	<CAPcSpEJphsRYSr_CmXtDc=G5MnGNyoEd8MQcbaALKu4GPQ__Uw@mail.gmail.com>
	<CACW_hTYaTBDZjfwHo=fYaZZ72KqEHVKS1DYaxDgeEVOkArmjEw@mail.gmail.com>
Date: Thu, 28 Jul 2011 10:29:27 -0400
Message-ID: <CAPcSpELL=VJEdcO+0m1goAQdgV8PkjGqmZ9+3U_SZRTed=Yu-A@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>, openembedded-core@openembedded.org
Subject: Re: [PATCH] [PATCH] raptor: add recipe
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
X-List-Received-Date: Thu, 28 Jul 2011 15:01:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2011 at 10:24 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
>
>
> 2011/7/28 Ben Gardiner <bengardiner@nanometrics.ca>
>>
>>
>> Well, I would not submit _this_ patch for pull-request. I was hoping
>> to get this version of raptor included and then submit a pull-request
>> for a cherry-pick of the patch to add libxml2 to DEPENDS.
>
> Ah, missed that you also added libxml2.
> Not sure about the policies of the maintenance branch, but I suspect the
> proper way would be to fix and test in openembedded then submit a pull
> request.
> Then again maybe the policies for the maintenance branch are different.

:) They are. AFAICT I need to get this recipe (including libxml2 dep
update) into oe-core or its layers :)

>
> [...]
>>
>> >>
>> >> http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guideline=
s#Example:_Importing_from_Elsewhere_Modified
>> >
>> > Ah ok, Those guidelines are fairly new and I was not too aware of them=
.
>> > If
>> > it is in accordance with the guidelines it is fine with me to keep the=
m.
>> > I was mainly triggered by the signed-off lines at the beginning of you=
r
>> > message (which I don't think are in accordance to the above mentioned
>> > guidelines).
>>
>>
>> Oh. I thought they were [in accordance]. I guess there would usually
>> be a commit body before the initial Signed-off-by:'s ; however, there
>> was no original commit body to preserve.
>
> Ah ok, understood.
> Actually, I guess we should preserve the first line of the commit too.
> This is what git log says:
>
> frans@frans-desktop:~/workspace/openembedded/recipes/raptor$ git log *
> commit 01e8e9f325d8d251e852e7a5704b5fe50880e1ad
> Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> Date:=A0=A0 Sat Aug 14 21:27:49 2010 +0200
>
> =A0=A0=A0 raptor: added recipe
>
> =A0=A0=A0 Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Yes! Good point, Frans. It is 'added' not 'add' Sorry about that.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


