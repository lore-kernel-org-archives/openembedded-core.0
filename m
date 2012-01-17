Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RnBAj-0002Du-5A
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 16:42:06 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0HFYQp9011821
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 07:34:26 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 17 Jan 2012 07:34:26 -0800
Message-ID: <4F159501.1080306@windriver.com>
Date: Tue, 17 Jan 2012 09:34:25 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <E37251D2-AC3E-44C0-BA37-7CD0579E6E3B@dominion.thruhere.net>
In-Reply-To: <E37251D2-AC3E-44C0-BA37-7CD0579E6E3B@dominion.thruhere.net>
Subject: Re: RPM and spaces in filenames?
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
X-List-Received-Date: Tue, 17 Jan 2012 15:42:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I ran into the same problem yesterday.  I've got a fix in my local tree, I'll 
submit it in a bit.

--Mark

On 1/17/12 8:53 AM, Koen Kooi wrote:
> Hi,
>
> With RPM packaging I'm getting these errors:
>
> | Processing files: cloud9-0.5.1-r12.armv7a
> | error: Two files on one line: /usr/share/cloud9/support/ace/tool/tmthemes/Slush
> | error: File must begin with "/": and
> | error: Two files on one line: /usr/share/cloud9/support/ace/tool/tmthemes/Slush
> | error: File must begin with "/": Poppies.tmTheme
> | error: Two files on one line: /usr/share/cloud9/support/ace/tool/tmthemes/Brilliance
> | error: File must begin with "/": Dull.tmTheme
> | error: Two files on one line: /usr/share/cloud9/support/ace/tool/tmthemes/All
> | error: File must begin with "/": Hallows
> | error: Two files on one line: /usr/share/cloud9/support/ace/tool/tmthemes/All
> | error: File must begin with "/": Eve.tmTheme
> | error: Two files on one line: /usr/share/cloud9/support/ace/tool/tmthemes/Pastels
> | error: File must begin with "/": on
> | error: Two files on one line: /usr/share/cloud9/support/ace/tool/tmthemes/Pastels
> | error: File must begin with "/": Dark.tmTheme
>
> Does rpm break with spaces in filenames?
>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



