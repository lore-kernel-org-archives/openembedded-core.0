Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1Rv6VB-0004e6-MS
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 13:19:57 +0100
Received: by obhx4 with SMTP id x4so740992obh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 04:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=VG3w3RSRmsF87ySV4EZrvthuN9gie20YVwLw1//KR8M=;
	b=uYKgNALZW5at0IBkoXQ1SALKY4ooQXStyCm2YMlwc3FGoAjTq7YJd1+OttHML1LYTv
	Ttq3ViJHMBvxKVw9ADP2ew1zYw1DYBBdtLxc6GiBCrsHurgaubWZmHDP/1HIQ1SlpnMb
	mcc629GXXa7Tkm2/mX0GHreU/TJhFmaGoorIE=
MIME-Version: 1.0
Received: by 10.182.49.104 with SMTP id t8mr671083obn.13.1328703113789; Wed,
	08 Feb 2012 04:11:53 -0800 (PST)
Received: by 10.60.39.39 with HTTP; Wed, 8 Feb 2012 04:11:53 -0800 (PST)
Date: Wed, 8 Feb 2012 15:11:53 +0300
Message-ID: <CAFZPMoZ=F_Adon-nQpRELPL2F3WBJi1Pt3T9sK3t1L-k--R0Cw@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: systemd.bbclass problems
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
X-List-Received-Date: Wed, 08 Feb 2012 12:19:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all!
For some reason the following doesn't work:

inherit systemd

...

SYSTEMD_PACKAGES = "pongo"
SYSTEMD_SERVICE_${PN} = "client1.service client2.service sms.service \
                registry.service alarm.service \
                geos-dbus.service gpsd-dbus-client.service"

While it produces proper /var/lib/opkg/info/pongo.postinst
which when executes on device produces what it should do.

otherwise service files remain disabled.

If I fail postinst start during image build, everything works properly.

Any ideas?

S.


