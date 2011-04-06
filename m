Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q7X5J-0000pC-TN
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 20:04:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p36I1JYo000646
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Apr 2011 11:01:19 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.73]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.01.0255.000;
	Wed, 6 Apr 2011 11:01:19 -0700
From: "Hatle, Mark" <mark.hatle@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [poky] [OE-core] Proposed Multilib Implementation Brainstorming
Thread-Index: AQHL89fR9iSKERjfLEG0K3fk5c3eRJRQa0rqgADIVACAAEN9gA==
Date: Wed, 6 Apr 2011 18:01:18 +0000
Message-ID: <A69B9A48-C42D-48B5-B09F-46AA5281C048@windriver.com>
References: <1302001365.24596.459.camel@rex>
	<87y63n5028.fsf@eha.doredevelopment.dk> <1302091554.22904.18.camel@rex>
In-Reply-To: <1302091554.22904.18.camel@rex>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, poky <poky@yoctoproject.org>
Subject: Re: [poky] Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Wed, 06 Apr 2011 18:04:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AB1FA4F4272E0A4D8959D0EB8E9DCF20@corp.ad.wrs.com>
Content-Transfer-Encoding: quoted-printable





On Apr 6, 2011, at 5:06 AM, "Richard Purdie" <richard.purdie@linuxfoundatio=
n.org> wrote:

> On Wed, 2011-04-06 at 09:08 +0200, Esben Haabendal wrote:
>> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>>=20
>>> One of the items on our post 1.0 schedule is multilib and we need a pla=
n
>>> of implementation. I've been thinking about this for a while and at
>>> least have some ideas how some of the issues can be handled.
>>> ....
>>> Does this make sense to everyone, are there any questions/ objections/
>>> concerns/ things I've missed?
>>=20
>> Which actual OE use-cases justify this kind of addition to OE?
>=20
> Several people wanting to use OECore have a requirement of multilib
> support. The typical embedded use case is where you have one main
> application which you might want to run in some kind of large memory
> mode or with some special optimisation (think a database engine) whilst
> the rest of the system is "standard". This requires the ability to mix
> different libraries.

This is a very popular use-case in carrier grade systems.  Back haul voice,=
 data, etc applications that require large routing databases or billing dat=
abases.  The other use I've seen for multilibs is some very specialized DVR=
 systems where large amount of video need to stay in memory for quick retri=
eval.

>> I know it is on the Yocto post 1.0 schedule, but is it actually a good
>> thing for OE?  Maintaining OE recipes is clearly not going to get any
>> easier with multilibs support.
>=20
> As detailed in the proposal you will see that the complexity added is
> minimal. It requires a simple enhancement to BBCLASSEXTEND which is
> likely desirable for other reasons too and that is the only real bitbake
> change required. For the metadata, individual recipes remain unaffected
> and also the core conf files are unchanged too. The toolchain dependency
> changes will be the only change affecting users at the recipe level and
> most of the class/machine configuration will be opt in by anyone using
> multilib. The only other invasive change is the package manager
> integration. For rpm, it has good support for multilib already and we're
> just enabling that. For opkg, we still need to determine the best
> approach but the simplistic approach I mentioned will probably suffice
> and anyone wanting true support at the package manager level can use
> rpm.
>=20
> For day to day recipe maintenance I don't see much direct impact.
>=20

What I've seen in the past is the ability to build multilibs has improved t=
he quality of the software integration by finding poorly constructed header=
s, hard coded library paths, etc... All things we should fix.

> Cheers,
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky


