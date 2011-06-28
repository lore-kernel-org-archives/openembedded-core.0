Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QbbCL-00033o-Oa
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 18:31:37 +0200
Received: by bwf20 with SMTP id 20so389720bwf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nux4F/rFeMmX3Frlx83/vwV7pXyCw/b6Vz4UnbdsI4M=;
	b=a8+o37rT9YRncOYRXxIE97/rQUV8SchgEBtKY95FXH/0GCr/vvGKRBxQYMVbPQAGBW
	5Vop/XqUfm8MvkstFwXjervv8NnKgWwPmWWgDZm1LpHuQbEa1RB41Wy4UUjbEOj907A9
	d4ni/cGpBo1Dx3wTgDWyBgSpe1YrPM1LLINjQ=
MIME-Version: 1.0
Received: by 10.204.20.143 with SMTP id f15mr5650615bkb.173.1309278475575;
	Tue, 28 Jun 2011 09:27:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.73.70 with HTTP; Tue, 28 Jun 2011 09:27:55 -0700 (PDT)
In-Reply-To: <1309277809.20015.322.camel@rex>
References: <BANLkTi=GQS+Rwv+srtcctpD3jDwu7RWv2Q@mail.gmail.com>
	<1309277809.20015.322.camel@rex>
Date: Tue, 28 Jun 2011 13:27:55 -0300
X-Google-Sender-Auth: pJiQCbD6DAuBlTbjnbiITlmGqc8
Message-ID: <BANLkTinGUawS4b7x2YdP+Tu+B=Ngkt4MbQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFH] Native SDK wirdness
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
X-List-Received-Date: Tue, 28 Jun 2011 16:31:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2011 at 13:16, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-06-28 at 11:56 -0300, Otavio Salvador wrote:
>> I am probably doing something stupid but I couldn't figure it myself
>> so I am looking for some help here. Basically I need to prepare a SDK
>> for usage by our team mates to develop to our embedded OS. In theory I
>> got most of it already done but when I build the meta-toolchain recipe
>> the built sdk tarball lacks GCC and like.
>>
>> Any idea where I ought to look for a good example? Or any clue what I
>> am doing wrong?
>
> Could you share a list of files from your toolchain tarball please? It
> certainly should contain a cross compiler...

~% tar -tjf oecore-i686-i586-toolchain-devel.tar.bz2| grep '\-gcc'
./usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/include/curl/typ=
echeck-gcc.h
./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/include/curl/typech=
eck-gcc.h
./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/s=
ymbian/linux-gcce/
./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/s=
ymbian/linux-gcce/qplatformdefs.h
./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/s=
ymbian/linux-gcce/qmake.conf
./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/s=
ymbian/linux-gcce/features/
./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/s=
ymbian/linux-gcce/features/default_post.prf
~%

I can provide the full list but it does seem to not include it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


