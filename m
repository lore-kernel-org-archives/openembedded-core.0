Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 924AC6022F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 05:18:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x495IZwC005743
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 May 2019 22:18:35 -0700 (PDT)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 8 May 2019 22:18:34 -0700
To: OE-core <openembedded-core@lists.openembedded.org>,
	<andrej.valek@siemens.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <7165aa71-35c4-dad0-d5ec-ec5712d5bcf1@windriver.com>
Date: Thu, 9 May 2019 13:18:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.146]
Subject: "shutdown now" Hangs Since 1d453c9087f9 ("systemd: upgrade to 242")
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2019 05:18:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,


Since 1d453c9087f9 ("systemd: upgrade to 242"), "shutdown now" hangs like below where I enable systemd debug information print.

Any idea? Thanks.


[  OK  ] Stopped NFS status monitor for NFSv2/3 locking..
Sent message type=signal sender=n/a destination=n/a path=/org/freedesktop/systemd1/unit/nfs_2dstatd_2eservice interface=org.freedesktop.DBusa
Sent message type=signal sender=n/a destination=n/a path=/org/freedesktop/systemd1/unit/nfs_2dstatd_2eservice interface=org.freedesktop.DBusa
Sent message type=signal sender=n/a destination=n/a path=/org/freedesktop/systemd1 interface=org.freedesktop.systemd1.Manager member=JobRemoa
Sent message type=signal sender=n/a destination=n/a path=/org/freedesktop/systemd1/unit/nfs_2dstatd_2eservice interface=org.freedesktop.DBusa
Sent message type=signal sender=n/a destination=n/a path=/org/freedesktop/systemd1/unit/nfs_2dstatd_2eservice interface=org.freedesktop.DBusa
Child 410 (sh) died (code=killed, status=1/HUP)
session-c1.scope: Child 410 belongs to session-c1.scope.
Child 299 (avahi-daemon) died (code=killed, status=15/TERM)
system.slice: Child 299 belongs to system.slice.
session-c1.scope: cgroup is empty
session-c1.scope: Succeeded.
session-c1.scope changed stop-sigterm -> dead
session-c1.scope: Job 277 session-c1.scope/stop finished, result=done
[  OK  ] Stopped Session c1 of user root.
Sent message type=signal sender=n/a destination=n/a path=/org/freedesktop/systemd1/unit/session_2dc1_2escope interface=org.freedesktop.DBus.a
Sent message type=signal sender=n/a destination=n/a path=/org/freedesktop/systemd1/unit/session_2dc1_2escope interface=org.freedesktop.DBus.a
Sent message type=signal sender=n/a destination=n/a path=/org/freedesktop/systemd1 interface=org.freedesktop.systemd1.Manager member=JobRemoa
session-c1.scope: Collecting.
Sent message type=signal sender=n/a destination=n/a path=/org/freedesktop/systemd1/unit/session_2dc1_2escope interface=org.freedesktop.DBus.a
Sent message type=signal sender=n/a destination=n/a path=/org/freedesktop/systemd1/unit/session_2dc1_2escope interface=org.freedesktop.DBus.a
Sent message type=signal sender=n/a destination=n/a path=/org/freedesktop/systemd1 interface=org.freedesktop.systemd1.Manager member=UnitRema
systemd-journald.service: Received EPOLLHUP on stored fd 56 (stored), closing.
systemd-journald.service: Received EPOLLHUP on stored fd 58 (stored), closing.
systemd-journald.service: Received EPOLLHUP on stored fd 65 (stored), closing.
Got message type=signal sender=org.freedesktop.DBus destination=n/a path=/org/freedesktop/DBus interface=org.freedesktop.DBus member=NameOwna
avahi-daemon.service: D-Bus name org.freedesktop.Avahi no longer registered by :1.1
systemd-journald.service: Received EPOLLHUP on stored fd 55 (stored), closing.
syslog.socket: Incoming traffic
syslog.socket: Suppressing connection request since unit stop is scheduled.



Zhe

