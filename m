Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QDE67-00065w-8H
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 13:00:27 +0200
Received: by eye27 with SMTP id 27so147021eye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 03:58:02 -0700 (PDT)
Received: by 10.14.137.204 with SMTP id y52mr318364eei.228.1303469880974;
	Fri, 22 Apr 2011 03:58:00 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id k57sm203754eei.10.2011.04.22.03.57.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Apr 2011 03:57:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DB151C6.1040605@intel.com>
Date: Fri, 22 Apr 2011 12:57:53 +0200
Message-Id: <3C230BDD-2655-4DCA-96FF-AD36631A3E93@dominion.thruhere.net>
References: <cover.1303453279.git.sgw@linux.intel.com>
	<5ef17f7591a3e53a8e21bf529d117b906fe611bb.1303453279.git.sgw@linux.intel.com>
	<4DB151C6.1040605@intel.com>
To: Scott Garman <scott.a.garman@intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/33] cdrtools: upgrade to v3.00
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
X-List-Received-Date: Fri, 22 Apr 2011 11:00:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 apr 2011, om 12:00 heeft Scott Garman het volgende geschreven:

> On 04/22/2011 12:24 AM, Saul Wold wrote:
>> From: Scott Garman<scott.a.garman@intel.com>
>>=20
>> * Addresses CVE-2003-0655
>> * Fixes [YOCTO #976]
>>=20
>> Note that the license has changed to the CDDL for most utilities.
>>=20
>> Note the following discussion of distribution issues with mixing GPL
>> and CDDL licenses:
>>=20
>> http://lwn.net/Articles/195167/
>>=20
>> This should not impact us at this is a -native recipe only.
>>=20
>> Recipe changes derived from OpenEmbedded.
>>=20
>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>=20
> Please skip this patch - the CDDL is a weird license and may pose =
problems for us to distribute its sstate-cache.
>=20
> The problem reported in the CVE is in a particular utility within =
cdrtools that we don't need, so I'm going to resolve the security =
advisory by not packaging that file, and stick with the GPL version we =
were previously using.

In OE.dev we switched to cdrkit to get rid of the Schilly factor, maybe =
oe-core can do something similar.

regards,

Koen=


