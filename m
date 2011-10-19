Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RGbSZ-0000eq-6u
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 21:05:51 +0200
Received: by bkat8 with SMTP id t8so2734338bka.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 12:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=oRMJkmtll0k+sAfc7OLbNjxK7Msihe5w91cNv/ePmdY=;
	b=kqFh7/95kqZjDBmTkoLCEkGW2tX8w9Ed/0BB0jkOwmmpc4nbSDF/SMY1d7R+O+9F86
	ouJ0pslvrScDZCQi6RNMTUDue5fLpGd4VW2q85lFUgeypM0ndM81ansUMPvAgrnhNVJe
	AlbSJR36mbmzEMiiikpS6+nKs9NHe7sKZRHNY=
MIME-Version: 1.0
Received: by 10.204.7.138 with SMTP id d10mr5812410bkd.31.1319050800161; Wed,
	19 Oct 2011 12:00:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Wed, 19 Oct 2011 12:00:00 -0700 (PDT)
In-Reply-To: <CAMKF1sqffiB0WMnhv3wVNseaMcL8TjXUePYXhvdUcwwk4roPag@mail.gmail.com>
References: <cover.1319012721.git.sgw@linux.intel.com>
	<436a9b443962036ff35a5ffd86d80ad44350d5f2.1319012721.git.sgw@linux.intel.com>
	<758B37BA-B417-4B39-BF1C-0CEC613F067D@dominion.thruhere.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E2F42EE2@orsmsx504.amr.corp.intel.com>
	<E8FAD09F-4767-4ACB-9588-EFC57570F176@dominion.thruhere.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E2F42F6A@orsmsx504.amr.corp.intel.com>
	<158EAB1C-0C40-4C5B-B47A-A4B8C90A2055@dominion.thruhere.net>
	<1319042998.22985.257.camel@phil-desktop>
	<4E9F018D.7030703@intel.com>
	<CAMKF1srj1OrgnSwihsVGDCVasAc6zTHRJkfAkjFOpM80mUFM9A@mail.gmail.com>
	<4E9F0CCF.3070404@intel.com>
	<CAMKF1sqffiB0WMnhv3wVNseaMcL8TjXUePYXhvdUcwwk4roPag@mail.gmail.com>
Date: Wed, 19 Oct 2011 17:00:00 -0200
X-Google-Sender-Auth: N8HoT9NPFCbBUf9ipnnZT5PEt9o
Message-ID: <CAP9ODKoFRiVnimZ3MDvK9S2v8JLykpR2-pWmmwz_2ua0pr-HfA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Phil Blundell <philb@gnu.org>, Saul Wold <saul.wold@intel.com>
Subject: Re: [CONSOLIDATED PULL 14/16] distro-tracking: update data for some toolchain recipes
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
X-List-Received-Date: Wed, 19 Oct 2011 19:05:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2011 at 16:30, Khem Raj <raj.khem@gmail.com> wrote:
...
>>>> Many upstreams we can't track if updates are required automagically, s=
o
>>>> we
>>>> need a place to record when the last manual check was, also possible
>>>> reasons
>>>> why we should not update to newer versions, ...
>
> hmm manual check means it has to be done manually is there any thing
> that needs it ?
>
> I think unless they are distro specific which seems not since they are
> in oe-core
> they could exist in recipes =A0thats my opinion.

I agree that this should be put into the recipes. Besides this allows
for checking if it was updated when the version has been updated.

If done right, when updating the version this data will be updated
together. I see no change in the amount of changes.

A plus of this choice is it will be more difficult to forget to update
that info. This happened in last qt update for an example.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


