Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RKv94-00005J-Da
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 17:55:34 +0100
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 31 Oct 2011 09:49:27 -0700
Received: by wye20 with SMTP id 20so1065677wye.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 09:49:26 -0700 (PDT)
Received: by 10.216.14.145 with SMTP id d17mr3208354wed.85.1320079766079;
	Mon, 31 Oct 2011 09:49:26 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id e7sm33459063wbh.12.2011.10.31.09.49.24
	(version=SSLv3 cipher=OTHER); Mon, 31 Oct 2011 09:49:25 -0700 (PDT)
Message-ID: <4EAED192.8000900@intel.com>
Date: Mon, 31 Oct 2011 09:49:22 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20111028205842.GA17752@gonzales.palutemo>
	<1319885588-5947-1-git-send-email-Martin.Jansa@gmail.com>
	<FF670D39-26C1-4B22-824A-CBBB99F71AAC@dominion.thruhere.net>
In-Reply-To: <FF670D39-26C1-4B22-824A-CBBB99F71AAC@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] dbus: add work around to set right owner in postinst
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
X-List-Received-Date: Mon, 31 Oct 2011 16:55:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2011 01:54 AM, Koen Kooi wrote:
>
> Op 29 okt. 2011, om 12:53 heeft Martin Jansa het volgende geschreven:
>
>> * even when I see right chown/chmod in log.do_install, files are still
>>   owned by bitbake:bitbake (user running bitbake) and we need to fix it on target
>
> I suspect fsperms.txt is breaking things, but I haven't tested it yet.
>
I did try to reset FILESYSTEM_PERMS_TABLE to "" and the issue still existed.

Further testing and debugging showed that both IPK and RPM packaging 
seems to kill off the ownership, but DEB packaging retained it correctly!

More research and digging is required.

Sau!

> regards,
>
> Koen
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



