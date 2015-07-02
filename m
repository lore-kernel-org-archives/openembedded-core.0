Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C012E73231
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 15:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t62Frgqo031839; Thu, 2 Jul 2015 16:53:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VqVPljt2ukv5; Thu,  2 Jul 2015 16:53:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t62FrUid031831
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 2 Jul 2015 16:53:41 +0100
Message-ID: <1435852410.7287.349.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Thu, 02 Jul 2015 16:53:30 +0100
In-Reply-To: <55940F38.9060603@linux.intel.com>
References: <1435587050-18517-1-git-send-email-sgw@linux.intel.com>
	<55940F38.9060603@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tune-i586-nlp: Add new tune file to support Quark/X1000 CPU
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
X-List-Received-Date: Thu, 02 Jul 2015 15:53:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-07-01 at 09:03 -0700, Darren Hart wrote:
> > +# Quark tune feature
> > +AVAILTUNES = "i586-nlp-32"
> > +TUNE_FEATURES_tune-i586-nlp-32 = "${TUNE_FEATURES_tune-x86} i586-nlp"
> > +BASE_LIB_tune-i586-nlp-32 = "lib"
> > +TUNE_PKGARCH_tune-i586-nlp-32 = "i586-nlp-32"
> > +PACKAGE_EXTRA_ARCHS_tune-i586-nlp-32 = "i586-nlp-32"
> > 
> 
> I believe this explicit assignment, instead of appending to tune-i586,
> addresses the issue Phil raised?

Correct, this looks much better and has been merged.

Cheers,

Richard


