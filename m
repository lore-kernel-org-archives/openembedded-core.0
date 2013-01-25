Received: from eu1sys200aog102.obsmtp.com ([207.126.144.113])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1TynRM-0001Mj-3n
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 18:51:48 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob102.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUQLCjoE2TUha9fLzU0YvCwV7ZHXgLaYt@postini.com;
	Fri, 25 Jan 2013 17:36:16 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA50B1E5;
	Fri, 25 Jan 2013 14:32:22 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 876BF4D96;
	Fri, 25 Jan 2013 14:32:22 +0000 (GMT)
Received: from CTN005027 (pcmdt30.ctn.st.com [164.130.129.192])
	by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id AWB62542 (AUTH condorg);
	Fri, 25 Jan 2013 15:32:21 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: "'Marcin Juszkiewicz'" <marcin.juszkiewicz@linaro.org>,
	<openembedded-core@lists.openembedded.org>
References: <1359124075-3504-1-git-send-email-marcin.juszkiewicz@linaro.org>
In-Reply-To: <1359124075-3504-1-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Fri, 25 Jan 2013 15:32:21 +0100
Message-ID: <094b01cdfb08$c967ddf0$5c3799d0$@st.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQIOH9lnb77hYnQlsquFzORqW7fQgJfZ0T/w
Subject: Re: [PATCH] eglibc: fix evacuate_scripts for external	toolchains
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
X-List-Received-Date: Fri, 25 Jan 2013 17:51:48 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: it

Well done Marcin,
I've just  met this issue working with my local external-toolchain and I =
had
to
locally patch the same .inc for checking. :)

Thanks for having highlighted that in the mailing list.
Regards,
Giuseppe

>-----Original Message-----
>From: openembedded-core-bounces@lists.openembedded.org
>[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>Of Marcin Juszkiewicz
>Sent: venerd=EC 25 gennaio 2013 15:28
>To: openembedded-core@lists.openembedded.org
>Subject: [OE-core] [PATCH] eglibc: fix evacuate_scripts for external
toolchains
>
>Not every external toolchain has mtrace/sotruss/xtrace scripts so check
their
>existance first.
>
>Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>---
> meta/recipes-core/eglibc/eglibc-package.inc | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/meta/recipes-core/eglibc/eglibc-package.inc =
b/meta/recipes-
>core/eglibc/eglibc-package.inc
>index 79c43f1..4a4e54a 100644
>--- a/meta/recipes-core/eglibc/eglibc-package.inc
>+++ b/meta/recipes-core/eglibc/eglibc-package.inc
>@@ -113,7 +113,9 @@ do_evacuate_scripts () {
> 	target=3D${D}${includedir}/eglibc-scripts-internal-
>${MULTIMACH_TARGET_SYS}
> 	mkdir -p $target
> 	for i in ${bashscripts}; do
>-		cp ${D}${bindir}/$i $target/
>+	    if [ -f ${D}${bindir}/$i ]; then
>+		    cp ${D}${bindir}/$i $target/
>+		fi
> 	done
> }
>
>--
>1.8.0
>
>
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



