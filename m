Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SwwLW-0001mW-RC
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:25:50 +0200
Received: by eekb57 with SMTP id b57so1934084eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 07:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=GjhRkBMA2TjamrRHHgBFAnirJJf66JjDh5UynB1stBM=;
	b=O6cneTzkP7RaWNWIPwKfdFHIlwOhyOK5WeVFyOivY9iuvUX+uNh6vSLHfRbNhA9QeB
	MiCC9s1DmBJc+uvq5TWJAg19lVVwlXv3q01bMHFfE5AZrSgHJRMpBG5vH9QOZEejqryO
	Gn8YeC93LlNmj3KOi40LFza2abSk9Wq2qICLTvuDMG0ERms7BdKC97CWZvF0WBfNTgzt
	mfJ3rnIGMAB+Baly2fxrSldccvM1zdcUECRoDdt8NicFKdCnvoHbmZWn0W5M3hz2Vi3p
	Ouvw0OdkelRhPYK06f/oiU/EFlfTJHjAo0uALDTsyaqZPYJEMGeerBEOR8KAUiiHRLkd
	YYsw==
Received: by 10.14.179.71 with SMTP id g47mr27241538eem.21.1343916851409;
	Thu, 02 Aug 2012 07:14:11 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id v5sm17832802eel.6.2012.08.02.07.14.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 07:14:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LakdrRqVVx+jAeUK7Upx570=jLo=PYONZ63=xDNiwD5jA@mail.gmail.com>
Date: Thu, 2 Aug 2012 16:14:07 +0200
Message-Id: <0AF90D68-14FE-4555-9293-75450B061A51@dominion.thruhere.net>
References: <1343909173-2161-1-git-send-email-radu.moisan@intel.com>
	<CD1E2BF4-09A1-4800-8191-553B40E4CF6B@dominion.thruhere.net>
	<CAJTo0LakdrRqVVx+jAeUK7Upx570=jLo=PYONZ63=xDNiwD5jA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQmmxizsIiirX/BaDMiHeA74zVrfE6SGM35aCwwPxCP8AocKh2NvkyPbOw3UmCSPfdBX1DEJ
Subject: Re: [PATCH v2] usbutils: Upgrade usbutils to upstream v006
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
X-List-Received-Date: Thu, 02 Aug 2012 14:25:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 aug. 2012, om 15:55 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 2 August 2012 14:50, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> That's the default value, so you can drop this hunk
>=20
> Can we settle this once and for all?  Sure, it's the default, but it's
> also going to be added back in again the moment there's a change...
> I'm a fan of leaving a PR in there, even at r0, so its not constantly
> being added and removed.

The complete PR field is scheduled to get removed, so the more recipes =
without it being said to that stupid default value, the better.=


