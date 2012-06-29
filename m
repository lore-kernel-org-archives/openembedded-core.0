Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkRQp-00055x-BZ
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 04:59:39 +0200
Received: by dalh21 with SMTP id h21so3614578dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 19:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=F7NFu+KbAlno9KUlCykG4F5xBqZ8//KmHClbcrCw4os=;
	b=aagxiELN8TYAiDP9G/cbY0RDK6lJcHMisRjyGMIIrVcHBqHMRFnhHixm7QaOCw9u9j
	UhgYcolwTeg5BYkfg5y03Tm/LNT/XWmIEaXn6iGgGxhL8GPW1gL6LiGSVnKjrZbLvZdv
	DNFTE4oioJbhGBVgqFFaxiHFukEuJzfw5POSRcvkuHV7nhuOXjno4vE0py1XAF/PYEuD
	mirewKZx8DDru2pLj3lhKxu0MgM5S6Kw60lRiIH2STWMFtcgXKvu/9OAr4b/GBEo25xD
	OUpUemRdzuO/7/kBNJ0Ps4OEMLedBIbhPrbNGOmmei9o31v9cRi/OJ0ppULM0OopWiiN
	SI1g==
Received: by 10.68.200.104 with SMTP id jr8mr1787915pbc.9.1340938123289;
	Thu, 28 Jun 2012 19:48:43 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id sy3sm3954735pbc.18.2012.06.28.19.48.41
	(version=SSLv3 cipher=OTHER); Thu, 28 Jun 2012 19:48:42 -0700 (PDT)
Message-ID: <4FED178F.50806@gmail.com>
Date: Thu, 28 Jun 2012 19:48:47 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340908084.git.paul.eggleton@linux.intel.com>
	<dfdd61d5d2f3c413b6b19db1b9d9371e46b32aa5.1340908084.git.paul.eggleton@linux.intel.com>
In-Reply-To: <dfdd61d5d2f3c413b6b19db1b9d9371e46b32aa5.1340908084.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.4.2
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 2/3] apr: add util-linux to DEPENDS for libuuid
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
X-List-Received-Date: Fri, 29 Jun 2012 02:59:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/28/2012 11:29 AM, Paul Eggleton wrote:
> apr will use libuuid if it is present, and thus we should require
> that it is there so that we have a deterministic build.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> --- 
> meta/recipes-support/apr/apr_1.4.6.bb |    1 + 1 file changed, 1
> insertion(+)
> 
> diff --git a/meta/recipes-support/apr/apr_1.4.6.bb
> b/meta/recipes-support/apr/apr_1.4.6.bb index 6cd37f1..54c47fe
> 100644 --- a/meta/recipes-support/apr/apr_1.4.6.bb +++
> b/meta/recipes-support/apr/apr_1.4.6.bb @@ -1,6 +1,7 @@ DESCRIPTION
> = "Apache Portable Runtime (APR) library" HOMEPAGE =
> "http://apr.apache.org/" SECTION = "libs" +DEPENDS = "util-linux"
> 


interesting. I wonder if there is configure option to denote this
feature. May be its better to enable it explicitly along with this change


> LICENSE = "Apache-2.0" LIC_FILES_CHKSUM =
> "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
> 


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEUEARECAAYFAk/tF48ACgkQuwUzVZGdMxQydQCUCdoOXb+AV2vPY7OAcc0fiecF
sgCfRbcwcMIZfoVjZ+XCsh3H0cgzmOE=
=8BAs
-----END PGP SIGNATURE-----


