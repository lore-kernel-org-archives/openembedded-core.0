Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7C671F1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 08:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1P8b0lg029622; Wed, 25 Feb 2015 08:37:00 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uiH6jzNR6h0N; Wed, 25 Feb 2015 08:37:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1P8altT029618
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Feb 2015 08:36:59 GMT
Message-ID: <1424853407.26813.29.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 25 Feb 2015 08:36:47 +0000
In-Reply-To: <alpine.LFD.2.11.1502250320080.23957@localhost>
References: <alpine.LFD.2.11.1502250320080.23957@localhost>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: on current linux distros, what are potential candidates for ASSUME_PROVIDED?
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
X-List-Received-Date: Wed, 25 Feb 2015 08:37:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-02-25 at 03:25 -0500, Robert P. J. Day wrote:
>   for the sake of reducing build time in the classroom, what are some
> of the potential (and relatively safe) candidates to add to
> ASSUME_PROVIDED for a build from scratch?

This path is fraught with danger to be honest. There are some things
which are "safe" like subversion and git but they don't make that much
difference to a build and there are not as many as you'd think.

The biggest difference you can make is an sstate cache you share amongst
the pupils. The time is spent:

a) building gcc
b) building libc
c) building gettext
d) building glib

each of these is a bottle neck which then opens up a new set of targets
as none of them are ASSUME_PROVIDED material.

Cheers,

Richard



