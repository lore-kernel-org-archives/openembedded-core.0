Received: from eu1sys200aog115.obsmtp.com ([207.126.144.139])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1Tvqoa-0006rr-E8
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 15:51:37 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob115.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUPgMXmY999EWnZ47YkRSBVF2t9hT8E6f@postini.com;
	Thu, 17 Jan 2013 14:36:15 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 314ECC1;
	Thu, 17 Jan 2013 13:30:57 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E5EF34826;
	Thu, 17 Jan 2013 13:30:56 +0000 (GMT)
Received: from CTN005027 (pcmdt30.ctn.st.com [164.130.129.192])
	by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id AVN19479 (AUTH condorg);
	Thu, 17 Jan 2013 14:30:56 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: "'Martin Jansa'" <martin.jansa@gmail.com>,
	"'Giuseppe Condorelli'" <giuseppe.condorelli@gmail.com>
References: <1358345647-13274-1-git-send-email-giuseppe.condorelli@st.com>
	<20130116150205.GE3002@jama>
	<CAOHjBZsXebja8FB4GbQNwm5zxBCoEOPh40rE9b71EzXG5fGWdA@mail.gmail.com>
	<20130117124209.GE3067@jama>
In-Reply-To: <20130117124209.GE3067@jama>
Date: Thu, 17 Jan 2013 14:30:55 +0100
Message-ID: <065b01cdf4b6$e1510160$a3f30420$@st.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQJd3UIgpWykE/uuKxds/KWg86Wy7AI8MptVAf37k6YCXM8t6pb4+w/g
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
X-List-Received-Date: Thu, 17 Jan 2013 14:51:39 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: it

Hi Martin,

Do you mean applying the patch you highlighted in libc/configure?

Cheers,
Giuseppe

>-----Original Message-----
>From: Martin Jansa [mailto:martin.jansa@gmail.com]
>Sent: gioved=EC 17 gennaio 2013 13:42
>To: Giuseppe Condorelli
>Cc: Giuseppe CONDORELLI; openembedded-core@lists.openembedded.org
>Subject: Re: [OE-core] [PATCH] eglibc: fix as and ld check in libc dir
>
>On Wed, Jan 16, 2013 at 04:07:39PM +0100, Giuseppe Condorelli wrote:
>> 2013/1/16 Martin Jansa <martin.jansa@gmail.com>
>>
>> > On Wed, Jan 16, 2013 at 03:14:07PM +0100, Giuseppe CONDORELLI =
wrote:
>> > > Fix routine to check as and ld version check in the configure, to
allow
>> > system
>> > > to correctly check for version 2.1x.
>> >
>> > Does it build with gold now?
>> >
>> > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-
>March/020310.html
>
>does it?
>
>--
>Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



