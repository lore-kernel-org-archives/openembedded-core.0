Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE9E60043
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 14:14:02 +0000 (UTC)
Received: by iofh3 with SMTP id h3so160747235iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 06:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=pClnpHwy8ulBkvmz0vBY4o5VwVTQO0W35Uir7pWacE0=;
	b=M/1vbXNj/orOnjw7Vgz41o8EM/R5G/C/urgngclZH8A9wQ+wcT71mg2kSqNMoQC2nW
	5DcBYW0ZgAsmBhB/GU+JvmusfEDJ8yCHwrBz+oSthcTV2Pu5tTmj6FDTM1sUL7pyM+uL
	xCMkCEplTtrGl7yK1n0GuIR0tQRuSh+Ss/V2xeqkR19fSuyMhC3k0sdNycy9lzBhGl5P
	wAeLmV32LzVnH+IIOMwTMfFqEHLR9u2WHG+q8VK0jMGwe0EIlhWdQvrCa0TwsuBdy/2h
	+0TybgfBscbIa4+H7jCfwf8YImdaiProjVn969MPpIDqBf0bnNyG48gyQxQ92alDQcDe
	26UA==
MIME-Version: 1.0
X-Received: by 10.107.130.155 with SMTP id m27mr36574529ioi.133.1447683242939; 
	Mon, 16 Nov 2015 06:14:02 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Mon, 16 Nov 2015 06:14:02 -0800 (PST)
Date: Mon, 16 Nov 2015 15:14:02 +0100
Message-ID: <CALbNGRQVDT0mdYJUrhP5A-Tkzoo1pE-L=ApsidqJXsHyenNz1w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: hostname issues
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
X-List-Received-Date: Mon, 16 Nov 2015 14:14:04 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

for xfce-session we have some very bad workaround entering machine
name to /etc/hosts [1]

I looked into this and found (let's assume ${MACHINE}='foomachine'):

* basefiles: By default /etc/hostname contains 'foomachine'
* netbase: /etc/hosts contains '127.0.0.1    localhost.localdomain
   localhost'

Shouldn't this be

/etc/hosts: '127.0.0.1    foomachine        localhost'
or
/etc/hostname: 'localhost.localdomain'

To test do

'ping foomachine'
or
hostname -f

What do experts say?

[1] https://github.com/openembedded/meta-openembedded/blob/master/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb

Regards

Andreas

