Return-Path: <andrei@gherzan.ro>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 44CF0602DA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 16:25:21 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id m15so2251848wgh.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 08:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
	:content-type;
	bh=YnbAdT3GFCe2ecSqpdNmIPfdaE1XIsaaNfVa8aJLhZ4=;
	b=XVCQfMjLCsDjnGvvJB5+/Oax1X9erhWUmfCmc9fCwDUeL7lfEDaQBQSKstaqbwwMdq
	RXk4utfnwzLCtbkrI5p6gzudm0EK2PxwMd/zwDZXK/wTbojhYVBqN6C0/Ki/K121KNl4
	EjRU5ifrvupLFZaXqIdk5IXAgCWsb2HFHk90zTjQDmUadJXxvddzMxA1Vh2uomRnE+cw
	gMthhZnb0YDg5955gIAGHOuYT5unkll2m9+UaGwSaiPpZ91cGwdHquzgJzW3Pdm9C643
	ZPsl7HrcOlgeprnOQe82HkqJXVRK95BghOjS1MGX9HF1PF1l3JF2ywAFZKRPlK4cMlpz
	PDYw==
X-Gm-Message-State: ALoCoQnYL0SFk37siQjvlKgDuKHX117fJPMWshFvtTLVFs9f59WLD2TVkXIhq3OdRwQm+h8n1YTn
X-Received: by 10.194.22.230 with SMTP id h6mr61602wjf.86.1389457521672; Sat,
	11 Jan 2014 08:25:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.217.150.199 with HTTP; Sat, 11 Jan 2014 08:25:01 -0800 (PST)
X-Originating-IP: [5.13.221.193]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sat, 11 Jan 2014 18:25:01 +0200
Message-ID: <CAK18fxG3_D9kRoiWrPJsTQxN=EOZSx3Vue8288maf_rMGHOrvQ@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
Subject: eglibc not buildable for on thumb2 only instructions
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
X-List-Received-Date: Sat, 11 Jan 2014 16:25:23 -0000
Content-Type: multipart/alternative; boundary=047d7b5d913102a15804efb44a6c

--047d7b5d913102a15804efb44a6c
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I'm trying to build eglibc for a thumb2 only processor: here is the log
http://pastebin.com/KgwtJYAC.

I know Raj tried in the past this and I want to know if it makes sense to
dig further into this or there is a known incompatibility in eglibc. I
searched a in eglibc and they seem to have patches that add thumb2 support.
So things, at least in theory, should work.

Cheers!
-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

--047d7b5d913102a15804efb44a6c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I&#39;m trying to build eglibc f=
or a thumb2 only processor: here is the log=A0<a href=3D"http://pastebin.co=
m/KgwtJYAC">http://pastebin.com/KgwtJYAC</a>.</div><div><br></div><div>I kn=
ow Raj tried in the past this and I want to know if it makes sense to dig f=
urther into this or there is a known incompatibility in eglibc. I searched =
a in eglibc and they seem to have patches that add thumb2 support. So thing=
s, at least in theory, should work.</div>

<div><br></div><div>Cheers!<br>-- <br><div dir=3D"ltr"><div style=3D"text-a=
lign:center"></div><div style=3D"text-align:center"><div align=3D"left" sty=
le=3D"font-family:&#39;Times New Roman&#39;;font-size:medium"><b style=3D"c=
olor:rgb(51,51,51);font-family:Arial;font-size:small;text-align:center">And=
rei Gherzan</b><font face=3D"Arial" color=3D"#333333" size=3D"-1"><br>

</font><font face=3D"Arial" color=3D"#333333" size=3D"-1">m: +40.744.478.41=
4 | =A0f: +40.31.816.28.12</font><br></div></div></div>
</div></div>

--047d7b5d913102a15804efb44a6c--
