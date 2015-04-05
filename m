Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 56BF172A23
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Apr 2015 19:13:52 +0000 (UTC)
Received: (qmail 9793 invoked by uid 1003); 5 Apr 2015 19:13:53 -0000
Received: from unknown (HELO ?192.168.11.132?)
	(philip@opensdr.com@108.44.116.31)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	5 Apr 2015 19:13:53 -0000
Message-ID: <55218970.8020308@balister.org>
Date: Sun, 05 Apr 2015 12:13:52 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: ed.bartosh@linux.intel.com, Otavio Salvador <otavio@ossystems.com.br>
References: <1428168028-6476-1-git-send-email-ed.bartosh@linux.intel.com>	<CAP9ODKprO_BWYjr4x0w2PXELXrZa6Y4C2=XgKMWXE+ppULZXTQ@mail.gmail.com>
	<20150404213401.GA10453@linux.intel.com>
In-Reply-To: <20150404213401.GA10453@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] wic: extended list of paths in find_binary_path
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
X-List-Received-Date: Sun, 05 Apr 2015 19:13:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 04/04/2015 02:34 PM, Ed Bartosh wrote:
> On Sat, Apr 04, 2015 at 03:34:59PM -0300, Otavio Salvador wrote:
>> Em 04/04/2015 14:21, "Ed Bartosh" <ed.bartosh@linux.intel.com> escreveu:
>>>
>>> wic requires tools that are not always possible to find in $PATH.
>>> This causes wic to fail with confusing errors like this:
>>>  External command 'parted' not found, exiting.
>>>    (Please install 'parted' on your host system)
>>>
>>> Adding ~/bin/, /usr/local/sbin, /usr/local/bin, /usr/sbin, /usr/bin,
>>> /sbin and /bin to the list of paths makes find_binary_path to
>>> produce more reliable results.
>>>
>>> [YOCTO #7122]
>>>
>>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>>
>> I think we shouldn't do that. If user wants something to be found the PATH
>> environment variable should have them included.
>>
> Some users think that this is confusing: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7122
> For current implementation of wic it practically means that it must be always run as "PATH=/usr/sbin:$PATH wic" on OpenSUSE systems.
> 
>> This also brings one serious error off wic which is it relying on host
>> utilities. It should use parted from native sysroot instead otherwise we
>> cannot be sure if witch version we will be using.
> 
> This makes sense to me. Not sure how easy is to do it as I suspect that not only parted is used this way.
> 
> BTW, this approach conflicts with this feature request: https://bugzilla.yoctoproject.org/show_bug.cgi?id=6558
> So, should wic rely on system utilities or not?
> If it should not then what would you suggest to do with #6558?

I added a comment to this. Basically wic is very dependent on data from
the build system. It has no knowledge of packages. If we want to build
images outside the build system from packages/package feeds, that would
be a different tool than wic.

Philip

> 
> --
> Regards,
> Ed
> 

