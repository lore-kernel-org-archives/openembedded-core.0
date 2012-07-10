Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SoT3c-0000Pq-4x
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 07:32:20 +0200
Received: by eekc50 with SMTP id c50so64198eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 22:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=pUmBQJJcN46Z2Uj9gC0t6I11UptyjxS9vgC45+o/kXQ=;
	b=LjsVImJIQfAm/B3sb4pjqO1MRYkUxg5x2jENdH4fFermAREuoGqTdhDYOEtEAnE5nI
	djB7RxaBzR1F2TDhuXSQxAG+R7hq5OM6/E9bZUHsKTHrxwp9FD+Y7EhTLhY51dTpkr87
	J1qyUJJxgXGFpJVQcA50x4HZ+a9RTDPbNtd49RxIK4fWv3ogsSb+I/+7ZrF9PBp6ApCa
	t42eCKA2qD6q21C1T5gA/+RhiLCl7kMVrwbOaG8OuTlLszcTjz2+rN4itfN9rN4zz22M
	AucjiPWU2KiivA4k/hvEep/eahFEVXbiqBVqkAQPcLZcefmOkJuCV6GbbTo+rvjHixR5
	GACQ==
Received: by 10.14.37.76 with SMTP id x52mr4423819eea.102.1341897670179; Mon,
	09 Jul 2012 22:21:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 9 Jul 2012 22:20:39 -0700 (PDT)
In-Reply-To: <45d7793f0e3092f3ba4e03c52195ea13179ad1d8.1341850982.git.nitin.a.kamble@intel.com>
References: <cover.1341850982.git.nitin.a.kamble@intel.com>
	<8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
	<45d7793f0e3092f3ba4e03c52195ea13179ad1d8.1341850982.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jul 2012 22:20:39 -0700
Message-ID: <CAMKF1sq3i3=Eo4NU9=WgdJHsqGw1vo5qZPJ=B+KPL0xsX4FDtQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 15/15] pango: fix dependencies to avoid build issue
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
X-List-Received-Date: Tue, 10 Jul 2012 05:32:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 9, 2012 at 9:26 AM,  <nitin.a.kamble@intel.com> wrote:
>
> | /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.7.1/ld: cannot find -lelf
> | collect2: error: ld returned 1 exit status

I wonder why this is not seen generally. Is there something in your
build box thats triggering pango to ask for libelf ?


