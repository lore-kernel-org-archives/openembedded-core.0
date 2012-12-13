Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TjBlI-00062h-6w
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 17:35:52 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so1912031lag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 08:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=6cTFx97lTnAnOkc8328xP3kCoZObju7EZuBvsWH8v7U=;
	b=CdyHueqwZturSEIpk73xw9p5aQDmlyYKugCnddz56R8DVdlVoibVC2d3l//ZMZ3oE1
	aRanIJ4pKxrXSEcWuMntztpwlaRF6cHJp8CA9kRU+cWCwbeku/ctCaSbqAUzawLAGrkk
	jYA43rODabjatAo6M6Z47iDFUReN+nTd7qTOqj3gw8xU7vWS50Io0wWQSZSNmnZXR69P
	O/tqLOaYs/Mk5IGpsAFVniHesPm0sZcMPrGKaUVqNZgYFRKxsqn64qEYAZ11fXMp8SiP
	wsv6BGcqKw1jJLjaqru7lu4htb/ss4RPFKASBa9bEul/GLTW7GxYmE3QfTV1boK6XSP+
	tQmw==
Received: by 10.152.124.111 with SMTP id mh15mr80745lab.20.1355415677092; Thu,
	13 Dec 2012 08:21:17 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Thu, 13 Dec 2012 08:20:57 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1212131048350.7515@oneiric>
References: <alpine.DEB.2.02.1212131048350.7515@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 13 Dec 2012 09:20:57 -0700
X-Google-Sender-Auth: JpTsHqvT-1pgv-k8jweS1EWtJHE
Message-ID: <CABcZANkM5f0dNAocFDm1k1soNSyD5LO4m1aD_wGtkjMC9-WHWg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: for svn:// fetching, is "protocol=svn" the default?
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
X-List-Received-Date: Thu, 13 Dec 2012 16:35:52 -0000
Content-Type: multipart/alternative; boundary=f46d042f954ef4c33104d0be4d1b

--f46d042f954ef4c33104d0be4d1b
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 13, 2012 at 8:51 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>   currently documenting svn fetching and noticed the occasional recipe
> with "protocol=svn", i have to assume that setting is unnecessary once
> you've specified the svn:// protocol, yes?
>

This is correct. For some fetchers (iirc, git) the default protocol changed
over time, but I don't think that is the case here.
-- 
Christopher Larson

--f46d042f954ef4c33104d0be4d1b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, Dec 1=
3, 2012 at 8:51 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&gt;</s=
pan> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":w3">=C2=A0 currently documenting=
 svn fetching and noticed the occasional recipe<br>
with &quot;protocol=3Dsvn&quot;, i have to assume that setting is unnecessa=
ry once<br>
you&#39;ve specified the svn:// protocol, yes?</div></blockquote></div><br>=
This is correct. For some fetchers (iirc, git) the default protocol changed=
 over time, but I don&#39;t think that is the case here.<br>-- <br>Christop=
her Larson<br>


</div>

--f46d042f954ef4c33104d0be4d1b--
