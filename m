Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Ming.Liu@windriver.com>) id 1UAAgx-0002BF-Uj
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 03:55:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q2cZZL007324
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Feb 2013 18:38:35 -0800 (PST)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.328.9;
	Mon, 25 Feb 2013 18:38:35 -0800
Message-ID: <512C2028.20404@windriver.com>
Date: Tue, 26 Feb 2013 10:38:32 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1361841584-4776-1-git-send-email-ming.liu@windriver.com>
	<CAP9ODKo4LVNcTWoW8dmM87fHeZ12i7Jm7RLCnyWqapKbAmbXvQ@mail.gmail.com>
In-Reply-To: <CAP9ODKo4LVNcTWoW8dmM87fHeZ12i7Jm7RLCnyWqapKbAmbXvQ@mail.gmail.com>
X-Originating-IP: [128.224.162.145]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V1] parted: fix several integer overflows
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
X-List-Received-Date: Tue, 26 Feb 2013 02:55:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2013 10:27 AM, Otavio Salvador wrote:
> On Mon, Feb 25, 2013 at 10:19 PM, Ming Liu <ming.liu@windriver.com> wrote:
>> Integer overflows were found in libparted/labels/dvh.c, while attemptting
>> to assign unsigned int values to int types in some places. These overflows
>> only can be observed on BE platforms like MIPS, when the "WORDS_BIGENDIAN"
>> macro is defined in parted.
>>
>> Defined by unsigned int instead.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> Did you send it upstream? Jim or I can review it.

Yes, I sent it to bug-parted@gnu.org a week ago, but didn't get any 
feedback, the mail link:
http://lists.gnu.org/archive/html/bug-parted/2013-02/msg00004.html

That's great if you can review it!

the best,
thank you

>



