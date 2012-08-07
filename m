Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Syqj0-00005e-OG
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 22:49:58 +0200
Received: by ghbz2 with SMTP id z2so49044ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 13:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=TPz1KUnLu6VTnzyuWAI6I6kzqKCW4PusQ6DM1U/Klsg=;
	b=PzNyMReqifvFKe7s+KrIU2jj4NXrR6Z5PGVAkKLgpfxNpF8fYd5+1GYFRgiAX4/U3m
	9UCRK8fuVrRU8eaOLNfRizxlBDqSsK7PGg4v6gxSpMnkV1fbwb2PYA+OHic/VaPMbjpa
	2314PqrRPEHcyb/8ekY5JLUy1jwjC2Zls7sc2ucAet83Pq1Uz9Jpby0j2ZoXdKhMNTkQ
	7H7IuCnMsPT1JwH6HiPcsfISteiXXC+9qHqyMFg3Vr2adNMsTAlmG65Li3JPD8W7SExM
	hb0D4+CuiHFNIdfXRM/aA9WyRqRgPlyUyz53jluyMEH5B6rolQMq2yc1PtYkDtWLmFqg
	4YJg==
MIME-Version: 1.0
Received: by 10.43.124.201 with SMTP id gp9mr12514632icc.47.1344371891743;
	Tue, 07 Aug 2012 13:38:11 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Tue, 7 Aug 2012 13:38:11 -0700 (PDT)
In-Reply-To: <CALbNGRS5mM4mTGsXUw1q+jVxtPZkPjHBGRQqpzaMfH0tx4=1gA@mail.gmail.com>
References: <1344258422-32173-1-git-send-email-radu.moisan@intel.com>
	<CALbNGRTBW1E6N5F0t3qaT+2BzGO9xeaXLLAFkFz6PE5dFy9=dw@mail.gmail.com>
	<CALbNGRS5mM4mTGsXUw1q+jVxtPZkPjHBGRQqpzaMfH0tx4=1gA@mail.gmail.com>
Date: Tue, 7 Aug 2012 22:38:11 +0200
Message-ID: <CALbNGRTnMpNr3RAVEWwSh2xM7d03GOd7M8e83RqaEHWZS=ZzLQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: upgrade to upstream stable 1.30.0
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
X-List-Received-Date: Tue, 07 Aug 2012 20:49:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 7, 2012 at 4:21 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Aug 7, 2012 at 4:19 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
>> On Mon, Aug 6, 2012 at 3:07 PM, Radu Moisan <radu.moisan@intel.com> wrot=
e:
>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>> ---
>>>  .../pango/pango-1.28.4/noconst.patch               |  408 ------------=
--------
>>>  .../multilib-fix-clean.patch                       |    0
>>>  .../{pango-1.28.4 =3D> pango-1.30.0}/no-tests.patch  |   14 +-
>>>  .../pango/{pango_1.28.4.bb =3D> pango_1.30.0.bb}     |    9 +-
>>>  4 files changed, 10 insertions(+), 421 deletions(-)
>>>  delete mode 100644 meta/recipes-graphics/pango/pango-1.28.4/noconst.pa=
tch
>>>  rename meta/recipes-graphics/pango/{pango-1.28.4 =3D> pango-1.30.0}/mu=
ltilib-fix-clean.patch (100%)
>>>  rename meta/recipes-graphics/pango/{pango-1.28.4 =3D> pango-1.30.0}/no=
-tests.patch (33%)
>>>  rename meta/recipes-graphics/pango/{pango_1.28.4.bb =3D> pango_1.30.0.=
bb} (49%)
>>>
>> I don't know if it's supposed to, but it does not fix the pango module
>> issue for me {1].
>>
>> Andreas
>>
>> [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026=
919.html
> Sorry - I am on the wrong machine forget my previous mail - will test it =
here.
>
Still manual

pango-querymodules > '/etc/pango/pango.modules'

is required but I don't think it is a pango issue.

Andreas


