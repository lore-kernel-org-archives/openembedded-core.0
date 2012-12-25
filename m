Received: from mail-qa0-f48.google.com ([209.85.216.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1Tnaba-0002Q1-K8
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Dec 2012 20:56:03 +0100
Received: by mail-qa0-f48.google.com with SMTP id l8so5340612qaq.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Dec 2012 11:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=e/7c7NgrsjX/FjludEj5u6EhT0owm38hRDxkZIopGFE=;
	b=qzsDf+iPPQWfLO7++hK5KyrTzRzCbqbU0Qra28b8OULAWTLSkoqkoz2G1GxdNfmO2b
	AvWHvF8Nw5ug+y8KYxBOqs3Ka/jjIwO0cbr8oB/QE8yl8UdwnTCpQ6csUl+5DL/fEbDd
	lHQ4g6OpSkyjlPpGSE4PDNG+OXKqA3kP2+DCTQ3OVrGv4pGtRFruaach7btN9ZFJ+ASs
	wu2Gz+p9Y0+I/z4zMFd7tuE5rtC7iM8MvtiQ5k72VaSCrYHii24g7z01BllvHjcK8FJz
	6AIRaKnYArfWau7SMweUNI9VIx/u0MXo53v1Go77mCJSXqWtQIgALtJdN7G/OFkMH7gO
	iGJA==
MIME-Version: 1.0
Received: by 10.224.202.1 with SMTP id fc1mr11847696qab.60.1356464470549; Tue,
	25 Dec 2012 11:41:10 -0800 (PST)
Received: by 10.49.106.5 with HTTP; Tue, 25 Dec 2012 11:41:10 -0800 (PST)
Date: Tue, 25 Dec 2012 21:41:10 +0200
Message-ID: <CADV-EXHanq4o_KSkqL8uo9_yGvrd7aMr+cdWN6SBDe28AFYZDQ@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: List of installed ipk packages on image is empty
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
X-List-Received-Date: Tue, 25 Dec 2012 19:56:03 -0000
Content-Type: multipart/alternative; boundary=20cf3005df16eae44404d1b27e8f

--20cf3005df16eae44404d1b27e8f
Content-Type: text/plain; charset=ISO-8859-1

Hi!

I built an image based on *.ipk packages.
But when I booted with new image first time and executed command "opkg
list-installed" I got nothing on output.
Seems that opkg cache is empty.

Recently I used *.deb packages and there were no such problems.

-- 
Best regards,
Yevhen

--20cf3005df16eae44404d1b27e8f
Content-Type: text/html; charset=ISO-8859-1

Hi!<div><br></div><div><div>I built an image based on *.ipk packages.</div><div>But when I booted with new image first time and executed command &quot;opkg list-installed&quot; I got nothing on output.</div><div>Seems that opkg cache is empty.</div>
</div><div><br></div><div>Recently I used *.deb packages and there were no such problems.</div><div><br></div><div>-- <br>Best regards,<br>Yevhen
</div>

--20cf3005df16eae44404d1b27e8f--
