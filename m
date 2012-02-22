Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S0DxK-0004n0-1C
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 16:18:10 +0100
Received: by yenr5 with SMTP id r5so95370yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 07:09:49 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.60.4.105 as permitted sender) client-ip=10.60.4.105; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.60.4.105 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.60.4.105])
	by 10.60.4.105 with SMTP id j9mr14901592oej.29.1329923389064 (num_hops
	= 1); Wed, 22 Feb 2012 07:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=kvH8p5fdERDbnrk6wf1737SDh6LQlVIEIaOtuCMG/Oo=;
	b=pPrXWMsu28IPxKeVE014xv7z3nzjEh4pFKQRwo+gvHLgtEYo8UCbJCWaefwmEF5Rmr
	XU8pyrXLXwh4NxE8ZjOozX1RWBgdmXDtQVYlqeeVw8RMOfntUs1JvzCptN74qSNo9u/9
	s/ESrsrnDVnzgehPIYLjz1zP0EMU5Syeqv12Q=
MIME-Version: 1.0
Received: by 10.60.4.105 with SMTP id j9mr12782180oej.29.1329923388906; Wed,
	22 Feb 2012 07:09:48 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Wed, 22 Feb 2012 07:09:48 -0800 (PST)
In-Reply-To: <CAOSpxdabeX7TrUa_xGKAjdTS_NtmVRR+Y_Jz_27PkvXx9XNWPQ@mail.gmail.com>
References: <1329851229-31625-1-git-send-email-steve@sakoman.com>
	<1329861178.20261.62.camel@ted>
	<CAOSpxdabeX7TrUa_xGKAjdTS_NtmVRR+Y_Jz_27PkvXx9XNWPQ@mail.gmail.com>
Date: Wed, 22 Feb 2012 07:09:48 -0800
Message-ID: <CAGDS+nkBpocsR0XzG3Qn=EgBSta7oQhd3hTkWncPpFX0RU5c2Q@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxml2: add missing dependency on binutils
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
X-List-Received-Date: Wed, 22 Feb 2012 15:18:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2012 at 2:26 PM, Steve Sakoman <steve@sakoman.com> wrote:
> On Tue, Feb 21, 2012 at 1:52 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2012-02-21 at 11:07 -0800, Steve Sakoman wrote:
>>> Otherwise build fails with following error:
>>>
>>> | In file included from libxml.h:36:0,
>>> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from xmlmemory.c:8:
>>> | ./include/libxml/xmlversion.h:396:22: fatal error: ansidecl.h: No suc=
h file or directory
>>>
>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>> ---
>>> =A0meta/recipes-core/libxml/libxml2.inc | =A0 =A02 +-
>>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/l=
ibxml/libxml2.inc
>>> index 0979acd..6230f60 100644
>>> --- a/meta/recipes-core/libxml/libxml2.inc
>>> +++ b/meta/recipes-core/libxml/libxml2.inc
>>> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://Copyright;md5=3Dbb90c489=
26316d9af6e2d70ca7013ade \
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://trio.c;beginline=3D5;=
endline=3D14;md5=3D6c025753c86d958722ec76e94cae932e"
>>>
>>> =A0DEPENDS_virtclass-native =3D "python-native"
>>> -DEPENDS =3D+ "zlib"
>>> +DEPENDS =3D+ "zlib binutils"
>>>
>>> =A0SRC_URI =3D "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz \
>>> =A0 =A0 =A0 =A0 =A0 =A0 file://libxml-64bit.patch"
>>
>> This sounds very wrong. It would have implications for libxml2-native
>> I'd imagine. What is it doing that needs binutils?
>
> For some reason the libxml2 configure phase decides that ansidecl.h
> from binutils is present, but then at compile time it finds that it
> actually isn't there! =A0I saw the same issue on both my desktop and
> autobuilder setups.
>
> I'll try a clean build to see if the problem persists. =A0The libz
> change from last week seems to have put my builds in a bad state, and
> the PR bumps intended to fix things really don't seem to be fixing
> things, at least on my build machines. =A0I suspect it might be faster
> to do a clean build than to track down where the corruption is.

FWIW, a clean build resolved the binutils dependency, so the above
patch is not required.

I suspect that the current set of PR bumps for the zlib issue still
aren't sufficient for many users, but I'm hoping the switch to
OEBasicHash will minimize further pain.

Steve


