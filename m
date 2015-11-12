Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8591A77221
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 16:08:14 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so68881903pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 08:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=ZgpvejmxFeaU/MGAJSkU4gZXq0Inko+kgrFO18yAFLs=;
	b=JiBTRWpAE44zq8ud3Qdlm3xywbkTC2/oFECa60p+WAqG0pB19UPXbogYnxqj5+6K/b
	OAsIBFzjwqT3CKTBfW6AgLg5nYP4JIyelYw44FNnjC1hsNecvLTLMdsduJjSbcbh4YY3
	HecnymGCCg2gTFY91sENc9MnEazhYdhX+h0DOvDIZtH+PfGh4J8EyhbncU/mWTiUqdHf
	vuJj1zgK5P1+Q9L4DlsvL0ZCJLepKswcpyoOprvir7U9hHQEIGNAWl0Poiv869A4QJzC
	oaJ+lexlT8Tm4KO5Bo6ZpmVdvEX34/JsykMQv1e9gcmM5QcYnqvakwsD2wuTcF9M6RFu
	08SQ==
X-Received: by 10.68.139.67 with SMTP id qw3mr13406447pbb.93.1447344494456;
	Thu, 12 Nov 2015 08:08:14 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:751f:c8d6:f527:b460?
	([2601:202:4000:1239:751f:c8d6:f527:b460])
	by smtp.googlemail.com with ESMTPSA id
	oi3sm15525330pbb.53.2015.11.12.08.08.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Nov 2015 08:08:13 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1447280506-25885-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LY68rGkJX+6drb5mGEtJ6aKr+yzR9-PFCPRRCi9Tu5QXw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5644B96A.1000008@gmail.com>
Date: Thu, 12 Nov 2015 08:08:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY68rGkJX+6drb5mGEtJ6aKr+yzR9-PFCPRRCi9Tu5QXw@mail.gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][jethro][fido][PATCH] libxml2: fix CVE-2015-7942 and CVE-2015-8035
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
X-List-Received-Date: Thu, 12 Nov 2015 16:08:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 11/12/2015 02:17 AM, Burton, Ross wrote:
> On 11 November 2015 at 22:21, Armin Kuster <akuster808@gmail.com> wrote:
> 
>> +Upstream Status: Backport
>>
> 
> This should be Upstream-Status, to get this merged sooner rather than later
> I've fixed it when merging to my staging branch.
> 

thanks.

- armin
> Ross
> 

