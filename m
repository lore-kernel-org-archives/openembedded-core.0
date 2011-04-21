Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCtGL-0000MY-9r
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 14:45:37 +0200
Received: by wye20 with SMTP id 20so1586314wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 05:43:13 -0700 (PDT)
Received: by 10.227.171.207 with SMTP id i15mr8883634wbz.121.1303389793685;
	Thu, 21 Apr 2011 05:43:13 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	ed10sm1166316wbb.49.2011.04.21.05.43.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 05:43:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20110421123115.GB6678@jama.jama.net>
Date: Thu, 21 Apr 2011 14:43:12 +0200
Message-Id: <973393A9-5CAC-4332-9317-D8CFF5AA1C10@dominion.thruhere.net>
References: <1303388485-25698-1-git-send-email-koen@dominion.thruhere.net>
	<20110421123115.GB6678@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] librsvg 2.32.1: fix postinst script
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
X-List-Received-Date: Thu, 21 Apr 2011 12:45:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 apr 2011, om 14:31 heeft Martin Jansa het volgende geschreven:

> On Thu, Apr 21, 2011 at 02:21:25PM +0200, Koen Kooi wrote:
>> The symptom:
>>=20
>> root@pandaboard-core:~# sh /var/lib/opkg/info/librsvg-2-gtk.postinst
>> g_module_open() failed for /home/root/--update-cache: =
/home/root/--update-cache.so: cannot open shared object file: No such =
file or directory
>> root@pandaboard-core:~#
>>=20
>> the gdk-pixbuf-query-loaders app doesn't support arguments, only .so =
names, so remove --update-cache
>=20
> I can confirm same symptom here
>=20
> shouldn't we store output from it as we did in oe.dev to
> /etc/gtk-2.0/gdk-pixbuf.loaders ?

I think we do :) Let's see if other requests come in before I respin it.

regards,

Koen=


