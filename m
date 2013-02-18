Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Muhammad_Shakeel@mentor.com>) id 1U7SMo-0002lO-Ac
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 16:10:54 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1U7S7A-00064a-4P from Muhammad_Shakeel@mentor.com ;
	Mon, 18 Feb 2013 06:54:44 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 18 Feb 2013 06:54:43 -0800
Received: from EU-MBX-04.mgc.mentorg.com ([169.254.4.64]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.01.0289.001; Mon, 18 Feb 2013 14:54:42 +0000
From: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/2 v3] archiver class: Use tasks instead of
	pre/post funcs with sstate
Thread-Index: AQHN+Jmb3narJOEegU2Pjr/YKPs+S5hVfJwAgCpej4o=
Date: Mon, 18 Feb 2013 14:54:41 +0000
Message-ID: <A8A2F4C5E3D3D0468DDA3544476725F85BC8DE1B@EU-MBX-04.mgc.mentorg.com>
References: <1358856653-17049-1-git-send-email-muhammad_shakeel@mentor.com>,
	<1358869272.6356.2.camel@ted>
In-Reply-To: <1358869272.6356.2.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
X-OriginalArrivalTime: 18 Feb 2013 14:54:43.0877 (UTC)
	FILETIME=[E3158D50:01CE0DE7]
Cc: "Larson, Chris" <Chris_Larson@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2 v3] archiver class: Use tasks instead of pre/post funcs with sstate
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 15:10:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,=0A=
=0A=
I did try deptask but =0A=
d.appendVarFlag('do_patch', 'deptask', ' do_archive_original_sources_patche=
s')=0A=
=0A=
doesn't make do_patch dependent on do_archive_original_sources_patches. Do =
you think it is a bug and needs to be fixed?=0A=
=0A=
Use of 'deps' or 'recrdeps' adds the above dependency. I believe 'recrdeps'=
 can introduce cyclic dependency so I didn't use it.=0A=
What is your suggestion on this?=0A=
=0A=
Regards,=0A=
Shakeel=0A=
________________________________________=0A=
From: Richard Purdie [richard.purdie@linuxfoundation.org]=0A=
Sent: Tuesday, January 22, 2013 8:41 PM=0A=
To: Shakeel, Muhammad=0A=
Cc: openembedded-core@lists.openembedded.org; Larson, Chris=0A=
Subject: Re: [OE-core] [PATCH 1/2 v3] archiver class: Use tasks instead of =
pre/post funcs with sstate=0A=
=0A=
Did you try using deptask instead of deps as I suggested in the previous=0A=
feedback?=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=
=0A=
=0A=
=0A=


