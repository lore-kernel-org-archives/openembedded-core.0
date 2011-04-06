Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q7WfZ-0000C3-D4
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 19:37:29 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q7WdX-0007Zc-MO from Tom_Rini@mentor.com ;
	Wed, 06 Apr 2011 10:35:23 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 6 Apr 2011 10:35:23 -0700
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Wed, 6 Apr 2011 10:35:22 -0700
Message-ID: <4D9CA452.1020205@mentor.com>
Date: Wed, 6 Apr 2011 10:35:14 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1302050252.git.tom_rini@mentor.com>
	<95d636004deffc0d6473c67ee9b5ce62937dc085.1302050252.git.tom_rini@mentor.com>
	<BANLkTi=RTLB21JAz4N2B2kPWu6H3uTHn1w@mail.gmail.com>
	<4D9C78F5.1090808@mentor.com>
	<BANLkTi=UeQ22hquxLPihJAnLzpW8ODpAkg@mail.gmail.com>
	<4D9C9E75.1060203@mentor.com>
	<BANLkTimuM8GCHd11cuH5ULA6jL=3kZDk6w@mail.gmail.com>
In-Reply-To: <BANLkTimuM8GCHd11cuH5ULA6jL=3kZDk6w@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 06 Apr 2011 17:35:23.0552 (UTC)
	FILETIME=[023A3A00:01CBF481]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ncurses: Update to 5.9
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
X-List-Received-Date: Wed, 06 Apr 2011 17:37:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 04/06/2011 10:26 AM, Khem Raj wrote:
> On Wed, Apr 6, 2011 at 10:10 AM, Tom Rini <tom_rini@mentor.com> wrote:
>> On 04/06/2011 10:05 AM, Khem Raj wrote:
>>> On Wed, Apr 6, 2011 at 7:30 AM, Tom Rini <tom_rini@mentor.com> wrote:
>>>> On 04/05/2011 11:18 PM, Khem Raj wrote:
>>>>> On Tue, Apr 5, 2011 at 5:38 PM, Tom Rini <tom_rini@mentor.com> wrote:
>>>>>> The previous 5.7 release was relatively close to 5.8 due to it bringing
>>>>>> in a patch to sync with upstream work-in-progress.  We skip over the
>>>>>> 5.8 release and move to 5.9.
>>>>>
>>>>>
>>>>> there already are patches for 5.9 available too
>>>>> ftp://invisible-island.net/ncurses/5.9/ncurses-5.9.patch.gz
>>>>
>>>> Wrong link?  That reverse applies to ncurses 5.9 release. But
>>>> regardless, is ncurses something we need to be tracking top of tree for?
>>>>  It seems like we needed to for 5.7 since there had been a lot going on
>>>> without a release but that seems to have changed now.
>>>>
>>>
>>> those patches usually contain critical bug fixes including security updates
>>> so it will be of interest to keep track of it
>>
>> Well, it doesn't currently.  And while I agree we need to do a good job,
>> everywhere, of keeping track of security updates, I don't think we
>> should move back to depending on a site that frequently removes patches.
>>
> 
> yes. cache the patches like yocto did for 5.7 recipes

That still leaves the problem of there not being a valid patch there at
the moment.  And I still don't see why ncurses needs to be in the bucket
of recipes we track the scm for rather than relying on the latest stable
release.

-- 
Tom Rini
Mentor Graphics Corporation


