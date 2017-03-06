Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7440B774FF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 16:01:45 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id v190so25336764pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 08:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=5PlNYdOYleBXz9krNWxwUU5sudEJtDvM0hGUSyHRQRc=;
	b=eevxgSKaX/BB5dzU5Akpn9oDMBMlVtpxJsFbPaRkHIw3xuLQ2WSWoz4s3qoPlJ0fdL
	uKo1wuFmdPpovIhvkQPAIP3bCzrjREQkWlx+1VYiJ0b3Bz+Yx9jHTwuGW91EO/gvrMR3
	Y+xSoXi50tJEkJVvR8IDnpKwNg77U+4W8EfJrJnZaS67t+YKiuX2JeKKDGzLGQb0r77r
	C7UpID7VyO8XEz2ivZmBR3o8KoWKCYjgVcXBTwED1z1eKe1c4NBMo/eC/73Dc9Euj+s/
	DBi/5Ya0FNX4XiBV2QMckdtRWmK1aqFYAlcCIkTtjCraKl8WLTpApyiRSe2bADIErn3h
	ee8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=5PlNYdOYleBXz9krNWxwUU5sudEJtDvM0hGUSyHRQRc=;
	b=DKjWd9XOGWbKbwIXlqgS3C5A0vWDgW7tM+1sN4QGl1oQ7DngvrW2EOzuL9uRU5C2Pg
	4P7vRminyjpS0CQID7m2EzebA6Pcb+Rj+mcLJa/rDhKblOqNAoAwFiUKHeg+6xCHkMIP
	wSPzG9wc+JPQo2q3ubDog/XNlRHq2wYL6TvLClZQGe1vMjNQL0sF6Fpxp2PcBOXFlEBC
	aF2wfzMzDYBLlwC95OVlpT7tdlNcn+pEp3Gg8KOizw9oJN8AcOflV8kOHWw6XdZ6V8YT
	jS8Zl8ncUZ3KkSKzBSUvDAVO7NUTkXqkNFetpnwrYJn9nSbuMzx4/2IfLmJQdRAmoqU1
	kueg==
X-Gm-Message-State: AMke39nEwHjvLZatTEis0QG2wIaMcXgXiZHEpEoWJnjFHZ1+AX2TO/L+khITrh/Ap7n8JQ==
X-Received: by 10.99.45.133 with SMTP id t127mr21523876pgt.224.1488816106306; 
	Mon, 06 Mar 2017 08:01:46 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:e3df:bf0a:9f90:498e?
	([2601:202:4001:9ea0:e3df:bf0a:9f90:498e])
	by smtp.gmail.com with ESMTPSA id
	u75sm40734914pgc.31.2017.03.06.08.01.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 08:01:45 -0800 (PST)
To: Rebecca Chang Swee Fun <rebecca.swee.fun.chang@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1488770446-37731-1-git-send-email-rebecca.swee.fun.chang@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <7ef9f7c0-8e60-803a-ea4d-b833c4ff7987@gmail.com>
Date: Mon, 6 Mar 2017 08:01:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1488770446-37731-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: Re: [jethro][PATCH] Forklift OpenSSL 1.0.k to Jethro
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
X-List-Received-Date: Mon, 06 Mar 2017 16:01:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 03/05/2017 07:20 PM, Rebecca Chang Swee Fun wrote:
> From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
>
> Hi all,
>
> This is an version upgrade for OpenSSL from 1.0.2h to 1.0.2k.
> The upgrade was forklifted from OE-Core master branch to
> Jethro branch and remove upstream dependencies to new bbclasses.
>
> The details of CVEs are mentioned in the patch commit message.
>
> The main purpose of this forklifting effort is to make sure
> OpenSSL shipped in BSPs is updated.
> Due to OpenSSL version
> fork in Jethro, it is difficult to do purely "git cherry-pick"
> and resolving conflicts everywhere.

Its not difficult, its just time consuming.

> This is main reason I opted for forklifting approach.
We have discussed updating openssl as the method for managing this 
package in stable branches and it was met with lots of resistance. 
Seeing this is Jethro ( nearly 2 yrs old), I would suspect this is a 
much harder sell to make.


>
> This is the first time I did an upgrade for OpenSSL. Please
> help to review and provide feedbacks if this approach is not
> feasible.
The feasible call is on the stable branch maintainer and oe-core layer 
maintainers.

per policy, these changes would have to propagate through the other 
stable branches first if we didn't want to make an exception.

- armin

>   I'm looking forward to learn from everyone of you.
>
> Thank you very much.
>
> Regards,
> Rebecca
>
> Chang, Rebecca Swee Fun (1):
>    openssl: upgrade 1.0.2h -> 1.0.2k
>
>   meta/recipes-connectivity/openssl/openssl.inc      |  104 +-
>   .../openssl/openssl/0002-CVE-2017-3731.patch       |   53 +
>   .../openssl/openssl/CVE-2016-2177.patch            |  286 --
>   .../openssl/openssl/CVE-2016-2178.patch            |   51 -
>   .../openssl/openssl/CVE-2016-2179.patch            |  255 --
>   .../openssl/openssl/CVE-2016-2180.patch            |   44 -
>   .../openssl/openssl/CVE-2016-2181_p1.patch         |   91 -
>   .../openssl/openssl/CVE-2016-2181_p2.patch         |  239 -
>   .../openssl/openssl/CVE-2016-2181_p3.patch         |   30 -
>   .../openssl/openssl/CVE-2016-2182.patch            |   70 -
>   .../openssl/openssl/CVE-2016-6302.patch            |   53 -
>   .../openssl/openssl/CVE-2016-6303.patch            |   36 -
>   .../openssl/openssl/CVE-2016-6304.patch            |   75 -
>   .../openssl/openssl/CVE-2016-6306.patch            |   71 -
>   .../openssl/openssl/CVE-2016-8610.patch            |  124 -
>   .../Use-SHA256-not-MD5-as-default-digest.patch     |   69 +
>   .../openssl/crypto_use_bigint_in_x86-64_perl.patch |   33 -
>   .../openssl/openssl/debian/ca.patch                |    2 +-
>   .../openssl/openssl/debian/version-script.patch    | 4663 ++++++++++++++++++++
>   .../openssl/debian1.0.2/version-script.patch       |   31 +-
>   .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch |    2 +-
>   .../openssl/openssl/openssl-c_rehash.sh            |  222 +
>   .../openssl/openssl-util-perlpath.pl-cwd.patch     |   34 +
>   .../openssl/openssl/openssl_fix_for_x32.patch      |    4 +-
>   .../openssl/openssl/parallel.patch                 |   17 +-
>   .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   82 -
>   .../recipes-connectivity/openssl/openssl_1.0.2k.bb |   64 +
>   27 files changed, 5200 insertions(+), 1605 deletions(-)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/0002-CVE-2017-3731.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2179.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2180.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p1.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p2.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p3.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2182.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6302.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6303.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6304.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6306.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-8610.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/debian/version-script.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-util-perlpath.pl-cwd.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
>   create mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
>


