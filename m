Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TznTc-0002We-Tx
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 13:06:17 +0100
Received: from mail-vc0-f199.google.com ([209.85.220.199])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 28 Jan 2013 03:50:37 -0800
Received: by mail-vc0-f199.google.com with SMTP id fo13so3727252vcb.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 03:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=79SE5dIUdQVC32LXKgvvWeYb7726xLcKnRInGf7+jug=;
	b=Zi5Vb6bJpcjG8uxjUcX+PdR2qkCSGEkQ/66nnu23XtxolgJ4MvgCvEB1UAsEMJk97w
	SGyV2lqis/62OaOXdebpUpGhPtC0J7AsZDu1yEOCalL7YWLvdZkDVglbpG0iXyR7bbJ0
	G2kr0hd+J7xTKO2/vyjaddBIZB0xhz94OH/yBTXNCkKcdhKZdv7RBXvaITEu/W/Kwn3l
	T2enBCDLcd2J5MkQGMe2rOHRiLajQenKnZtPyaCxb9pCTtY7ptkq0XIxSDnvHYZeYqFt
	vANAnS57/WANZpLjNFWw0zuYW4l7c412Qt+H6+3axn1JpPRPzAK369cOy2GzKkeikken
	Hqmg==
X-Received: by 10.220.218.197 with SMTP id hr5mr14301327vcb.8.1359373835471;
	Mon, 28 Jan 2013 03:50:35 -0800 (PST)
X-Received: by 10.220.218.197 with SMTP id hr5mr14301323vcb.8.1359373835409;
	Mon, 28 Jan 2013 03:50:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Mon, 28 Jan 2013 03:50:15 -0800 (PST)
In-Reply-To: <CALbNGRSbLSf6oysR-EkR9ojsUNwhZLGfGg6P5Y1s2XKbFf5gYA@mail.gmail.com>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
	<CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
	<CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
	<20130125180634.GC16904@jama.palm1.palmone.com>
	<CALbNGRTUU_jBo4uktmEv+JCKaDnkayRt6oULYX2rUq+ro3aE+g@mail.gmail.com>
	<20130125193456.GE16904@jama.palm1.palmone.com>
	<16274FAC3E3E4296A4BB54A6FC9F6300@intel.com>
	<20130125202657.GF16904@jama.palm1.palmone.com>
	<CAJTo0LY77_koWo9=y3cYcJo+43-tE7_txf6uW0_pqr7hSi-QMA@mail.gmail.com>
	<CALbNGRSbLSf6oysR-EkR9ojsUNwhZLGfGg6P5Y1s2XKbFf5gYA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Jan 2013 11:50:15 +0000
Message-ID: <CAJTo0LbLM+A0+NyNgR5meFgdR1iFcGawz8XhAfHzOvohDjz6aA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQlWYquyJHOyY0koVTItrVemGPHdx37kxZKa20AuKrB0umA/pVgYXVOsqSFWdFAKvdp0+oPTgTlpajnCopNKRGjHjjjaIWpZSWWPiiRNJrJ+/lFIM4pmGHuSRisEfY2bHo0n7MPBzahuuZuEMrl8TMb3iDkdCRUlMlIyt2iWINria8froU1nEQFW0ssZI4rne/K9dT2E
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 12:06:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28 January 2013 11:48, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
> On Mon, Jan 28, 2013 at 11:44 AM, Burton, Ross <ross.burton@intel.com> wr=
ote:
>> On 25 January 2013 20:26, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> ALTERNATIVE_${PN}-systemd =3D "systemd-def-target"
>>
>> Let's not introduce packages controlled on distro features whose sole
>> purpose is to contain a single file.  systemd enabled -> units go into
>> $PN.
> It's more than that: postinst and companions to auto enable/disable servi=
ces.

Which are controlled by a distribution feature, so have no need to be
in a separate package.

Ross


