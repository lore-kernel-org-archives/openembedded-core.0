Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C9D8F6072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 08:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4J82kDQ023845; Thu, 19 May 2016 09:02:46 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aSbCi3_dZSjs; Thu, 19 May 2016 09:02:46 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4J82h2a023842
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 May 2016 09:02:44 +0100
Message-ID: <1463644963.4578.91.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 09:02:43 +0100
In-Reply-To: <1463643393.4578.90.camel@linuxfoundation.org>
References: <c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
	<85edcbf217242f13d1fa76bcf8258c153fc89db9.1463546289.git.raj.khem@gmail.com>
	<1463643393.4578.90.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/5] systemd: Create missing sysusers offline
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
X-List-Received-Date: Thu, 19 May 2016 08:02:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-05-19 at 08:36 +0100, Richard Purdie wrote:
> On Tue, 2016-05-17 at 21:40 -0700, Khem Raj wrote:
> > Some system users which are needed by systemd components were
> > missing
> > create these users knobbed with relevant packageconfig
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/systemd/systemd_229.bb | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> This looks better but there do appear to still be problems:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd
> /b
> uilds/776/steps/Running%20Sanity%20Tests/logs/stdio
> 
> and
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd
> /b
> uilds/776/steps/Running%20Sanity%20Tests_2/logs/stdio


Just seen your other email. I'll queue the revised patch in the next 
-next build.

Cheers,

Richard

