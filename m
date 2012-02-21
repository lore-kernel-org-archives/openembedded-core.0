Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RzxYv-0001SI-VK
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 22:47:54 +0100
Received: by obhx4 with SMTP id x4so9560095obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 13:39:34 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.182.193.73 as permitted sender) client-ip=10.182.193.73; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.182.193.73 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.182.193.73])
	by 10.182.193.73 with SMTP id hm9mr7416430obc.29.1329860374126
	(num_hops = 1); Tue, 21 Feb 2012 13:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=6hetQrkX77i7BE6bocP1DoY8d8b05sWi314+Qz6jwYE=;
	b=rQkrprNfuwCDDWbTg52xzv6onIOK6EmBK0iSpMSWFMEZ4pfhLN/7rRTedtauAIGBuR
	crCf/PqyJB3TJsZszdI4DnaENVPveLDX02fLrY9Fo1YB4K4EQ2eHB9JRykwyEVwryP9m
	x08a52D9BI310GIxZAtN/deVsyyq4kA0EynAU=
MIME-Version: 1.0
Received: by 10.182.193.73 with SMTP id hm9mr6360383obc.29.1329860374063; Tue,
	21 Feb 2012 13:39:34 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Tue, 21 Feb 2012 13:39:34 -0800 (PST)
In-Reply-To: <1329860021.2591.182.camel@x121e.pbcl.net>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
	<1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
	<4cb8ea6acd12fec8ff072912292a374aaac56dcb.1329147583.git.Martin.Jansa@gmail.com>
	<CAGDS+nkxwj33z1zP2Uc9+oH97WkOy_v0yP2cs0VDcDgxm3SYog@mail.gmail.com>
	<CAMKF1sqMP5yyeFo8qUhjd1xPkOvV6JcpzSwRP33VNyc0wf+C_A@mail.gmail.com>
	<CAGDS+nn7+3zVFX896P-+y5tT4Xw-++bgKtizmDsFZUno5D9Y8A@mail.gmail.com>
	<1329860021.2591.182.camel@x121e.pbcl.net>
Date: Tue, 21 Feb 2012 13:39:34 -0800
Message-ID: <CAGDS+nmmDatHX=MbJkEgCLNS0ZWssWVTDCQZR3Q5wNYPe82EhA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] recipes: bump PR to rebuild .la files without libz.la
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
X-List-Received-Date: Tue, 21 Feb 2012 21:47:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2012 at 1:33 PM, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2012-02-21 at 13:16 -0800, Steve Sakoman wrote:
>> On Tue, Feb 21, 2012 at 1:07 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > On Tue, Feb 21, 2012 at 11:25 AM, Steve Sakoman <sakoman@gmail.com> wr=
ote:
>> >>
>> >> | configure: error: Package requirements (cairo-xlib >=3D 1.6) were n=
ot met:
>> >> |
>> >> | No package 'cairo-xlib' found
>> >
>> > Add DEPENDS +=3D "cairo"
>>
>> Nope, cairo is already in the DEPENDS list for gtk+.
>>
>> Seems the issue is that on that build machine (the 4 core) cairo isn't
>> being built with --with-x=3Dyes.
>>
>> The cairo recipe checks for x11 in DISTRO_FEATURES and does
>> --with-x=3Dyes if it is present.
>>
>> Since Poky doesn't have x11 in DISTRO_FEATURES, cairo builds without
>> xlib support by default.
>
> If you don't have x11 in DISTRO_FEATURES then I wouldn't have expected
> gtk+ to want cairo-x11 either.

Agreed!  But it does :-(

>=A0Though, I don't quite know what the gtk+
> configury will do if you don't select any backends at all and it's
> possible it might be falling back to X in that case.
>
> What gtk backend are you expecting to use - directfb?

Well, this is an image for a headless system, so neither directfb nor
x11 will be used!  I'm not really sure what package is causing gtk+ to
be built.

Steve


