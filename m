Return-Path: <i.efimov@inango-systems.com>
Received: from mail.inango-sw.com (mail.inango-systems.com [213.136.71.184])
	by mail.openembedded.org (Postfix) with ESMTP id 1BAB36058C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 17:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 004317A24D6;
	Sun,  3 Mar 2019 19:57:46 +0200 (IST)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ddZb-CjqzIVz; Sun,  3 Mar 2019 19:57:44 +0200 (IST)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 8320A7A24D7;
	Sun,  3 Mar 2019 19:57:44 +0200 (IST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com 8320A7A24D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1551635864;
	bh=9q+tPSIaRuytDaeVbIQxQ6xarshhMIPzft35JA8gRZ4=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=SWqpvNsPC4tLpq6Ac1z093QTJS67/aI6NDj5ACSmE85L+40JUtlliAdt82ovwyKOF
	DONCXYMQ8RJ8dTE10GQtigJ2ZVbz20SnJHnKRPBdlDHmEEvJ9kcgWt36O93CaFcOwV
	yMomOCttk8CQtDc8QlW4Oa3Svuqzk5uppyer0o9n3mPkaga6jPr4nN3IaOCDPVTICg
	f9XpFjEpuiFcILqas+ojkgXSzLeQjMPXf+96SgrfWn1VBF7yGLCNNgVlf8QNq6SbL3
	okBXRwunB9KE4oAfw2Sgvroqipk2WMcOrZW8sbM2rbgVb4LhK1GENQPXnLQLEAr58E
	IPrym5yaLY9tw==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id L9PfVS5Pgc-r; Sun,  3 Mar 2019 19:57:44 +0200 (IST)
Received: from mail.inango-sw.com (mail.inango-sw.com [172.17.220.3])
	by mail.inango-sw.com (Postfix) with ESMTP id 4D0FF7A24D6;
	Sun,  3 Mar 2019 19:57:44 +0200 (IST)
Date: Sun, 3 Mar 2019 19:57:42 +0200 (IST)
From: Ivan Efimov <i.efimov@inango-systems.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <1506785607.339541.1551635862625.JavaMail.zimbra@inango-systems.com>
In-Reply-To: <CANNYZj9z-899=vC9upcBMX2azcKuNvr4qOMF6E6Hcw9+FtpVwA@mail.gmail.com>
References: <20190303173808.12198-1-i.efimov@inango-systems.com>
	<CANNYZj9z-899=vC9upcBMX2azcKuNvr4qOMF6E6Hcw9+FtpVwA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [172.17.220.3]
X-Mailer: Zimbra 8.8.9_GA_3006 (ZimbraWebClient - FF65 (Linux)/8.8.9_GA_3006)
Thread-Topic: perl, do_install_ptest_base: add "--" into "tar" command line
Thread-Index: z3kFkfxhlP5E2NRlQG2qabVpO8FRTw==
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2] perl, do_install_ptest_base: add "--" into "tar" command line
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
X-List-Received-Date: Sun, 03 Mar 2019 17:57:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Alex,

Do you mean "master" branch of OE-core?

   I tried to reproduce the same bug on "master" branch, but fail.
   I know, that the same bug with "--" missing in "tar" command line is present in "master" branch,
      but if it does not prevent success compilation, so i'm not sure, that my patch will be accepted.

Best regards,
Ivan

----- Original Message -----
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: "Ivan Efimov" <i.efimov@inango-systems.com>
Cc: "OE-core" <openembedded-core@lists.openembedded.org>
Sent: Sunday, March 3, 2019 10:40:43 PM
Subject: Re: [OE-core] [morty][PATCH v2] perl, do_install_ptest_base: add "--" into "tar" command line

On Sun, 3 Mar 2019 at 18:38, Ivan Efimov <i.efimov@inango-systems.com> wrote:
> Upstream-Status: Pending

This is used only in patches to upstream source, and so not needed here.

Alex

