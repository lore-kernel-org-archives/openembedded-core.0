Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RupgN-0004ev-5w
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 19:22:23 +0100
Received: by qcso7 with SMTP id o7so3994435qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 10:14:20 -0800 (PST)
Received: by 10.229.76.9 with SMTP id a9mr9690447qck.76.1328638460320;
	Tue, 07 Feb 2012 10:14:20 -0800 (PST)
Received: from [128.224.170.202] ([89.121.200.106])
	by mx.google.com with ESMTPS id fh6sm42280963qab.22.2012.02.07.10.14.18
	(version=SSLv3 cipher=OTHER); Tue, 07 Feb 2012 10:14:19 -0800 (PST)
Message-ID: <4F3169F9.5070005@gherzan.ro>
Date: Tue, 07 Feb 2012 20:14:17 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1328635982-18444-1-git-send-email-andrei@gherzan.ro>
	<1328636405.14363.32.camel@phil-desktop>
In-Reply-To: <1328636405.14363.32.camel@phil-desktop>
Subject: Re: [PATCH] nspr: Integrate version 4.8.9
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
X-List-Received-Date: Tue, 07 Feb 2012 18:22:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2012 07:40 PM, Phil Blundell wrote:
> On Tue, 2012-02-07 at 19:33 +0200, Andrei Gherzan wrote:
>> +FILES_${PN} = "/usr/lib/*.so"
>> +FILES_${PN}-dev = "/usr/bin/* /usr/include/* /usr/share/aclocal/* /usr/lib/pkgconfig/*"
>> +FILE_${PN}-staticdev= "/usr/lib/*.a"
> That all looks rather dubious.  The last line surely isn't accomplishing
> anything and I suspect the other three are largely wrong/useless as
> well.  What problem were you trying to solve by adding those?
>
> p.
You right. These line are useless here as they end up in the right rpm 
by default. Resending patch...

@g


