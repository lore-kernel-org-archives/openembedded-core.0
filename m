Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web11.11067.1593505413496149133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 01:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 49wy6n4XZKz5tl9;
	Tue, 30 Jun 2020 10:23:28 +0200 (CEST)
Date: Tue, 30 Jun 2020 10:23:27 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: John Klug <john.klug@multitech.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] git do_unpack
Message-ID: <20200630082327.r4s7e2nwkbucslyd@qschulz>
References: <e5Dw.1593365236614554114.mV8j@lists.openembedded.org>
 <CANNYZj8ondQew3MqtyLr1k-EyBLG52KfT_wu3mRabZRpjecQEg@mail.gmail.com>
 <f0fc34bfb15642bdab4a1def06639238@multitech.com>
MIME-Version: 1.0
In-Reply-To: <f0fc34bfb15642bdab4a1def06639238@multitech.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

On Tue, Jun 30, 2020 at 04:45:32AM +0000, John Klug wrote:
>=20
> a:
>=20
> (fetch was already run successfully while connected with a VPN).
>=20
> VPN then shut down.
>=20
>   $  bitbake -c unpack dhq-client
>=20
>      ...
>   NOTE: Executing RunQueue Tasks
>   ERROR: dhq-client-0.32-r11 do_unpack: Fetcher failure: Fetch command ex=
port  DBUS_SESSION_BUS_ADDRESS=3D"unix:abstract=3D/tmp/dbus-CbyhEfsmW1"; ex=
port SSH_AGENT_PID=3D"2444"; export SSH_AUTH_SOCK=3D"/tmp/ssh-gHgQLFqq7E5R/=
agent.2443"; export PATH=3D"/home/klugja/mlinux-up-14/build/tmp/sysroots/x8=
6_64-linux/usr/bin/python-native:/home/klugja/mlinux-up-14/layers/openembed=
ded-core/scripts:/home/klugja/mlinux-up-14/build/tmp/sysroots/x86_64-linux/=
usr/bin/arm-mlinux-linux-gnueabi:/home/klugja/mlinux-up-14/build/tmp/sysroo=
ts/mt100eocg/usr/bin/crossscripts:/home/klugja/mlinux-up-14/build/tmp/sysro=
ots/x86_64-linux/usr/sbin:/home/klugja/mlinux-up-14/build/tmp/sysroots/x86_=
64-linux/usr/bin:/home/klugja/mlinux-up-14/build/tmp/sysroots/x86_64-linux/=
sbin:/home/klugja/mlinux-up-14/build/tmp/sysroots/x86_64-linux/bin:/home/kl=
ugja/mlinux-up-14/scripts:/home/klugja/mlinux-up-14/bitbake/bin:/home/klugj=
a/bin:/home/klugja/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/s=
bin:/bin:/usr/games:/usr/local/games:/snap/bin"; export HOME=3D"/home/klugj=
a"; git -c core.fsyncobjectfiles=3D0 ls-remote ssh://git@gitlab.multitech.n=
et/devicehq/mAPI-dhq-client.git  failed with exit code 128, output:
>   ssh: connect to host gitlab.multitech.net port 22: Connection timed out
>   fatal: Could not read from remote repository.
>=20
>   Please make sure you have the correct access rights
>   and the repository exists.
>=20
>   ERROR: dhq-client-0.32-r11 do_unpack: Function failed: base_do_unpack
>   ERROR: Logfile of failure stored in: /home/klugja/mlinux-up-14/build/tm=
p/work/mt100eocg-mlinux-linux-gnueabi/dhq-client/0.32-r11/temp/log.do_unpac=
k.10175
>   ERROR: Task (/home/klugja/mlinux-up-14/build/../layers/meta-mlinux/reci=
pes-core/dhq-client/dhq-client_0.32.bb:do_unpack) failed with exit code '1'
>   NOTE: Tasks Summary: Attempted 2 tasks of which 1 didn't need to be rer=
un and 1 failed.
>=20
>   Summary: 1 task failed:
>     /home/klugja/mlinux-up-14/build/../layers/meta-mlinux/recipes-core/dh=
q-client/dhq-client_0.32.bb:do_unpack
>   Summary: There was 1 WARNING message shown.
>   Summary: There were 2 ERROR messages shown, returning a non-zero exit c=
ode.
>=20
>=20
> Line 3 of the do_unpack.log:
>=20
>   DEBUG: Fetcher accessed the network with the command git -c core.fsynco=
bjectfiles=3D0 ls-remote ssh://git@gitlab.multitech.net/devicehq/mAPI-dhq-c=
lient.git
>=20

Any chance you're using a tag in your SRC_URI?

https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#git-=
fetcher

or AUTOREV? Which I guess needs network access to know if there's
something to pull or not.

Quentin
