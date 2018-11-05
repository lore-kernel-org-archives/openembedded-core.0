Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 298F079EEC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 11:39:39 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wA5Bdc6v030662
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 5 Nov 2018 11:39:40 GMT
Message-ID: <11534e53929f6a521560cdf97f71b6af61afdb29.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jens Rehsack <sno@netbsd.org>, openembedded-core@lists.openembedded.org
Date: Mon, 05 Nov 2018 11:39:38 +0000
In-Reply-To: <20181103131223.28268-1-sno@netbsd.org>
References: <20181103131223.28268-1-sno@netbsd.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] sqlite3_3: Update to 3.25.2
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
X-List-Received-Date: Mon, 05 Nov 2018 11:39:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-11-03 at 14:12 +0100, Jens Rehsack wrote:
> Update SQLite3 from 3.23.1 to 3.25.2 for UPSERT, window
> functions and improved ALTER TABLE support.
> 
> For a detailed list of changes since 3.23.1, see
> * https://www.sqlite.org/releaselog/3_25_2.html
> * https://www.sqlite.org/releaselog/3_24_0.html
> 
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/recipes-support/sqlite/sqlite3_3.23.1.bb | 10 ----------
>  meta/recipes-support/sqlite/sqlite3_3.25.2.bb | 10 ++++++++++
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.23.1.bb
>  create mode 100644 meta/recipes-support/sqlite/sqlite3_3.25.2.bb

How was this tested? pseudo-native fails to build with this:

https://autobuilder.yoctoproject.org/typhoon/#/builders/34/builds/161/steps/7/logs/step1b

and many other similar failures.

Cheers,

Richard


