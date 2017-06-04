Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 546A977756
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jun 2017 11:06:43 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v54B6fCo012501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 4 Jun 2017 12:06:43 +0100
Message-ID: <1496574401.6630.150.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
Date: Sun, 04 Jun 2017 12:06:41 +0100
In-Reply-To: <CA+chaQeMbAOzi_ZJiyzXzLnDK_otaHJBMBgYr1xMN8O_gNLqJg@mail.gmail.com>
References: <20170530080836.25342-1-Martin.Jansa@gmail.com>
	<CAJ86T=XbqdaxFrWzd1RN-5Y0E8B+Ndj9fHAy8XU0v+q1OYMp6Q@mail.gmail.com>
	<3feaadad-607b-0ae4-61b4-158f86816786@windriver.com>
	<CAJ86T=W=pf1ie8TEe6+pnHU_JaHf1wb-5Odv73=6em2iQYX98w@mail.gmail.com>
	<CA+chaQfy11sKg7njwvg3-Sg=-8_q4JmjEEbydiGRSAw+urQ5mQ@mail.gmail.com>
	<CA+chaQeMbAOzi_ZJiyzXzLnDK_otaHJBMBgYr1xMN8O_gNLqJg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 04 Jun 2017 12:06:43 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=mode, links"
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
X-List-Received-Date: Sun, 04 Jun 2017 11:06:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2017-06-04 at 08:55 +0200, Martin Jansa wrote:
> There are few more QA warnings about this even with this change
> applied:
> 
> count: 3	issue: host-user-contaminated
> glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-ar-
> jo/usr/lib/locale/ar_JO/LC_PAPER is owned by uid 3004, which is the
> same as the user running bitbake. This may be due to host
> contamination [host-user-contaminated]
> glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-de-
> at/usr/lib/locale/de_AT/LC_MEASUREMENT is owned by uid 3004, which is
> the same as the user running bitbake. This may be due to host
> contamination [host-user-contaminated]
> glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-es-sv.iso-
> 8859-1/usr/lib/locale/es_SV.ISO-8859-1/LC_MESSAGES/SYS_LC_MESSAGES is
> owned by uid 3004, which is the same as the user running bitbake.
> This may be due to host contamination [host-user-contaminated]
> 
> These seem to be a bit undeterministic (I think I've seen various
> locales and files there in different runs, not just these 3 files).
> But I'll leave this to someone else.

I think there is an open bug for this one:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=11299

Cheers,

Richard

