Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RAR9G-00045J-D1 for openembedded-core@lists.openembedded.org;
	Sun, 02 Oct 2011 20:52:26 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RAR3w-0007MD-2r for openembedded-core@lists.openembedded.org;
	Sun, 02 Oct 2011 20:46:56 +0200
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2011 20:46:56 +0200
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2011 20:46:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Sun, 02 Oct 2011 22:45:35 +0400
Message-ID: <j6abik$9f7$1@dough.gmane.org>
References: <cover.1317400021.git.paul.eggleton@linux.intel.com>
	<1317401867.12332.216.camel@ted>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Iceowl/1.0b2 Icedove/3.1.13
In-Reply-To: <1317401867.12332.216.camel@ted>
Subject: Re: [PATCH 0/7] Qt4 upgrade/fixes
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
X-List-Received-Date: Sun, 02 Oct 2011 18:52:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/30/2011 08:57 PM, Richard Purdie wrote:
> On Fri, 2011-09-30 at 17:33 +0100, Paul Eggleton wrote:
>> This is a pull request for Eric Bénard's qt4_upgrade branch, including
>> an update of Qt to 4.7.4 (preserving 4.7.3 until other layers such as
>> meta-oe, meta-yocto etc. can sync up) as well as several important bug
>> fixes.
>>
>> The patches look good; if was to be really picky though I would say that
>> the two demo/doc patches in the series ought to be merged into one patch,
>> and there are a few typos in the commit messages. I'm also relying on
>> others to review the correctness of the armv6-vfp no-neon patch as I have
>> no knowledge of this area.
>>
>>
>> The following changes since commit c54c1280fc0d06a53e23339c3913ec88eead13d9:
>>
>>    base.bbclass: Drop unneeded dependency (2011-09-30 11:34:44 +0100)
>>
>> are available in the git repository at:
>>    git://git.openembedded.org/openembedded-core-contrib paule/qt4_upgrade
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4_upgrade
>>
>> Denis Carikli (3):
>>    qt4.inc: remove the optional documentation package from the demo's
>>      RRECOMMENDS
>>    qt4(embedded and x11): disable neon for armv6-vfp
>>    qt4.inc: package qtdemo's docs in a separate package
>>
>> Eric Bénard (3):
>>    qt4e-demo-image: improve image
>>    qt4: fix generated sdk
>>    qt4: update to latest version 4.7.4
>>
>> Otavio Salvador (1):
>>    qt4: fix translation support
>
> Thanks Paul. I fixed the typos and queued this on master-next.

It seems, during 4.7.3 -> 4.7.4 addition, fix-translation patch got 
lost. Richard please reaply the "qt4: fix translation support" after 
s/4.7.3/4.7.4/ . I can provide a patch if you'd like.

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
With best wishes
Dmitry



