Received: from eu1sys200aog110.obsmtp.com ([207.126.144.129])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1Tw7cR-00057v-Ql
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 09:48:52 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob110.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUPkIsLOrbusSCy0veAC7HovRH3A5Y8I/@postini.com;
	Fri, 18 Jan 2013 08:32:49 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61A52198;
	Fri, 18 Jan 2013 08:32:33 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E27992AB4;
	Fri, 18 Jan 2013 08:32:32 +0000 (GMT)
Received: from CTN005027 (pcmdt30.ctn.st.com [164.130.129.192])
	by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id AVO62502 (AUTH condorg);
	Fri, 18 Jan 2013 09:32:32 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: "'Martin Jansa'" <martin.jansa@gmail.com>
References: <1358345647-13274-1-git-send-email-giuseppe.condorelli@st.com>
	<20130116150205.GE3002@jama>
	<CAOHjBZsXebja8FB4GbQNwm5zxBCoEOPh40rE9b71EzXG5fGWdA@mail.gmail.com>
	<20130117124209.GE3067@jama>
	<065b01cdf4b6$e1510160$a3f30420$@st.com>
	<20130117134619.GI3067@jama>
	<068101cdf4d3$f2e58fa0$d8b0aee0$@st.com>
	<20130117172817.GK3067@jama>
In-Reply-To: <20130117172817.GK3067@jama>
Date: Fri, 18 Jan 2013 09:32:31 +0100
Message-ID: <06a101cdf556$5c273b80$1475b280$@st.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQJd3UIgpWykE/uuKxds/KWg86Wy7AI8MptVAf37k6YCXM8t6gG5dPdSAgbRfn8CkCQuxwHX1DyQlrj2sRA=
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: fix as and ld check in libc dir
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
X-List-Received-Date: Fri, 18 Jan 2013 08:49:03 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: it

Yes Martin,

but I discovered the issue building (erroneously because eglibc was =
actually
not required at all) an external-toolchain a little bit old (gcc and
binutils) against the master oe-core repository,
which contains eglic-2.16 as you know. And libc/configure comes with the
issue I highlighted.
So, please, think to my patch as a nice to have and not as a mandatory =
one.
I don't know if other people will fall in my same condition.

Thanks so much for your support.
Giuseppe


>-----Original Message-----
>From: Martin Jansa [mailto:martin.jansa@gmail.com]
>Sent: gioved=EC 17 gennaio 2013 18:28
>To: Giuseppe CONDORELLI
>Cc: 'Giuseppe Condorelli'; openembedded-core@lists.openembedded.org
>Subject: Re: [OE-core] [PATCH] eglibc: fix as and ld check in libc dir
>
>On Thu, Jan 17, 2013 at 05:59:00PM +0100, Giuseppe CONDORELLI wrote:
>>
>> >-----Original Message-----
>> >From: Martin Jansa [mailto:martin.jansa@gmail.com]
>> >Sent: gioved=EC 17 gennaio 2013 14:46
>> >To: Giuseppe CONDORELLI
>> >Cc: 'Giuseppe Condorelli'; openembedded-core@lists.openembedded.org
>> >Subject: Re: [OE-core] [PATCH] eglibc: fix as and ld check in libc
>> >dir
>> >
>> >On Thu, Jan 17, 2013 at 02:30:55PM +0100, Giuseppe CONDORELLI wrote:
>> >> Hi Martin,
>> >>
>> >> Do you mean applying the patch you highlighted in libc/configure?
>>
>> Hi Martin,
>>
>> Please untar the attachment and run the test I sent you.
>> It reproduces the same scenario as in the libc/configure eglibc file.
>
>Ah I see it's not used as regexp.
>
>But doesn't upstream have some good reason to require 2.20 and newer?
>
>It was incremented from 1.17+ to 2.20+ in
>http://www.eglibc.org/cgi-
>bin/viewvc.cgi/trunk/libc/configure.in?r1=3D17195&r2=3D17385
>
>Cheers,
>
>> >> >-----Original Message-----
>> >> >From: Martin Jansa [mailto:martin.jansa@gmail.com]
>> >> >Sent: gioved=EC 17 gennaio 2013 13:42
>> >> >To: Giuseppe Condorelli
>> >> >Cc: Giuseppe CONDORELLI; openembedded-
>> >core@lists.openembedded.org
>> >> >Subject: Re: [OE-core] [PATCH] eglibc: fix as and ld check in =
libc
>> >> >dir
>> >> >
>> >> >On Wed, Jan 16, 2013 at 04:07:39PM +0100, Giuseppe Condorelli =
wrote:
>> >> >> 2013/1/16 Martin Jansa <martin.jansa@gmail.com>
>> >> >>
>> >> >> > On Wed, Jan 16, 2013 at 03:14:07PM +0100, Giuseppe CONDORELLI
>> >wrote:
>> >> >> > > Fix routine to check as and ld version check in the
>> >> >> > > configure, to
>> >> allow
>> >> >> > system
>> >> >> > > to correctly check for version 2.1x.
>> >> >> >
>> >> >> > Does it build with gold now?
>> >> >> >
>> >> >> > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-
>> >> >March/020310.html
>> >> >
>> >> >does it?
>> >> >
>> >> >--
>> >> >Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> >>
>> >
>> >--
>> >Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
>--
>Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



