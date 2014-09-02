Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6A13160DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 15:00:00 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id i8so6793048qcq.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Sep 2014 08:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BtcfNE2S61IhybWamEyPy8txK7DU3g8UIK8dWLLzWfs=;
	b=PUfjqPLP8lkZB2ZwslMlhwVD8ZtcYjU6BhnbeSr1nCdYBQ+H1wY/Ex+2SCMbpoFLu+
	DACrIVNtaY4gTG1LAn5sT0I9Oi8Ke5MV2OoBrHIxXBjSOVostkAM836eteB8IMAntCtc
	7s9CxIkVrL91u26/2rV+5QR0J2WjBBJfIxVOYKbZPaATBeFCqreZr/gn9pKytpWtm0zF
	c8vY2oaKlWYbyvCFetKkUe3ZKIfePscltSXZIZidXrWY0QYf5X5ymEjbzyc6KHtqYksC
	udRSmKRf4FXHv/tnfnI0VijdD6N4lyYtsBy8zzK9ndHQMxWGt29ttUHvwxJkMfGwULUN
	6dNg==
X-Gm-Message-State: ALoCoQneYkEGtEhFRER3PVjD0m45Jx/LQVBmFJj7EKMp/s8Kfx+5oYgCGR7HgOSvWXE4MnKDqeei
X-Received: by 10.140.97.131 with SMTP id m3mr52002784qge.80.1409670001733;
	Tue, 02 Sep 2014 08:00:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 2 Sep 2014 07:59:40 -0700 (PDT)
In-Reply-To: <0f179788c0f2119c374a56a981fea794d5d13542.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<0f179788c0f2119c374a56a981fea794d5d13542.1409655125.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Sep 2014 15:59:40 +0100
Message-ID: <CAJTo0Lb+i0mBh6VfBcCS29kg_hr_sw88Y9otsiH1q5PbrE9pdw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/26] systemd: add PACKAGECONFIG for curl
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
X-List-Received-Date: Tue, 02 Sep 2014 15:00:04 -0000
Content-Type: text/plain; charset=UTF-8

On 2 September 2014 11:53, Chen Qi <Qi.Chen@windriver.com> wrote:
> Add PACKAGECONFIG for curl and disable it by default.

It isn't clear what the curl dependency is for without reading the
source, so naming the option "journal-upload" would be
self-documenting.

Ross

