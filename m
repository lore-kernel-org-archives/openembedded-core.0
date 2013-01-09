Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1Tsrj4-0002BI-Qa
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 10:13:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r098wMva010638
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Jan 2013 00:58:22 -0800 (PST)
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 9 Jan 2013 00:58:21 -0800
Message-ID: <50ED312C.4050903@windriver.com>
Date: Wed, 9 Jan 2013 16:58:20 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1357719953.git.hongxu.jia@windriver.com>
	<1499acb24c57f9bf9b10c0b87e331df4f00ea5b4.1357719953.git.hongxu.jia@windriver.com>
	<CAJTo0La0VCxXbhZ4de4pR0AqBoojLNWGaBm9+xVwtokSz99PLw@mail.gmail.com>
In-Reply-To: <CAJTo0La0VCxXbhZ4de4pR0AqBoojLNWGaBm9+xVwtokSz99PLw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] qemu-native:add option march to BUILD_CFLAGS
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
X-List-Received-Date: Wed, 09 Jan 2013 09:13:46 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2013 04:50 PM, Burton, Ross wrote:
> On 9 January 2013 08:46, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Add option -march to BUILD_CFLAGS in order to let the atomic operations
>> ("lock free") be available while using old version GCC (4.3.4 for example)
>> on x86 host to compile glib-2.0-native.
> Did you mean to say glib?
>
> Ross
I mean using old version GCC(4.3.4 for example) on x86 host to compile
glib-2.0-native.

See bugzilla for detail:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3563

Hongxu


