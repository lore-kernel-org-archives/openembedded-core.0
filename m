Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id DD6ED7318F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 21:42:48 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id e63so236901153ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 14:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=HoFJ0Vs4tAipJnbrUq+AqdsOh/A9I0Y4IlVwIXWLc3k=;
	b=SeQpxf5GDoHq+B+EuXKYsvUolIazUHfAdgUFqM/UABjXy+m5MZwTztFrffAUD6Tese
	L8jWOopNZLVh6JOoOYYQ4hSA94DiQVUY1JU3lpqveq+X3UiWqPFBdOAILUrpZtiR6zkz
	SwrDX15TJUsYGvvZ+NQ6z2G0VpaA4Ow7LTiFH4mB+wBo9A70TmCyipU4TISM/jiGHSm/
	Yjfzh/VhF2UhhO9Du49UyoMXrtErEHTni6CsLGRAk1pRzKGkMbF0jR0fpMVnFRF5NN+o
	eXyhaKgqLNZgeQlf5fr0zPmUK2jLIK8mi4L5c1UwRnw8X1fERNlmZAbDtJnO+UVYgRuq
	J2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=HoFJ0Vs4tAipJnbrUq+AqdsOh/A9I0Y4IlVwIXWLc3k=;
	b=fSyEVsXPIU2+0PxhNMHNHyv77F53mQQlwsJNi/D1W6w2SyvcG7OK6T27NsBMnoS9EB
	wJEc0L57CkDFfEgonmfrL18u9YYZ0FF7OUnJafJaCEHU9x24Q3UaqpE/9hHMqJuSMoa9
	TQnHTiZDI6JP0EgCxoxlPxySEKhuR9w1RbTPn+ydtH4gMwNT3NSlwkEjmMaa1c+UWb7i
	ygxjUxRrPWQ8MWuJ4bFWhdgUt5iwzOMJ+rWTl6c2SWKLO2xXXX1Gupl7a/1rcFHdOC/7
	E2gOlE3Qeeqz9IUYMLnrWhT2ZVtcIgPqaIwhA9SIZXSWrYs4Mc3DBLcZ80t61Yz56KeH
	Ff5g==
X-Gm-Message-State: AE9vXwNmJ+N3BGNKs70GMtCVz/ocd87XA3HJvaOVgqPs3g36f1y9eq3QpWtwffByxqD4nwNWX4WNuyHH2QIq105S
X-Received: by 10.107.135.142 with SMTP id r14mr7071192ioi.133.1472074969157; 
	Wed, 24 Aug 2016 14:42:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 24 Aug 2016 14:42:28 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Aug 2016 22:42:28 +0100
Message-ID: <CAJTo0LaQopnGT2j0y-+evnSkCfXN_ew311LsqP_zJ4+uq6CmBg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Broadcom firmware
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
X-List-Received-Date: Wed, 24 Aug 2016 21:42:50 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc9ea5a7053ad82996

--001a113eccbc9ea5a7053ad82996
Content-Type: text/plain; charset=UTF-8

Every time I do an image build this is in the buildhistory:

  /lib/firmware/brcm/brcmfmac-sdio.bin changed symlink target from
/lib/firmware/brcm/brcmfmac4339-sdio.bin to
/lib/firmware/brcm/brcmfmac4329-sdio.bin

Because linux-firmware has alternatives for brcmfmac-sdio.bin but none of
the choices is preferred.  If I made the 4339 file preferred by bumping its
priority, would anyone object?

Ross

--001a113eccbc9ea5a7053ad82996
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Every time I do an image build this is in the buildhi=
story:</div><div><br></div>=C2=A0 /lib/firmware/brcm/brcmfmac-sdio.bin chan=
ged symlink target from /lib/firmware/brcm/brcmfmac4339-sdio.bin to /lib/fi=
rmware/brcm/brcmfmac4329-sdio.bin<br><div><br></div><div>Because linux-firm=
ware has alternatives for brcmfmac-sdio.bin but none of the choices is pref=
erred.=C2=A0 If I made the 4339 file preferred by bumping its priority, wou=
ld anyone object?</div><div><br></div><div>Ross</div></div>

--001a113eccbc9ea5a7053ad82996--
