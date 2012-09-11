Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBIiA-0007zr-UC
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 07:08:36 +0200
Received: by iebc11 with SMTP id c11so208257ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 21:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=FM5HLx70l/z95JLMD8oao7Dx7Y8/6ZliDwBsywSlb3I=;
	b=YFJCHliH6Sx4h1WxwRwKUjkUYbyA2MCzjkO8wcFzwYhYuF2gqA/bvERjTWDfekxE/i
	1sfCTuEBrWGKiImqCadUeGBWNI/sfzJr1AiVwo9cBsgU8MNLqZTeY02Fdc9NADMlr89Y
	tv/+RR2twYOFAckdhBCt6S0H5/NNG4qwJXkVg17E0GiJX++Bh9uk3L4XA2tHVNIN109x
	mJZU9YbdYpwkAIAikJk3gF2oLd5K6S1YljhQl8AaWdlK85ek2UX4zV3HrjcvRJCNvj0T
	z0rrJ698El0UE5MMQsBLg0EZpaIVe/u4UVlXQC6AxmSoiXhpp8YVjHyj0+BlgXNEQAkZ
	Z3lg==
Received: by 10.50.7.210 with SMTP id l18mr2337716iga.26.1347339364198;
	Mon, 10 Sep 2012 21:56:04 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id aa4sm616382igc.15.2012.09.10.21.56.02
	(version=SSLv3 cipher=OTHER); Mon, 10 Sep 2012 21:56:03 -0700 (PDT)
Date: Mon, 10 Sep 2012 21:55:59 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20120911045557.GF2980@sakrah.homelinux.org>
Mail-Followup-To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
References: <cover.1347300360.git.bruce.ashfield@windriver.com>
	<cc8bfedabfe61a0e06a8a8199f8c0fce4738260a.1347300360.git.bruce.ashfield@windriver.com>
	<20120911045038.GE2980@sakrah.homelinux.org>
	<504EC385.6060008@windriver.com>
MIME-Version: 1.0
In-Reply-To: <504EC385.6060008@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 05:08:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/09/12 00:52), Bruce Ashfield wrote:
> On 12-09-11 12:50 AM, Khem Raj wrote:
> >On (10/09/12 14:11), Bruce Ashfield wrote:
> >>Updating to 3.4.10 which has been soaking for a bit now, as well
> >>as picking up the following meta commits from Tom Z:
> >
> >would it also need bumping linux-libc-headers too ?
> 
> There's no new interfaces in the -stable updates, so there's no reason
> to bump. I typically elect to jump to a 3.x.0 and leave it there, but
> we had an interim bump that I wouldn't have done .. so we sit at 3.4.3
> at the moment (which is still fine).

OK. Next question is, do stable updates get changes such that we need to
bump the linux-libc-headers ?


