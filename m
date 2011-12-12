Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RaDqp-0004K8-On
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 22:55:59 +0100
Received: by lami14 with SMTP id i14so127216lam.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2011 13:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=v532kMCCfBbLhOYj6LZ3N0tYbbS7J7+Bd6Su/B2ktCI=;
	b=Nm4mCYsaR/fe0wS0mGtcYZr8/l+dcEUZZ/G0l8GQipyuKvtUfW4r8giaObaHgTi3Y+
	usuvNLkF1ADMRhTGat1aF1yWVd4fuEWB/QFFlVTbYYbRFnHBk2s1kMcEESZtAYX6bDS1
	astG7NcuKE7+oDlqJX8RLCdCBmarQLIW+V4i8=
Received: by 10.152.104.103 with SMTP id gd7mr13046201lab.34.1323726544294;
	Mon, 12 Dec 2011 13:49:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Mon, 12 Dec 2011 13:48:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Dec 2011 13:48:34 -0800
Message-ID: <CAMKF1sqm+eStEyHsXgOgfp-DyQyQSx7vo1T9noJAiT-Qyv=Pnw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: -fpermissive option for C++ in bitbake.conf
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
X-List-Received-Date: Mon, 12 Dec 2011 21:55:59 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I see that we add -fpermissive option for C++
code, is there still some code that we have needs that option ?
if not then I think we should get rid of that option
I have not experimented with it myself yet but if someone could
try to test a clean build without this option would be nice

-Khem


