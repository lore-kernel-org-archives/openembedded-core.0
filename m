Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RIREj-00040P-8p
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 22:35:09 +0200
Received: from [192.168.2.8] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 9E0A4A62A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 22:29:08 +0200 (CEST)
Message-ID: <4EA5CA93.5070506@eukrea.com>
Date: Mon, 24 Oct 2011 22:29:07 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EA5C803.1030205@eukrea.com>
	<20111024202541.GA14251@mail.adw-basketball.de>
In-Reply-To: <20111024202541.GA14251@mail.adw-basketball.de>
Subject: Re: Dependency problem in mysql ?
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
X-List-Received-Date: Mon, 24 Oct 2011 20:35:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 24/10/2011 22:25, Henning Heinold a =E9crit :
> On Mon, Oct 24, 2011 at 10:18:11PM +0200, Eric B=E9nard wrote:
>> Hi,
>>
>> while testing a build from scratch of a configuration which was
>> working, I increased BB_NUMBER_THREADS to  "8" and PARALLEL_MAKE to
>> "-j6" and started to get problems with mysql (log at the end of this
>> mail).
>>
>> Reducing BB_NUMBER_THREADS to 4 "solved" the problem.
>>
>> Any idea what dependency could be missing in mysql ?
>>
>> Thanks,
>> Eric
>
> None,
>
> you just hit a parallel make error inside mysql I think.
>
Thanks, I also reduced  PARALLEL_MAKE to j4 which seems to confirm this.
I think I also met the same kind of problem with directfb.

Eric


