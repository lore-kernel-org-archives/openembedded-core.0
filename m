Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SwtQk-0005QH-OG
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 13:19:02 +0200
Received: by yhjj56 with SMTP id j56so7738711yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 04:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=K3CKTxMrLvoi6LRUuvxpKLXogE8DcvJW6mwTi9WXePw=;
	b=m2rh9jSc1R7trTJwc7b1p8vGGfW1XosabdJzRJ1prk/9VgENWAhzUJxQPkXVVj7d/c
	KAhwMwm14t+f7/aCYhKh5NQmTeqMABbCshcF1826QAbFvD02QfaHPPuSLoaBrRD6wRbP
	Vjiqpnui5Vrm73yV3CXd8Iymtw9DqZucc69YiT5sFtguYMachpeWm/FTR+Fs0LQPYiJ3
	3yWEx/e0d5Ep423BQNw1vGqkzuy5fNOA8QL7ohh0Cp5SyzDNSZWGIeImTmip2N00ZxDx
	AkSU4bIxpJmrHt8F2SMc/0voXqpjrEzrUAXf9R3uyUOZrw8BakGYrEJzw8OHfoDsm7jR
	Rw7Q==
MIME-Version: 1.0
Received: by 10.50.88.134 with SMTP id bg6mr3121755igb.0.1343905642605; Thu,
	02 Aug 2012 04:07:22 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Thu, 2 Aug 2012 04:07:22 -0700 (PDT)
In-Reply-To: <CAMKF1soNF3pdCnn41Ob0zWb8JaR0J4eL8tcc8MK3FKXeXnihVg@mail.gmail.com>
References: <CALbNGRR1j33mDcTD-q2FD+g2uL1VNZNdDwRX7_MNeUTKtN=ozQ@mail.gmail.com>
	<20120620185551.GU3178@jama.jama.net>
	<CAMKF1soNF3pdCnn41Ob0zWb8JaR0J4eL8tcc8MK3FKXeXnihVg@mail.gmail.com>
Date: Thu, 2 Aug 2012 13:07:22 +0200
Message-ID: <CALbNGRSbs7D5kiPjuR1uh=ra-j08HbJRszx+cLv5NJtRtxj_RA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: latest updates make kernel menuconfig unusable
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
X-List-Received-Date: Thu, 02 Aug 2012 11:19:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2012 at 2:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Jun 20, 2012 at 11:55 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> On Wed, Jun 20, 2012 at 04:20:03PM +0200, Andreas M=FCller wrote:
>>> Hi,
>>>
>>> since
>>>
>>> commit fe417e8a4d625c6933de72163d2fee52ac47f571
>>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> Date:   Thu May 31 13:22:34 2012 +0000
>>>
>>>     cmd1.bbclass: Ensure ncurses is built and used for menuconfig tasks
>>>
>>>     Currently, the task just exits if something goes wrong. This adds t=
he
>>>     ncurses-native dependency. It also adds a small delay before closin=
g the
>>>     window so any messages displayed there can be seen.
>>>
>>>     Trying to get the kernel build system to correctly find and link wi=
th
>>>     our copy of ncurses is some kind of nightmare. I ended up having to=
 add
>>>     it to HOST_LOADLIBES globally for this task which is rather nasty b=
ut I
>>>     couldn't find any other way.
>>>
>>>     [YOCTO #2513]
>>>
>>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>
>>> my menuconfig is unusable (see screenshot attached). I reverted it and
>>> can work as before.
>>>
>>> I am working on Fedora 15 and set in my local.conf
>>>
>>> TERMCMD =3D "${GNOME_TERMCMD}"
>>> TERMCMDRUN =3D "${GNOME_TERMCMDRUN}"
>>
>> I can confirm the same look&feel with
>> TERMCMD =3D "${SCREEN_TERMCMD}"
>> TERMCMDRUN =3D "${SCREEN_TERMCMDRUN}"
>>
>
> seems like a locale issue.
>
FYI

Still have this behaviour and can work around it by commenting out

OE_TERMINAL_EXPORTS +=3D "HOST_EXTRACFLAGS HOSTLDFLAGS HOST_LOADLIBES"

in cml1.bbclass.

Andreas


