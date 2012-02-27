Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1S1yFn-00068a-Th
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 11:56:27 +0100
Received: from [192.168.0.59] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 3B35928A73
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 09:41:11 +0000 (GMT)
Message-ID: <4F4B5DDA.6010206@communistcode.co.uk>
Date: Mon, 27 Feb 2012 10:41:30 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120217 Thunderbird/10.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <17057774.C0TjevbrGC@kgy> <1330181716.13788.33.camel@ted>
	<41586593.1CLnZEXO8J@linux-oxe9>
In-Reply-To: <41586593.1CLnZEXO8J@linux-oxe9>
Subject: Re: empty dirs in glib-2.0
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
X-List-Received-Date: Mon, 27 Feb 2012 10:56:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/12 10:30, Gyorgy Kovesdi wrote:
>> rmdir was used specifically so we'd know if the directory wasn't empty.
>> What files are in there?
> ...../usr/lib/gio/modules:
>
> total 32K
> drwxr-xr-x 2 kgy users 4.0K Feb 27 11:26 .
> drwxr-xr-x 3 kgy users 4.0K Feb 27 11:26 ..
> -rwxr-xr-x 1 kgy users 2.0K Feb 27 11:26 libgiofam.la
> -rwxr-xr-x 1 kgy users  20K Feb 27 11:26 libgiofam.so
>
> It is reproducible now, even in a brand new checkout.
>
> Regards
> Gyorgy Kovesdi
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

I can confirm I also just ran into this issue on an Angstrom Master 
checkout.


