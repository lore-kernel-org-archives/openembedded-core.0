Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SDzcf-0003Ou-71
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 16:49:45 +0200
Received: by lagw12 with SMTP id w12so1731548lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 07:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=sacc0Z+oDuY+4OEVAltW2mnfvc5lmhmTRrxF5oLZLgc=;
	b=C5DUoJVRkaXMexoXeeVZWYMyAdKEwOIDFKQKyZuBaJJnz9tFThnhjagUmLA94O+/8U
	ivtEW7yo6zzX4AXmd54VjUq3J0IGT5Og8fajgkEyghZCnBsVEWSHeToTtC4VQxra/FpK
	DYkHqgtvZdi64Oig/O95inGI0My710iy0GLP36mTwBuV9UR2EYGqKET1zCuPUvZggDVw
	W5JjsgQjaKiHkrRP/CoiYfnxhZv90dGEBz5v3JeEFhIYez4KT/KW1WeUxE30XpkZSAdM
	NvfNAbTyjWPmqpzo+uxElo7mUsyzE206xGcUAooDGz8ECLubFggEefKsOsy8AmACcyGl
	Xwxw==
Received: by 10.152.146.163 with SMTP id td3mr2565775lab.31.1333204839430;
	Sat, 31 Mar 2012 07:40:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Sat, 31 Mar 2012 07:40:09 -0700 (PDT)
In-Reply-To: <CAMKF1srXwcC9s_wOb3OuSEt+QWeSOfn3yR6R6VGtGP3mhhRASw@mail.gmail.com>
References: <cover.1333176251.git.lianhao.lu@intel.com>
	<d33b7d21b1cc23f7c20743d85a261c4d610e2f41.1333176251.git.lianhao.lu@intel.com>
	<eb2bbe99f15183d5c82ab5c12178a1e336a7c5ce.1333176251.git.lianhao.lu@intel.com>
	<CAMKF1srXwcC9s_wOb3OuSEt+QWeSOfn3yR6R6VGtGP3mhhRASw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 31 Mar 2012 07:40:09 -0700
Message-ID: <CAMKF1sosTMMM0AUhPy6=4P7CQBAO2WJ3VCfObAb-+0g2+25mig@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] eglibc-nativesdk: Set GCC_ADDONS.
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
X-List-Received-Date: Sat, 31 Mar 2012 14:49:45 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 31, 2012 at 7:39 AM, Khem Raj <raj.khem@gmail.com> wrote:
> nptl is bogus now a days. so please delete it completely.

heh I must have said in GLIBC_ADDON context its bogus. Since its _the_
only thread implementation in eglibc/glibc


