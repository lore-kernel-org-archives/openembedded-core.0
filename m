Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QjuJ3-0002XB-8q
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 16:32:57 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QjuEz-0002nY-GR from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 07:28:41 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 21 Jul 2011 07:26:23 -0700
Received: from [172.30.80.89] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 21 Jul 2011 07:28:40 -0700
Message-ID: <4E283794.6010503@mentor.com>
Date: Thu, 21 Jul 2011 07:28:36 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>	<4E277049.6020308@gmail.com>
	<4E2778DF.4040001@mentor.com> <20110721061111.GD3443@jama.jama.net>
In-Reply-To: <20110721061111.GD3443@jama.jama.net>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 21 Jul 2011 14:26:23.0358 (UTC)
	FILETIME=[2ABB71E0:01CC47B2]
Subject: Re: [PATCH 00/10] Small fixes
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
X-List-Received-Date: Thu, 21 Jul 2011 14:32:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/20/2011 11:11 PM, Martin Jansa wrote:
> On Wed, Jul 20, 2011 at 05:54:55PM -0700, Tom Rini wrote:
>> On 07/20/2011 05:18 PM, Khem Raj wrote:
>>> On 07/20/2011 02:06 PM, Martin Jansa wrote:
>>>> Fixes for recipes using intltool, distributions not having locales
>>>> support in libc and distutils fix
>>>>
>>>> The following changes since commit
>>>> 0d03800caffc2341b74190d38f7a372223c89f4c:
>>>>
>>>>    lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib
>>>> (2011-07-20 15:43:43 +0100)
>>>>
>>>> are available in the git repository at:
>>>>    git://git.openembedded.org/openembedded-core-contrib jansa/pull
>>>>   
>>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
>>>>
>>>>
>>>> Martin Jansa (10):
>>>>    tcmode-default: set preferred version also for (e)glibc-locale
>>>>    eglibc-package: don't fail without localedef/gconv
>>>>    intltool: inherit perlnative
>>>>    polkit: inherit perlnative
>>>>    shared-mime-info: inherit perlnative
>>>>    xkeyboard-config: inherit perlnative
>>>>    avahi: inherit perlnative
>>>>    vte: inherit perlnative
>>>
>>> I guess all inherit perlnative patches can me squashed into one
>>
>> Or not done? :)
> 
> I still see this issue, with
> http://patches.openembedded.org/patch/8069/
> applied.

That's not enough.  You then need the cpan mangling patch applied on top.

-- 
Tom Rini
Mentor Graphics Corporation


