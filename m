Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UZlXb-000372-45
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 19:19:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r47H10KO005453
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 May 2013 10:01:00 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 7 May 2013 10:00:59 -0700
Message-ID: <5189334A.5020206@windriver.com>
Date: Tue, 7 May 2013 12:00:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Trevor Woerner <twoerner@gmail.com>
References: <51892728.3090609@farnsworthtech.com>
	<51892D8A.5030806@windriver.com>
	<CAHUNapRAZVrC4eKTRiPNaun2wg2bEQs2Qt-x8dA67h9Uvb2NWg@mail.gmail.com>
In-Reply-To: <CAHUNapRAZVrC4eKTRiPNaun2wg2bEQs2Qt-x8dA67h9Uvb2NWg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: SDK meta-toolchain
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
X-List-Received-Date: Tue, 07 May 2013 17:19:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/13 11:49 AM, Trevor Woerner wrote:
> On Tue, May 7, 2013 at 12:36 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> There are two ways to generate an SDK.
>>
>> * targeted SDK -- This is a meta-toolchain* recipe that lists -exactly- what
>> is going to be in the SDK.  This is great if you want to limit your SDK to
>> specific libraries for your application developers.
>
> Is this the one created using:
>
>      $ bitbake meta-toolchain
>
> ?
>
>> * implied / image based SDK -- This type of SDK bases off of what is in the
>> image to generate an SDK that contains all of the libraries that are
>> runnable inside of the image.  This is a very simple way to generate an SDK
>> for application developers that -will- match the run-time image.
>
> Is this the one created by:
>
>      $ bitbake -c populate_sdk <image>
>
> ?
>

Yes to both questions.

--Mark


