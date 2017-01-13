Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7B371DBE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 15:05:45 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id v96so45305656ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 07:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=B9rqX9OEXcp+uayxIJafUWielnF1bMXAe+/hVw0F+Go=;
	b=I3EXL79NFyud7hePlQP5VuvYamHiSNJo/wIf33gHnHSNoCLJ1fDJr06GA6YYwRuJme
	7BRzmx6bWPED7Ovzk2dubx79oe0p44yM1MjVsCQCF4TL+AbexZbSpLVB44RxP5BPBua8
	FFjsTo4bWEIevTsEl4PNYkWPGOLozRzg1NMzFvgN517dqPad/nQW/CVI4rFFcrrTeznt
	QF/w7ehdd523PC1bpYV+YwKZUqzKoIJgNTNEshHX3Bgj362b8Ut6I/AKMm9SMshEddkU
	5HRJ/T7XTqGLuAyGXU0V+7Myz/EBXoUrgMB5YbF9FT329NvLpQ1ubRM58dLKhb/GIYiY
	LSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=B9rqX9OEXcp+uayxIJafUWielnF1bMXAe+/hVw0F+Go=;
	b=shUiScW/xBTyXDyTOyc16FC13RdU2MnvbdyGAdy/6hl1Lh7CgvqXNNgY5plFJfhnGW
	LXYVojXRXbRiyj8JfMVCN1C0g+EksVAUYq3zH6QsfcmbNgkrck3ALCbn2KZKMKv2FZZx
	ZqCVzZJOZD/Plh4ZBNAOdeTO2Mqyw7gQZIE2qxX06jRCwLx5wbAnl0OdQMBVqHNDy88d
	L7AOawAqKdFJUhjdhj1JYE8FT2bX8okXmXJyfzwF1CkXd4wANjRneRCjNXOcCK43jTeV
	+SCAUQIkNVE7tWFlQjsWZWp8gjvctGrRb7rNayPHhjy2O7t6uuaTNWE+cwkFSKxCk4pR
	GctA==
X-Gm-Message-State: AIkVDXLRoXbB8XT8B/D8ZFqkPFyMqIjxKktdGIcqxDZjghWVRNvtAZol05ohAIGDF0hOzfOC
X-Received: by 10.107.57.131 with SMTP id g125mr21983326ioa.108.1484319945767; 
	Fri, 13 Jan 2017 07:05:45 -0800 (PST)
Received: from pohly-mobl1 (p57A56056.dip0.t-ipconnect.de. [87.165.96.86])
	by smtp.gmail.com with ESMTPSA id v7sm6732325iod.0.2017.01.13.07.05.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jan 2017 07:05:44 -0800 (PST)
Message-ID: <1484319942.21036.6.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 16:05:42 +0100
In-Reply-To: <1484317436-13263-1-git-send-email-patrick.ohly@intel.com>
References: <1484317436-13263-1-git-send-email-patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] rm_work.bbclass: allow preserving additional content
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
X-List-Received-Date: Fri, 13 Jan 2017 15:05:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

Please ignored the 1/2 in the subject. There's just one patch for
OE-core, the other one I had locally needs to go into meta-swupd.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




