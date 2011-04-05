Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7Bgk-0008U9-K6
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 21:13:32 +0200
Received: by yxn22 with SMTP id 22so292845yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 12:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=uDT63ifYQ/KkJQQQW4wgzjtPSOBSoJTycWo+IZ5Y2F0=;
	b=q1gJCxYZdw8bOg2tQywuvrqVMsQSInlZP4V+dn2wnc+JRozoV6lQo09NfjpGkCyFrq
	JMVFPY/xhUwJmwL3/8/uxCJAIsMVHm3kYfTLk4KD0UCuc1B/BKjJrXxGogp/7Lhf/AuN
	9dm5OCcg+e0VC5W82+Tp7cXQ5iNeDs8UqEVB0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=x7VmBMhkTONwRpX3tSn/pAVZeS5SLyDxYK0nmkejVHxcOgh56KDoUtQ1Gab/qvjmGU
	z9SdPMd1dmTM3IaFY4QPt7qw6mrcBKUMhtE8DVBHEjwN9I/fScoiU+Jdr5+bl1dRU+SZ
	3gKU+r6YYFmrfqAcXvSakgqsjSyQDov88eWFg=
Received: by 10.42.157.193 with SMTP id e1mr71077icx.178.1302030669060; Tue,
	05 Apr 2011 12:11:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.179.199 with HTTP; Tue, 5 Apr 2011 12:10:49 -0700 (PDT)
In-Reply-To: <BANLkTikWLN1mUiF3D6i9q0YhP3pn-29JYQ@mail.gmail.com>
References: <cover.1302030219.git.chris_larson@mentor.com>
	<BANLkTikWLN1mUiF3D6i9q0YhP3pn-29JYQ@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 5 Apr 2011 12:10:49 -0700
Message-ID: <BANLkTimRpAq1PGiYwgPYaNhUWNk8-KFN+A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Rework the devshell
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
X-List-Received-Date: Tue, 05 Apr 2011 19:13:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 5, 2011 at 12:09 PM, Chris Larson <kergoth@gmail.com> wrote:
> On Tue, Apr 5, 2011 at 12:08 PM, Chris Larson <kergoth@gmail.com> wrote:
>> From: Chris Larson <chris_larson@mentor.com>
>>
>> - Adds a utility metaclass for maintaining class registries
>> - Shifts the handling of spawning a terminal into a new 'terminal' pytho=
n
>> =C2=A0module
>> - Automatically selects an appropriate terminal based on what you have
>> =C2=A0available on your machine
>> - Still allows manual selection, but in a more convenient way, and falls=
 back
>> =C2=A0to auto if you select an invalid or unavailable (not installed) te=
rminal
>> - Improves how we spawn screen:
>>
>> =C2=A0- Shows a warning when spawning it, so do_devshell doesn't appear =
to hang
>> =C2=A0- Spawns a named screen session 'devshell', to avoid confusion whe=
n the user
>> =C2=A0 =C2=A0already has other screen sessions running
>>
>> Pull URL: https://github.com/kergoth/oe-core
>> =C2=A0Branch: devshell
>> =C2=A0Browse: https://github.com/kergoth/oe-core/commits/devshell
>
> Note: this depends on the variable typing from the previous pull
> request, forgot to add that to the cover letter.

Er, ignore this pull request, a v2 will be forthcoming (missed a file).
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


