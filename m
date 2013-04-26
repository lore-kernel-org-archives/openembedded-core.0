Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UVlQB-0007Qm-J8
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 18:22:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3QG55wQ004559
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Apr 2013 09:05:05 -0700 (PDT)
Received: from msp-dhcp9.wrs.com (172.25.34.9) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 26 Apr 2013 09:05:05 -0700
Message-ID: <517AA5B2.7050808@windriver.com>
Date: Fri, 26 Apr 2013 11:05:06 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<1366888374.14512.78.camel@phil-desktop.brightsign>
	<517933DC.9080809@windriver.com>
	<1366984657.14512.108.camel@phil-desktop.brightsign>
	<517A8C41.20202@windriver.com>
	<1366986469.14512.116.camel@phil-desktop.brightsign>
	<517A91BA.7030200@windriver.com>
	<1366987306.14512.117.camel@phil-desktop.brightsign>
	<CAP9ODKrbTjSOw4k3bpVD3eVFDfHARKzcfft5rMoznwfTCir8OA@mail.gmail.com>
In-Reply-To: <CAP9ODKrbTjSOw4k3bpVD3eVFDfHARKzcfft5rMoznwfTCir8OA@mail.gmail.com>
Cc: layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
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
X-List-Received-Date: Fri, 26 Apr 2013 16:22:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/26/13 9:50 AM, Otavio Salvador wrote:
> On Fri, Apr 26, 2013 at 11:41 AM, Phil Blundell <pb@pbcl.net> wrote:
>> On Fri, 2013-04-26 at 09:39 -0500, Mark Hatle wrote:
>>> On 4/26/13 9:27 AM, Phil Blundell wrote:
>>>> On Fri, 2013-04-26 at 09:16 -0500, Mark Hatle wrote:
>>>>> The alternative of course is to crease special -dbg packages for the two
>>>>> conflicting items.  I.e. foo-dbg, foo-sulogin-dbg, bar-dbg and bar-sulogin-dbg...
>>>>
>>>> Yeah, indeed, that's what I suggested in my original email.  At the time
>>>> I thought that would be hard to arrange (in the general case), but
>>>> having given it some further consideration perhaps it isn't all that bad
>>>> after all.
>>>
>>> I certainly wouldn't be against an enhancement that tries to match up the
>>> binaries to their debug and create suitably named -dbg packages.  The only
>>> tricky part is what to do with the associated sources?  Since those are not
>>> arranged according to binaries, but generally for the whole recipe.
>>
>> The sources can stay where they are, in ${PN}-dbg.  There won't be any
>> conflict there because the installed files are already namespaced by
>> recipe.
>
> Maybe add a ${PN}-source with it? So any -dbg could rdepends on it?

-dbg-source would be better.. but I don't mind that.  I know there have been 
complaints where people want the debug symbols on the target, but don't want the 
debug sources.  This could address that as well.

I'd suggest someone (Phil ?) collect these and add a open an enhancement bug in 
the YP bugzilla.  That way progress on implementation can be tracked.   (Unless 
of course someone just implements it.. but I'm guessing it won't be quite that 
straightforward.)

--Mark

> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>



