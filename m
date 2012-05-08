Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SRq6s-0002dl-Lm
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 21:30:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q48JKIbu000507
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2012 12:20:18 -0700 (PDT)
Received: from msp-dhcp19.wrs.com (172.25.34.19) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 8 May 2012 12:20:17 -0700
Message-ID: <4FA971F0.8020406@windriver.com>
Date: Tue, 8 May 2012 14:20:16 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20120508180256.GB3138@jama.jama.net>
In-Reply-To: <20120508180256.GB3138@jama.jama.net>
Subject: Re: CONFLICTS as keyword or just misspelled RCONFLICTS?
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
X-List-Received-Date: Tue, 08 May 2012 19:30:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/12 1:02 PM, Martin Jansa wrote:
> It's used in few recipes (lately used in kmod recipe), but no .bbclass and no match in bitbake
>
> OE @ ~/openembedded-core $ git grep CONFLICTS | grep -v RCONFLICTS | grep -v TUNE_CONFLICTS | grep -v TUNECONFLICTS
> meta/recipes-connectivity/openssh/openssh_6.0p1.bb:CONFLICTS_${PN} = "dropbear"
> meta/recipes-core/gettext/gettext_0.18.1.1.bb:CONFLICTS_${PN} = "proxy-libintl"
> meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb:CONFLICTS = "compositeext"
> meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb:CONFLICTS = "damageext"
> meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb:CONFLICTS = "fixesext"
> meta/recipes-graphics/xorg-proto/randrproto_1.3.2.bb:CONFLICTS = "randrext"
> meta/recipes-graphics/xorg-proto/recordproto_1.14.1.bb:CONFLICTS = "recordext"
> meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb:CONFLICTS = "renderext"
> meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb:CONFLICTS = "resourceext"
> meta/recipes-graphics/xorg-proto/xf86dgaproto_2.1.bb:CONFLICTS = "xxf86dgaext"
> meta/recipes-graphics/xorg-proto/xf86vidmodeproto_2.3.1.bb:CONFLICTS = "xxf86vmext"
> meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb:CONFLICTS = "matchbox-common"
> meta/recipes-support/db/db_5.1.19.bb:CONFLICTS = "db3"

Not finding CONFLICTS defined anywhere, including bitbake -- I'm inclined to 
agree that these should have been RCONFLICTS_<pn>, and weren't.

> BTW: IIRC TUNE_CONFLICTS/TUNECONFLICTS inconsistency was discussed on ML already
> (I could not find that thread, but still it's used in meta/conf/machine/include/arm

Ya, patches to fix these, and actually check them were sent to the list, but I 
don't believe they have been merged yet.

--Mark

> Cheers,
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



