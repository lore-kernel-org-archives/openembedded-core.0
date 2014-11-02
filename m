Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0352F60557
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Nov 2014 15:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA2F0YG1010378; Sun, 2 Nov 2014 15:00:34 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UKpl6Jjzk91q; Sun,  2 Nov 2014 15:00:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA2F0V0p010375
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 2 Nov 2014 15:00:33 GMT
Message-ID: <1414940466.5111.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Sun, 02 Nov 2014 15:01:06 +0000
In-Reply-To: <1414925318-15353-3-git-send-email-pab@pabigot.com>
References: <1414925318-15353-1-git-send-email-pab@pabigot.com>
	<1414925318-15353-3-git-send-email-pab@pabigot.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] image_types.bbclass: add tar --numeric-owner support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Nov 2014 15:01:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-11-02 at 04:48 -0600, Peter A. Bigot wrote:
> tar format normally stores user and group as names, which is the right
> thing to use when target passwd and group files are available.  When
> unpacking a rootfs archive onto a mounted SD card partition on a build
> host outside the pseudo environment the host passwd/group files will be
> used for name-to-id mapping, which results in mis-assigned identifiers
> (often for important ids like messagebus).
> 
> Using IMAGE_FSTYPES += "nug.tar" creates rootfs.nug.tar files where the
> owner and group are specified numerically, using the target IDs obtained
> when the archive is built under pseudo.
> 
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>  meta/classes/image_types.bbclass | 2 ++
>  1 file changed, 2 insertions(+)

Shouldn't we always do this?

I'm trying to figure out when this would be a bad idea...

Cheers,

Richard


