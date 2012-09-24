Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TGG8X-0001Eu-Tl
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 23:24:18 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8OLBSA4012299
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 14:11:28 -0700 (PDT)
Received: from msp-dhcp5.wrs.com (172.25.34.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Mon, 24 Sep 2012 14:11:27 -0700
Message-ID: <5060CC7F.6080700@windriver.com>
Date: Mon, 24 Sep 2012 16:11:27 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1348513241-18271-1-git-send-email-kergoth@gmail.com>
	<CAMKF1sqsvYcwKTG1wzAGKnWrRZ6K5yh0=D9ncGOAtOHSJ-i1cQ@mail.gmail.com>
	<CABcZAN=XVRRjH+57g+E24qr6vQ9Mf7Z9A7YHMcKgrFGkH6RbyA@mail.gmail.com>
In-Reply-To: <CABcZAN=XVRRjH+57g+E24qr6vQ9Mf7Z9A7YHMcKgrFGkH6RbyA@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q8OLBSA4012299
Subject: Re: [PATCH] Add and use 'localedir' variable
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
X-List-Received-Date: Mon, 24 Sep 2012 21:24:18 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 9/24/12 4:04 PM, Chris Larson wrote:
> On Mon, Sep 24, 2012 at 2:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Sep 24, 2012 at 12:00 PM, Christopher Larson <kergoth@gmail.co=
m> wrote:
>>> From: Christopher Larson <chris_larson@mentor.com>
>>>
>>> This avoids the hardcoding of ${libdir}/locale which is all over the =
place,
>>> and will facilitate use of ${exec_prefix}/lib/locale instead of
>>> ${libdir}/locale.
>>
>> what is adavantage of letting use ${exec_prefix}/lib/locale ? Do you h=
ave a case
>> where you share locale between multilibs ?
>
> This is the case by default for all eglibc builds that set libdir to
> the default. See https://gist.github.com/3756705 =E2=80=94 there's anot=
her
> block just like that for all the other 64 bit archs for eglibc. When
> we pass =E2=80=94libdir=3D/usr/lib64, it skips this logic.
>
> So changing it would just bring us inline with the default eglibc
> behavior. The binary locale files are, as far as I'm aware, a
> relatively arch independent binary format. There's no point or benefit
> to having lib32 vs lib64 copies, they'd just be duplicated content.

They are endian and locale word size dependent.  (It just happens to be t=
hat all=20
of our architectures use the unit32-aligned=3D4 structures.)  :)

So they are sharable between ABIs on the same arch for sure.

--Mark

> If it wasn't for the forthcoming 1.3 release, I'd have included the
> proposed change to the default localedir to ${exec_prefix}/lib/locale
> with this patch.
>



