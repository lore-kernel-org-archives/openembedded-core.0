Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 208EB60FC2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 08:51:28 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hn3so3729927wib.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 01:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=ilHVkUtApfor/datT/FGgmUkfR+vF13Q/4o7SjnaegM=;
	b=QCyyp+uwVu0B7jtp43a5r/B3C0Cph2MXyy5JUul+LgDATe/j/GUA7ky2HjWCrVAzWr
	e1hbHZ25KbjdS4iTeTCH2h7zfI0jeXn1Tmiu7q0vR9tarH2ZP8IulqVNdGh6ekasxgHO
	5bC2xh804mH/VIFJBmg5GHEZ1SwGCg35GfzCxPU7hwQcwJoe9hPWRlwEfVPC2/n0yELg
	BLxOH+kgj68P6Nlp5PRIM1eOoywOEADIoAnjIT0tO6rwN23uchF4/nD9//kDbZUeALAT
	QqfmBAtoxUwjYcpZpOrgIjwR/J5sCu36YGmXsGp4+uNu+5jF2Zy7M3OIVQXSUGrOFxc+
	8tww==
X-Gm-Message-State: ALoCoQnLyAmfVWwi+tmjTH0GXn0QSvwvy21aCpmYUl+tushnans0YlV7tDUHTpPWZZCVfjFf9p3v
X-Received: by 10.180.12.243 with SMTP id b19mr13625736wic.18.1381740689031;
	Mon, 14 Oct 2013 01:51:29 -0700 (PDT)
Received: from ?IPv6:2001:610:612::1cbc:8870:802f:f32d?
	([2001:610:612:0:1cbc:8870:802f:f32d])
	by mx.google.com with ESMTPSA id
	bs15sm21201393wib.10.2013.10.14.01.51.27 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 01:51:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1381739126.29912.239.camel@ted>
Date: Mon, 14 Oct 2013 10:51:27 +0200
Message-Id: <2A539B17-C625-4CA4-B21C-3A3BBFF60E93@dominion.thruhere.net>
References: <1381498665-21514-1-git-send-email-koen@dominion.thruhere.net>
	<1381498665-21514-2-git-send-email-koen@dominion.thruhere.net>
	<1381567052.29912.206.camel@ted>
	<8C777AF9-B935-4043-AC97-106EBA7BC89E@dominion.thruhere.net>
	<1381671560.29912.221.camel@ted>
	<284EA7A5-1C83-4B85-AC71-27CD9707EC5C@dominion.thruhere.net>
	<1381739126.29912.239.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] openssh: allow empty passwords if PAM allows it as well
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Oct 2013 08:51:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 okt. 2013, om 10:25 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Sun, 2013-10-13 at 17:30 +0200, Koen Kooi wrote:
>> Op 13 okt. 2013, om 15:39 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>>=20
>>> On Sun, 2013-10-13 at 12:01 +0200, Koen Kooi wrote:
>>>> Op 12 okt. 2013, om 10:37 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>>>>=20
>>>>> On Fri, 2013-10-11 at 15:37 +0200, Koen Kooi wrote:
>>>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>>>> ---
>>>>>> meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config | 2 =
+-
>>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>=20
>>>>>> diff --git =
a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config =
b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
>>>>>> index 4f9b626..175e8f3 100644
>>>>>> --- a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
>>>>>> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
>>>>>> @@ -59,7 +59,7 @@ Protocol 2
>>>>>>=20
>>>>>> # To disable tunneled clear text passwords, change to no here!
>>>>>> #PasswordAuthentication yes
>>>>>> -#PermitEmptyPasswords no
>>>>>> +PermitEmptyPasswords yes
>>>>>>=20
>>>>>> # Change to no to disable s/key passwords
>>>>>> #ChallengeResponseAuthentication yes
>>>>>=20
>>>>> I'm struggling to connect the "if PAM allows it as well" part of =
the
>>>>> shortlog to this change? How is this conditional on PAM?
>>>>=20
>>>> If PAM disallows empty passwords this option doesn't do anything. =
The
>>>> PAM rules run before the openssh config options get applied.
>>>=20
>>> What if PAM isn't being used?
>>=20
>> I haven't tested that, but I suspect it will only allow empty =
passwords if you set it to 'yes'.
>=20
> Let me put this a different way. I think this commit allows empty
> passwords for users both using PAM and those who are not.

Right

> I think the
> commit message needs to clearly say that as its a fairly serious
> security change for both cases.

Right again.

> I'm not actually sure this makes sense as a default and it may be =
better
> off being configurable, defaulting to off...

Allowing passwordless (well, null passwords to be exact) logins is the =
current default for both PAM and dropbear, openssh is the odd one out. I =
don't really care what the default should be, just that all 3 should use =
the same :)

So should I resubmit this patch with an amended commit message or rework =
it and change the defaults in PAM and dropbear as well?

regards,

Koen=

