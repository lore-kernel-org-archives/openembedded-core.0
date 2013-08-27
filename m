Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB1F6A95B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 12:38:12 +0000 (UTC)
Message-ID: <521C9DB3.5090604@communistcode.co.uk>
Date: Tue, 27 Aug 2013 13:38:11 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130806 Thunderbird/17.0.8
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <521C969A.30909@communistcode.co.uk>
	<1377605761.28077.4.camel@phil-desktop.brightsign>
In-Reply-To: <1377605761.28077.4.camel@phil-desktop.brightsign>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: do_root_fs failing on flock command
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Aug 2013 12:38:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/08/13 13:16, Phil Blundell wrote:
> On Tue, 2013-08-27 at 13:07 +0100, Jack Mitchell wrote:
>> Does anyone have any insight to why this may be failing. It mentions a
>> bad file descriptor, so I assume it is related to building on an NFS mount.
>
> There's no particular reason that flock() oughtn't to work on NFS.  If
> you happened to be mounted with -o nolock then you wouldn't get the
> correct semantics versus lockers on other hosts, but you shouldn't be
> getting -EBADF under any circumstances that I can think of.
>
> If you run flock by hand against a file on the same mount, does it work?
> If it fails, what does the output from strace look like?
>
> p.
>
>

http://pastebin.com/LB7nZs1q

-- 
   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   Cambrideshire, UK
   http://www.embed.me.uk
--

