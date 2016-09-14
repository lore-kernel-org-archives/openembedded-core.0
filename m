Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DB4DF771C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 09:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8E9hDqY032449; Wed, 14 Sep 2016 10:43:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8kMyd2w9LRSv; Wed, 14 Sep 2016 10:43:13 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8E9h8MF032443
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 14 Sep 2016 10:43:10 +0100
Message-ID: <1473846188.7207.57.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 10:43:08 +0100
In-Reply-To: <37af20ca-62f9-7308-0b97-6ba6c46dafb1@linux.intel.com>
References: <3230301C09DEF9499B442BBE162C5E48ABE3BA3B@SESTOEX04.enea.se>
	<37af20ca-62f9-7308-0b97-6ba6c46dafb1@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: CVE-2016-3116: dropbear: X11 forwarding input not validated properly
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
X-List-Received-Date: Wed, 14 Sep 2016 09:43:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-09-14 at 12:06 +0300, Alexander Kanavin wrote:
> On 09/14/2016 11:49 AM, Sona Sarmadi wrote:
> > 
> > https://matt.ucc.asn.au/dropbear/CHANGES
> > .....
> > 2016.72 - 9 March 2016    <<<<<<< dropbear version this CVE has
> > been fixed
> > - Validate X11 forwarding input. Could allow bypass of
> > authorized_keys command= restrictions,
> >   found by github.com/tintinweb. Thanks for Damien Miller for a
> > patch. CVE-2016-3116
> > 
> > 2015.71 - 3 December 2015  <<<< dropbear version in krogoth
> It's *probably* this one. The commit messages in dropbear repository
> are 
> *amazingly* vague and unprofessional.
> 
> https://secure.ucc.asn.au/hg/dropbear/rev/a3e8389e01ff
> 
> That said, I vote for updating to the version that comes with the
> fix. 
> Backporting fixes should not be the default in the stable yocto 
> releases; we should trust the upstream more.

Taking that argument to the extreme, we should update all versions in
the "stable" release to the latest to ensure we get all the fixes. At
that point, it becomes no different to master and its not the
definition of "stable" which most people want to use.

So whilst I do take the point and in some cases it does make sense, it
doesn't really make sense to have that as the default policy.

In this case, its a question of what else changed in dropbear between
these versions. Were there a ton of new features or was it just
bugfixes? How much risk of other problems is there?

Cheers,

Richard

