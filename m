Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Qf5bC-0004Dn-Lq
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 09:35:42 +0200
Received: by yxi19 with SMTP id 19so743889yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=oGWfpW2QbDh6v1jwANpgkwwAnLoQ903aJBYBAnprYLU=;
	b=et6fPosQryH1GJWnE132SZYwWthxzkWQyyCqz8zqazXrEV5ndAorvDBJs6rpYXZq+Q
	9nEY5/9f8tB6y/L5IrUNUSA0Srv1y6wrjr9h2QD0rBGb67NeSAzhQFGC0xM98ETZk+Xc
	NftHrcvOMJscVNOxMZu8W0lLR2Hrx3G7j/+so=
MIME-Version: 1.0
Received: by 10.91.65.16 with SMTP id s16mr1709547agk.90.1310109838284; Fri,
	08 Jul 2011 00:23:58 -0700 (PDT)
Received: by 10.91.220.7 with HTTP; Fri, 8 Jul 2011 00:23:58 -0700 (PDT)
In-Reply-To: <A538C871-F8A8-4F13-BAD7-F883E76EF0C5@dominion.thruhere.net>
References: <cover.1310081443.git.sgw@linux.intel.com>
	<d188228df9d99be77ec2b3becc354a1fc905ab65.1310081443.git.sgw@linux.intel.com>
	<CACW_hTYw_nBv=fftJOevnoDCpXXN5OuuGzgT9AXOSziGDaqprA@mail.gmail.com>
	<A538C871-F8A8-4F13-BAD7-F883E76EF0C5@dominion.thruhere.net>
Date: Fri, 8 Jul 2011 09:23:58 +0200
Message-ID: <CACW_hTbw_H3ibSkoWvLXwk99-C-u4z4k95XNQZUeyY8VB4sAPQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] eglibc: Add RDEPENDS on bash
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
X-List-Received-Date: Fri, 08 Jul 2011 07:35:42 -0000
Content-Type: multipart/alternative; boundary=0016e650a4fc87174304a789b76d

--0016e650a4fc87174304a789b76d
Content-Type: text/plain; charset=ISO-8859-1

2011/7/8 Koen Kooi <koen@dominion.thruhere.net>

>
>
> Op 8 jul. 2011 om 07:53 heeft Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> het volgende geschreven:
>
>
>> -#RDEPENDS_ldd +=" bash"
>> +RDEPENDS_ldd +=" bash"
>>
>
> Ah ok, now see that this is only for ldd.
> In that case the commit message is misleading. (and probably also not
> conformant with the commit message policy).
>
>
> there's an ldd-unbash patch in . dev
>
>
> Seems to me that that is a better alternative then

Frans

--0016e650a4fc87174304a789b76d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/8 Koen Kooi <span dir=3D"ltr">&lt=
;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.thruhere.net</=
a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt=
 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<div bgcolor=3D"#FFFFFF"><div><br><br>Op 8 jul. 2011 om 07:53 heeft Frans M=
eulenbroeks &lt;<a href=3D"mailto:fransmeulenbroeks@gmail.com" target=3D"_b=
lank">fransmeulenbroeks@gmail.com</a>&gt; het volgende geschreven:<br><br><=
/div>
<div><div class=3D"h5"><blockquote type=3D"cite"><div><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex;=
 border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><br>
-#RDEPENDS_ldd +=3D&quot; bash&quot;<br>
+RDEPENDS_ldd +=3D&quot; bash&quot;<br></blockquote><div><br>Ah ok, now see=
 that this is only for ldd.<br>In that case the commit message is misleadin=
g. (and probably also not conformant with the commit message policy).<br>

<br></div></div></div></blockquote><div><br></div></div></div><div>there&#3=
9;s an ldd-unbash patch in . dev</div><div><div></div><div class=3D"h5"><di=
v><br></div><br></div></div></div></blockquote><div>Seems to me that that i=
s a better alternative then <br>
<br>Frans<br></div></div>

--0016e650a4fc87174304a789b76d--
