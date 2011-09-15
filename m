Received: from 18.mo5.mail-out.ovh.net ([178.33.45.10]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R4DWL-0008TM-IS
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 17:06:33 +0200
Received: from mail183.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 745B4FFC226
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 09:58:00 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 15 Sep 2011 09:57:35 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 15 Sep 2011 09:57:35 +0200
Message-ID: <4E71AFEE.6000502@eukrea.com>
Date: Thu, 15 Sep 2011 09:57:34 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
References: <20110911172241.GA3674@chargestorm.se>
	<1315762415-18070-1-git-send-email-eric@eukrea.com>
	<201109121134.42474.paul.eggleton@linux.intel.com>
	<FF2EB738-77F7-4BC5-BB83-82ED8CBC0F96@dominion.thruhere.net>
	<4E70A76E.1030101@eukrea.com>
	<CAP9ODKqgNTF3Uz_kfTfE_=pFrovt-tpmGRGsKBGcXDFy3k-52w@mail.gmail.com>
In-Reply-To: <CAP9ODKqgNTF3Uz_kfTfE_=pFrovt-tpmGRGsKBGcXDFy3k-52w@mail.gmail.com>
X-Ovh-Tracer-Id: 12677351478203755970
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -200
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrvddtucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmneculddquddttddm
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Thu, 15 Sep 2011 15:06:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Otavio,

Le 14/09/2011 17:34, Otavio Salvador a =E9crit :
> On Wed, Sep 14, 2011 at 10:09, Eric B=E9nard<eric@eukrea.com>  wrote:
>> I sent patches to update meta-oe, meta-angstrom&  meta-intel : did you
>> get them ?
>
> The md5sum of the tarball doesn't match. GNUtoo is aware of the issue.
>
> Please hold the patch merging until a new patchset is send with the fix=
es
> md5sum hashes.
>
OK we have checked that and it seems they updated the archive on the 12 o=
f
september without any change in the changelog which explains the md5sum d=
iff !

The diff between old and new qt 4.7.4 leads to a 154MB diff which seems t=
o=20
concern the documentation and src/corelib/global/qglobal.h wich says :
-#define QT_PACKAGEDATE_STR "2011-08-23"
+#define QT_PACKAGEDATE_STR "2011-09-12"

Best regards,
Eric


