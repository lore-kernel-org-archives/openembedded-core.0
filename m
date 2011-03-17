Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0G14-0002GG-1n
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:25:38 +0100
Received: by iyb26 with SMTP id 26so3049289iyb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=DAPiaTh55+8yqKDSGZRx9ptdt1Hkpzfgfk6OUDJZv9g=;
	b=i7hz7UI+h6lANKOZ0+uhoWRqmpWh8ZOSe25JeDuWOUnp81vv3HGNdkZYse8r+MKye8
	HSpoy5eeDDP0Klh06i4TC50X0rPYefLk1Ruyc/yb9EI3YMxKAD4Pn9gV2Y4CJiT2AIaZ
	uqG3vdceV46yuxGqP2XbDbK4bAyJMEfGO933o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=j5HSMwCzN4ibiwn45ZEKw8Tf7nEL4+qNxFouMC2bQkGFtOb685rb6qosbWYUznuO4V
	0Xg3ToJf1Oxqd0YD67gvVx+qrXPE5P5zlhHCURhMkW7jSV0H83t+7Dg0GYHY9qzumCZ7
	3Rq6YTrGnkp00F1bxFaFyqJaTvqz3Xkl9eOsk=
Received: by 10.42.243.130 with SMTP id lm2mr466751icb.401.1300379032065; Thu,
	17 Mar 2011 09:23:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.176.137 with HTTP; Thu, 17 Mar 2011 09:23:32 -0700 (PDT)
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
From: Chris Larson <kergoth@gmail.com>
Date: Thu, 17 Mar 2011 09:23:32 -0700
Message-ID: <AANLkTikTN34eB90o8rLuJq5aaMa=nTE9aDCJmCMO+Rrp@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 00/12] Pull request - some sync bits from OE
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
X-List-Received-Date: Thu, 17 Mar 2011 16:25:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2011 at 9:18 AM, Chris Larson <kergoth@gmail.com> wrote:
> From: Chris Larson <chris_larson@mentor.com>
>
> This is primarily a sync of a couple OE features, along with a few minor
> changes to ensure those features work fine for us. =C2=A0More OE sync bit=
s will be
> forthcoming. =C2=A0These certainly need review. =C2=A0In particular, I ha=
ven't gotten
> any feedback on how the poky folk feel about this approach to IMAGE_FEATU=
RES
> relative to their own, so please do comment on that, if you would :)
>
> Pull URL: https://github.com/kergoth/oe-core
>
> =C2=A0Branch: oe-sync
> =C2=A0Browse: https://github.com/kergoth/oe-core/commits/oe-sync
>
>
> Thanks,
> =C2=A0 =C2=A0Chris Larson <chris_larson@mentor.com>

Erm, I forgot I hadn't yet dealt with ROOTFS_PACKAGEMANAGE_BOOTSTRAP,
in the IMAGE_FEATURES changes, don't pull this until I resolve that :)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


