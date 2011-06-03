Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QSO72-0001QT-Ba
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 08:44:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jun 2011 23:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,314,1304319600"; d="scan'208";a="12967960"
Received: from unknown (HELO [10.255.13.71]) ([10.255.13.71])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2011 23:40:50 -0700
Message-ID: <4DE881F1.5070509@linux.intel.com>
Date: Thu, 02 Jun 2011 23:40:49 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1306856806.git.Martin.Jansa@gmail.com>
	<4fdf0bdf57b56d363e0b2ae8747e85fc84fbf8ca.1306856806.git.Martin.Jansa@gmail.com>
	<4DE87343.6010209@linux.intel.com>
	<20110603060334.GK3281@jama.jama.net>
In-Reply-To: <20110603060334.GK3281@jama.jama.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] create-pull-request: allow '+' in git PROTO_RE, ie for 'git+ssh://'
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
X-List-Received-Date: Fri, 03 Jun 2011 06:44:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/02/2011 11:03 PM, Martin Jansa wrote:
> On Thu, Jun 02, 2011 at 10:38:11PM -0700, Darren Hart wrote:
>> Hi Martin,
> 
> Hi Darren,
> 
>> No objection if this is a valid URL. I didn't include this because 1) I
>> didn't know about it and 2) it isn't listed in the git pull man page,
>> which is what I developed to. Is git+ssh... equivalent to ssh:// ?
> 
> before this change my pull requests had url like this
> are available in the git repository at:
>   git+ssh://git@git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
>   http://cgit.openembedded.org/cgit.cgi/git+ssh://git@git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/meta-oe
> 
> because RE wasn't matching my URL at all
> 
> OE @ ~/shr-core/openembedded-core $ git config remote.contrib.url
> git+ssh://git@git.openembedded.org/openembedded-core-contrib
> 
> IMHO this is equivalent to ssh:// or git@ without protocol but haven't 
> checked documentation to be sure. But I'm sure this is valid and that 
> this works right (as I'm able to push to contrib).
> 

I'm sure the patch is fine - I was just surprised git pull didn't
document the URL. It's already been pulled as well I believe.

>> As a minor nit, please include a body message for anything more
>> complicated than whitespace or typographical fixes.
> 
> I use git+ssh:// for many projects so I'm used to it, so I expected that
> this is widely used and this patch would be clear enough.

As I said, it's a nit, but it is consistent with guidelines used in many
other projects. Cramming too much into the subject line makes the git
log hard to read - especially as git doesn't wrap long lines - perhaps
due to the prejudices of the authors ;-) Yours doesn't truncate,
but it comes close. Anyway, dead horse and all that.

Thanks for the fix.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


