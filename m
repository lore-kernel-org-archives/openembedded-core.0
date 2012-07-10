Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SoSyw-0000M6-9K
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 07:27:30 +0200
Received: by eekc50 with SMTP id c50so63586eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 22:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=fB/9Mj9bv2wxKj7S9u7PdRqX1DcTjFVDUkKbO5ovo04=;
	b=DqhAsjaLgcccTTqpBYp/tNew9R9CpLrlTeElDujXK+q71J89kg/29QctRA2mdMFL72
	69pkYF/VberiwDI3klOQu6ktwlihv4Gcj+Lx/sWmu5cHhNtcdbJ7mfDpVD7r6avwREn2
	2l2sBsuA1RKtDuL+bbJfYhydGWO7BI3ZQAQKBBDlgwA8tm9OGRHdNm5JUIkII0WgjmC0
	UI9L0hu3UMn8bo/ZznvmD/saP4DYug+bpxjqMxiKSEsOgllb/E3xACwswq8cVdCea6d9
	Xl1gMG5PhhKuw2jjrPnBJA6RRCiOBsF7wjcLj1XpDBSJ3rBqnIIqJigjn82g4JnsWUDk
	tECA==
Received: by 10.14.95.138 with SMTP id p10mr10421907eef.110.1341897380142;
	Mon, 09 Jul 2012 22:16:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 9 Jul 2012 22:15:49 -0700 (PDT)
In-Reply-To: <1341894563-32675-2-git-send-email-msm@freescale.com>
References: <1341894563-32675-1-git-send-email-msm@freescale.com>
	<1341894563-32675-2-git-send-email-msm@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jul 2012 22:15:49 -0700
Message-ID: <CAMKF1spJBYKoOYnBzFRDZ3ByfY9ifewx8i46e7ifuP=haLuZrw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] libgomp: add libgomp (openmp) library, and build for powerpc targets by default
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
X-List-Received-Date: Tue, 10 Jul 2012 05:27:30 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 9, 2012 at 9:29 PM, Matthew McClintock <msm@freescale.com> wrote:
> +
> +       # clean up extra libgomp files
> +       if [[ "${RUNTIMETARGET}" =~ "libgomp" ]]; then

This seems bashism.

if could just check the valued of $d in the loop instead something like


> +               rm -rf ${D}${datadir}/info/libgomp.info ${D}${datadir}/info/dir
> +               rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
> +               rmdir --ignore-fail-on-non-empty -p ${D}${datadir}/info
> +       fi
> +


