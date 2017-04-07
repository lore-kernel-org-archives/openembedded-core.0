Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 35C7A77D6F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 06:41:29 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id y18so38305073itc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=yWtYkzynKjs6m5nNY21gbdHo0e1sQpKxrwVMwI9UAP0=;
	b=BN2NpJTsN/z/WLODp7G6aMYuypQSG0dVnkYbp76UrllaVkHWoAxXoF64mSyDXyefQk
	sH+d8cM7YganhfKYpSVZgAkiMnFr/xbGSK/MSYXlYxrau5w/ggtrsmWwTaO/KZpNS9uf
	NlQS/PlCzdLckkM2D2vQexc7aqMTrvcAj7TPos9Z3/gCIl/QrHTgBOZe8UgbyzcufBPH
	D8l4DtYFesONoTOIus0YZfAqFv4pnE8xkaMbd7tn6S5ZYIcCFCVuAuOHR8fgZRwH1EXX
	deQGwV4kN4Za3Tvlzh0HTLv7W/3MHjCjnwj9RCFm5J2dcq9dBAMk3Qql/1I8LqBS3fGr
	s07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=yWtYkzynKjs6m5nNY21gbdHo0e1sQpKxrwVMwI9UAP0=;
	b=S8//ZHdjU35UeTAj5Vcoyev/B8D16044D4sKyl2Gt05gLauJmqbOcGDmEtgd/rrZrM
	bqTHFyzJOrtCv5O5eOKUWYUUR2pwFsRNxZcHSARv0DJPhMjSiJZCf5J9KCU5FdrbEThb
	V7Pnl9A7cP3jgjZQA4tLQx8RCHW5sm9eQ0VReqZc39rukTak8FqzVMtbga5JyAdv4hMs
	y0JmPaxaJO2eKN91Pc9SX5DPjhR9Ce3oAs2HchXu2v2J2mqw2yhgrqeGlE/Mq9xQNgOp
	cd1gJFcjVF8T7/pkfaP7bBNBUL/v1H+ppDQYPJO5BIfiO+j/0370Rpsg+MwuVdNAeRad
	h47g==
X-Gm-Message-State: AFeK/H3ITPaQ0p2aPHQ6yCmbTQFVClde7fwIQ4gpSO7u/RlqHXZ8bzb0XXNmVwTijczsAYS+
X-Received: by 10.36.70.210 with SMTP id j201mr29369824itb.109.1491547291386; 
	Thu, 06 Apr 2017 23:41:31 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EAD9.dip0.t-ipconnect.de. [93.232.234.217])
	by smtp.gmail.com with ESMTPSA id
	n73sm2087578ioe.10.2017.04.06.23.41.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Apr 2017 23:41:30 -0700 (PDT)
Message-ID: <1491547287.10884.57.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 07 Apr 2017 08:41:27 +0200
In-Reply-To: <5236508.TZczFS0D24@peggleto-mobl.ger.corp.intel.com>
References: <cover.3970fab18c2598adf378d62e8fcba4ca004fbd13.1491399200.git-series.patrick.ohly@intel.com>
	<ddd6caf52e347f925286bfe9e37b894996037679.1491399200.git-series.patrick.ohly@intel.com>
	<5236508.TZczFS0D24@peggleto-mobl.ger.corp.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] yocto-compat-layer: limit report of signature changes
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
X-List-Received-Date: Fri, 07 Apr 2017 06:41:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-04-07 at 08:38 +1200, Paul Eggleton wrote:
> On Thursday, 6 April 2017 1:36:05 AM NZST you wrote:
> >    AssertionError: False is not true : Layer meta-xxxx changed 120
> > signatures, initial differences (first hash without, second with layer):
> 
> BTW, rather than self.assertTrue(False, ... ) you can just use self.fail(...) 
> and then you avoid this ugly "False is not True" bit.

I suspected that there must be something like that when changing the
message, but then was too lazy to look it up - thanks for pointing it
out ;-}

I'll change that in a V2.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




