Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C064F770CD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 12:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0UC6WM9009766; Sat, 30 Jan 2016 12:06:32 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zjFSXmzgTBZR; Sat, 30 Jan 2016 12:06:32 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0UC6T3l009762
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 30 Jan 2016 12:06:30 GMT
Message-ID: <1454155589.27087.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, akuster808 <akuster808@gmail.com>
Date: Sat, 30 Jan 2016 12:06:29 +0000
In-Reply-To: <CA+chaQcaWoZE_Cru1YZGd+AahFx7y_jBapZFG9rxuKcJrE=aXg@mail.gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
	<20160121115752.GA2603@jama> <20160127113311.GA2574@jama>
	<56AC2396.8030707@gmail.com>
	<CA+chaQcaWoZE_Cru1YZGd+AahFx7y_jBapZFG9rxuKcJrE=aXg@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/20] Dizzy-next pull request 2016-1
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
X-List-Received-Date: Sat, 30 Jan 2016 12:06:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2016-01-30 at 10:08 +0100, Martin Jansa wrote:
> > that was a patch from the patch queue and affect glibc below 2.21
> so
> 
> glibc/wscanf: CVE-2015-1472
> 
> looks like better subject
> 
> > Dizzy 1.7.4 is  not planned yet.
> 
> I don't care about point releases, I care only about contents of
> release branch, can it be merged to dizzy branch?

I was hoping the branch would get corrected so I could then just pull
the correct commits. I suspect Armin didn't realise I was waiting for
that.

In the interests of expedience, I've reworded that commit and merged
the branch.

There are a couple of tweaks that would make things easier for me to
take these:

a) Could you in the 00/XX series header in future confirm you've
checked and that these issues are addressed in the later stable
branches? I do worry that for example there may be unaddressed issues
in fido.

b) If you could share an oe-core contrib branch with these in, it does
make it easier for me to merge them. I can deal with that comparatively
easily though.

I have merged this to dizzy though.

Cheers,

Richard




