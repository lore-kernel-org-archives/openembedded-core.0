Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RUdJU-0005Sw-Ds
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Nov 2011 12:54:28 +0100
Received: from [192.168.2.8] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 86280A6644
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Nov 2011 12:47:49 +0100 (CET)
Message-ID: <4ED22364.3000801@eukrea.com>
Date: Sun, 27 Nov 2011 12:47:48 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4ED0CC76.4040606@emagii.com> <4ED0DDBF.9000104@eukrea.com>
	<1322394029.4798.16.camel@ted>
In-Reply-To: <1322394029.4798.16.camel@ted>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Sun, 27 Nov 2011 11:54:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 27/11/2011 12:40, Richard Purdie a =C3=A9crit :
> On Sat, 2011-11-26 at 13:38 +0100, Eric B=C3=A9nard wrote:
>> Le 26/11/2011 12:24, Ulf Samuelsson a =C3=A9crit :
>>> I noted that "iostream" is built and available in<sysroot>/usr/includ=
e/c++
>>> On the host, it is located in /usr/incolude/c++/<version>
>>> "tiff" build seems to be OK with Ubuntu 11.04 i686.
>>>
>> what is your BB_NUMBER_THREADS setting ?
>> Here (on 2 different hosts/distro/arch but with an i7 CPU in both case=
s) if I
>> set it over 4, I often (always with a value of 8) meet problems with c=
++
>> includes during build from scratch. 4 seems the magic value which neve=
r
>> trigger the problem.
>
> To help me get further data points on this issue, are you using rm_work=
?
> Do the recent changes in master help (the bitbake sstate/task_skip()
> ones in particular)? I've not been able to reproduce this :(
>
yes that was with rm_work, I still need to test with current head.

Eric


