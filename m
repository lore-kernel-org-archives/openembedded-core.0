Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qcher-0002Mn-CU
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 19:37:37 +0200
Received: by wyg30 with SMTP id 30so2651026wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 10:33:49 -0700 (PDT)
Received: by 10.227.201.142 with SMTP id fa14mr3193898wbb.48.1309541629397;
	Fri, 01 Jul 2011 10:33:49 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id e11sm292788wbh.2.2011.07.01.10.33.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 10:33:48 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E0E02FF.4040304@windriver.com>
Date: Fri, 1 Jul 2011 19:33:42 +0200
Message-Id: <38420CC7-A216-4D03-B512-0D85BA9393B9@dominion.thruhere.net>
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>	<201106301633.48933.paul.eggleton@linux.intel.com>	<4FC82E26-5A0C-48DF-99F5-7E2D9B8C7290@dominion.thruhere.net>	<201106301659.54941.paul.eggleton@linux.intel.com>	<1309537504.20015.531.camel@rex>	<1309540367.20015.534.camel@rex>
	<4E0E00FA.1060508@gmail.com> <4E0E02FF.4040304@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal errors
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
X-List-Received-Date: Fri, 01 Jul 2011 17:37:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jul 2011, om 19:25 heeft Mark Hatle het volgende geschreven:

> On 7/1/11 12:16 PM, Khem Raj wrote:
>> On 07/01/2011 10:12 AM, Richard Purdie wrote:
>>> gcc-4.6.0+svnr175150, non dev contains .so, gcc, =
/work/i586-poky-linux/gcc-4.6.0+svnr175150-r4/packages-split/gcc/usr/libex=
ec/gcc/i586-poky-linux/4.6.1/liblto_plugin.so
>>>>=20
>>=20
>> This should be packages with gcc itself. May be adding to FILES will =
get=20
>> rid of this warning
>=20
> The warning above indicates that it -is- being packaged in the 'gcc' =
package.
> The check verified that no files of the name .so exit and they are not =
symlinks:
>=20
>    if not name.endswith("-dev") and not name.endswith("-dbg") and
> path.endswith(".so") and os.path.islink(path):
>=20
> In this case, I believe that the file is likely supposed to be there.  =
Is there
> a way to selectively disable insane checks on a per-recipe basis when =
we know
> they are wrong?

We only have the big INSANE_SKIP_gcc =3D True hammer=


