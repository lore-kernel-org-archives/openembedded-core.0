Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Muhammad_Shakeel@mentor.com>) id 1TukY1-000768-CL
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 14:58:16 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1TukJA-0003c5-LW from Muhammad_Shakeel@mentor.com ;
	Mon, 14 Jan 2013 05:42:36 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 14 Jan 2013 05:42:36 -0800
Received: from EU-MBX-04.mgc.mentorg.com ([169.254.4.64]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.01.0289.001; Mon, 14 Jan 2013 13:42:34 +0000
From: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH 1/3] archive-*-source.bbclass: Use tasks
	instead of pre/post functions
Thread-Index: AQHN7bipqnQxtucxR0Cw3rl2dtkGI5g/mA0AgAlFs3A=
Date: Mon, 14 Jan 2013 13:42:33 +0000
Message-ID: <A8A2F4C5E3D3D0468DDA3544476725F85BC88B2A@EU-MBX-04.mgc.mentorg.com>
References: <1357660547-19803-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAP9ODKqce52z7FKg2frjMwUEkRzsWRGJ78HQwTatiXR09FugQQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqce52z7FKg2frjMwUEkRzsWRGJ78HQwTatiXR09FugQQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 14 Jan 2013 13:42:36.0075 (UTC)
	FILETIME=[030E1FB0:01CDF25D]
Cc: "Larson, Chris" <Chris_Larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] archive-*-source.bbclass: Use tasks instead of pre/post functions
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
X-List-Received-Date: Mon, 14 Jan 2013 13:58:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All right. I am resending this patch with two commits in total.

--Shakeel

-----Original Message-----
From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com] On Behal=
f Of Otavio Salvador
Sent: Tuesday, January 08, 2013 9:04 PM
To: Shakeel, Muhammad
Cc: Patches and discussions about the oe-core layer; Larson, Chris
Subject: Re: [OE-core] [PATCH 1/3] archive-*-source.bbclass: Use tasks inst=
ead of pre/post functions

On Tue, Jan 8, 2013 at 1:55 PM, Shakeel, Muhammad <muhammad_shakeel@mentor.=
com> wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> * Modified following archiver related classes to add separate tasks
>   for different archiver functions instead of adding these as pre/post
>   functions of existing tasks.
>     -archive-original-source.bbclass
>     -archive-patched-source.bbclass
>     -archive-configured-source.bbclass
>
> [YOCTO #3449]
>
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>

This can be dropped as it will be changed again in 3/3. Right?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


