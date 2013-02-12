Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U5MG9-0002Pd-Qd
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 21:15:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1CJxK8P021718
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 11:59:21 -0800 (PST)
Received: from msp-dhcp44.wrs.com (172.25.34.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 12 Feb 2013 11:59:20 -0800
Message-ID: <511A9F12.2020100@windriver.com>
Date: Tue, 12 Feb 2013 13:59:14 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <2760168.9kFd94gL1F@helios> <20130212191902.GD3300@jama>
	<CABcZAN=ZXF=mLKzd7EswuFj4FLO5WosnciFUjSLst3uZE38wKA@mail.gmail.com>
In-Reply-To: <CABcZAN=ZXF=mLKzd7EswuFj4FLO5WosnciFUjSLst3uZE38wKA@mail.gmail.com>
Subject: Re: [oe] RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 20:15:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/12/13 1:32 PM, Chris Larson wrote:
>
> On Tue, Feb 12, 2013 at 12:19 PM, Martin Jansa <martin.jansa@gmail.com
> <mailto:martin.jansa@gmail.com>> wrote:
>
>      > * meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
>      > * meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
>      > These two add MySQL and PostgreSQL support to Qt and Qt/Embedded. I see this
>      > as a distro policy decision; these should move to the layers for whichever
>      > distros want this. FWIW, this is particularly egregious if you've already
>      > built Qt, then add meta-oe and find Qt is being unexpectedly rebuilt.
>
>     MySQL and PostgreSQL are not in oe-core so it cannot be replaced with
>     simple PACKAGECONFIG option in oe-core recipe, but I also prefer to
>     share such .bbappend somewhere instead of every distribution reinventing
>     the wheel when trying to enable something as simple as db in qt.
>
>
> I don't see any reason the oe-core recipe couldn't provide the packageconfig
> options, even missing the dependencies. They are valid package configuration
> options, so they should exist in PACKAGECONFIG. If a distro wants to enable one
> of them, however, they'd better include the layers that provide the deps :)

RPM and Smart integrations both have configuration options that are invalid for 
most configurations or sometimes need additional software provided via a layer. 
  I think this is acceptable, as long as the configuration selects the proper 
DEPENDS/RDEPENDS to ensure the items work properly in the end.

--Mark

> --
> Christopher Larson
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



