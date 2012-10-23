Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1TQbVA-0003nG-3Z
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 12:14:26 +0200
Received: from [192.168.0.2] (host81-153-114-169.range81-153.btcentralplus.com
	[81.153.114.169]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id C3A7C99A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 11:00:48 +0100 (BST)
Message-ID: <50866ACF.8010105@r-finger.com>
Date: Tue, 23 Oct 2012 11:00:47 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1350898066.git.ross.burton@intel.com>
	<dc59bf999e1f8a6d5953c02d21c6e45c53c204a9.1350898066.git.ross.burton@intel.com>
	<50865F91.5060002@r-finger.com>
	<CAPj87rP+FHP8QeBvqVHVDX0dUHh-fFL1W_BQbV-1HErG5dE4FA@mail.gmail.com>
In-Reply-To: <CAPj87rP+FHP8QeBvqVHVDX0dUHh-fFL1W_BQbV-1HErG5dE4FA@mail.gmail.com>
Subject: Re: [PATCH 1/3] libxkbcommon: New window system-independent xkb library
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
X-List-Received-Date: Tue, 23 Oct 2012 10:14:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/12 10:15, Daniel Stone wrote:
> Hi,
> 
> On 23 October 2012 20:12, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
>> I think this needs a -native tools as well, like,
>> https://github.com/Guacamayo/meta-guacamayo/blob/master/meta-guacamayo/recipes-graphics/xorg-lib/libxkbcommon_git.bb
> 
> Not anymore, we use Python for makekeys nowadays.  (And, in an
> unpushed tree, don't use Python at all if we can avoid it.)

Good news, but perhaps you forgot to push this into the public repo?
makekeys seems to be C program even in the current master, certainly in
1c880887666f84e08ea1752bb8a5ab2a7bf1d8a0.

Tomas


