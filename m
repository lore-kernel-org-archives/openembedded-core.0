Received: from smtpout.karoo.kcom.com ([212.50.160.34])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1S9cul-0003Xv-QH
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 14:46:23 +0100
X-IronPort-AV: E=Sophos;i="4.73,611,1325462400"; d="scan'208";a="604563254"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 19 Mar 2012 13:37:32 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1S9cmB-0001HO-Ut
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 13:37:31 +0000
Date: Mon, 19 Mar 2012 13:37:31 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120319133731.GA4473@mcrowe.com>
References: <1331915573-28368-1-git-send-email-mac@mcrowe.com>
	<BE489DAB-2E22-4B8F-A565-10C5DF842857@dominion.thruhere.net>
	<20120319115236.GA1947@mcrowe.com>
	<511DBFC2-F4AF-4C39-91D2-F59F686F21F5@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <511DBFC2-F4AF-4C39-91D2-F59F686F21F5@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] libc-common: Apply Debian-naming to libc debug symbols too
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
X-List-Received-Date: Mon, 19 Mar 2012 13:46:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Op 16 mrt. 2012, om 17:32 heeft Mike Crowe het volgende geschreven:
>>>> diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
>>>> index 962f205..d0c1ab4 100644
>>>> --- a/meta/classes/libc-common.bbclass
>>>> +++ b/meta/classes/libc-common.bbclass
>>>> @@ -27,4 +27,5 @@ python populate_packages_prepend () {
>>>> 		bpn = d.getVar('BPN', True)
>>>> 		d.setVar('PKG_'+bpn, 'libc6')
>>>> 		d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
>>>> +		d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
>>>> }

On Fri, Mar 16, 2012 at 08:39:00PM +0100, Koen Kooi wrote:
>>> Missing PR bump

Op 19 mrt. 2012, om 12:52 heeft Mike Crowe het volgende geschreven:
>> On eglibc?

On Mon, Mar 19, 2012 at 12:59:53PM +0100, Koen Kooi wrote:
> On everything that uses that class.

OK.

>>>                and broken upgrade path.

>> I'm having trouble coming up with a way to solve that. I think the
>> libc6-dbg package needs to RPROVIDE, RREPLACE and RCONFLICT with
>> libc-dbg but if I add the following:
>> 
>>  d.setVar('RPROVIDES_' + bpn + '-dbg', bpn + '-dbg')
>>  d.setVar('RCONFLICTS_' + bpn + '-dbg', bpn + '-dbg')
>>  d.setVar('RREPLACES_' + bpn + '-dbg', bpn + '-dbg')

> Does d.setVar('RREPLACES_' + bpn + '-dbg', 'libc-dbg') work?

It seems to. Do I just need to set RREPLACES or all three?

Thanks.

Mike.


