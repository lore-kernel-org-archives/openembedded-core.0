Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PyqSa-0008H0-SM
	for openembedded-core@lists.openembedded.org;
	Sun, 13 Mar 2011 19:56:13 +0100
Received: by iwn10 with SMTP id 10so4477302iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2011 11:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=PDS76Gv2D8o4z0OuhRa+CGEYO9hshLiyZkD2ejpFBMQ=;
	b=kWLMdQ4pkGLWVLjz/MDFsBWDlAFOy2Z1uweUrCUOIb99dCdVc9iLyEH9lRthfm/YNU
	4i1o5Ha7EEMsNlnoYNH6N95xO+2XDA8af6NHbXlqRf6B6Gcg3p9pyUAe0DH0cT14Pkhj
	nXAmUi25cZWLhSGLPLB6Lwd4+mCkkw6+hQ+ck=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=ffEdQoCazI7n22pmh1YGxAfF4sIrKFFWiZ3k/Yf32N/FLtFtP3/Vx81JncOdQZ3TXj
	MzQjbqUR2/e7tBGJyGAtRTElKnHrG2wzXkYWOaUjf6xaIJpkH3qXJPUcCWVm06lpV8/O
	Tb2v1/+wKeZuFu+rDQ3EdRq6v/XbTsLrXjY/M=
Received: by 10.43.49.69 with SMTP id uz5mr3120886icb.133.1300042262045; Sun,
	13 Mar 2011 11:51:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.42.176.137 with HTTP; Sun, 13 Mar 2011 11:50:42 -0700 (PDT)
In-Reply-To: <4D7CF827.60904@mlbassoc.com>
References: <cover.1299940883.git.raj.khem@gmail.com>
	<4D7CE94A.5080706@mlbassoc.com>
	<CCDB3981-855D-444D-A271-A863C2765CC4@dominion.thruhere.net>
	<4D7CF827.60904@mlbassoc.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 13 Mar 2011 11:50:42 -0700
X-Google-Sender-Auth: KpevNz7keXD1KBUXxbpGjVEtOC0
Message-ID: <AANLkTikQ-kF5u6AAKmWojmuP3xGZB4EPR0RkhhSsWAns@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 0/1] Import own-mirrors class from OE
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
X-List-Received-Date: Sun, 13 Mar 2011 18:56:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 13, 2011 at 10:00 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> Ask Richard? =C2=A0I was just pointing out that Poky/Yocto already has a
> mechanism;
> perhaps the OE one is better, who knows.

There seems to be some confusion here.  PREMIRRORS isn't a
"poky/yocto" mechanism.  It started in OE, and stills works just fine
there (it's implemented in bitbake).  own-mirrors is simply a
convenience to make premirrors manipulation easier for the user.  If
convenience and usability isn't a priority for poky/yocto, I'd be
curious to hear the reasoning.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


