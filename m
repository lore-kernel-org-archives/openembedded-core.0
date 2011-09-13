Received: from 20.mo3.mail-out.ovh.net ([178.33.47.94]
	helo=mo3.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R3TcK-0006yN-BG
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 16:05:41 +0200
Received: from mail176.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 316ED1000B15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 07:45:51 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Sep 2011 07:44:32 +0200
Received: from unknown (HELO ?192.168.100.34?)
	(ebenard%eukrea.com@80.72.59.187)
	by ns0.ovh.net with SMTP; 13 Sep 2011 07:44:30 +0200
Message-ID: <4E6EEDBE.70801@eukrea.com>
Date: Tue, 13 Sep 2011 07:44:30 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Ovh-Mailout: 178.32.228.3 (mo3.mail-out.ovh.net)
References: <1315646701-28916-1-git-send-email-eric@eukrea.com>
	<CAP9ODKoUZfRLHDv7p=wJAczZ_nh-7LeETabwzM8X_Hp_EyqN7g@mail.gmail.com>
	<4E6B3502.6020702@eukrea.com>
	<CAP9ODKoAZqdGAFJnyjdLKVCFUd5+wjndcWBPnH=DCrF7S19HRg@mail.gmail.com>
	<CAP9ODKr8_p-3KfSQjy8DBbeGPDS+JHts9enX-eksW_YOOcFFyw@mail.gmail.com>
In-Reply-To: <CAP9ODKr8_p-3KfSQjy8DBbeGPDS+JHts9enX-eksW_YOOcFFyw@mail.gmail.com>
X-Ovh-Tracer-Id: 17131130033867763133
X-Ovh-Remote: 80.72.59.187 ()
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -180
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfedvkedrtdduucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlvddtmdenucdlqddutddtmd
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: fix generated sdk
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
X-List-Received-Date: Tue, 13 Sep 2011 14:05:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Paul,

did you have time to test this patch ?
http://patches.openembedded.org/patch/11281/

Le 10/09/2011 12:31, Otavio Salvador a =E9crit :
> On Sat, Sep 10, 2011 at 07:03, Otavio Salvador<otavio@ossystems.com.br>=
  wrote:
>> But as qmake is generated for the sdk it has the proper patches and
>> thus qmake -query will report the right paths AFAIK making qt.conf a
>> duplication of this information. Am I missing something?
>
> Just to let the mailing list posted ...
>
> As we discussed on #oe I will be working at porting the O.S. Systems
> qt.conf generation since this is required for CMake to properly work
> with Qt applications.
>
one more detail : this patch is fine when not using cmake so can be integ=
rated
as is as it fix meta-toolchain-qte (the right path are set by both this p=
atch=20
and the environment-setup script on the toolchain.

One more question : is there interest in a patch that move "qtopia" paths=
 to=20
more standard "qt4" paths ?

Thanks,
Eric


