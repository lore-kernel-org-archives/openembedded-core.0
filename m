Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ75z-0000wn-DV
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 21:31:03 +0100
Received: by lahd3 with SMTP id d3so1262907lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 12:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ylDelSrBC3ja3F3KdD9n+xKmwHKeTqhWvd4RqABxLl8=;
	b=kZ+yHdxFGs9t6XcmDClcLwSdRpAQLLXOn5lxm8uGCAg9JmxOBrfYKiDWPU5nO2C4tB
	0fC89oVD0XmeSqLXEEUAEjlqsUxCRCD5wcpeqC/wedljEluyAwKvWAToHIMjW/MXxFgn
	yoM4WPs8l8x+UQW6Lcjd8KoaBIvhTsDimVuK4=
Received: by 10.152.104.206 with SMTP id gg14mr5850799lab.41.1323462249323;
	Fri, 09 Dec 2011 12:24:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 9 Dec 2011 12:23:37 -0800 (PST)
In-Reply-To: <CAP9ODKozBigWbmZZFX9AESZpms+4cNWKUx20uhZsfCYjURNHZA@mail.gmail.com>
References: <1323460893-30873-1-git-send-email-otavio@ossystems.com.br>
	<CAMKF1spbr_wVbi7tLToDF3bPhg28cAGz_JVVWFg59iGHEM5quA@mail.gmail.com>
	<CAP9ODKozBigWbmZZFX9AESZpms+4cNWKUx20uhZsfCYjURNHZA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2011 12:23:37 -0800
Message-ID: <CAMKF1sqk78Du5cphwfusxFOjpGBrOpOXtK2zpn-6AmToBav-BQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: avoid checking for linux/if_alg.h header
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
X-List-Received-Date: Fri, 09 Dec 2011 20:31:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 9, 2011 at 12:19 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, Dec 9, 2011 at 18:14, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Fri, Dec 9, 2011 at 12:01 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>> > +# alg-test doesn't build, so disable that and test
>> > +# for if_alg.h as this header is only in 2.6.39
>> > +do_configure_prepend() {
>> > + =C2=A0 =C2=A0 =C2=A0 sed -i 's:tools/alg-test ::g' Makefile.am
>> > + =C2=A0 =C2=A0 =C2=A0 sed -i 's:AC_CHECK_HEADERS(linux/if_alg.h, dumm=
y=3Dyes,::g;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s:AC_MSG_ERROR(User=
-space algorithm header files are
>> > required))::g' configure.ac
>> > +}
>> > +
>>
>> may be you can cache that in site files instead of this.
>
>
> I'm willing to try to drop this in a next patch but I'd prefer this to ge=
t
> in before and get connman in a working shape again before focusing on
> improvements for it.

your patch is already available for who are in hurry.


