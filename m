Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED73601F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6S9bFpj020011; Tue, 28 Jul 2015 10:37:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rJZOBQOEg9Ao; Tue, 28 Jul 2015 10:37:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6S9axhC020001
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 28 Jul 2015 10:37:10 +0100
Message-ID: <1438076219.24778.4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Jul 2015 10:36:59 +0100
In-Reply-To: <CAJTo0LaAkEcLK=7Bzne+N8fQa2+KsA_EbuK4r1syEjR7YVcMbw@mail.gmail.com>
References: <55B734EA.8050903@windriver.com>
	<CAJTo0LaAkEcLK=7Bzne+N8fQa2+KsA_EbuK4r1syEjR7YVcMbw@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: About upgrade a package to a Release Candidate version (RCX)
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
X-List-Received-Date: Tue, 28 Jul 2015 09:37:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-07-28 at 09:09 +0100, Burton, Ross wrote:
> On 28 July 2015 at 08:53, Robert Yang <liezhi.yang@windriver.com>
> wrote:
>         Is it a good idea to upgrade a package to a Release Candidate
>         version,
>         such as RC1, RC2 and so on ? I think no because:
>
>         1) Maybe the RC version is not stable enough.
>         2) Maybe the package's final version doesn't release when
>            oe-core/meta-oe releases, I think that use an older but
>         stable
>            version is better than new RC version usually.
>
> In general that's true, - qemu is the obvious recent exception because
> they should be releasing before we freeze and there were major fixes
> in the RC compared to the latest stable release.
> 
Agreed. If there is a pressing reason for an RC release which gives us
more benefit than drawback, we can consider it on a case by case basis.
With QEMU and the autobuilder issues we've been seeing, we decided we're
better off being close to upstream right now.

Cheers,

Richard



