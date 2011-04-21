Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCui6-0002ZW-S6
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 16:18:22 +0200
Received: by wwb17 with SMTP id 17so1809140wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 07:15:58 -0700 (PDT)
Received: by 10.216.237.67 with SMTP id x45mr1905588weq.72.1303394572170;
	Thu, 21 Apr 2011 07:02:52 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id r80sm980902wei.15.2011.04.21.07.02.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 07:02:51 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 21 Apr 2011 16:02:49 +0200
Message-Id: <8313867A-EA5C-473D-A82B-D8338186BF5F@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: [RFC] Working toward a GNOME layer
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
X-List-Received-Date: Thu, 21 Apr 2011 14:18:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

Now that I finally have an image that boots into an E17 gui I can focus =
on making an image that boots into a GNOME desktop. The gnome bits are =
current scattered over different layers:

oe-core
meta-demoapps
meta-oe
meta-shr

and possibly more. I would like to create a meta-gnome layer in the =
meta-openembedded repository where new recipes get added and things from =
meta-demoapps can get moved over into. Long term recipes-gnome in =
oe-core should move there as well.

What are your thoughts on this?

regards,

Koen=


