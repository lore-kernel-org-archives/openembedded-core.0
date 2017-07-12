Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4B243771EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 06:56:38 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id h134so7738211iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 23:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=BnUz+MD/IcUKs4zmuVp+4Bcqvw39cx2IAGplIcF4gTU=;
	b=BTZQd2QuNuop71LSAaVRS9Txnq/LCX07FPId0A2las/PZI8vh5GwWhop0RykkuqOXD
	RUVMB+nd/RBurUe9fUNFWlOinRKvs1enHNcwE9qL1zyJhASs7UC2epO3xQk6tnS3Fu0y
	9NtRal1tX8TAIdcnDgiX9Z61cThcwOt6dV7p+85GT66SLLWQda3LIOlCDITXJOmwj2SM
	1eVwg0G6oFxw9fmfhfbevL2zmPpE5jBIIw5RvcVI40yS6QAhxIllzTLnAl8gfd5QgZgM
	A3wCwH7xEnCPI0UNvoLkEwC5F91twlFCi7t9xSd33nkj6QM2izVtTV/u61hqsOh3To1H
	yozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=BnUz+MD/IcUKs4zmuVp+4Bcqvw39cx2IAGplIcF4gTU=;
	b=ZqnCVITotQl7kNlOWFft77DbTlKvm7Sn7cGwG+/23CeQsKxKz4yN3OiXDI8goAEukn
	ZKAx/TTX5I4oGF/BaScIf84EYKmD3F0ciIYlxNAJfqP5eIl7VGeD4oa9YjaJCTKPCA39
	msG9GVoH7Zxv/gs8gotJSNhoYC7TucflmKyMcW28867KH2MUPNdPq10nt+hmWtmHK003
	RvSKWVP74sicccrz8wLxa6yGfKWnes/MWBUH/8n7bV/lIyN33OTkhVi5FxJf4JJV/nEV
	c81apE3//rPtnofz2sDry2erEx+BHH6Y/i5+/927u0mHggJrFiHUNYHLBu4nADRD0VU8
	MA4w==
X-Gm-Message-State: AIVw110h1/Fl3pQ5XWnnqTSg1WUAfA/D4qjx5EwBh6OXYSg/OAJ0Z+EG
	cRC6AVOqCAVKtNKi
X-Received: by 10.107.176.11 with SMTP id z11mr3848656ioe.173.1499842599900;
	Tue, 11 Jul 2017 23:56:39 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F424.dip0.t-ipconnect.de. [93.232.244.36])
	by smtp.gmail.com with ESMTPSA id
	e143sm1102941iof.54.2017.07.11.23.56.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 23:56:38 -0700 (PDT)
Message-ID: <1499842595.20211.104.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Wed, 12 Jul 2017 08:56:35 +0200
In-Reply-To: <3e458a34a75f4a0b1e351b780034cce5f26cae89.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<3e458a34a75f4a0b1e351b780034cce5f26cae89.1499803885.git.anibal.limon@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 18/30] oeqa/selftest/cases: tinfoil to run in the main thread
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
X-List-Received-Date: Wed, 12 Jul 2017 06:56:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-07-11 at 15:23 -0500, Aníbal Limón wrote:
> The tinfoil tests needs to initialize bitbake internals and wasn't
> designed to be in a thread environment causing problems when try
> for example set signal handlers in a thread different than the
> main one.
> 
> To workaround this execute tinfoil tests in the main thread and
> don't use custom builddir because isn't make sense too.
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/cases/tinfoil.py | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py
> b/meta/lib/oeqa/selftest/cases/tinfoil.py
> index aa1af7e0423..7248b755812 100644
> --- a/meta/lib/oeqa/selftest/cases/tinfoil.py
> +++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
> @@ -9,7 +9,6 @@ from oeqa.core.decorator.oeid import OETestID
>  
>  class TinfoilTests(OESelftestTestCase):
>      """ Basic tests for the tinfoil API """
> -
>      @OETestID(1568)
>      def test_getvar(self):
>          with bb.tinfoil.Tinfoil() as tinfoil:

There's just a line removal in this patch. That's probably not what was
intended?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




