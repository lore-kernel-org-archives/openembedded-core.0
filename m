Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q7WXu-00006b-8E
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 19:29:34 +0200
Received: by fxm19 with SMTP id 19so1297898fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2011 10:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=l5aS1FDLax7whPJjOdEyCVS5LEzIX3hAQSci8A4upzM=;
	b=vAL/taZoumAZFwiP1LJnbrwVZgWyshL0z4Hzz7YyieMSVJGXnxE/fiyea2eX2Xt/Qe
	OupYpkb0rtO9jIj67JesywNQlxrXXG6fDF3+rl/GxT4hRTyL/IsjjMkAbm8XmsLR7Kcy
	0XF71n03BvdPKWh2cVmmgZFkNqnhM+MagR+5Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=RK1viimA1x1Ige+Es8a3qLZoZEu+GrY5tBn1Wof/B4ZAMvyHvmpRX+6eGte0K7a9m0
	G4T99cnsR5ManF35a/P6gIGSYLfzKQPkEGAZ2a5WPhvCwiIl2aayjNbuDtY7PU0aqVV3
	6fIDDqOO4r2nBqmV2epc195jvx0JbX5gU5i2s=
Received: by 10.204.19.20 with SMTP id y20mr1088214bka.170.1302110847193; Wed,
	06 Apr 2011 10:27:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Wed, 6 Apr 2011 10:26:57 -0700 (PDT)
In-Reply-To: <4D9C9E75.1060203@mentor.com>
References: <cover.1302050252.git.tom_rini@mentor.com>
	<95d636004deffc0d6473c67ee9b5ce62937dc085.1302050252.git.tom_rini@mentor.com>
	<BANLkTi=RTLB21JAz4N2B2kPWu6H3uTHn1w@mail.gmail.com>
	<4D9C78F5.1090808@mentor.com>
	<BANLkTi=UeQ22hquxLPihJAnLzpW8ODpAkg@mail.gmail.com>
	<4D9C9E75.1060203@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Apr 2011 10:26:57 -0700
Message-ID: <BANLkTimuM8GCHd11cuH5ULA6jL=3kZDk6w@mail.gmail.com>
To: Tom Rini <tom_rini@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ncurses: Update to 5.9
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
X-List-Received-Date: Wed, 06 Apr 2011 17:29:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 6, 2011 at 10:10 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 04/06/2011 10:05 AM, Khem Raj wrote:
>> On Wed, Apr 6, 2011 at 7:30 AM, Tom Rini <tom_rini@mentor.com> wrote:
>>> On 04/05/2011 11:18 PM, Khem Raj wrote:
>>>> On Tue, Apr 5, 2011 at 5:38 PM, Tom Rini <tom_rini@mentor.com> wrote:
>>>>> The previous 5.7 release was relatively close to 5.8 due to it bringi=
ng
>>>>> in a patch to sync with upstream work-in-progress. =C2=A0We skip over=
 the
>>>>> 5.8 release and move to 5.9.
>>>>
>>>>
>>>> there already are patches for 5.9 available too
>>>> ftp://invisible-island.net/ncurses/5.9/ncurses-5.9.patch.gz
>>>
>>> Wrong link? =C2=A0That reverse applies to ncurses 5.9 release. But
>>> regardless, is ncurses something we need to be tracking top of tree for=
?
>>> =C2=A0It seems like we needed to for 5.7 since there had been a lot goi=
ng on
>>> without a release but that seems to have changed now.
>>>
>>
>> those patches usually contain critical bug fixes including security upda=
tes
>> so it will be of interest to keep track of it
>
> Well, it doesn't currently. =C2=A0And while I agree we need to do a good =
job,
> everywhere, of keeping track of security updates, I don't think we
> should move back to depending on a site that frequently removes patches.
>

yes. cache the patches like yocto did for 5.7 recipes
> --
> Tom Rini
> Mentor Graphics Corporation
>


