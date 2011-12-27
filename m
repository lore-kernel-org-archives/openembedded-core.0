Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RfazU-0004Yy-BD
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Dec 2011 18:39:08 +0100
Received: by werm13 with SMTP id m13so5892246wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2011 09:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=vGOkQiUUT/LtTZnfBbMLrbBeEMtmMH6bE1FZ2wmgnbs=;
	b=OB+5HA/7e0kqNaK6WhCQtuhDrAZTMO9kxvW+dGbAsHF3Odx23zYQeZEHN8Z8JxNrqY
	Kls+xLdGEeqldLw9lIOOZ56ZyS4ngXykF+rKxWOraFTUGtzazu469lx+4D0qyWUa+rYU
	l+hPmS4CkiZqMGq8z9qLsSou7MfJ0QTenZKu0=
Received: by 10.216.138.101 with SMTP id z79mr22034922wei.7.1325007112256;
	Tue, 27 Dec 2011 09:31:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.162.208 with HTTP; Tue, 27 Dec 2011 09:31:31 -0800 (PST)
In-Reply-To: <1324488253.19860.4.camel@ted>
References: <4EF0C808.8060609@gmail.com> <1324488253.19860.4.camel@ted>
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 27 Dec 2011 10:31:31 -0700
Message-ID: <CABcZAN=tn0f=xNFepSeOMT--yvPX-UKCj0fa-0WMeuWsAAro5Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] patch.bbclass: abstract out logic that determines patches to apply
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
X-List-Received-Date: Tue, 27 Dec 2011 17:39:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2011 at 10:24 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-12-20 at 10:38 -0700, Christopher Larson wrote:
>> This is needed by the copyleft_compliance class, so it can emit series f=
iles
>> for the patches, which greatly increases their usefulness to a user
>> trying to
>> reconstruct the sources outside of OE.
>>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> ---
>> =C2=A0 meta/classes/patch.bbclass | =C2=A0196
>> +++++++++++++++++++++++--------------------
>> =C2=A0 1 files changed, 105 insertions(+), 91 deletions(-)
>
> I have no objection to the change but the patch seems to be mangled
> somehow. Could you resend it or point me at a git tree please?

Sorry about that, my git send-email isn't working on my main dev
machine at the moment, strange error from git that no one seems to
recognize. used imap-send, and apparently tbird defaults to wrapping
the same way the gmail UI does *eyeroll*. See
https://github.com/kergoth/oe-core/compare/patch-refactor
--=20
Christopher Larson


