Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Qws04-0002Vw-N4
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 10:42:52 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 9E9771660593; Fri, 26 Aug 2011 02:38:04 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id D2AC11660590;
	Fri, 26 Aug 2011 02:38:03 -0600 (MDT)
Message-ID: <4E575B6B.2030205@mlbassoc.com>
Date: Fri, 26 Aug 2011 02:38:03 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313993805.git.wenzong.fan@windriver.com>
	<1313999777.7620.13.camel@localhost.localdomain>
	<1314325642.1332.54.camel@localhost.localdomain>
	<1314326849.1332.57.camel@localhost.localdomain>
In-Reply-To: <1314326849.1332.57.camel@localhost.localdomain>
Subject: Re: new feature? (for "DL_DIR")
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
X-List-Received-Date: Fri, 26 Aug 2011 08:42:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011-08-25 20:47, Ni Qingliang wrote:
> I found that: for every vcs (e.g. git) package, except a directory in
> "git" or "git2", there is another file "*.tar.gz" in the downloads dir.
>
> but for my own package, e.g linux 2.6.35 for i.mx28, only the directory
> under "git2", I can't found the tar.gz file in downloads, why?
>
> On Fri, 2011-08-26 at 10:27 +0800, =E5=80=AA=E5=BA=86=E4=BA=AE wrote:
>> thanks again, I have setup an internal package server (http), and the
>> client can use it in poky.
>>
>> but I have another problem for git svn( for the .gz .bz2 package, no
>> problem), the source code of the packages using git/svn/hg are
>> directories in the server, does the client can use it???
>>
>> On Mon, 2011-08-22 at 15:56 +0800, =E5=80=AA=E5=BA=86=E4=BA=AE wrote:
>>> Do we can assign all package be downloaded from the same path?
>>>
>>> I want setup one internal server to store the files in upstreamsource=
s,
>>> and all developer's PC use it but not the original package address.

Set this in your .conf
   BB_GENERATE_MIRROR_TARBALLS ?=3D "1"

When you use 'own-mirrors', you'll end up with a "downloads" directory
in your build tree.  This will include symbolic links to files already
found in your cache, as well as any files newly downloaded during a
build.  You probably want to push out the new files to your cache from
this downloads directory.

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


