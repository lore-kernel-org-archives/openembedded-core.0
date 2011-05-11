Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1QKDA8-0008Hl-I0
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 19:25:29 +0200
Received: by pvc30 with SMTP id 30so349481pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=kt3b4vzJWUD4xuUG2DV36n+CNAxWEcJnZ+cRmbQNyxM=;
	b=fA3Eko3ltlt2M3Eb9Pug/p4AvNmHFA1nZGUu4ZyZVurdYHT+4jv4kV8ENw4uIvsl48
	DoirPHUAQz4DGwy7wG1TiKm3OoGhsNNnioLz/Uc5o8mF+WqKG60hmGBsap4dpzF7TU8S
	6GD2rnSmWGplpvitEcQZH7h7y/CcorcfEe78M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=u42FLPG9JLJF0uXQSQdDlTt4enwCqAi2usHmp/EuumkiA2vSgMnuaBrsn1VrRMsofk
	PIRcs4ZjLJomSomskCJ1iHd8PB7WJi/5NgIAsrhzh0LylTiCq8fXmF8TMXrMtzCHEl7e
	38i0LDBqmLyyKL6vaJTpT5O16bdnLYc8b7m1o=
MIME-Version: 1.0
Received: by 10.68.38.226 with SMTP id j2mr4701444pbk.471.1305134559476; Wed,
	11 May 2011 10:22:39 -0700 (PDT)
Received: by 10.68.52.232 with HTTP; Wed, 11 May 2011 10:22:39 -0700 (PDT)
In-Reply-To: <1305121270.30391.359.camel@rex>
References: <BANLkTik-WKWNkvyLtvh-CEtD2e4qa8EcGQ@mail.gmail.com>
	<1305121270.30391.359.camel@rex>
Date: Wed, 11 May 2011 19:22:39 +0200
Message-ID: <BANLkTinh1L9sn+F6nAJ9DvJ4DWtAuOLamg@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How does openembedded-core-contrib/master relate to openembedded-core/master?
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
X-List-Received-Date: Wed, 11 May 2011 17:25:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Richard,

On Wed, May 11, 2011 at 3:41 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-05-11 at 14:37 +0200, Leon Woestenberg wrote:
>> how does the master branch of openembedded-core-contrib relate to the
>> master branch of openembedded-core?
>>
>> Is -core-contrib tracking -core 1-to-1?
>
>> My first feature branch (likewise/gnuspe) was cloned from, branched,
>> and pushes against openembedded-core-contrib, is that the correct
>> approach?
>
> The pull request you sent looked fine. This only works if that master
> branch is kept in sync with the main repo though.
>
which was exactly why I wrote this email. Thanks for confirming my concerns.


So the safer way would be to create a feature branch on core-contrib,
that however is (re)based on core.

Should I clone core, then create a feature branch that I push to core-contrib?
Should I clone core-contrib, then rebase against core, then create a
feature branch that I push to core-contrib?

In either way, I could use a list of the corresponding git commands,
as I hate to screw up and we need to document this anyway; we need
more core developers.

Regards,
-- 
Leon


