Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoC1c-0002ve-AV for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 12:16:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72ACFd3014519
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 11:12:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12443-08 for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2011 11:12:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72AC6MX014513
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 11:12:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF181E0B@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF181E0B@MBX20.4emm.local>
Date: Tue, 02 Aug 2011 11:11:52 +0100
Message-ID: <1312279912.2344.574.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: erratic failure of pseudo
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Aug 2011 10:16:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-02 at 07:28 +0000, James Limbouris wrote:
> Hi,
> 
> I've just switched to oe-core from -dev, and I'm finding that my root
> images are showing incorrect permissions on files, randomly. From one
> build to the next, different subsets of files and folders end up owned
> by 1000:1000, instead of root:root. They aren't strictly grouped by
> package - just random files, different every time.
> 
> Has anyone else noticed this behaviour? Does anyone have any advice on
> how to go about debugging? It might help to look at the pseudo db, and
> see if the permissions are in there - can anyone tell me where it is?
> I find an empty pseudo folder in the work folder after do_rm_work, but
> it is not there if I do a bitbake -c build image-xxx.
>  

I'd work backwards with this. Check the owners of the files in the
packages, then that either points at the packages themselves or the
rootfs step. I'd also disable rm_work whilst debugging this since it
deletes a lot of the info you might want to use to debug it...

There is the PSEUDO_DEBUG=x environmental variable which can help with
pseudo debugging too...

Cheers,

Richard



