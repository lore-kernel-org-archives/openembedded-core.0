Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URhtv-0001yB-2N
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:48:56 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so2158548eei.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 04:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=b8ojdlIKPdqkHy8sVpK6N7E2x7BWvhsu7Knrb9HSy24=;
	b=CZZ8hDSPIuAHchxFhHtmUqxzaf1EAFjDDTDGlVWjb4tRYXrLKDYooNb/eZD6kJOwKq
	63lfpDWwKsg35cSbCiwnQPHvRxZkw4HCp1sjJopq03HpRKC6Kd4bMq0A6QON676H6AJS
	8dzYgrU2bbEOM+9ketuGgNYr9SJwXs7+AlxKKa9t/K63jE0qf9+MB+Sv3KUhvij0GlPm
	r01DwzxFzSH/vcT5vUacUmYiy7mrTTecAcWqHbgNtydlMvUjWY6dLE3+TGwEvblzruo7
	7YGzfWeQg7ahR//PRtkUOSPgAY41aRJyCDirh/WTop6601qI05JO4rzt3Iqy+8ztyyGy
	UrMQ==
X-Received: by 10.15.35.193 with SMTP id g41mr61394710eev.45.1366025478493;
	Mon, 15 Apr 2013 04:31:18 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id i53sm26398979eeu.5.2013.04.15.04.31.17
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 04:31:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LbfDu6bOAPYjd3ohzZJcvPDmYiT4RcUhZC9JXkQB6dmOw@mail.gmail.com>
Date: Mon, 15 Apr 2013 13:31:18 +0200
Message-Id: <CCA3D6B4-A857-47C4-AC09-CD642F627078@dominion.thruhere.net>
References: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
	<9D7AC92D-FF69-4A31-B99C-D2008675A27B@dominion.thruhere.net>
	<CAJTo0Laqc93oxZcHZ+vF99q_UqJ_8TUV4QAxPy6VfBLDBUxOYg@mail.gmail.com>
	<CAJTo0LbfDu6bOAPYjd3ohzZJcvPDmYiT4RcUhZC9JXkQB6dmOw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmiEslvAFPhcNEwPf1ceAT4Fk9jj1inMV2wuel8ulb+iAj1vNoh4fVUOEE9VxV3tVqB/je/
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-dylan][PATCH] systemd: fix bootup with 'ro' by re-adding util-linux-mount to RDEPENDS
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
X-List-Received-Date: Mon, 15 Apr 2013 11:48:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 12:42 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> Hi Koen,
>=20
> On 15 April 2013 11:16, Burton, Ross <ross.burton@intel.com> wrote:
>> On 15 April 2013 11:09, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>> Does busybox produce any useful errors as to why it's not working?
>>>=20
>>> No, it pretends everything is OK and the remount succeeded.
>>=20
>> Thanks busybox!
>=20
> There's several fixes upstream that we don't have in our busybox, it
> would be much appreciated if you could try this patch which rolls them
> all up.
>=20
> =
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dross/mo=
unt&id=3D1fc11cc25938b6a0c1e9b69a30326de8608cb98f

With that patch included and util-linux-mount removed:

[    3.027961] systemd-random-seed[107]: Failed to write new random seed =
file: Bad file descriptor
[    3.189475] systemd-tmpfiles[108]: rm_rf(/var/run/udisks): Read-only =
file system
[    3.262564] systemd-tmpfiles[108]: rm_rf(/var/run/pm-utils): =
Read-only file system
[    3.310582] systemd-tmpfiles[108]: rm_rf(/var/run/dbus): Read-only =
file system
[    3.331494] systemd-tmpfiles[108]: rm_rf(/var/run/utmp): Read-only =
file system
[    3.357310] systemd-tmpfiles[108]: rm_rf(/var/run/avahi-daemon): =
Read-only file system
[    3.383427] systemd-tmpfiles[108]: rm_rf(/var/run/syslogd.pid): =
Read-only file system
[    3.410699] systemd-tmpfiles[108]: rm_rf(/var/run/gdm): Read-only =
file system
[    3.435955] systemd-tmpfiles[108]: rm_rf(/var/run/connman): Read-only =
file system
[    3.462494] systemd-tmpfiles[108]: rm_rf(/var/run/ConsoleKit): =
Read-only file system
[    3.492882] systemd-tmpfiles[108]: Failed to create file =
/var/log/wtmp: Read-only file system
[    3.522076] systemd-tmpfiles[108]: Failed to create file =
/var/log/btmp: Read-only file system
[    3.554021] systemd-tmpfiles[108]: chmod(/var/tmp) failed: Read-only =
file system
[    4.676901] systemd-update-utmp[162]: Failed to write utmp record: =
Read-only file system

So busybox mount is still worthless=


