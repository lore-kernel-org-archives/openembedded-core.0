Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5035A781F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 09:35:06 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id x187so67001350oig.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 02:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=SPN/XgR315T2eXgZIa5s8ujQl/655nzG2T+osEcSWL8=;
	b=pBjojMNG89bAzCgYgHukM685hrQ0ypwr8OvKHdKkzTKmAryoVUx/NVIcQzDsbp/sF4
	+WpsD6JXGz5R+ewjcO0pjaNWCH7rJAIDkMmRwYnQ0UNVpm6KFA18eNMaTd945Ri9Cder
	yDFCERYRNRuW25ya2CQWsyPzefaz7knTOpwl6Xfwlm+kzFBmNHmCppQMyYHN5H6MDO1E
	kG0WCAmlhARy+J3k3WTgWdkN+9B8Y0ookgvJ3PgyLyG1q6JizU5N89sro/MtSPewbdAS
	66GDJJKTglv0jZGPj8yoQ2BUNP5hj5Vu2NjXBqbhaxOVxcQMDz005IDnWZW76lYNZU9Z
	oI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=SPN/XgR315T2eXgZIa5s8ujQl/655nzG2T+osEcSWL8=;
	b=bSIW1pXyQbaHu6uwVKg2j0ryPvr2S5LFEBgfSZLA6lH2JDR95kFyIO1RS/LvkCc+mA
	Kokb5BsSwfP1K4wKnLUvSY3PgQ1zjxse2PNqeRhqO7HJUzAwGqVIgux5Os/POUp8nxNQ
	T2vfMWwP8uCPXou/pMo10O/k296GnDV3GNmAOnXHXKh5DCZGqUfdjEePYtESxN+FNAre
	CHsnrH0Z+0MZxj2PCqcaF3Rj6YzDK2G8d1kF/i94TSaAbbNMUajgYfK7bXfvw82pkS/e
	piiEO5/FSOdZysxJ3CTG6tFXJDTgUYIMHs5jqI+wnLmcQNnoV2ZccDVJC/RZ+byHZ1cJ
	2Dcg==
X-Gm-Message-State: AIVw112kdIiRDo6r000ffPRxUbNfqAeKX+iDYkNAPC6woDzXDZuGC0H7
	DQWcYH3O5JrlbJup
X-Received: by 10.202.204.196 with SMTP id c187mr5577805oig.11.1500024908194; 
	Fri, 14 Jul 2017 02:35:08 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F454.dip0.t-ipconnect.de. [93.232.244.84])
	by smtp.gmail.com with ESMTPSA id
	f137sm11327008oig.26.2017.07.14.02.35.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 02:35:06 -0700 (PDT)
Message-ID: <1500024902.21921.35.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Fri, 14 Jul 2017 11:35:02 +0200
In-Reply-To: <ec785117-31c8-db37-cfbe-b7bd34ce007f@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<0ba0ca75258dc5f62b1c79a7b87f85c136ca8ab7.1499803885.git.anibal.limon@linux.intel.com>
	<1499843714.20211.117.camel@intel.com>
	<ec785117-31c8-db37-cfbe-b7bd34ce007f@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 20/30] oeqa/selftest/cases: runqemu enable thraded runs
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
X-List-Received-Date: Fri, 14 Jul 2017 09:35:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-07-12 at 10:01 -0500, Aníbal Limón wrote:
> > Add also a wrapper for runqemu and we can get rid of "from
> > oeqa.utils.commands import" completely.
> 
> Yes we can after the refkit and other selftest are adapted.

My proposal wasn't to remove oeqa.utils.commands, only the "import"
statements for it in selftest test cases. There might be legitimate uses
for oeqa.utils.commands outside of selftests.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




