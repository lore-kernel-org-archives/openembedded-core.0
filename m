Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id D899A6CD18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2013 15:30:09 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id t60so6147213wes.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2013 08:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=EUHpD/KRQHZNY19W97ewp2e1yFtToqr06No2KFvG19A=;
	b=DoTuoTk0wT0Ym0klfUwTOT8e4/MJIaS0SMHFm4xh2AQE8xcL+IMhDQAcyisvCcycUG
	ew/FVmxCDP3GVFH6zwu3SyQLJcJEW6pk+asRoMT/RJ1tkIJhqkDCBrgnbdIXo0Drpypm
	/saq9LDYJY7B0H7pPt87n0t9EbPTqo8QGSyrCOWULV1mkIE3ygZoTfadjlB2T6AM2+Vm
	VZZoOMdYy6HVqnGz78gbEaZi4d6+vvNym2qQtojw5/Lq1eSjKrESpP0siMpi5d2BcUyP
	fq8N18lrv6tfORk2aSfKDoa4w68SXbcbzYVaTMwD39V7r9O7GwH795AAgr6oR9Ei5sGb
	7SWw==
X-Gm-Message-State: ALoCoQnfXMXl83YnQR+1ydESMOoEUIIalR409Awt3DWbffjKXfgmrHFEyEs556DjJfKMNS/SWnlH
X-Received: by 10.194.89.233 with SMTP id br9mr25277533wjb.15.1381678210718;
	Sun, 13 Oct 2013 08:30:10 -0700 (PDT)
Received: from [172.20.0.132] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	sh5sm25249914wic.11.2013.10.13.08.30.09 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 08:30:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1381671560.29912.221.camel@ted>
Date: Sun, 13 Oct 2013 17:30:08 +0200
Message-Id: <284EA7A5-1C83-4B85-AC71-27CD9707EC5C@dominion.thruhere.net>
References: <1381498665-21514-1-git-send-email-koen@dominion.thruhere.net>
	<1381498665-21514-2-git-send-email-koen@dominion.thruhere.net>
	<1381567052.29912.206.camel@ted>
	<8C777AF9-B935-4043-AC97-106EBA7BC89E@dominion.thruhere.net>
	<1381671560.29912.221.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1510)
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
X-List-Received-Date: Sun, 13 Oct 2013 15:30:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 okt. 2013, om 15:39 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Sun, 2013-10-13 at 12:01 +0200, Koen Kooi wrote:
>> Op 12 okt. 2013, om 10:37 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>>=20
>>> On Fri, 2013-10-11 at 15:37 +0200, Koen Kooi wrote:
>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>> ---
>>>> meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>=20
>>>> diff --git =
a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config =
b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
>>>> index 4f9b626..175e8f3 100644
>>>> --- a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
>>>> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
>>>> @@ -59,7 +59,7 @@ Protocol 2
>>>>=20
>>>> # To disable tunneled clear text passwords, change to no here!
>>>> #PasswordAuthentication yes
>>>> -#PermitEmptyPasswords no
>>>> +PermitEmptyPasswords yes
>>>>=20
>>>> # Change to no to disable s/key passwords
>>>> #ChallengeResponseAuthentication yes
>>>=20
>>> I'm struggling to connect the "if PAM allows it as well" part of the
>>> shortlog to this change? How is this conditional on PAM?
>>=20
>> If PAM disallows empty passwords this option doesn't do anything. The
>> PAM rules run before the openssh config options get applied.
>=20
> What if PAM isn't being used?

I haven't tested that, but I suspect it will only allow empty passwords =
if you set it to 'yes'.

regards,

Koen


