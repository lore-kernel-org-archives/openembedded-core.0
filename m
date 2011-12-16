Received: from bluegiga.fi ([194.100.31.45] helo=darkblue.bluegiga.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Lauri.Hintsala@bluegiga.com>) id 1RbSzk-0005NX-0U
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 09:18:20 +0100
Received: from [10.1.1.28] ([10.1.1.28]) by darkblue.bluegiga.com with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 16 Dec 2011 10:11:22 +0200
Message-ID: <4EEAFD28.1060609@bluegiga.com>
Date: Fri, 16 Dec 2011 10:11:20 +0200
From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAMvUbCzceL3owJH51JnUYYC90ExEHkbEOcd4887sjWAKEV83=A@mail.gmail.com>
In-Reply-To: <CAMvUbCzceL3owJH51JnUYYC90ExEHkbEOcd4887sjWAKEV83=A@mail.gmail.com>
X-OriginalArrivalTime: 16 Dec 2011 08:11:22.0755 (UTC)
	FILETIME=[4C76E530:01CCBBCA]
Subject: Re: after modifying source code in work/, how to rebuild package?
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
X-List-Received-Date: Fri, 16 Dec 2011 08:18:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

bitbake projectname -c cleanall
bitbake projectname

Cleanall command will clean the workdir and sstatefiles from sstate folder.

BR,
Lauri Hintsala


On 12/16/2011 09:55 AM, Leon Woestenberg wrote:
> Hello all,
>
>
> after modifying source code in the work directory, what is the set of
> commands to rebuild the package (from the compile stage and further)?
>
> Under classic OpenEmbedded, I removed the compile, install, package
> stages stamp files and ran bitbake. However, shared staging "broke" that
> workflow.
>
> Is there an equivalent approach with OpenEmbedded Core?  Possibly
> disabling 'sstage' on a per build, or per package basis?
>
>
> Thanks,
>
> Leon.
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


