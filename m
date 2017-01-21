Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2B87F605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2017 11:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0LBibLo026866; Sat, 21 Jan 2017 11:44:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kGH4vlkrlf_O; Sat, 21 Jan 2017 11:44:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0LBiWMt026860
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 21 Jan 2017 11:44:34 GMT
Message-ID: <1484999072.9391.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pascal Bach <pascal.bach@siemens.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 21 Jan 2017 11:44:32 +0000
In-Reply-To: <1484817397-7308-1-git-send-email-pascal.bach@siemens.com>
References: <1484817397-7308-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: Passing additional data from packages to be used during image creation
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
X-List-Received-Date: Sat, 21 Jan 2017 11:44:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-01-19 at 10:16 +0100, Pascal Bach wrote:
> I would like to pass some additional data generated during the
> creation of a package to the image creation step.
> The idea is to use this data to generate a more detailed manifest of
> what is included in the image. In the concrete case
> I would like to pass a list of required copyright files that need to
> be checked for during image creation.
> 
> My current approach is to add this list as a new variable COPYRIGHTS
> to the pkgdata of each package.
> Using the image manifest to determine the package this allows me to
> compile a list of all required copyrights.
> 
> The following patch allows to add extra variables to pkgdata and thus
> allows to pass additional data
> 
> - [PATCH] package.bbclass: allow additional variables to be added to
> 
> Is this a valid approach or did a miss a simpler way to access any
> package data during image creation?

I'm curious if adding something to PACKAGEVARS would work or if not,
why not?

Cheers,

Richard

