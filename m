Received: from mail2.multitech.com (mail2.multitech.com [65.126.90.11])
 by mx.groups.io with SMTP id smtpd.web10.8828.1593492336805947937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 21:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: multitech.com, ip: 65.126.90.11, mailfrom: prvs=14431d34bc=john.klug@multitech.com)
Received: from mail2.multitech.com (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id D62AF584CCC_EFAC36FB;
	Tue, 30 Jun 2020 04:45:35 +0000 (GMT)
Received: from EXCHDBPM2.dc.multitech.prv (unknown [192.168.11.7])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(Client CN "", Issuer "MultiTech Systems Intermediate CA 01" (verified OK))
	by mail2.multitech.com (Sophos Email Appliance) with ESMTPS id 1AD1D583499_EFAC36DF;
	Tue, 30 Jun 2020 04:45:33 +0000 (GMT)
Received: from EXCHDBPM1.dc.multitech.prv (192.168.11.6) by
 EXCHDBPM2.dc.multitech.prv (192.168.11.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 29 Jun 2020 23:45:32 -0500
Received: from EXCHDBPM1.dc.multitech.prv ([192.168.11.6]) by
 EXCHDBPM1.dc.multitech.prv ([192.168.11.6]) with mapi id 15.01.1847.009; Mon,
 29 Jun 2020 23:45:32 -0500
From: "John Klug" <john.klug@multitech.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] git do_unpack
Thread-Topic: [OE-core] git do_unpack
Thread-Index: AQHWTXFgQdNOqBKAikyDTZHWQuTCS6juvhkAgAHRjWM=
Date: Tue, 30 Jun 2020 04:45:32 +0000
Message-ID: <f0fc34bfb15642bdab4a1def06639238@multitech.com>
References: <e5Dw.1593365236614554114.mV8j@lists.openembedded.org>,<CANNYZj8ondQew3MqtyLr1k-EyBLG52KfT_wu3mRabZRpjecQEg@mail.gmail.com>
In-Reply-To: <CANNYZj8ondQew3MqtyLr1k-EyBLG52KfT_wu3mRabZRpjecQEg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.20.93]
MIME-Version: 1.0
X-SASI-RCODE: 200
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


a:

(fetch was already run successfully while connected with a VPN).

VPN then shut down.

  $  bitbake -c unpack dhq-client

     ...
  NOTE: Executing RunQueue Tasks
  ERROR: dhq-client-0.32-r11 do_unpack: Fetcher failure: Fetch command expo=
rt  DBUS_SESSION_BUS_ADDRESS=3D"unix:abstract=3D/tmp/dbus-CbyhEfsmW1"; expo=
rt SSH_AGENT_PID=3D"2444"; export SSH_AUTH_SOCK=3D"/tmp/ssh-gHgQLFqq7E5R/ag=
ent.2443"; export PATH=3D"/home/klugja/mlinux-up-14/build/tmp/sysroots/x86_=
64-linux/usr/bin/python-native:/home/klugja/mlinux-up-14/layers/openembedde=
d-core/scripts:/home/klugja/mlinux-up-14/build/tmp/sysroots/x86_64-linux/us=
r/bin/arm-mlinux-linux-gnueabi:/home/klugja/mlinux-up-14/build/tmp/sysroots=
/mt100eocg/usr/bin/crossscripts:/home/klugja/mlinux-up-14/build/tmp/sysroot=
s/x86_64-linux/usr/sbin:/home/klugja/mlinux-up-14/build/tmp/sysroots/x86_64=
-linux/usr/bin:/home/klugja/mlinux-up-14/build/tmp/sysroots/x86_64-linux/sb=
in:/home/klugja/mlinux-up-14/build/tmp/sysroots/x86_64-linux/bin:/home/klug=
ja/mlinux-up-14/scripts:/home/klugja/mlinux-up-14/bitbake/bin:/home/klugja/=
bin:/home/klugja/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbi=
n:/bin:/usr/games:/usr/local/games:/snap/bin"; export HOME=3D"/home/klugja"=
; git -c core.fsyncobjectfiles=3D0 ls-remote ssh://git@gitlab.multitech.net=
/devicehq/mAPI-dhq-client.git  failed with exit code 128, output:
  ssh: connect to host gitlab.multitech.net port 22: Connection timed out
  fatal: Could not read from remote repository.

  Please make sure you have the correct access rights
  and the repository exists.

  ERROR: dhq-client-0.32-r11 do_unpack: Function failed: base_do_unpack
  ERROR: Logfile of failure stored in: /home/klugja/mlinux-up-14/build/tmp/=
work/mt100eocg-mlinux-linux-gnueabi/dhq-client/0.32-r11/temp/log.do_unpack.=
10175
  ERROR: Task (/home/klugja/mlinux-up-14/build/../layers/meta-mlinux/recipe=
s-core/dhq-client/dhq-client_0.32.bb:do_unpack) failed with exit code '1'
  NOTE: Tasks Summary: Attempted 2 tasks of which 1 didn't need to be rerun=
 and 1 failed.

  Summary: 1 task failed:
    /home/klugja/mlinux-up-14/build/../layers/meta-mlinux/recipes-core/dhq-=
client/dhq-client_0.32.bb:do_unpack
  Summary: There was 1 WARNING message shown.
  Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.


Line 3 of the do_unpack.log:

  DEBUG: Fetcher accessed the network with the command git -c core.fsyncobj=
ectfiles=3D0 ls-remote ssh://git@gitlab.multitech.net/devicehq/mAPI-dhq-cli=
ent.git

Testing the download of the git (download is verifiable):
  klugja@peru:~/mlinux-up-14/build/downloads/git2/gitlab.multitech.net.devi=
cehq.mAPI-dhq-client.git$ git fsck
  Checking object directories: 100% (256/256), done.
  Checking objects: 100% (485/485), done.
  klugja@peru:~/mlinux-up-14/build/downloads/git2/gitlab.multitech.net.devi=
cehq.mAPI-dhq-client.git$



b.  Too busy writing my own git commands in my own do_unpack to fix this.  =
Maybe someday.
