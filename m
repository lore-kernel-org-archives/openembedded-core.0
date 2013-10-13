Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id F220E6CD23
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2013 10:01:20 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id ez12so120905wid.15
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2013 03:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=QcX8PeITatbX+enSNPwZWCDhzJIOJf9HoE4EzRwqyBo=;
	b=Ws1VPi1g3kL0eHUfDpUZddjsUt5EUMAD+VCHHEuNKdL7XOCipLTVkU25dk54pPoOz3
	PEL//rMjbvgVR3bkDhTjdd/1o/1yOiaSn734+CC3hvDhj7Gx8CJoYVXFfZpGyVCJGd4B
	ORbpNWZ3xyd5Kpgf1XRmd4iE1A4j9AdEvws8UG+a/VjoL0NSam6ZKG0dod54gJqBMZEJ
	8jkIcIFm1oldKSAj0/OI9l9bSQthtevrB+FnvE16bLRDHzS+LGIcz+ZG4pGfkyFiJ/SJ
	ds2vPDKuAQvWgekMIn+XXtEiTBqUhKyJK/gCzrAJon1QcNIFsnNJiGl+9DSdkp89mPom
	m3aw==
X-Gm-Message-State: ALoCoQkwHY1wAR6JkcxDGah1z68eeQl2D5DQXaKyLtRwvCV5lA8+FZGYKXwNH5/DNdPnFBw1CixP
X-Received: by 10.180.36.80 with SMTP id o16mr10283580wij.1.1381658482233;
	Sun, 13 Oct 2013 03:01:22 -0700 (PDT)
Received: from ?IPv6:2001:610:612::ed98:d413:7f7b:5e4d?
	([2001:610:612:0:ed98:d413:7f7b:5e4d])
	by mx.google.com with ESMTPSA id w10sm11787294wia.4.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 03:01:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1381567052.29912.206.camel@ted>
Date: Sun, 13 Oct 2013 12:01:19 +0200
Message-Id: <8C777AF9-B935-4043-AC97-106EBA7BC89E@dominion.thruhere.net>
References: <1381498665-21514-1-git-send-email-koen@dominion.thruhere.net>
	<1381498665-21514-2-git-send-email-koen@dominion.thruhere.net>
	<1381567052.29912.206.camel@ted>
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
X-List-Received-Date: Sun, 13 Oct 2013 10:01:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 okt. 2013, om 10:37 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Fri, 2013-10-11 at 15:37 +0200, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git =
a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config =
b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
>> index 4f9b626..175e8f3 100644
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
> I'm struggling to connect the "if PAM allows it as well" part of the
> shortlog to this change? How is this conditional on PAM?

If PAM disallows empty passwords this option doesn't do anything. The =
PAM rules run before the openssh config options get applied.

regards,

Koen=

