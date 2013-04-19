Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UTB1k-0000aI-1b
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 15:07:04 +0200
Received: by mail-ee0-f54.google.com with SMTP id e51so1743712eek.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 05:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Z0/MBHPhk8d3yRaPAagzfeZrlVDoQer2+fdnsIgT0hk=;
	b=jLitglqrmRMjYT1aGra9rfmtKYIY/uERu+ExPlpahIZddml2MLHs54G1+2dUCzXKIH
	Nv58e5NUFmBKCBvi0LErwBa02qR1FWsJ9qwb5KE27X0bMOXrqfiYliNRsHudRjygugMf
	eYML4xZhn/BzvDRteRaPDbvIw0w340iCM4zy20OphSZucJLf91DK0BFHftmZEbo6gfLn
	t/dFS4fWwwGWqo2Y/uSa9dCDps8lkY+t9eqBdX3qU7nBeL8MxhI0Lthy7aY+okkC9Bkq
	JwJBLFSYxPwoafCFhbM3rC7eTX3uEu7mizsb1A+Fp79yAoX+aScLmKNvBWKH5kCK1/tg
	EDZA==
X-Received: by 10.15.83.73 with SMTP id b49mr41641935eez.25.1366375761544;
	Fri, 19 Apr 2013 05:49:21 -0700 (PDT)
Received: from ?IPv6:2001:610:612::15cb:73fc:27f0:4e75?
	([2001:610:612:0:15cb:73fc:27f0:4e75])
	by mx.google.com with ESMTPS id bk42sm22847006eeb.3.2013.04.19.05.49.18
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 05:49:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <51713804.9000002@intel.com>
Date: Fri, 19 Apr 2013 14:49:20 +0200
Message-Id: <5437CC85-9AC1-4A18-BAE8-BDE01613215D@dominion.thruhere.net>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
	<3344072.3yQMCnL6TJ@helios>
	<B9C5C522-FF02-4724-B527-ACBE69FDE1B8@dominion.thruhere.net>
	<CAJTo0LZ54q91K8GNEP0RB7St4L+mpm861-kpaXTGswsqLSUk1A@mail.gmail.com>
	<6BD1F316-C3AE-41BD-B9ED-296278CEF5A7@dominion.thruhere.net>
	<CAJTo0LYeJwW-Lbf9bEZogCh1e97bwj7PTgFZV=3NbwN=PMWENg@mail.gmail.com>
	<CAJTo0LYRPtG_N1WCE37UTvGvy5HYt7ia1ym12iR874Ykb8QwTg@mail.gmail.com>
	<623CB95B-FD17-49A5-9547-71E0EFC316A7@dominion.thruhere.net>
	<5171293A.5010300@intel.com>
	<0E83C36A-8358-40B0-B022-A39DBFF44880@dominion.thruhere.net>
	<51713804.9000002@intel.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmAF5H6kASKdf+R+rh5iXaL1TJwxwg6gS+X2YckqgoYrtlIipIHMvRFy4ARFWx4RQMwRem7
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
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
X-List-Received-Date: Fri, 19 Apr 2013 13:07:13 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 19 apr. 2013, om 14:26 heeft Laurentiu Palcu =
<laurentiu.palcu@intel.com> het volgende geschreven:

>=20
>=20
> On 04/19/2013 02:38 PM, Koen Kooi wrote:
>>=20
>> Op 19 apr. 2013, om 13:23 heeft Laurentiu Palcu =
<laurentiu.palcu@intel.com> het volgende geschreven:
>>=20
>>>=20
>>>=20
>>> On 04/19/2013 12:13 PM, Koen Kooi wrote:
>>>>=20
>>>> Op 19 apr. 2013, om 10:52 heeft "Burton, Ross" =
<ross.burton@intel.com> het volgende geschreven:
>>>>=20
>>>>> On 19 April 2013 09:38, Burton, Ross <ross.burton@intel.com> =
wrote:
>>>>>> On 18 April 2013 19:45, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>>>>> [koen@rrMBP 1.0-r0]$ grep "configuration required on target" =
temp/log.do_rootfs
>>>>>>> gdk-pixbuf-loader-png.postinst returned 1, marking as unpacked =
only, configuration required on target.
>>>>>> ..
>>>>>>=20
>>>>>> This is "usual" for postinsts that are intercepted and handled in =
a
>>>>>> single go - scroll further down the log and you should see the =
package
>>>>>> manager running the intercept scripts (i.e. fontcaches once, =
gconftool
>>>>>> once).  I expect you'll see there that the gconftool intercept is
>>>>>> breaking for some reason.
>>>>>=20
>>>>> Actually gconf isn't using triggers but it should happen on the =
host.
>>>>>=20
>>>>> I wonder if we're hitting a problem where the postinsts are doing =
some
>>>>> actions on the host and then triggers are "erroring" out and it's =
all
>>>>> falling back to the target.  Can you share the complete rootfs log =
for
>>>>> this gnome image?
>>>>=20
>>>> Here's the complete log: =
http://dominion.thruhere.net/koen/angstrom/beaglebone/log.do_rootfs
>>> Do you think you can post the rootfs/var/lib/opkg/status file? This
>>> would show us exactly what packages were postponed for first boot.
>>=20
>> This is the build that finished just before Ross sent the gconf =
patch:
>>=20
>> 	=
http://dominion.thruhere.net/koen/angstrom/beaglebone/Angstrom-systemd-GNO=
ME-image-eglibc-ipk-v2013.06-beaglebone.rootfs.tar.xz (75MiB)
>>=20
>> I haven't booted that yet, I'll do that when I get back from lunch.
> =46rom what you sent, I see the following packages postponed: =
udev-hwdb,
> gnome-panel and gdm. We know about udev-hwdb... However, gnome-panel =
and
> gdm are postponing the postinstalls for first boot explicitly:
>=20
> if [ "x$D" !=3D "x" ]; then
> 	exit1
> fi
>=20
> This explains, at least, why you still see postinstalls running at =
first
> boot.
>=20
> Running the postinstalls at first boot appear to hang because (and
> that's just a feeling) gtk-icon-cache is run twice on target... which =
is
> time consuming.

I know it's time consuming, but it finished on 60-90 minutes with 1.3, I =
left it overnight and it still hadn't finished. I have the LEDS =
configured to short mmc0 and cpu0 activity and there' s no IO, only cpu =
from time to time. I don't think it takes more than 14 hours to run =
those postinsts.

regards,

Koen=


