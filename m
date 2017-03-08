Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF8F777E7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 11:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v28BBQEi004318; Wed, 8 Mar 2017 11:11:26 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id foA7G0gJZItI; Wed,  8 Mar 2017 11:11:26 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v28BBN0i004301
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Mar 2017 11:11:24 GMT
Message-ID: <1488971483.22968.64.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Wed, 08 Mar 2017 11:11:23 +0000
In-Reply-To: <08203c70694442b388883c73d7f160b0@XBOX02.axis.com>
References: <1488910966-30028-1-git-send-email-richard.purdie@linuxfoundation.org>
	<08203c70694442b388883c73d7f160b0@XBOX02.axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes: Move out stale GPLv2 versions to a seperate layer
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
X-List-Received-Date: Wed, 08 Mar 2017 11:11:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-08 at 09:34 +0000, Peter Kjellerstedt wrote:
> > I'm proposing we mmove to this separate layer for 2.3 with its
> > future
> > maintinership and testing to be determined in 2.4 and beyond.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Since this has now been integrated, announcing where to find the new 
> layer might have been a good idea, as it is no longer part of Poky.

It probably would have been a good idea. There are lots of things which
"might have been a good idea" however I am somewhat limited by physical
hours in the day to do them all myself.

> For the record, the new layer can be found here:
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-gplv2/

Thank you. It was mentioned mentioned in the email to the openembedded-
architecture list and you managed to find regardless.

> You probably also want to update the information about the layer so 
> that it appears correctly on http://git.yoctoproject.org/

Indeed.

> And the layer should be added to the layer index...

Yes, it should.

Cheers,

Richard


