Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 373386FEE0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 08:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1C8HRug008612; Fri, 12 Feb 2016 08:17:27 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id muLTlp6g43uT; Fri, 12 Feb 2016 08:17:26 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1C8HNMe008591
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 12 Feb 2016 08:17:25 GMT
Message-ID: <1455265043.16142.267.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 08:17:23 +0000
In-Reply-To: <1455249507-30989-1-git-send-email-gary@mlbassoc.com>
References: <1455249507-30989-1-git-send-email-gary@mlbassoc.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] ffmpeg: Add -dbg packages for all libraries
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
X-List-Received-Date: Fri, 12 Feb 2016 08:17:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-02-12 at 04:58 +0100, Gary Thomas wrote:
> Improve the packaging of the libraries built by this recipe.  These
> are created using special code in the recipe and the debug (-dbg)
> packages were not being created.  Adding these packages allow the
> libraries in question to be debugged using GDB.

This isn't really policy, the policy is one -dbg package per recipe and
that is how the dependency chains and dbg-pkgs in IMAGE_FEATURES work
and so on.

I'm not arguing this is perfect, its not and I would like to see it
change. It is how it all works today though. Is there a pressing reason
we need to do something different here?

Cheers,

Richard

