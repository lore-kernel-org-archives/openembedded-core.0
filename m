Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RfdwP-0002lM-35
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Dec 2011 21:48:09 +0100
Received: by vcbf1 with SMTP id f1so8705370vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2011 12:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=e0SyD8v/u0ZeTGqckOlsE3rzj1F5lflzMZqXKUpsp3w=;
	b=KRYuUWjDGYKL4Rb81pLvSGVd+n6iV+DHolNZHEAtlPQGND3+VmgQ44WDpIPu+hLocc
	USGe2CIaijsw0vuN6pFlI/SBCXjRQHehhyn962oznINzUbrlGNZPxAPUjPfhJAksn4lI
	th0DIkM6ZcMWbl1mWqWw1An8QUwPo3WH8phAI=
MIME-Version: 1.0
Received: by 10.220.149.205 with SMTP id u13mr16974735vcv.45.1325018451034;
	Tue, 27 Dec 2011 12:40:51 -0800 (PST)
Received: by 10.52.160.137 with HTTP; Tue, 27 Dec 2011 12:40:50 -0800 (PST)
In-Reply-To: <1325018118-30223-2-git-send-email-fransmeulenbroeks@gmail.com>
References: <1325018118-30223-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1325018118-30223-2-git-send-email-fransmeulenbroeks@gmail.com>
Date: Tue, 27 Dec 2011 21:40:50 +0100
Message-ID: <CACW_hTZCU6Wa7XjET3AbUUSbF_ZS95SFUx70gJybFkWSTmympA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 27 Dec 2011 20:48:09 -0000
Content-Type: multipart/alternative; boundary=f46d043c822c18428f04b518e686

--f46d043c822c18428f04b518e686
Content-Type: text/plain; charset=ISO-8859-1

Forgot to mention this but it could be decided to make a separate recipe
for the env utils (like there is for mkimage).

And if you are interested in the reason why HOSTCC is being used to compile
fw_printenv and friends:
read this thread:
http://old.nabble.com/-U-Boot---PATCH-1-4--tools%3A-enable-img2srec-for-%22all%22-target-td29440508.html#a29440510

Enjoy!
Frans

--f46d043c822c18428f04b518e686
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Forgot to mention this but it could be decided to make a separate recipe fo=
r the env utils (like there is for mkimage).<br><br>And if you are interest=
ed in the reason why HOSTCC is being used to compile fw_printenv and friend=
s:<br>
read this thread: <a href=3D"http://old.nabble.com/-U-Boot---PATCH-1-4--too=
ls%3A-enable-img2srec-for-%22all%22-target-td29440508.html#a29440510">http:=
//old.nabble.com/-U-Boot---PATCH-1-4--tools%3A-enable-img2srec-for-%22all%2=
2-target-td29440508.html#a29440510</a><br>
<br>Enjoy!<br>Frans<br>

--f46d043c822c18428f04b518e686--
