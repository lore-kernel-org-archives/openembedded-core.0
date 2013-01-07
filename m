Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Muhammad_Shakeel@mentor.com>) id 1Ts7PZ-0005Ov-UD
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 08:46:26 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Ts7At-0006BM-6O from Muhammad_Shakeel@mentor.com ;
	Sun, 06 Jan 2013 23:31:11 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 6 Jan 2013 23:31:10 -0800
Received: from EU-MBX-04.mgc.mentorg.com ([169.254.4.64]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.01.0289.001; Mon, 7 Jan 2013 07:31:09 +0000
From: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>
To: Otavio Salvador <otavio@ossystems.com.br>, "Larson, Chris"
	<Chris_Larson@mentor.com>
Thread-Topic: [OE-core] [PATCH 3/3] [RFC] archive-*-source.bbclass: Handle
	package class 'package_ipk'
Thread-Index: AQHN6N/NuWv3/7ZGeUWqYyY77s4KDJg2H5SAgAAlDgCAAAHtAIAB1hyAgAVi1cA=
Date: Mon, 7 Jan 2013 07:31:09 +0000
Message-ID: <A8A2F4C5E3D3D0468DDA3544476725F85BC87543@EU-MBX-04.mgc.mentorg.com>
References: <1357127607-20161-1-git-send-email-muhammad_shakeel@mentor.com>
	<CABcZANn3GUDdPK6XwVMHqEeJjiAhWRukEiiumXoifYF-PT--Sg@mail.gmail.com>
	<CAP9ODKoRytWOxAX3jn0nj12Jeah9mihobxd2PWaqApWA0ut9yQ@mail.gmail.com>
	<CABcZANkEoq6BpZ7YWPnD_QVpFym31DmWH+G6mBaFOnqqeO6SXg@mail.gmail.com>
	<CAP9ODKoiXA6jNavd=191nzZNGCHW2ygRfd-PnjoxoZt8bP7Ncw@mail.gmail.com>
In-Reply-To: <CAP9ODKoiXA6jNavd=191nzZNGCHW2ygRfd-PnjoxoZt8bP7Ncw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 07 Jan 2013 07:31:10.0722 (UTC)
	FILETIME=[F70EDE20:01CDECA8]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] [RFC] archive-*-source.bbclass: Handle package class 'package_ipk'
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
X-List-Received-Date: Mon, 07 Jan 2013 07:46:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Okay, I will fix it by using python function before sending the final patch=
. Thanks for your feedback.

--Shakeel

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Otavio Salvador
Sent: Friday, January 04, 2013 2:14 AM
To: Larson, Chris
Cc: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH 3/3] [RFC] archive-*-source.bbclass: Handle p=
ackage class 'package_ipk'

On Wed, Jan 2, 2013 at 3:11 PM, Christopher Larson <chris_larson@mentor.com=
> wrote:
>
>
> On Wed, Jan 2, 2013 at 10:04 AM, Otavio Salvador=20
> <otavio@ossystems.com.br>
> wrote:
>>
>> On Wed, Jan 2, 2013 at 12:51 PM, Christopher Larson=20
>> <chris_larson@mentor.com> wrote:
>> > On Wed, Jan 2, 2013 at 4:53 AM, Shakeel, Muhammad=20
>> > <muhammad_shakeel@mentor.com> wrote:
>> >>
>> >>  addtask do_archive_scripts_logs after do_package_write_rpm
>> >> +addtask do_archive_scripts_logs after do_package_write_ipk
>> >
>> >
>> > This will cause problems for anyone trying to do builds without=20
>> > package_ipk at all. I'd suggest using anonymous python to add the=20
>> > appropriate package dependencies based on what tasks actually=20
>> > exist.
>>
>> Uh? the only exception for it would be deb, right?
>
>
> Yes, and?

So the first patch changing from pre/post commands should be reworked and s=
olve it in the right way. I agree about the use of annonymous python method=
 for it.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


