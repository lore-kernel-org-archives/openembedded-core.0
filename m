Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qc4jI-00048x-KJ
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 02:03:36 +0200
Received: by vxa37 with SMTP id 37so1452200vxa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 16:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=mt2y+PFsr1NK4DiVLuEYoAqNbt3419uVP75y7eWIF80=;
	b=TnAzyf4vMYu3urhN0mmsrZ+eGygOCjEvIvFPP3qMal2PJ8CddTW35qcg/Fs0dE1qEM
	XR6JiG7ipCjmaudxSHto97AwgRaftkuelQM6W4trtdCA1K5NIZvcpHVH+3grlfLV4NMa
	7LratDw0K/RyNWtzFlRg+b/RtvkLZEu9TUyWQ=
Received: by 10.52.111.71 with SMTP id ig7mr1995125vdb.209.1309391993056; Wed,
	29 Jun 2011 16:59:53 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.181.2 with HTTP; Wed, 29 Jun 2011 16:59:33 -0700 (PDT)
In-Reply-To: <201106300102.16411.schnitzeltony@gmx.de>
References: <201106300102.16411.schnitzeltony@gmx.de>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 29 Jun 2011 16:59:33 -0700
X-Google-Sender-Auth: DqI47pjc-D3Qbs4wSIawzC73eRw
Message-ID: <BANLkTimEROj5AcR+eYjLVFH2Sh3+0sB04A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to reuse code in oe-core environment
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
X-List-Received-Date: Thu, 30 Jun 2011 00:03:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2011 at 4:02 PM, Andreas Mueller <schnitzeltony@gmx.de> wro=
te:
> foo() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# code to reuse
> }
>
> and called foo from several recipes. In oe-core the run.* scripts are muc=
h more
> stripped of unnecessary. =C2=A0All the code included by 'require' seems t=
o miss, so
> the function foo() will not be found.
>
> My searches for examples did not lead to a hook so what is the suggested
> solution for reusing code for multiple recipes in oe-core?

The require doesn't have to do with anything. bitbake emits only the
functions which get called somewhere from the task being run. It
tracks what variables reference what other variables. If you call a
shell function from another shell function, it tracks this, and
realizes that both need to be emitted. Either you're doing something
wrong, or you're doing something in a way that bitbake can't track.
There's a variable flag you can set to explicitly add variable
dependencies.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


