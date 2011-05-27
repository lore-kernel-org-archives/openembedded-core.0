Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QQ0tX-0002sN-VM for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 19:32:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RHTFa5004733
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 18:29:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04648-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 18:29:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RHTAEr004727
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 18:29:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DDD90F9.5030901@intel.com>
References: <4DDD90F9.5030901@intel.com>
Date: Fri, 27 May 2011 18:29:04 +0100
Message-ID: <1306517344.27470.300.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] license.bbclass parsing changes and common-license additions
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
X-List-Received-Date: Fri, 27 May 2011 17:32:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-25 at 16:30 -0700, Elizabeth Flanagan wrote:
> This pull request is a consolidated pull of some changes to the license.bbclass
> license parsing, some cleanup of existing licenses, and some additions to/
> modifications of various licenses kept in meta/files/common-licenses.
> 
> I've modified the common-licenses by adding licenses from the Software Package
> and Data Exchange group/OSI and using their naming convention for internal
> parsing within license.bbclass.
> 
> Licenses were retrieved from http://spdx.org/licenses/ or
> in cases where text of the license was missing:
> http://opensource.linux-mirror.org/licenses/
> 
> I've also modified some recipe's LICENSE field, either because the field was
> unparsable or the LICENSE was factually incorrect. This was not an entire audit
> of every LICENSE field but there were some errors that were obvious.
> 
> And lastly, using python abstract syntax trees as a parser and an ast visitor
> class, I've begun the first steps to being able to put some sanity to license
> selection.
> 
> One note. License modifiers have traditionally been limited to the "or greater"
> modifier "+". I've added another modifier "with exceptions" for licenses that
> have no generic ie common-licenses/GPL-2,0-with-GCC-exception
> 
> The modifiers are ignored for now, but I'll be looking at the logic for them
> next.
> 
> One side note. The listserve seems to limit mail size, so some of these PATCH
> requests may get slammed to /dev/null.
> 
> The following changes since commit 5d56586a00350f2ec90a7143182a3f1294fb4c73:
> 
>    binutils: Add missing dependency on zlib-native (2011-05-25 23:53:47 +0100)
> 
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib eflanagan/common-licenses
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/common-licenses
> 
> Beth Flanagan (5):
>    common-licenses: Adding new licenses and renaming
>    License Field Cleanup: Non-standard field names

I took these two big ones before anything changed and we started seeing
rejects.

>    license.bbclass: Sane Parsing of licenses
>    license.bbclass: Fixing X-MIT SPDX license mapping
>    license.bbclass: Fixing LICENSE modifiers.

For these, Josh spotted some debug left in and I think you can squash
these into one commit.

Cheers,

Richard



