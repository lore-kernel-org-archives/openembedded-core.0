Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RktV7-0001iL-9y
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 09:25:43 +0100
Received: from WX-EXCHMB2.insigma.com.cn (10.0.1.203) by
	WX-Edge.insigma.com.cn (10.0.1.205) with Microsoft SMTP Server (TLS) id
	8.1.436.0; Wed, 11 Jan 2012 16:18:02 +0800
Received: from [192.168.0.98] (122.224.76.38) by Wx-ExchMB2.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.436.0; Wed, 11 Jan 2012
	16:17:57 +0800
Message-ID: <1326269782.12463.4.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jan 2012 16:16:22 +0800
In-Reply-To: <1326269523.12463.3.camel@localhost.localdomain>
References: <1326269523.12463.3.camel@localhost.localdomain>
Organization: Insigma
X-Mailer: Evolution 3.2.3 
MIME-Version: 1.0
Subject: Re: does busybox 1.19 still support the arg `-m'?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 11 Jan 2012 08:25:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

and in syslog-startup.conf, the comments `incompatible with busybox'
should be deleted.

#ROTATESIZE=3D0			# rotate log if grown beyond X [kByte] (incompatible
with busybox)
#ROTATEGENS=3D3			# keep X generations of rotated logs (incompatible with
busybox)

On Wed, 2012-01-11 at 16:12 +0800, =E5=80=AA=E5=BA=86=E4=BA=AE wrote:
> in file meta/recipes-core/busybox/files/syslog
> I found code section:
>         if [ -n "$MARKINT" ]; then
>                 SYSLOG_ARGS=3D"$SYSLOG_ARGS -m $MARKINT"
>         fi
> but I can't find `-m' in the help of syslogd.
>=20
>=20
> syslogd --help
> BusyBox v1.19.3 (2012-01-11 12:34:06 CST) multi-call binary.
>=20
> Usage: syslogd [OPTIONS]
>=20
> System logging utility
>=20
>         -n              Run in foreground
>         -O FILE         Log to FILE (default:/var/log/messages)
>         -l N            Log only messages more urgent than prio N (1-8)
>         -S              Smaller output
>         -s SIZE         Max size (KB) before rotation (default:200KB,
> 0=3Doff)
>         -b N            N rotated logs to keep (default:1, max=3D99,
> 0=3Dpurge)
>         -R HOST[:PORT]  Log to IP or hostname on PORT (default
> PORT=3D514/UDP)
>         -L              Log locally and via network (default is network
> only if)
>         -C[size_kb]     Log to shared mem buffer (use logread to read
> it)
>         -f FILE         Use FILE as config (default:/etc/syslog.conf)
>=20
> --
> Yi Qingliang
> niqingliang@insigma.com.cn
> https://niqingliang2003.wordpress.com
>=20

--=20
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



