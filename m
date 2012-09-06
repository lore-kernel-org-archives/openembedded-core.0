Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9dbI-0000Mu-CS
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 17:02:36 +0200
Received: by wibhq4 with SMTP id hq4so5734263wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 07:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Tvn7haGoH4A3FDslCr3SJKYw+ddey+8JsE2N/ZVUWh8=;
	b=m4I4Qa1Z9u6cFMVdL4+80okM1N/P77kDojXwZO/KB6O+t3+OCuO+toOV0wTNuPrt5k
	HV5Ec7DyGcOzmmvBRrVQifeqKOYCMvL07jourUmnTIUJoSxgl6QEXnmpritshRH+UfkY
	YMvrfbS29vM3CAdzWGOOEdp+6C0deugV5+YSC7U9/hBDQ/suuhCuGWovYts2jKEoqbCR
	BHZlRTTjPNJ5a7HjYWNneHUZNyFNN9OR0D1Da2+89NTJKm/pmR63BTlTae6sG7ocMMf8
	XpbK63xfE2o6BrbaDZDs5T5mk8WJlVRP2sUL9RAntPEyIoOQAtx2avM7RzgTZAXY08NW
	3SrA==
Received: by 10.181.13.208 with SMTP id fa16mr5398924wid.11.1346943012039;
	Thu, 06 Sep 2012 07:50:12 -0700 (PDT)
Received: from ?IPv6:2001:610:612::4908:ca0a:f01a:394b?
	([2001:610:612:0:4908:ca0a:f01a:394b])
	by mx.google.com with ESMTPS id w7sm4463016wiz.0.2012.09.06.07.50.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 07:50:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5048B526.4050501@r-finger.com>
Date: Thu, 6 Sep 2012 16:50:10 +0200
Message-Id: <C92CD2AA-A842-454E-9C14-FCA5FC683DAB@dominion.thruhere.net>
References: <CAK18fxEb3gjEEwhvN-du3eJvgUVCbjXU2Ag4kicFFDt6xra6og@mail.gmail.com>
	<CAJTo0LYmPf0g_qv6X+8MefjzfWr4gsr33SaszHsG82PiGg+oEg@mail.gmail.com>
	<644855E8-7D63-45DC-B072-B9A9893058F3@dominion.thruhere.net>
	<CAJTo0La9-QHoWJB2v82C2tiM2XFwgHzsP1zda+Duqe_3uTwByw@mail.gmail.com>
	<5048B526.4050501@r-finger.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQksrVbS7ht0EFPp0WDXEMzyxuvydZVt4mQ389gR3zfWn5yE52CEiHmRXIMjXidnshMX21Xk
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [yocto] opengl / libgl / libgles
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
X-List-Received-Date: Thu, 06 Sep 2012 15:02:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 sep. 2012, om 16:37 heeft Tomas Frydrych =
<tf+lists.yocto@r-finger.com> het volgende geschreven:

> On 06/09/12 14:51, Burton, Ross wrote:
>> On 6 September 2012 14:25, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>> It's not automatic, but you can do something like this:
>>>=20
>>>        =
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3D23b02134
>>>=20
>>>        RDEPENDS_${PN} =3D "libGL"
>>=20
>> Ah, interesting.  I'm not entirely keen on the manual dependencies =
but
>> that's certainly a step in the right direction.
>=20
> Is there much that actually links against libGL / libgles? Things like
> cogl dlopen() these these, so you have to manually specify the =
RDEPENDS
> anyway. Just thinking this could be less of an issue than it might =
appear.


xbmc is one=


