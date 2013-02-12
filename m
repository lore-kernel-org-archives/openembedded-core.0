Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1U5DtU-0008Aj-1n
	for Openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 12:19:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1CB3M9X026595
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Feb 2013 03:03:22 -0800 (PST)
Received: from [172.25.32.35] (172.25.32.35) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 12 Feb 2013 03:03:22 -0800
Message-ID: <511A2179.5080005@windriver.com>
Date: Tue, 12 Feb 2013 05:03:21 -0600
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <1360624949-43859-1-git-send-email-jason.wessel@windriver.com>
	<5119F8A9.8080603@intel.com> <511A1714.7090205@windriver.com>
	<511A1871.6070109@intel.com>
In-Reply-To: <511A1871.6070109@intel.com>
X-Enigmail-Version: 1.5
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/3] relocate_sdk.py: improvements
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
X-List-Received-Date: Tue, 12 Feb 2013 11:19:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 02/12/2013 04:24 AM, Laurentiu Palcu wrote:
>
> On 02/12/2013 12:19 PM, Jason Wessel wrote:
>> For what ever reason I never received the original mails, else I absolutely would have responded.  This is the first response I have received from the oe-core list in months in fact.
> I believe you... It happened to me too not to receive replies to my own
> patches. :/

Hard to say where the mail went other than the black hole.   We too have had black hole issues, but I had always assumed it was on anti-spam filter side with our local mail server.

As a side point it occurred to me that I never answered your other question, which was about what qemu we were using.   At the time I hit the problem with the silent .interp corruption it was the qemu from denzil.  Silent corruption is never fun to find or deal with, we had just ended up with binary that segmentation faulted some of the time.  One time through trying to figure out what the root of the problem was more than enough.  I figured I never wanted anyone else to have to debug that problem again, which the origin of these patches. ;-)

Cheers,
Jason.


