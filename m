Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 47B2372656
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 13:59:57 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id 29so5538872yhl.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 05:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=RcnAUVaGQYVu3l802izhgV44vG3c19zFKx1Q32hEAQM=;
	b=jVuYljmH9utkDpcN8j4DqeT5kDOt21iBKtfaHcLJosxxMt4nALeytZEtrFMAde00mt
	6Vu1KUl8gq+B1h031/FkphiVpTeoT8/S7bOLoh1cLdvlSHs1egt3RApNOqtgK5XhhjXi
	ArE6A/5Ns/VRhw8IIFW7OFQz8NuKyWTPhGFfIbm84YWMCPjde/QxvNDZ5ufA35QBJnXX
	A32HBh+V0quv90YwCKbqpgiiRcg4mPwmqvvTXXubvZ3dy3RWhWJCiqSqFeGYPgJ4T8Ki
	JBgm8atWFwefrxw/KfahNHy4VxLnQq14e8dqwTmy8Fm2y6aaAHrPpqo8zg2Q19Won57R
	qW8Q==
MIME-Version: 1.0
X-Received: by 10.236.109.166 with SMTP id s26mr30983267yhg.67.1419602398384; 
	Fri, 26 Dec 2014 05:59:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Fri, 26 Dec 2014 05:59:58 -0800 (PST)
In-Reply-To: <883cc974857e6896b33eb4be4f5c326840bb90ad.1419471695.git.hongxu.jia@windriver.com>
References: <cover.1419471695.git.hongxu.jia@windriver.com>
	<883cc974857e6896b33eb4be4f5c326840bb90ad.1419471695.git.hongxu.jia@windriver.com>
Date: Fri, 26 Dec 2014 11:59:58 -0200
X-Google-Sender-Auth: tDgTN1izYKQjCb7-rp-tPprAIfI
Message-ID: <CAP9ODKqYTffL5+7uY9VTbR9nM1bMU9nA5rb0-C0FXm3GmX3POQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] busybox.inc: fix QA package-missing warnings
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
X-List-Received-Date: Fri, 26 Dec 2014 13:59:58 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 24, 2014 at 11:48 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> While building busybox with QA package-missing checking enabled,
> there was warning:
> ...
> WARNING: QA Issue: package busybox-mdev not generated, but listed in PACKAGES
> WARNING: QA Issue: package busybox-httpd not generated, but listed in PACKAGES
> ...
>
> The config in ${B}/.config decides to generate busybox-mdev,
> busybox-httpd or not. Files are copied if the packages generated.
> So set PACKAGES in do_package according to the existance of files.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

Shouldn't we "invert" the logic here? This patch 'removes' httpd and
mdev when those are not enabled. Why we don't /add/ those when they
are enabled?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

