Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S9lzJ-0006iM-1g
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 00:27:41 +0100
Received: by iaag37 with SMTP id g37so9969429iaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 16:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=nLHsp9PuTQuNTFOH3YMeRVi9cIuN0QWyFZ3NVOkTUp4=;
	b=SdjV2fffkTkNO5ytn7Umv8Zj26TMSoB4bTDEcms3VctdPkDMbas6Ql/QLKT+OXRozg
	OR2c5ueZrYlxDN5eN+N9oYJ7bVta5kTzHr/n/qMJPz7mR7ccmqW1BKg6SiqAd2dZZ2Bi
	rgb3UwAChKnpBWj3HYN1MCLWWgNN4auI+IqX2Jpxa6m6uH0RIWHU9cHgUmDDdCHot6xm
	tJO6Mjj0ktAalCS/jGo8vENzTjaGMk2o0tMwDbJge7OI9EyRNfAEhX2VcRxSmn2+5zON
	7OFxE81zpEzSSn4VnHRP43p7nwqKe9a0ETV26qBWaH3Ml8XVIj8uGjeH82TMRob77odK
	8IFQ==
MIME-Version: 1.0
Received: by 10.42.159.201 with SMTP id m9mr7889264icx.32.1332199128757; Mon,
	19 Mar 2012 16:18:48 -0700 (PDT)
Received: by 10.42.75.137 with HTTP; Mon, 19 Mar 2012 16:18:48 -0700 (PDT)
Date: Tue, 20 Mar 2012 00:18:48 +0100
Message-ID: <CALbNGRSm2KV_RsV+rR4hFNcEg7Oi5Z57N1nGXS73Z17G6gqS1g@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Debugging with gdb
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
X-List-Received-Date: Mon, 19 Mar 2012 23:27:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

midori crashes with segmentation fault since a while (0.4.3 & 0.4.4).
To understand why I would like to start a gdb remote debug session. In
the past I prepared the image in the following way to get as much
libraries as possible compiled with -O0 since I do not know which
component might be responsible:

1. clean all tmp dirs
2. build all recipes where -O0 is not wanted
(u-boot/kernel/gdb/gdb-cross) or not possible (eglibc/lttng-ust)
3. added in local.conf: 'SELECTED_OPTIMIZATION = "${DEBUG_OPTIMIZATION} -O0'
4. build image

This sequence does not work anymore since the change in local.conf
causes most (all?) recipes to rebuild which crashes at least at
eglibc.

I am running a bit out of ideas to get this done. The only solution I
see is a minimum optimization passed in the recipe together with 3.
and build from scratch.

Comments / better ideas?

Andreas


