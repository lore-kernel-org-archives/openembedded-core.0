Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UbYgM-0006iE-TI
	for openembedded-core@lists.openembedded.org;
	Sun, 12 May 2013 17:59:32 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 May 2013 08:41:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,657,1363158000"; d="scan'208";a="240421265"
Received: from unknown (HELO [10.255.12.109]) ([10.255.12.109])
	by AZSMGA002.ch.intel.com with ESMTP; 12 May 2013 08:40:42 -0700
Message-ID: <518FB7F9.2020102@linux.intel.com>
Date: Sun, 12 May 2013 08:40:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518D7326.1030901@linux.intel.com> <518E4EAB.8050502@balister.org>
	<CAP9ODKoB_KzEPvRwDkZxLgq4d5A5DiPZ+gfko5XgF3qp9fP_xQ@mail.gmail.com>
In-Reply-To: <CAP9ODKoB_KzEPvRwDkZxLgq4d5A5DiPZ+gfko5XgF3qp9fP_xQ@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Sun, 12 May 2013 15:59:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2013 06:27 AM, Otavio Salvador wrote:
> On Sat, May 11, 2013 at 10:59 AM, Philip Balister <philip@balister.org> wrote:
>> On 05/10/2013 06:22 PM, Saul Wold wrote:
>>> On 05/10/2013 05:33 AM, Jukka Rissanen wrote:
>>>> The VPN support is activated if DISTRO_FEATURES contains
>>>> vpn string.
>>>>
>>>
>>> This also create a dependency on the meta-openembedded layer, I am not
>>> sure we want to do that.
>>
>> If the default setting does not add the dependency it should be OK? What
>> packages in meta-oe are needed? Does this suggest they should move to
>> oe-core?
>
> I think so, it'd be good to have it in oe-core and allow use of vpn :)
>
I would like to see what the full dependency set looks like for these, 
clearly there is the vpnc, openvpn, l2tp and pptp recipes, but what else 
and what licenses are they under.

Sau!

> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
>


