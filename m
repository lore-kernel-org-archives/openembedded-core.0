Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1US7oz-0006Me-DO
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 17:29:27 +0200
Received: by mail-vc0-f169.google.com with SMTP id hx10so475940vcb.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 08:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=7ymgDllVzutABPjmzlLLAP+kfl0CQd2qwisjBluDd4o=;
	b=Dn98Swcv0rzRibdz48yM1pL5u5ZkcEakt/oNeVFQ45EUUr+GhFSWcSBLb/sIliG/XJ
	Yvyq4M4/9AuV2fEDHHhwDp1LdNGV4b1qDaj0irtxHqoBrcOR9oVxCuH9yzE2e5mleuy+
	GwY8PtCy0k4hEUXgQkCK/raKnDLY0y5tC4TtjMg63WNrHjblASq0zr0CtFX5YVyJXVoQ
	yH1DgYQV+m+D9ZbWznpYfHB1Mj/N7WEJ/0msP55p4YzUTWtLoO1MenPu0XfOlLgq7B9L
	KpsPw+eyNP4ST7Ja00ZsPkgliZpO05uoXbqWrsJw7t3COoRus+96JIHqo47WE/waaGRX
	lE0w==
X-Received: by 10.52.108.10 with SMTP id hg10mr1555965vdb.34.1366125114603;
	Tue, 16 Apr 2013 08:11:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 16 Apr 2013 08:11:34 -0700 (PDT)
In-Reply-To: <20130408190328.GC2470@jama>
References: <1365093733-31674-1-git-send-email-Martin.Jansa@gmail.com>
	<1365094008.6526.115.camel@ted>
	<20130404165547.GF1271@jama.dyndns-home.com>
	<1365115121.6526.121.camel@ted> <20130408190328.GC2470@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Apr 2013 16:11:34 +0100
Message-ID: <CAJTo0LaJpGLXC5B2L=YjvH6_8c2=FSrMy5EhH7Z44FJonRkCTg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmMZmIk21+9e24AHvjCF2Hv8OlyIM6ksNXxkwISH9Tra4mjF2X6LlS6Fzvl49r/0BmfcP3l
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd: set INHIBIT_UPDATERCD_BBCLASS without sysvinit in features
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
X-List-Received-Date: Tue, 16 Apr 2013 15:29:47 -0000
X-List-Received-Date: Tue, 16 Apr 2013 15:29:47 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

On 8 April 2013 20:03, Martin Jansa <martin.jansa@gmail.com> wrote:
> There is also error from prerm :/
>
> //var/lib/opkg/info/dbus-1.prerm: line 3: /etc/init.d/dbus-1: No such file or directory
>
> updatercd_prerm() {
> if test "x$D" = "x"; then
>         ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> fi
> }
>
> not sure if testing update-rc.d existence like in postinst/postrm
> if type update-rc.d >/dev/null 2>/dev/null; then
> is right way, checking ${INIT_D_DIR}/${INITSCRIPT_NAME}
> existence will possibly hide some real issues...

This fragment doesn't exist with your explicit inhibit update-rc.d
patch, so this is effectively resolved.

Ross


