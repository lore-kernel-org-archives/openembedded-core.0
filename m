Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RhhOn-0005EW-P9
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 13:53:57 +0100
Received: by vcbf1 with SMTP id f1so11468381vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jan 2012 04:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=t9a8qdhGwIZJM29ZfMXyROTf7ag4vp7OmWwbgQRMCT4=;
	b=QqPYLOi195SIMdamZaWyDDvtqF6LcsUs6znlMkuKt6K31BIr3aKlsxoLkD2sOVPbqz
	MyGuAfcR2C4vZrs/l4+RLXoIvQwn7qcQ5xe9tFnYRyaKQMnLSh6HZ/f2l9N/TO8qlG0v
	DyMxrLU4SPeZppUthsD/1LUfqns7Kz5axi0mo=
MIME-Version: 1.0
Received: by 10.220.231.9 with SMTP id jo9mr27362213vcb.59.1325508396576; Mon,
	02 Jan 2012 04:46:36 -0800 (PST)
Received: by 10.52.160.137 with HTTP; Mon, 2 Jan 2012 04:46:36 -0800 (PST)
In-Reply-To: <FCF8E2EA-669F-4D3E-89D9-4193AABE3344@chargestorm.se>
References: <1325018118-30223-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1325018118-30223-2-git-send-email-fransmeulenbroeks@gmail.com>
	<38A62FB9-6B22-4DC6-AC66-23F5806ED8BA@chargestorm.se>
	<CACW_hTZ=5dzL6g2BOUnjjbWr+_kjU3RDjAGfMDs0NaMTpUffHg@mail.gmail.com>
	<FCF8E2EA-669F-4D3E-89D9-4193AABE3344@chargestorm.se>
Date: Mon, 2 Jan 2012 13:46:36 +0100
Message-ID: <CACW_hTafHhQB_3XKNrOmc0qv2pAuhEMgFw4EtjmsPKdMj+RrbA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Anders Darander <anders@chargestorm.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] u-boot: added generating the env utils (fixes bug 1800)
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
X-List-Received-Date: Mon, 02 Jan 2012 12:53:58 -0000
Content-Type: multipart/alternative; boundary=14dae9cc96881feed204b58af924

--14dae9cc96881feed204b58af924
Content-Type: text/plain; charset=ISO-8859-1

Triggered by the remarks of Anders I've been digging into this a little bit
more.
I suggest to ignore tools_fwenv.patch, and only add the changes to the .inc
file.

For fw_env.h a better solution exists, namely using the value from the
config file.
I'll try to submit a patch to upstream to fix that.

Best regards (and a prosperous 2012!)
Frans

--14dae9cc96881feed204b58af924
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Triggered by the remarks of Anders I&#39;ve been digging into this a little=
 bit more.<br>I suggest to ignore tools_fwenv.patch, and only add the chang=
es to the .inc file. <br><br>For fw_env.h a better solution exists, namely =
using the value from the config file.<br>
I&#39;ll try to submit a patch to upstream to fix that.<br><br>Best regards=
 (and a prosperous 2012!)<br>Frans<br>

--14dae9cc96881feed204b58af924--
