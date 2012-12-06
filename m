Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TgfEE-00062e-RT
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 18:27:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB6HCqki011515
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Dec 2012 09:12:52 -0800 (PST)
Received: from msp-dhcp50.wrs.com (172.25.34.50) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 6 Dec 2012 09:12:52 -0800
Message-ID: <50C0D217.1040200@windriver.com>
Date: Thu, 6 Dec 2012 11:12:55 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1354641032.git.mark.hatle@windriver.com>
	<0d97e14c48d2368ad4801994416eba990654254d.1354641032.git.mark.hatle@windriver.com>
	<CAP9ODKonXjjUYEGCuDqXiNF4vpROi4DbAZjygdNbFHDQh3+V_Q@mail.gmail.com>
In-Reply-To: <CAP9ODKonXjjUYEGCuDqXiNF4vpROi4DbAZjygdNbFHDQh3+V_Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/22] pkgconfig: Add a manual dependency of pkgconfig(pkg-config)
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
X-List-Received-Date: Thu, 06 Dec 2012 17:27:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/6/12 7:30 AM, Otavio Salvador wrote:
>
>
>
> On Tue, Dec 4, 2012 at 3:14 PM, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
>
>     The libtelepathy-glib-dev package contains a .pc file that has a requires
>     of pkgconfig(pkg-config) > 0.21 in it.  In order to satisfy this requirement
>     we add a manual RPROVIDE to the pkgconfig package.
>
>     Signed-off-by: Mark Hatle <mark.hatle@windriver.com
>     <mailto:mark.hatle@windriver.com>>
>
>
> Have this been tested using ipk and deb packages?
>
> I don't know if the format used, of rprovides, is supported by them (or
> abstracted by bitbake).

Deb was the only one that complained.  And that was solved by a patch that 
changed '(' and ')' to '__'.  This also paves the way for us to use some of the 
per-file dependency information we have to improve the dependency resolution for 
both deb and ipk.

(If IPK fails with this, it wasn't reporting the problem during build or image 
install on my system.  I tests deb, ipk and rpm with this change.)

--Mark

> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br <mailto:otavio@ossystems.com.br>
> http://www.ossystems.com.br
> Mobile: +55 53 9981-7854 http://projetos.ossystems.com.br
>



