Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QFZ0E-00018u-Mu
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 23:44:02 +0200
Received: by vxd7 with SMTP id 7so2701794vxd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2011 14:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=bgdeSIVE8heledStkV0gs9QaBi+cMybdm7bAZ7Fz7iQ=;
	b=F72IvwninwfT1qXBeHurn8ksexXieSXHQsd2hYzGQXUbDMSWm8YwiNl0yO3PYg3ZKf
	KVCqVsO9F1lZxedsr660NLthUIUCLwdQfAADHPv3qVFPIBK2WWdiCk+sB/PxMS2FcT16
	7A30z9hFeYdq9RLjq/EzpuwY8QeMwMuqAzj8s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=nrjOXtvPahWI9rfJ1rkTI9ZeNy/3JqAZjhxFJtVs4TEiwa+1aWKz2YW79JAgYO9e71
	2hGLgL521fq9IKQkjMrN4V9QgTOemv1KSlaW2DgujoI51yv7xbv1P/m9KlyZ2xiWOjZu
	krXLwcTeONzaF31TyClb6Om3Pml5aXGVYHLLo=
Received: by 10.52.18.47 with SMTP id t15mr3015438vdd.48.1304026890085; Thu,
	28 Apr 2011 14:41:30 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.183.162 with HTTP; Thu, 28 Apr 2011 14:41:10 -0700 (PDT)
In-Reply-To: <BANLkTik8RuWrHsg6sNPq7peW6=9agGYwuA@mail.gmail.com>
References: <4DB9D856.7030709@windriver.com>
	<BANLkTik8RuWrHsg6sNPq7peW6=9agGYwuA@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 28 Apr 2011 14:41:10 -0700
X-Google-Sender-Auth: moYfgh_RXcBn26Q3qoMRF4H5gn0
Message-ID: <BANLkTikOESf2KFaoo6Gx+Z0Zf2U-S3MsTw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core and MacOS X
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
X-List-Received-Date: Thu, 28 Apr 2011 21:44:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2011 at 2:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Apr 28, 2011 at 2:12 PM, Mark Hatle <mark.hatle@windriver.com> wr=
ote:
>> I've started working on getting bitbake and OE-Core building on MacOS X.=
 =C2=A0So far
>> what I have are some pretty hacky patches.. but they should be a reasona=
ble start.
>>
>
> You might be interested in
> http://git.openembedded.org/cgit.cgi/openembedded/log/?h=3Dkoen/darwin-ho=
st-fixes
> there might be some interesting bits still relevant

I did some work on this in the past as well.  There may be a commit or
two at http://git.openembedded.org/cgit.cgi/openembedded/log/?h=3Ddarwin
worth grabbing.  There's also the openembedded/bin/darwin/ wrapper
scripts in upstream OE, that deal with gnu vs bsd cp/sed arguments.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


