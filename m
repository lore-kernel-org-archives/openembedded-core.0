Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q7WDS-0002kb-UI
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 19:08:29 +0200
Received: by bwz5 with SMTP id 5so1373986bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2011 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=ZUPV7pJ5Zar9JRyXVVKQUpmA/sDvUdphp/Ku4cjtubw=;
	b=ODUOrS5CAz9sGJwL2FvvtKMKbgkR/w03lolAjHkyzfHjfrv5TbuSt8A3DYnQE+aBrV
	sC1mZBG9p+9Rhyhsx6vYeA7cfSmibmECA8QbuHf28iJiLIxR7jUEZAX4CM9Wy5VQGnme
	jFkN/EoJQXtvnnM8gRkUSAxWU+T+uJPSM5mcw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=PJZQ4K+GKjC1ABMKitmEUEQIsrtEMCIhxqtedEPfei8et/FbhvPJHC71HIa9lD4qC6
	oQ18VgUWmnMaCuEHgj+zvX0mb3fgwfuwDVPa5zVZm7FBR5tSLTMT5nPNcWKITFxiSMOc
	uLMu8qGtC4cZHX630d+hAeSU3remTJvG8szUk=
Received: by 10.204.74.21 with SMTP id s21mr1110756bkj.62.1302109579909; Wed,
	06 Apr 2011 10:06:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Wed, 6 Apr 2011 10:05:36 -0700 (PDT)
In-Reply-To: <4D9C78F5.1090808@mentor.com>
References: <cover.1302050252.git.tom_rini@mentor.com>
	<95d636004deffc0d6473c67ee9b5ce62937dc085.1302050252.git.tom_rini@mentor.com>
	<BANLkTi=RTLB21JAz4N2B2kPWu6H3uTHn1w@mail.gmail.com>
	<4D9C78F5.1090808@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Apr 2011 10:05:36 -0700
Message-ID: <BANLkTi=UeQ22hquxLPihJAnLzpW8ODpAkg@mail.gmail.com>
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
X-List-Received-Date: Wed, 06 Apr 2011 17:08:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 6, 2011 at 7:30 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 04/05/2011 11:18 PM, Khem Raj wrote:
>> On Tue, Apr 5, 2011 at 5:38 PM, Tom Rini <tom_rini@mentor.com> wrote:
>>> The previous 5.7 release was relatively close to 5.8 due to it bringing
>>> in a patch to sync with upstream work-in-progress. =C2=A0We skip over t=
he
>>> 5.8 release and move to 5.9.
>>
>>
>> there already are patches for 5.9 available too
>> ftp://invisible-island.net/ncurses/5.9/ncurses-5.9.patch.gz
>
> Wrong link? =C2=A0That reverse applies to ncurses 5.9 release. But
> regardless, is ncurses something we need to be tracking top of tree for?
> =C2=A0It seems like we needed to for 5.7 since there had been a lot going=
 on
> without a release but that seems to have changed now.
>

those patches usually contain critical bug fixes including security updates
so it will be of interest to keep track of it

> --
> Tom Rini
> Mentor Graphics Corporation
>


