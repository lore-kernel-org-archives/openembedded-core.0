Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UBjot-0002Dm-JB
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 11:38:00 +0100
Message-ID: <5131D0C5.7070703@communistcode.co.uk>
Date: Sat, 02 Mar 2013 10:13:25 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <5130987B.5050800@communistcode.co.uk>
	<CAHUNapQL7K3mQw3diFuRTSeLAs1yghXkqJJwBTSYx=cZrXnQmQ@mail.gmail.com>
In-Reply-To: <CAHUNapQL7K3mQw3diFuRTSeLAs1yghXkqJJwBTSYx=cZrXnQmQ@mail.gmail.com>
Subject: Re: Perf using host system includes
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
X-List-Received-Date: Sat, 02 Mar 2013 10:38:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/13 18:34, Trevor Woerner wrote:
> On Fri, Mar 1, 2013 at 7:00 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> It seems Perf is managing to have some system includes slip into the build.
>> Attached is the log file with details.
> Strange... I can't reproduce this. I just performed a build from master adding:
>
>      IMAGE_INSTALL_append = " perf"
>
> to my conf/local.conf.
>
> It is strange that, about a dozen lines down, your log says:
>
>    PERF_VERSION = 3.8.0
>
> mine says:
>
>      PERF_VERSION = 3.4.28

I bet my host having perf 3.8 has something to do with it!


