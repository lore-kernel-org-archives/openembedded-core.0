Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TCF4t-0004w2-5p
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 21:27:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8DJFHax027673
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 12:15:17 -0700 (PDT)
Received: from msp-dhcp28.wrs.com (172.25.34.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 13 Sep 2012 12:15:17 -0700
Message-ID: <505230C4.5090107@windriver.com>
Date: Thu, 13 Sep 2012 14:15:16 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAP9ODKpy==dnOV-MtxLck0nLm0juBPiVSNwf=_M3gt12tCqXXQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpy==dnOV-MtxLck0nLm0juBPiVSNwf=_M3gt12tCqXXQ@mail.gmail.com>
Subject: Re: Possible bug in bitbake
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
X-List-Received-Date: Thu, 13 Sep 2012 19:27:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/12 1:41 PM, Otavio Salvador wrote:
> Hello,
>
> Rogerio and Daiane, here copied, found a bug in bitbake (we managed to
> reproduce it in denzil). The output in console when it happens can be
> seen at:
>
> https://groups.google.com/d/msg/meta-fsl-arm/7W9bwxqslnk/htEiOcaJMH8J
>
> The way to reproduce it is very easy:
>
>   * bitbake gnutls -c cleansstate
>   * remove gnutls from download cache
>   * bitbake gnutls
>
> Adding gnutls back to download cache make the build succeed.
>

There is a stamp file in the download cache.  If you don't clear that, then it 
will think it's still there.

bitbake gnutls -c distclean

that should remove from the download cache, the stamp file, and all of the 
actions of cleansstate.

--Mark


