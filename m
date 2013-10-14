Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 495386CD55
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 11:09:56 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t61so6712534wes.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 04:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=ho2g5eUUl4PyNfuSx1dBdEqbW3YSLmCYCzr8MkC/oM0=;
	b=AWGthmyKrphPDAQX90AR6xoSwtj1Q8K8xCmjIoojD2SbiiCZaIssy8xmaMwyb8i1KG
	wKV4vN1x3y0FOPffInoW9/HQEeg0nRgv70S7kRs2FPCYQCVHxHfVySMWU71wiXbr41K5
	osIctQgAfhv3lenFznp+efNrCt8ERE210X8Rc7hUabx27YTHAdObnF08N8p6DeadQRC8
	5ARa4OtX1v5qEeSGREs2aLV/MLdIoawYocKjQ0cerB1DT0H2SGJcFzj3e3dKgsU82IzP
	1xuU5d1bCiidAd9TOiA2BtO7sLVFxLXNwUen5yGKjZw0eKrFozRRS/OQpHghhPFeVANL
	62Kw==
X-Gm-Message-State: ALoCoQlb7WW+bge166W1sZspTy6fEQjJp0rTntd+U2lKuq3qxFEDgxjU2T+N5DFmI1VhNyH/G8Ma
X-Received: by 10.194.173.163 with SMTP id bl3mr29541181wjc.10.1381748997286; 
	Mon, 14 Oct 2013 04:09:57 -0700 (PDT)
Received: from ?IPv6:2001:610:612::1cbc:8870:802f:f32d?
	([2001:610:612:0:1cbc:8870:802f:f32d])
	by mx.google.com with ESMTPSA id b13sm33156490wic.9.2013.10.14.04.09.56
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 04:09:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2930108.6fy5UNzbWP@helios>
Date: Mon, 14 Oct 2013 13:09:55 +0200
Message-Id: <F5284B34-0CDB-4F68-93B1-E748158FF690@dominion.thruhere.net>
References: <1381745377-6129-1-git-send-email-koen@dominion.thruhere.net>
	<2930108.6fy5UNzbWP@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] openssh: allow login with empty password
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
X-List-Received-Date: Mon, 14 Oct 2013 11:09:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 okt. 2013, om 12:37 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Monday 14 October 2013 12:09:37 Koen Kooi wrote:
>> Currently both PAM and dropbear allow logins with empty passwords, =
but
>> openssh doesn't. This commit changes the default in openssh to allow
>> empty password logins.
>>=20
>> This should be changed to be a global config option in the long run.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git =
a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
>> b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config index
>> 4f9b626..175e8f3 100644
>> --- a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
>> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
>> @@ -59,7 +59,7 @@ Protocol 2
>>=20
>> # To disable tunneled clear text passwords, change to no here!
>> #PasswordAuthentication yes
>> -#PermitEmptyPasswords no
>> +PermitEmptyPasswords yes
>>=20
>> # Change to no to disable s/key passwords
>> #ChallengeResponseAuthentication yes
>=20
> We do already have logic in image.bbclass to set this based upon =
debug-tweaks=20
> being in IMAGE_FEATURES; is that not working for you?

I haven't tried that, but that still doesn't fix the inconsistency =
issues and presents problems during package upgrades.=20

regards,

Koen=

