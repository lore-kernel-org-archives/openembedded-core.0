Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5F99A7D25F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 20:46:42 +0000 (UTC)
Received: from Marks-MacBook-Pro.local ([76.164.61.198]) (authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id x9MKkeK8015493
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Tue, 22 Oct 2019 15:46:41 -0500
To: Yann CARDAILLAC <yann.cardaillac@smile.fr>
References: <CAA984JUdZZ7d6pnpeddtSSR_XkPfxsUw-8e3AsLPjyiXzvJd0w@mail.gmail.com>
	<f9a16068-7062-b02e-0fd0-63acda2ec1ab@kernel.crashing.org>
	<CAA984JX8pNoXopjq==SvqZNJ9h=+ZR3w-+7FQo_eORH-ipF_Sw@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <ef566b98-7ba6-d8b4-157f-fa389a5b519a@kernel.crashing.org>
Date: Tue, 22 Oct 2019 15:46:39 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAA984JX8pNoXopjq==SvqZNJ9h=+ZR3w-+7FQo_eORH-ipF_Sw@mail.gmail.com>
Cc: jakub@redhat.com, yocto@yoctoproject.org,
	Romain Naour <romain.naour@smile.fr>, mark.hatle@windriver.co,
	openembedded-core@lists.openembedded.org
Subject: Re: [yocto][prelink-cross] Bug 13529 add SPDX identifier
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
X-List-Received-Date: Tue, 22 Oct 2019 20:46:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

I need to look through it further, but everything I looked at (and your comments
below) look good to me.

I'll try to get this merge soon.  (If you don't see it get merged, please ping
me.)  I'm preparing for ELC-E and am short on time right now.

--Mark

On 10/22/19 4:28 AM, Yann CARDAILLAC wrote:
> 
> 
> On Mon, Oct 21, 2019 at 4:35 PM Mark Hatle <mark.hatle@kernel.crashing.org
> <mailto:mark.hatle@kernel.crashing.org>> wrote:
> 
>     On 10/21/19 4:43 AM, Yann CARDAILLAC wrote:
>     > Hi Mark Hatle, Jakub Jelinek,
> 
>     Jakub is no longer supporting this code, but he may have valuable insights into
>     licensing.
> 
>     > I'm currently beginning the work on bug 13529:
>     >
>     > https://bugzilla.yoctoproject.org/show_bug.cgi?id=13529
>     >
>     > The purpose is to add SPDX identifier to scripts and sources.
>     >
>     > Most of the sources have licences on the sources, however some of them don't,
>     > and I've question about others :
>     >
>     > - src/sha.c do not shall it be GPLV2-or-later as most of the other?
> 
>     /* sha.c - Functions to compute the SHA1 hash (message-digest) of files
>        or blocks of memory.  Complies to the NIST specification FIPS-180-1.
> 
>        Copyright (C) 2000, 2001, 2003 Scott G. Miller
> 
>        Credits:
>           Robert Klep <robert@ilse.nl <mailto:robert@ilse.nl>>  -- Expansion
>     function fix
>        NOTE: The canonical source of this file is maintained in GNU coreutils.
>     */
> 
>     The last line is the key.  This apparently came from GNU coreutils.
> 
>     >From the SCM logs, sha.c was introduced in approx 2003-07-01 from what it looks
>     like.  So it's a pretty old version.  You will need to do some detective work,
>     and find older versions of coreutils until you find the one that corresponds to
>     the code that was checked in.  Start back in 2003 and work backwards as
>     necessary.  (The version that matches to the original 2003-07-01 should be the
>     reasonable license to use.)
> 
> 
> Ok I found it ! https://github.com/coreutils/coreutils/blob/v4.5.8/lib/sha.c
> 
> from : https://github.com/coreutils/coreutils/blob/v4.5.8/COPYING it looks like
> it's only GPLV2
> 
> 
>     > - how to licence m4/libelf.m4 ? I'd prefer you to tell me exactly what to
>     add in
>     > order to avoid errors
> 
>     The original version of the m4/libelf.m4 was introduced 2001-09-27.  It appears
>     to me that it was written as part of the prelinker, so would be under the
>     overall license of the prelinker.
> 
>     Based on this, my assumption is that it is GPL-2.0
> 
>     I do not see any 'or-later' clauses anywhere.
> 
> I have just add  "dnl SPDX-License-Identifier: GPL-2.0-only" bellow the "Written
> by" comment, however should it also be in the resulting template? 
> I can add it also at first line of the resulting file if necessary ?
> 
> 
>     > - what about *.C files ? They don't have licence header, they look like C file
>     > to me so I'd probably add :
>     > // SPDX-License-Identifier: GPL-2.0-or-later
> 
>     There are each simply test cases.  They would be covered by the overall
>     'COPYING' for the package.  Thus GPL-2.0
> 
>     > - what about testsuite/ files ?
> 
>     Same, no specifically stated license will be GPL-2.0.
> 
> Done ! 
> 
>     > Shall every thing just be GPL-2.0-or-later?
> 
>     Also just to be clear.  As I am NOT the original author of this work, I won't
>     accept a patch to remove any existing license text from the headers in this
>     software, but I will accept the SPDX-License-Identifier to be added in addition
>     to the existing license text.
>      
> 
>     If an existing file does not have any License text in it, then we will need to
>     assume that the COPYING file covers all software unless there is some indicator
>     it comes from another source with a different license.  For items w/o existing
>     licenses, just adding the SPDX-License-Identifier will be acceptable.
> 
>     So in a header similar to:
> 
>     /* Copyright (C) 2001, 2002, 2003, 2007 Red Hat, Inc.
>        Written by Jakub Jelinek <jakub@redhat.com <mailto:jakub@redhat.com>>, 2001.
> 
>        This program is free software; you can redistribute it and/or modify
>        it under the terms of the GNU General Public License as published by
>        the Free Software Foundation; either version 2, or (at your option)
>        any later version.
> 
>        This program is distributed in the hope that it will be useful,
>        but WITHOUT ANY WARRANTY; without even the implied warranty of
>        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>        GNU General Public License for more details.
> 
>        You should have received a copy of the GNU General Public License
>        along with this program; if not, write to the Free Software Foundation,
>        Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
> 
>     please add the header between the 'Written by' and the existing license text,
>     such as:
> 
>     /* Copyright (C) 2001, 2002, 2003, 2007 Red Hat, Inc.
>        Written by Jakub Jelinek <jakub@redhat.com <mailto:jakub@redhat.com>>, 2001.
> 
>        SPDX-License-Identifier: GPL-2.0-or-later
> 
>        This program is free software; you can redistribute it and/or modify
>        it under the terms of the GNU General Public License as published by
> 
> 
> Here's the first attempt of the patch, feel free to give me any advice on how to
> improve it!
> 
> Regards,
> 
> -- 
> SMILE <http://www.smile.eu/>
> 
> 20 rue des Jardins
> 92600 Asnières-sur-Seine
> 
> 	
> *Yann CARDAILLAC*
> Ingénieur Systèmes Embarqués
> 
> email yann.cardaillac@smile.fr <mailto:yann.cardaillac@smile.fr>
> url http://www.smile.eu
> 
> Twitter <https://twitter.com/GroupeSmile> Facebook
> <https://www.facebook.com/smileopensource> LinkedIn
> <https://www.linkedin.com/company/smile> Github <https://github.com/Smile-SA>
> 
> 
> 
> eco Pour la planète, n'imprimez ce mail que si c'est nécessaire

