Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6FDCB71A69
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 21:14:46 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id c21so621834283ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 13:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=XsPGjBsGQRg028c3dQBBrPbKIjC80dzgD++Cc9wCK2k=;
	b=VzRb/Vil+R08vk2jAq2l0TmESGgputK0uJFD7161sXdR7Z6bR+Nc+DGZXHHMMX293Z
	GR3HEGketPPbThro6bFnO37panxxyfExkB76NNDNSWhzX32ZwEYX/3Yyh0ONodkhZ8Zl
	VAXpHWxsnChK2BdU9s2KD8u/g1hP2jf888j4HDUXs+zj0aQEIuGmoctmc7rEauaaJOPw
	OOG42QsQaC4elicd1RRLqc18zBpnFWqxDY2mbeeVrfCRU+VuRIWcyVmGM0EksX5A5eza
	U8hzRt0WW0abWPY66rfoBUd7UNFytg+9QGvWm7Ppfrjmef+EaZvThahY+0aSHLYM0bBE
	AzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=XsPGjBsGQRg028c3dQBBrPbKIjC80dzgD++Cc9wCK2k=;
	b=BefXUC3ZNgFT7skcYpSddgiN+lRz/rE70Bfn1gKnzwFneeGI03mJxiXpZYhbDIZj7E
	HGmmKtpauJW5f1Vkbdyyyq7D/lSd0ylfSorvzsLJVfy9ELN2WzRVXFQJ6LX1F7HU2RJl
	BtKdx2N7uSRU+/jRDBmfDiT1HBZmIbKnZD5v+uuWeJOn78nJmwSun9nJesuzRUy619ey
	sJKsjlDFFNCzQC5v2wdJJsa51okk79sygVgBmPEnG+5M/mKEvFRVVSXHx/Ou7R54olN4
	QzZDaCIUl3qB4zdWh5KpTK6Hya+kGA2TjyOoxrg2Zgo4hC2YeuKdy8Z6viAfeQGvGmJr
	PbMw==
X-Gm-Message-State: AKaTC03Lu41Tr6h/NRWanRY42b1hGCDxBtK0VCgsq2MINB1E69mFsg1iuqk7/OVml9OUug5q
X-Received: by 10.107.35.73 with SMTP id j70mr6112403ioj.195.1481058885151;
	Tue, 06 Dec 2016 13:14:45 -0800 (PST)
Received: from pohly-mobl1 (p57A5612C.dip0.t-ipconnect.de. [87.165.97.44])
	by smtp.gmail.com with ESMTPSA id p20sm2107155itc.8.2016.12.06.13.14.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 13:14:44 -0800 (PST)
Message-ID: <1481058881.17535.58.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, Mikko Ylinen
	<mikko.ylinen@intel.com>
Date: Tue, 06 Dec 2016 22:14:41 +0100
In-Reply-To: <48f1e3e16ca28e1194d6024689d000cb6ffc303c.1480711764.git.bruce.ashfield@windriver.com>
References: <cover.1480711764.git.bruce.ashfield@windriver.com>
	<48f1e3e16ca28e1194d6024689d000cb6ffc303c.1480711764.git.bruce.ashfield@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] kern-tools: fix processing for no branch meta-data
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
X-List-Received-Date: Tue, 06 Dec 2016 21:14:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-12-02 at 16:09 -0500, Bruce Ashfield wrote:
> Lernel meta-data that has patches, but no branches, can trigger an
> error due to no branch specific patch queue.
> 
> This error then cascades to more issues since the tools are using
> a named file in /tmp to store and display error messages to the
> user.
> 
> We fix both issues though the following kern tools tweaks:
> 
>   commit bd9e1d6c9b0a34ff3e19a06999aaf57ffadfd04c
>   Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>   Date:   Fri Dec 2 13:09:40 2016 -0500
> 
>     scc: use mktemp for consolidated output capture
> 
>     To provide useful error messages the tools dump pre-processed
>     files and messages to a temporary file. If multiple users are
>     doing builds, this means they either race, or can have permissions
>     issues.
> 
>     By creating the temporary file via mktemp, we avoid both issues.
>     (We also make sure to clean these up on exit, or /tmp will get
>     polluted quickly).
> 
>   commit a287da4bfe0b4acb8f2b0627bd8e7abd1a1dde26
>   Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>   Date:   Fri Dec 2 13:08:08 2016 -0500
> 
>     patch: do not assume a branch specific patch queue is needed
> 
>     When processing input files per-branch and global patch queues are
>     generated. If the meta-data has not created any branches in the
>     repo, no branch specific queue is required.
> 
>     The tools assumed that one is always valid, and hence would throw a
>     non-zero exit code and stop processing.
> 
>     By testing for a named per-branch queue, we avoid this issue.

Ostro OS runs into the problem while trying to use current OE-core
master:

 .../patch.cmd: line 29: : No such file or directory

| ERROR: Function failed: do_kernel_metadata (log file is located ...)

This commit here fixed it for me. I see that it is already in Ross' mut2
branch, so hopefully that'll land in master soon.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




