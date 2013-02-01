Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1U1HEV-00041m-8I
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 15:05:06 +0100
Received: from [192.168.101.9] (afplatform.bmw-carit.intra [192.168.101.9])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 323B640037;
	Fri,  1 Feb 2013 14:09:10 +0100 (CET)
Message-ID: <510BC7D0.2030608@oss.bmw-carit.de>
Date: Fri, 01 Feb 2013 14:49:04 +0100
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <510B8C52.4020700@oss.bmw-carit.de>
	<CAJTo0LZGYW4Q8smAh8K863D++K_H4hcndwYWYFJrgPjd8rd-wQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZGYW4Q8smAh8K863D++K_H4hcndwYWYFJrgPjd8rd-wQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Two recipes with the same file name for the SRC_URI
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
X-List-Received-Date: Fri, 01 Feb 2013 14:05:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/01/2013 11:32 AM, Burton, Ross wrote:
> Try the "downloadfilename" option, i.e.
> http://bar.com/src.tar.gz;downloadfilename=bar-src.tar.gz"
>
> (if this works, it should be added to the manual)
>
The downloadfilename option worked. Thanks a lot for your help.

Lukas


