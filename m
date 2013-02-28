Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UBAcJ-0005e4-Cb
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 22:03:03 +0100
Message-ID: <512FC1FE.7070200@communistcode.co.uk>
Date: Thu, 28 Feb 2013 20:45:50 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130215 Thunderbird/17.0.3
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1362034602-30163-1-git-send-email-raj.khem@gmail.com>
	<CAHUNapSbpFDttimPKO9czY3NiV4x7kTZ8ysDgq2TuifnosH0Xw@mail.gmail.com>
	<CAMKF1srnzum61DyhW95LgX14HmOJxaVwvcz_y2iGXNime6FZkg@mail.gmail.com>
	<512FB8B3.2090500@communistcode.co.uk>
	<CAMKF1srqOXOJqNkXOUkq4bdUZSFyMTBkNC+qNScpdVwpkiPCsw@mail.gmail.com>
In-Reply-To: <CAMKF1srqOXOJqNkXOUkq4bdUZSFyMTBkNC+qNScpdVwpkiPCsw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-4.7: Fix build with texinfo 5.0+
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 21:03:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/2013 20:18, Khem Raj wrote:
> On Thu, Feb 28, 2013 at 12:06 PM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> If this is the patch you posted in the other thread it didn't work, I have
>> attached the log to this mail also.
>
> yes I got that, I am now trying to reproduce it locally in order to
> fix it right.
> since upstream fix wont look same for gcc 4.7 it needs to be hand woven, I dont
> have any system handy which uses new texinfo 5.0 I believe there will be more
> damages then just gcc and binutils.

Yes, as soon as I understood what the first issue was I knew I was in 
for a world of bleeding-edge pain.

If it helps then I use Archlinux which has the texinfo5 package in it's 
stable repos.


