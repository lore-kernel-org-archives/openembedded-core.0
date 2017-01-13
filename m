Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 64E8F71DDE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 19:32:28 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id r185so44904250ita.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 11:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=4o0hmDDYc4hnZSrk7zx7p+wgUg141D3AuVjvLWwDk+U=;
	b=Ha0Jb0SwIxjO2beSZvA3VvLxQPNShLuxK1Pw+sy/NfObZs4Pa2XdvSXmC42VJlFBmT
	4ycGDDrkw7kSV4S5+iEmABQgL2hoQOofpJ+IOdSSSN2nqpYUfIOcvpKD66Xns1DoaanI
	xzZeC1glyBr6YGTrZdtzP46jayGvROvLiLgFsP51l8QQgz6D/umVpT4zgmPf34f1dCC3
	6Jd9PSLsIV+Oz1HdCgbzefCqhLJoP65ZFJbq4+EcwqFvfGnS1B1Z0asdaZOCuFSWM8wW
	g2S6+LgSPYpi9BWqHT8veoUY298AsnBf8V56+R+7Gs4xhyx3MpfITllAoWYNdEyNFXNJ
	pNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=4o0hmDDYc4hnZSrk7zx7p+wgUg141D3AuVjvLWwDk+U=;
	b=SfdVWcEnxeiHHr0ufTlEO3EgSpnsYJyREXynMkQ5qJEJNDdyTXy+DPKW14i+k9el7p
	Phmz+qmkP6yMuy2oucMHKztSvNEmQoQIIsjVcs2LlPED6/9c9oObOA31NFxRYnOCz5ty
	FajayFN+hBUg2HdFYkkLjKcShh+u+V7F6kkvmtqyQjMyWiG2CBKyrHXi2lCkF7KaQo3y
	RSO9GiZdmgd7tFaSTQXBygLyFq+AuaxTjkHxXb8yXh3B7B3BBYSblZgA1qOok3L3SCEk
	/tDeTrD5rNEoLpYf7eDT8INjPqST4R96NspoukNBquejlba61ACYSi2jgJ2o//Wok43j
	RmIQ==
X-Gm-Message-State: AIkVDXJom+sr4RF6B5g9AkPMgcZHqj4kLP+kZkgI6jKR6PrZC7HXX2bVGbBpKlr39gSykC0J
X-Received: by 10.36.80.145 with SMTP id m139mr4258316itb.24.1484335948459;
	Fri, 13 Jan 2017 11:32:28 -0800 (PST)
Received: from pohly-mobl1 (p57A56056.dip0.t-ipconnect.de. [87.165.96.86])
	by smtp.gmail.com with ESMTPSA id o13sm1367607ith.5.2017.01.13.11.32.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jan 2017 11:32:27 -0800 (PST)
Message-ID: <1484335945.21036.8.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Date: Fri, 13 Jan 2017 20:32:25 +0100
In-Reply-To: <1484331195-11919-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
References: <1484331195-11919-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] python3-docutils: upgrade to 0.13.1
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
X-List-Received-Date: Fri, 13 Jan 2017 19:32:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-01-13 at 12:13 -0600, Edwin Plauchu wrote:
> Changed document date field and several notes about folders

Perhaps now would be a good time to start using beginline/endline
parameters?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




