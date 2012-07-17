Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sr7ys-0006R3-V8
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 15:38:27 +0200
Received: by wibhq4 with SMTP id hq4so3321513wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 06:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=sKyRq3EsvbiYdlUlw4OeUydiXdl89x+mF1pPBkpD0ng=;
	b=I3ddRQBqumcKGvuCdz49D5hcjDiNckR/VtR+L+Ee/sBcmVp5o3CNYvowbF5ayOTvh5
	pUAjg8eXG8kIPi/OM40Y5gaozLuVQ1BDeXg3eUk3SpVvwWps2mb0cz5L/ZDJBs+CLQyW
	3VOdkMG20tnpHLxjAmcURCdrjGr2kXiAIsvmy1kDnx/htXXgxw4mFRjhWkg3jgenqZcT
	6igaBF0qvXhc50gpoP7JubBsq6bpZC1ATNqME5jZ3UV6PDHSuOgjDxE1Tvvdm/2BEzEg
	2O99Y9PdRb1kTI9r+3YZzSjZX0VmpXr1HMKx5GWcDjs61pzXgXD3xT1UU7+4EHSSDaom
	1YHA==
Received: by 10.216.139.145 with SMTP id c17mr1374546wej.175.1342531627647;
	Tue, 17 Jul 2012 06:27:07 -0700 (PDT)
Received: from [10.47.217.41] ([188.207.89.201])
	by mx.google.com with ESMTPS id ep14sm27771412wid.0.2012.07.17.06.27.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 06:27:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1880207.FUrsv2Gi0U@helios>
Date: Tue, 17 Jul 2012 15:27:01 +0200
Message-Id: <19F41A1C-D530-4725-AB58-4193025996BB@dominion.thruhere.net>
References: <1342513736-468-1-git-send-email-cristian.iorga@intel.com>
	<CAK18fxG7KJvUfL+LN8r42+Px2=adL9Su9ry+0gup0m1RC_u2rw@mail.gmail.com>
	<1880207.FUrsv2Gi0U@helios>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmUbNycnThobCTU1s/BZp+C4XnkOm6q7vEaJFdHDcasi8Tg2AAbcXQ0Z/Dh17UmtBuG9Q2J
Subject: Re: [PATCH 1/3] iproute2: upgrade to 3.4.0
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
X-List-Received-Date: Tue, 17 Jul 2012 13:38:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 jul. 2012, om 15:08 heeft Paul Eggleton het volgende geschreven:

> On Tuesday 17 July 2012 12:24:41 Andrei Gherzan wrote:
>> On Tue, Jul 17, 2012 at 11:28 AM, Cristian Iorga
>> <cristian.iorga@intel.com>wrote:
>>> +PR =3D "r0"
>>=20
>> Not needed anymore. (The same mention for wpa-s. and pulseaudio.)
>=20
> This is not a hard-and-fast rule for OE-Core AFAIK.

It would be *very* nice to get rid of all PR =3D r0 instances in the =
complete oe metaverse.=


