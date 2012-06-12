Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SeWEJ-0000DH-JB
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 20:54:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5CIhdCS014311
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 11:43:39 -0700 (PDT)
Received: from msp-dhcp49.wrs.com (172.25.34.49) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 12 Jun 2012 11:43:38 -0700
Message-ID: <4FD78DDA.5010907@windriver.com>
Date: Tue, 12 Jun 2012 13:43:38 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAOHjBZuZrjs+Uza6yF+WxVmfFoQ1GZfkry0U4UOr1g+0xzdNqA@mail.gmail.com>
	<CAMKF1srAO=qZzCkxiSo=Az+sdS+YCzaQnU-=u1KeThZO42Faig@mail.gmail.com>
In-Reply-To: <CAMKF1srAO=qZzCkxiSo=Az+sdS+YCzaQnU-=u1KeThZO42Faig@mail.gmail.com>
Subject: Re: fixup_perms failure on linux-libc-headers
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
X-List-Received-Date: Tue, 12 Jun 2012 18:54:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/12 8:57 AM, Khem Raj wrote:
> On Tue, Jun 12, 2012 at 2:07 AM, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com>  wrote:
>> OSError: [Errno 1] Operation not permitted:
>> '/oelinux/condorg/openembedded-core/stlinux-3.0-build/tmp-uclibc/work/sh4-oe-linux-uclibc/linux-libc-headers-2.6.32-r1/package/usr'
>
> what is your host machine ? did you also update bitbake ?

It also could be the filesystem.  What filesystem type are you using?  (on the 
host system...)  If you are using something like fat32, you may run into 
problems like this because it does not have the ability to change permissions 
and modes.. since the underlying filesystem does not support them.

--Mark


