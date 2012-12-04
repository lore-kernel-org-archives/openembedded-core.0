Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TfoGm-0006GI-P5 for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 09:54:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB48e2Ks004852;
	Tue, 4 Dec 2012 08:40:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01558-09; Tue,  4 Dec 2012 08:39:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB48dukk004842
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Dec 2012 08:39:57 GMT
Message-ID: <1354610385.25268.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>
Date: Tue, 04 Dec 2012 08:39:45 +0000
In-Reply-To: <50BD667C.6040005@windriver.com>
References: <cover.1354084523.git.Qi.Chen@windriver.com>
	<22684c7fc852e5c43d241e760fe8e1af7095f9ff.1354084523.git.Qi.Chen@windriver.com>
	<50BD667C.6040005@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] autotools.bbclass: use relative path for acpaths whenever possible
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
X-List-Received-Date: Tue, 04 Dec 2012 08:54:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-12-04 at 10:57 +0800, ChenQi wrote:
> Hi Richard,
> 
> I saw that this series of patches have been merged except this one.
> Is there any problem with this patch?
> 
> The thing is, if we don't fix autotool.bbclass like this, building 
> coreutils will fail with a long TMPDIR (bug#2766). I tried to build 
> coretuils with TMPDIR of 200 char length, it failed.

I know but I'm rather unhappy having the autotools code work two rather
different ways depending on the number of configure scripts a project
has, it all seems like a bit of a hack :(

I don't like the fix but I haven't found time to propose any
alternative...

Cheers,

Richard



