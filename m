Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8fk-00006x-OZ
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 19:45:01 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:34:19 -0700
Received: by lahj13 with SMTP id j13so2477562lah.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=daJSW6pbH4lsz0jfevEZikrDE6IC46dBdYp6NoxzhAE=;
	b=C79Fdwvah3GcG3qqXTNfp5dzs1Ypw79QTuxf0iHaLfjY5oM885LgRdc6iuCCmxtWph
	l6y9OcU69TQm+OXoue5mDgPaYbuYHTUz2b3Qvdd/0cRXtDsViPKeMS+F3AqzSGGVe7oG
	FjnhVgThDhvAH6E+RIvWzNyYayxP5SgPyfhIAPC1m1x6e/yxSlmQj3OLb8og8+e85vW1
	zqjqfi8Y21mXAnQfutwdf/hGWdBf4EGyPL0K0/YlkM6Ql2Y6am2rcb4Hna9L1kjIMP3z
	jMjdz4wjoacIWlTgT60MswSnZwnwz+LJjweLUjO+k2r965HeCigS/aLN4txhGAqYipwW
	33vw==
MIME-Version: 1.0
Received: by 10.152.108.38 with SMTP id hh6mr17891276lab.28.1339436057437;
	Mon, 11 Jun 2012 10:34:17 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:34:17 -0700 (PDT)
In-Reply-To: <5bbd09a3f268bff3c7f1126e6d88bb61aeccbb2f.1338658339.git.otavio@ossystems.com.br>
References: <cover.1338658338.git.otavio@ossystems.com.br>
	<5bbd09a3f268bff3c7f1126e6d88bb61aeccbb2f.1338658339.git.otavio@ossystems.com.br>
Date: Mon, 11 Jun 2012 10:34:17 -0700
Message-ID: <CAPhnLPDP65iKqruiLLE2UmmEZsR7LOKeUNMGHVitwKp54dHWRg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlfpgUuM5IpEwIWeHKogpMtJZhxNTfsJzka9vjwHo9nLZnF8YXJAbdEZ5l8uNsUbhaQj7M+
Subject: Re: [PATCH 1/1] openjade: autoreconf to fix building on newer host systems
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
X-List-Received-Date: Mon, 11 Jun 2012 17:45:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jun 2, 2012 at 10:34 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> When using an update host system the build environment fails to
> properly get config.h done. To solve it we update the build system
> thought use of autoreconf. The build failure was:
>
> ,----
> | ...
> | DssslApp.cxx:117:36: error: 'PACKAGE' was not declared in this scope
> | DssslApp.cxx:118:36: error: 'VERSION' was not declared in this scope
> | make[2]: *** [DssslApp.lo] Error 1
> `----
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---

Merged into OE-Core

Thanks

-b

-- 
Elizabeth Flanagan
Yocto Project
Build and Release


