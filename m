Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQ6is-0006j9-B7 for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 01:17:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAF0BbhP018961
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 00:11:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18650-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 00:11:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAF0BU9b018954
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 00:11:31 GMT
Message-ID: <1321315894.26881.117.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2011 00:11:34 +0000
In-Reply-To: <4EC1A8A1.5010303@balister.org>
References: <4EC1A8A1.5010303@balister.org>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Build failure in samba
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
X-List-Received-Date: Tue, 15 Nov 2011 00:17:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-14 at 18:47 -0500, Philip Balister wrote:
> Anyone have an idea about this failure building samba?
> 
> http://pastebin.com/5PGX6MZr
> 
> I'm going to look more tomorrow, just hoping someone sees something obvious.

Maybe this might help:


commit ce064001e628597cab9c5713f1351e03478a4aa5
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Wed Nov 2 14:24:37 2011 +0000

    samba: Force python disabled for now to avoid host contamination

diff --git a/recipes-support/samba/samba_3.5.6.bb b/recipes-support/samba/samba_3.5.6.bb
index d5945f9..a44ce02 100644
--- a/recipes-support/samba/samba_3.5.6.bb
+++ b/recipes-support/samba/samba_3.5.6.bb
@@ -12,6 +12,7 @@ SRC_URI[sha256sum] = "466410868375d19a286ac3fc5d9f3c267ce359189f8e0d76e72ec10bd5
 S = "${WORKDIR}/samba-${PV}/source3"
 
 EXTRA_OECONF += "\
+	ac_cv_path_PYTHON=/not/exist \
 	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
 	samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
 	linux_getgrouplist_ok=no \

Cheers,

Richard



