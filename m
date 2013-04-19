Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UTBPG-0002ic-GX
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 15:31:14 +0200
Received: by mail-ee0-f48.google.com with SMTP id b15so1819250eek.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 06:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=sE24dJ0KDJMDVs2MvkMJ/Eh3wxebFym9XAVK4+3Zb7o=;
	b=gPv/y+rjtfAuNPCTQbbQzGOeUqdn+upe76iKU7TCHWrnsFF0sX29e2APW7nQ9QM87m
	QRVkm64qHmXMSYvLaqlZkINVBfhs/C2g/MCJuhnoHhxpYstYDRzzEHF6ESwDU3yle40p
	hKZu4GCXhYDY7rrdWruFZqoWjdutKP4FJdcr0Lo4t57Gicjn1oUwE+10+vrTuc8bdvoB
	oZU3PCxUlnKBbnb+K6Jv0kHgYMKf4eGueqhDIg6imnUD01Sp19lp2HbDydJ36Cxnb98A
	16ASuyz8nQh1jBEiGohi3JhTKrLu8GYHsx2R5aGxQfKd7ZjkwQHftdq9SaNlXRYqugz/
	aJHg==
X-Received: by 10.14.0.5 with SMTP id 5mr41813265eea.13.1366377220082;
	Fri, 19 Apr 2013 06:13:40 -0700 (PDT)
Received: from ?IPv6:2001:610:612::15cb:73fc:27f0:4e75?
	([2001:610:612:0:15cb:73fc:27f0:4e75])
	by mx.google.com with ESMTPS id b47sm23002643eez.2.2013.04.19.06.13.38
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 06:13:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LbkfHKtEGnMDso0L5L0C62rO+ox__NHRu63HOt7Toh5wA@mail.gmail.com>
Date: Fri, 19 Apr 2013 15:13:41 +0200
Message-Id: <6B56E483-2965-46F1-A120-2F5F9807C594@dominion.thruhere.net>
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
	<5437CC85-9AC1-4A18-BAE8-BDE01613215D@dominion.thruhere.net>
	<CAJTo0LbkfHKtEGnMDso0L5L0C62rO+ox__NHRu63HOt7Toh5wA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnEp02LoR+6J+O0r2RWSC5FG8x3ns/vRUOaCgnUwvLkPj6TwjeJ54sszuWPtJ+Jf/LF7iam
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
X-List-Received-Date: Fri, 19 Apr 2013 13:31:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 apr. 2013, om 15:03 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 19 April 2013 13:49, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> Running the postinstalls at first boot appear to hang because (and
>>> that's just a feeling) gtk-icon-cache is run twice on target... =
which is
>>> time consuming.
>>=20
>> I know it's time consuming, but it finished on 60-90 minutes with =
1.3, I left it overnight and it still hadn't finished. I have the LEDS =
configured to short mmc0 and cpu0 activity and there' s no IO, only cpu =
from time to time. I don't think it takes more than 14 hours to run =
those postinsts.
>=20
> How about hacking the postinsts to use sh -x, so you can see what it's
> executing?

Going to do that in a minute. Todays build just finished (*$(@*$(@ =
webkit-gtk build times) and I added timeoutsec=3D600 to the .service =
file:

root@beaglebone:~# systemctl status run-postinsts -a
run-postinsts.service - Run pending postinsts
   Loaded: loaded (/lib/systemd/system/run-postinsts.service; disabled)
   Active: failed (Result: timeout) since Sat 2000-01-01 18:30:33 UTC; =
13 years 3 months ago
 Main PID: 122
   CGroup: name=3Dsystemd:/system/run-postinsts.service

Jan 01 18:20:33 beaglebone S98run-postinsts[122]: adduser: group gdm =
does not exist
Jan 01 18:20:33 beaglebone S98run-postinsts[122]: chown: unknown =
user/group gdm:gdm
Jan 01 18:30:33 beaglebone systemd[1]: run-postinsts.service operation =
timed out. Terminating.
Jan 01 18:30:33 beaglebone systemd[1]: Failed to start Run pending =
postinsts.
Jan 01 18:30:33 beaglebone systemd[1]: MESSAGE=3DUnit =
run-postinsts.service entered failed state.
root@beaglebone:~#=20

So it seems to just hang. Will report about the set -x thing shortly.

regards,

Koen=


