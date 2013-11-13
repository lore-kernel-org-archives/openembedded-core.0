Return-Path: <kirgene@gmail.com>
Received: from mail-qe0-f53.google.com (mail-qe0-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 56C7B6D571
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 00:56:35 +0000 (UTC)
Received: by mail-qe0-f53.google.com with SMTP id cy11so6063233qeb.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 16:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yeTAEpl/ZC0iGvisoxAq00SMMGqSIjcc1hW+Zf9rUm8=;
	b=bAEhBr1OV3bYqPWlma8DcliI/x2HTxn9mBd3oQYaSlfI4Af+0B2Go0zbAGxwEhsNbM
	9vZOwjBty/DEY8GB0H77g0Ibcnec4MH7FE3iinw6sHdRPgg92eVQHtft6dAvaj3eKAKD
	/lb7LLMU1Few53Z4wTf40dnMeCD01nXtrYkSNdgalVvwAnvkMjQ4NOoj5Ke0E0Z/Q8F9
	oZNJr6G90X777/J9OCXmvEJseLfBvKoDq3zpRdPfe3XtXVmuxE0MpPzBNqQIXIt/RdHC
	AeJxYQ6wMcfljf0ICtUdl67ud3rcBhQK9oNv7hp33Ket1UqgeO6xsUIfa92IRt2JO6bP
	k0dQ==
MIME-Version: 1.0
X-Received: by 10.49.24.161 with SMTP id v1mr28373287qef.75.1384304196779;
	Tue, 12 Nov 2013 16:56:36 -0800 (PST)
Received: by 10.96.55.197 with HTTP; Tue, 12 Nov 2013 16:56:36 -0800 (PST)
Date: Wed, 13 Nov 2013 02:56:36 +0200
Message-ID: <CADV-EXFZta7Y=vb57czxCpCPkcrtkj4dkhpX+y1O37F_e2tXOQ@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: build with c-ares library support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Nov 2013 00:56:36 -0000
Content-Type: multipart/alternative; boundary=047d7b6dcd04e904f004eb046f83

--047d7b6dcd04e904f004eb046f83
Content-Type: text/plain; charset=ISO-8859-1

> I am still considering this patch, but need to understand what platforms
> curl is failing on.

As far as I've tested curl crashes on i386, cedartrail and x86-64 platforms.

The c-ares recipe was borrowed from meta-webos-ports.

I'll prepare new version of this patch that will include PACKAGECONFIG
switch.

Best regards,
Yevhen

--047d7b6dcd04e904f004eb046f83
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-family:arial,sans-serif;font-size=
:13px">&gt; I am still considering this patch, but need to understand what =
platforms</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><=
span style=3D"font-family:arial,sans-serif;font-size:13px">&gt; curl is fai=
ling on.</span><br>
</div><div><br></div><div>As far as I&#39;ve tested curl crashes on i386, c=
edartrail and x86-64 platforms.</div><div><br></div><div>The c-ares recipe =
was borrowed from=A0<span style=3D"font-family:arial,sans-serif;font-size:1=
3px">meta-webos-ports</span>.</div>
<div><br></div><div>I&#39;ll prepare new version of this patch that will in=
clude=A0<span style=3D"font-family:arial,sans-serif;font-size:13px">PACKAGE=
CONFIG switch.</span></div><br clear=3D"all"><div>Best regards,<br>Yevhen</=
div>

</div>

--047d7b6dcd04e904f004eb046f83--
